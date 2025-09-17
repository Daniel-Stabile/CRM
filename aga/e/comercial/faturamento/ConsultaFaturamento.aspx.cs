using Benner.Corporativo.Definicoes.Comercial;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Business.Tasks;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.Corporativo.Comum.AmplifiqueMe;
using System;
using System.Linq;
using System.Collections.Generic;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;
using Benner.ERP.Comum;
using Benner.Corporativo.Comum;
using System.Net;
using System.IO;
using Benner.Corporativo.Definicoes.Comercial.ServicesInterfaces;
using Ninject;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Genericos;

public partial class faturamentoConsultaFaturamentoPage : WesPage
{
    public ICMVTFiltroFaturamentoDao FiltroFaturamentoDao { get; set; }

    [Inject]
    public IAmplifiqueMeBusiness AmplifiqueMeBusiness { get; set; }

    public bool ExistePermissao
    {
        get
        {
            return Utils.VerificaPermissao("MANTER_FATURAMENTO", "MODULO_COMERCIAL");
        }
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        if (!IsPostBack)
            FiltroPadrao.Mode = FilterMode.SelectableRequired;

        FiltroPadrao.FilterControl.FilterExecute += FilterControl_FilterExecute;

        FATURAMENTOS.CommandExecute += ControleComandosItens;
        FATURAMENTOS.CommandExecuted += FATURAMENTOS_CommandExecuted;
        FATURAMENTOS.GridDefinition.Commands["CMD_EMITIR"].Visible = Utils.VerificaPermissao("MANTER_FATURAMENTO", "MODULO_COMERCIAL");
        
        ScriptManager.RegisterStartupScript(this, GetType(), "AtribuirClasseStatus", "AtribuirClasseStatus();", true);
        AvisosComandos();
    }

    private void ControleComandosItens(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name.Equals("CMD_EMITIR"))
        {
            ErpEnvironment.AtribuirSessionVar("FAT.IGNORARBLOQUEIOLIMITE", "N");

            var handlesSelecionados = ObterHandlesSelecionado();

            foreach (var handle in handlesSelecionados)
            {
                string msgAviso = BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Comercial.Faturamento.EmissorNotaFiscal, Benner.Corporativo.Comercial",
                    "AvisarClienteBloqueado", handle.ToLong()) as string;

                if (!msgAviso.Equals(""))
                {
                    ErpEnvironment.AtribuirSessionVar("FAT.IGNORARBLOQUEIOLIMITE", "S");
                    e.Command.RequestConfirmation = true;
                    e.Command.RequestConfirmationMessage = string.Format("{0} Deseja continuar?", msgAviso);
                    break;
                }                
            }
        }
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        FATURAMENTOS.GridView.RowDataBound += GridView_RowDataBound;

        //Chama o script para adicionar o html dos botes de visibilidade do filtro.
        ScriptManager.RegisterStartupScript(this, GetType(), "InserirBotoesOcultarExibirFiltro", "InserirBotoesOcultarExibirFiltro();", true);
        FATURAMENTOS.UserDefinedCriteriaWhereClause = " A.ABRANGENCIA = 'A' OR (A.ABRANGENCIA = 'N' AND A.TIPOREGISTRO = 11)";
    }

    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);
        WesBreadcrumbProvider.UpdateCurrentTitle("Consultar faturamento");
    }

    private void GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        var documento = e.Row.DataItem as IFNDocumento;

        if (VerificaVisibilidadeCartaCorrecao(documento.Handle))
            RemoverComando(e, "CMD_CARTACORRECAO");

        if (documento.ValorNominal <= 0 || documento.OperacaoFaturamentoInstance != null && documento.OperacaoFaturamentoInstance.AtualizaFinanceiro != CMOperacoesFaturamentoAtualizaFinanceiroRadioItens.ItemSim)
            RemoverComando(e, "CMD_RECEBIMENTO");

        if (((documento.Status != FNDocumentoStatusListaItens.ItemCadastrada) && (documento.Status != FNDocumentoStatusListaItens.ItemAguardandoServidor)) || !ExistePermissao)
            RemoverComando(e, "CMD_EDITAR");

        if (documento.Status != FNDocumentoStatusListaItens.ItemEmitida || documento.PodeGerarDANFSe)
            RemoverComando(e, "CMD_RELATORIO");

        if (documento.Status != FNDocumentoStatusListaItens.ItemEmitida || !documento.PodeGerarDANFSe)
            RemoverComando(e, "CMD_DANFSE");

        if (!documento.BotaoBaixarXmlNfseEnvioVisivel())
            RemoverComando(e, "CMD_XMLNFSEENVIO");
    }

    private bool VerificaVisibilidadeCartaCorrecao(long handleDocumento)
    {
        StringBuilder sb = new StringBuilder();

        sb.AppendFormat(@"SELECT A.HANDLE FROM FN_DOCUMENTOS A
                           WHERE A.HANDLE = {0} 
                             AND ((A.ABRANGENCIA = 'A') OR ((A.ABRANGENCIA = 'N') AND (A.TIPOREGISTRO = 11))) AND A.STATUS = 2
                             AND EXISTS (SELECT F.HANDLE FROM FILIAIS F,
                                                              TR_PARAMETROFILIAL TR,
                                                              FN_TIPOSDOCUMENTOS TP
                                          WHERE F.HANDLE = TR.FILIAL
                                            AND TP.HANDLE = A.TIPODOCUMENTO
                                            AND F.HANDLE = A.FILIAL
                                            AND ((TR.EMITENFE = 'S' AND TP.EHNFE = 'S' AND A.STATUSNFE = 6)
                                             OR ((TP.EHNFESERVICO <> 'S') AND ((TR.AMBIENTENFE NOT IN (1,2)) OR (TP.EHNFE <> 'S')))))", handleDocumento);

        var query = new Query(sb.ToString()).ExecuteFirstOrDefault();
        return query == null;
    }

    private void RemoverComando(GridViewRowEventArgs e, string comando)
    {
        if (((Benner.Tecnologia.Wes.Components.WebControls.RecordCommandsMenu)e.Row.Cells[0].FindControl(comando)) != null)
            ((Benner.Tecnologia.Wes.Components.WebControls.RecordCommandsMenu)e.Row.Cells[0].FindControl(comando)).Items.Clear();
    }

    private void FilterControl_FilterExecute(object sender, FilterExecuteEventArgs e)
    {
        if (e.WhereClause == null)
        {
            FATURAMENTOS.UserDefinedCriteriaWhereClause = " A.ABRANGENCIA = 'A' OR (A.ABRANGENCIA = 'N' AND A.TIPOREGISTRO = 11)";
            ScriptManager.RegisterStartupScript(this, GetType(), "ApagarMensagemFiltro", "ApagarMensagemFiltro();", true);
        }
        else
        {
            FATURAMENTOS.UserDefinedCriteriaWhereClause = "A.OPERACAOFATURAMENTO IS NOT NULL AND @CRITERIOSELECAO";
        }
    }

    void FATURAMENTOS_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_EMITIR":
                var handlesSelecionados = ObterHandlesSelecionado();
               
                var handlesProcessos = BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Comercial.Faturamento.EmissorNotaFiscal, Benner.Corporativo.Comercial",
                    "EmitirNotaFiscal", handlesSelecionados.ConvertAll(a => a.Value)) as List<long>;

                GerarNotificacaoBTL(handlesProcessos);

                if (handlesSelecionados.Count > 0)
                    AmplifiqueMeBusiness.AplicarCsat(this);

                break;

            case "CMD_CANCELAR":
                handlesSelecionados = ObterHandlesSelecionado();
                e.Command.OutputDefinition.Parameters.Add("HANDLES", handlesSelecionados);
                break;

            case "CMD_DANFSE":
                {
                    string url = BennerContext.BusinessComponent.Call(
                        "Benner.Corporativo.Comercial.DocumentosEletronicos.NFSe.NFSePackMonitor, Benner.Corporativo.Comercial",
                        "GerarDANFSEReportLink", e.Entity.Handle.ToLong()) as string;

                    WebRequest wr = WebRequest.Create(url);

                    using (HttpWebResponse response = (HttpWebResponse)wr.GetResponse())
                    {
                        if (response.StatusCode == HttpStatusCode.OK)
                        {
                            Response.Redirect(url);
                        }
                        FATURAMENTOS.ShowWidgetMessage(string.Format("Link para o DANFSe não está acessível. Status: {0}", response.StatusDescription), MessageType.Error);
                        response.Close();
                    }

                    break;
                }

            case "CMD_COMISSOES":
                {
                    var link = new GridLinkDefinition();
                    link.TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
                    link.TargetEntityDefinitionName = "FN_DOCUMENTOCOMISSOES";
                    link.IsModalPage = true;
                    link.Url = "~/aga/a/comercial/faturamento/Comissoes.aspx";
                    if (((EntityAssociation)e.Entity.Fields["DOCUMENTOORIGEM"]).Handle.IsReallyValid())
                        link.WhereClause = new WhereClause(string.Format("A.DOCUMENTO = {0} AND A.PARCELA IS NULL", ((EntityAssociation)e.Entity.Fields["DOCUMENTOORIGEM"]).Handle.Value));
                    else
                        link.WhereClause = new WhereClause(string.Format("A.DOCUMENTO = {0} AND A.PARCELA IS NULL", e.Entity.Handle));

                    string url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link, absoluteUrl: true, modal: true);

                    Response.Redirect(url);
                    break;
                }

            default:
                break;
        }
    }

    private List<Handle> ObterHandlesSelecionado()
    {
        List<Handle> handles;

        if (hfSelecionaTodosDocumentos.Value == "1")
        {
            var listaHandles = Entity.GetMany(EntityDefinition.FromQuery(" SELECT A.HANDLE        " +
                                                                         "   FROM FN_DOCUMENTOS A " +
                                                                         "  WHERE " + FiltroPadrao.FilterControl.CurrentFilterWhereClause.Where),
                                                                         new Criteria(FiltroPadrao.FilterControl.CurrentFilterWhereClause.Parameters.ToArray()));
            handles = listaHandles.GetHandles();
        }
        else
        {
            if (FATURAMENTOS.SelectedEntitiesHandles.Count == 0)
                throw new BusinessException("Necessário selecionar ao menos um documento.");

            handles = FATURAMENTOS.SelectedEntitiesHandles;
        }

        return handles;
    }

    private static void GerarNotificacaoBTL(IList<long> handlesProcessos)
    {
        foreach (var handleProcesso in handlesProcessos)
        {
            var task = BusinessTask.Factory.GetTask(handleProcesso);

            if (task == null)
                continue;

            Notification.Processes.New(task);
        }
    }

    private void AvisosComandos()
    {
        IMonitorIntegracaoNfeService monitorIntegracaoNfeService = BusinessComponent.CreateProxyInstance<IMonitorIntegracaoNfeService>();
        var results = monitorIntegracaoNfeService.RetornaStatusComandosAvisos();

        foreach (var result in results)
        {

            var comando = ((CommandGroup)FATURAMENTOS.EntityViewCommands.Commands.FirstOrDefault(p => p.Key == "GRP_AVISOS")).Items.FirstOrDefault(p => p.Key == result.comando);
            
            if (comando != null)
            {
                comando.Color = result.cor;
                comando.UrlImage = result.icone;
            }

            if (result.criticidade == 2 || result.criticidade == 3)
            {
                FATURAMENTOS.EntityViewCommands.Commands["GRP_AVISOS"].Color = "yellow-lemon";
                FATURAMENTOS.EntityViewCommands.Commands["GRP_AVISOS"].UrlImage = "fa fa-exclamation-triangle";
            }
        }
        
    }

}
