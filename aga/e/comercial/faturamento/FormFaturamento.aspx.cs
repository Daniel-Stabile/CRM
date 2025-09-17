using Benner.Corporativo.Comum.Helpers.QueryMaker;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Business.Tasks;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Web.UI;
using Ninject;
using Benner.ERP.Comum;
using Benner.Corporativo.Comum;
using Benner.Tecnologia.Metadata.Entities;
using Benner.Corporativo.Definicoes;
using Benner.Corporativo.Definicoes.Comercial;
using Benner.Tecnologia.Metadata.TransformData;
using System.Text;
using Benner.Corporativo.Legacy;
using System.Threading.Tasks;

public partial class FormFaturamentoPage : WesPage
{
    [Inject]
    public IFNDocumentoNFeDao DocumentoNFeDao { get; set; }

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
        NOTAFISCAL.CommandExecute += NOTAFISCAL_CommandExecute;
        NOTAFISCAL.CommandExecuted += NOTAFISCAL_CommandExecuted;
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        var status = NOTAFISCAL.GetEntity()[FNDocumento.FieldNames.Status].GetDBValue();

        GRID_ITENS.GridDefinition.Commands["CMD_EDITARITEM"].Visible =
            ((status.ToInt() == FNDocumentoStatusListaItens.ItemCadastrada.Index) ||
            (status.ToInt() == FNDocumentoStatusListaItens.ItemComDivergencias.Index)) &&
            ExistePermissao;

        if (VerificaVisibilidadeCartaCorrecao(NOTAFISCAL.InMemoryEntity.Handle.Value))
            NOTAFISCAL.EntityViewCommands.Commands["CMD_CARTACORRECAO"].Visible = false;

        VisibilidadeComandos();
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

    void NOTAFISCAL_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        if (NOTAFISCAL.InMemoryEntity == null || !NOTAFISCAL.InMemoryEntity.Handle.IsValid())
            return;

        switch (e.CommandName)
        {
            case "CMD_XML":
                var docNfe = DocumentoNFeDao.GetHandle(a => a.DocumentoHandle == NOTAFISCAL.InMemoryEntity.Handle);

                if (!docNfe.IsReallyValid())
                    break;

                var link = new FileLinkDefinition();
                link.EntityDefinitionName = FNDocumentoNFe.GetEntityDefinition().Name;
                link.SystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                link.EntityHandle = docNfe;
                link.FieldName = FNDocumentoNFe.FieldNames.ArquivoXml;
                link.Url = Page.ResolveUrl("~/DownloadFile.ashx");

                ScriptManager.RegisterStartupScript(this, GetType(), "AtribuirDownloadXML", "window.open('" + link.GetEncodedUrl() + "','download');", true);

                break;

            case "CMD_COMISSOES":
                {
                    var documentoOrigem = ((EntityAssociation)e.Entity.Fields[FNDocumento.FieldNames.DocumentoOrigem]).Handle;
                    var formLink = new FormLinkDefinition();

                    formLink.TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
                    formLink.TargetEntityDefinitionName = FNDocumentoComissao.GetEntityDefinition().Name;
                    formLink.IsModalPage = true;
                    formLink.Url = "~/aga/a/comercial/faturamento/Comissoes.aspx";

                    if (documentoOrigem.IsReallyValid())
                        formLink.WhereClause = new WhereClause(string.Format("A.DOCUMENTO = {0} AND A.PARCELA IS NULL", documentoOrigem.Value));
                    else
                        formLink.WhereClause = new WhereClause(string.Format("A.DOCUMENTO = {0} AND A.PARCELA IS NULL", e.Entity.Handle));

                    formLink.TargetFormMode = FormLinkDefinition.FormMode.ViewElseInsert;

                    ((CommandGroup)NOTAFISCAL.EntityViewCommands.Commands["GRP_COMANDOS"]).Items[e.CommandName].OutputDefinition = formLink;
                }

                break;

            case "CMD_SELECIONAR_NOTAS_DEVOLUCAO":
                {
                    var gridLink = new GridLinkDefinition();
                    gridLink.Url = "~/aga/e/faturamento/SelecaoDocumentosDevolucao.aspx";
                    gridLink.Parameters.Add(CMItem.FieldNames.Documento, e.Entity.Handle);

                    var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(gridLink);

                    Response.Redirect(url);
                }

                break;
            case "CMD_SUGERIRENTRAGAS":
                e.Entity.OutputMessage = "Entregas sugeridas com sucesso.";
                break;

            case "CMD_EMITIR":
                    ErpEnvironment.AtribuirSessionVar("FAT.IGNORARBLOQUEIOLIMITE", "N");

                    string msgAviso = BennerContext.BusinessComponent.Call(
                        "Benner.Corporativo.Comercial.Faturamento.EmissorNotaFiscal, Benner.Corporativo.Comercial",
                        "AvisarClienteBloqueado", e.Entity.Handle.ToLong()) as string;

                    if (!msgAviso.Equals(""))
                    {
                        ErpEnvironment.AtribuirSessionVar("FAT.IGNORARBLOQUEIOLIMITE", "S");

                        NOTAFISCAL.EntityViewCommands.Commands["CMD_EMITIR"].RequestConfirmation = true;
                        NOTAFISCAL.EntityViewCommands.Commands["CMD_EMITIR"].RequestConfirmationMessage = string.Format("{0} Deseja continuar?", msgAviso);

                        break;
                    }

                    break;               

             case "CMD_APROPRIACAO_RECEITA":
                {
                    var documento = (IFNDocumento)NOTAFISCAL.GetEntity();
                    string mensagemErro = "";

                    if (ZGrupoUsuariosUtil.ValorCampo("ALTERAAPROPRIACOESNFEMITIDA").GetBoolean() && (documento.Status.Index == 2 || documento.Status.Index == 3))
                    {
                        mensagemErro = "Apropriação da receita não pode ser alterada.";
                    }

                    DateTime dataFechamento = (DateTime)BennerContext.BusinessComponent.Call("Benner.Corporativo.Userinterface.CorpComum.Generico, Benner.Corporativo.Userinterface",
                                                           "DataFechamentoPeriodo",
                                                           1,
                                                           (int)Company.Current.Handle.Value,
                                                           documento.FilialHandle.ToInt());


                    if ((ZGrupoUsuariosUtil.ValorCampo("ALTERAAPROPRIACOESNFEMITIDA").GetBoolean() && DateTime.Now < dataFechamento)
                         && (documento.Status.Index == 2 || documento.Status.Index == 3))
                    {
                        mensagemErro = "Apropiação da receita não pode ser alterada, verifique o período contábil!";
                    }

                    if (!documento.OperacaoInstance.ExigirPeriodosApropriacao.ToBoolean())
                    {
                        mensagemErro = "Não é possível lançar as apropriações da receita. " +
                                              "Pois a operação " + documento.OperacaoInstance.Nome.ToString() + " está configurada para não apresentar a tela de cadastro das apropriações da receita. " +
                                              "Acesse o módulo ADM, carga Operações, " + documento.OperacaoInstance.Nome.ToString() + ", guia Geral e marque a opção Exigir períodos de apropriação receita.";

                       
                    }


                    int DocHandle = (int)documento.Handle;

                    decimal ValorTotal = BennerContext.BusinessComponent.Call("Benner.Corporativo.Userinterface.FinanceiroComum.ApropriacaoReceita, Benner.Corporativo.Userinterface",
                                                           "ValorParaApropriacao",
                                                           DocHandle,
                                                           0) as dynamic;

                    if (ValorTotal == 0)
                    {
                        mensagemErro = "O valor líquido da nota deve ser maior que zero.";
                    }

                    if (mensagemErro != "")
                    {
                        throw new BusinessException(mensagemErro);
                    }
                }                  

                break;
        }

    }

    private void NOTAFISCAL_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
            case "CMD_EMITIR":
                this.CloseModalAndRefreshOrRedirect(this.Page.GetUrlToReturn());
                break;
        }
    }

    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);

        if (NOTAFISCAL.InMemoryEntity == null)
            return;

        CONTABILIZAO.Visible = TABCONTABILIZACAO.Visible =
            ((ListItem)NOTAFISCAL.InMemoryEntity.Fields[FNDocumento.FieldNames.Status]).Value
            .Equals(FNDocumentoStatusListaItens.ItemEmitida);

        OcultarGuiasComplementares();
    }

    private void OcultarGuiasComplementares()
    {
        var documento = (IFNDocumento)NOTAFISCAL.GetEntity();
        TABNFE.Visible = documento.TipoDocumentoInstance.EhNfe.GetValueOrDefault();

        var ordensVendaQry = new Query();
        ordensVendaQry.CommandText.AppendLine("SELECT HANDLE FROM CM_ORDENSVENDA WHERE");
        ordensVendaQry.CommandText.AppendLine("HANDLE IN (SELECT DISTINCT(ORDEMVENDA) FROM CM_ORDEMVENDAITENS WHERE CM_ORDEMVENDAITENS.HANDLE IN (SELECT ORDEMVENDAITEM FROM CM_ORDEMVENDALIBERACOES WHERE ITEMNF IN(SELECT HANDLE FROM CM_ITENS WHERE DOCUMENTO = :DOCUMENTO)))");
        ordensVendaQry.Parameters.Add(new Parameter("DOCUMENTO", NOTAFISCAL.InMemoryEntity.Handle.Value));
        var ordensVenda = ordensVendaQry.Execute();

        TABORDENSVENDA.Visible = ORDENSVENDA.Visible = ordensVenda != null && ordensVenda.Count > 0;

        var itensDevolvidosQry = new Query();
        itensDevolvidosQry.CommandText.AppendLine("SELECT HANDLE FROM CM_ITENS WHERE");
        itensDevolvidosQry.CommandText.AppendLine(@"HANDLE IN (SELECT I.HANDLE FROM CM_ITEMDEVOLUCOES A
                                                JOIN CM_ITENS I ON A.ITEM = I.HANDLE
                                                INNER JOIN CM_ITENS B ON A.ITEMDEVOLVIDO = B.HANDLE
                                                INNER JOIN PD_PRODUTOS C ON B.PRODUTO = C.HANDLE
                                                INNER JOIN FN_DOCUMENTOS D ON B.DOCUMENTO = D.HANDLE
                                                LEFT JOIN CP_ORDENSCOMPRA E ON A.ORDEMCOMPRA = E.HANDLE
                                                    WHERE I.DOCUMENTO = :DOCUMENTO)");
        itensDevolvidosQry.Parameters.Add(new Parameter("DOCUMENTO", NOTAFISCAL.InMemoryEntity.Handle.Value));
        var itensDevolvidos = itensDevolvidosQry.Execute();

        TABITENSDEVOLVIDOS.Visible = ITENSDEVOLVIDOS.Visible = itensDevolvidos != null && itensDevolvidos.Count > 0;
    }


    private void VisibilidadeComandos()
    {
        var documento = NOTAFISCAL.GetEntity() as IFNDocumento;

        NOTAFISCAL.FormDefinition.Commands["CMD_BLOQUETO"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemEmitida;
        NOTAFISCAL.FormDefinition.Commands["CMD_RELATORIO"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemEmitida;
        NOTAFISCAL.FormDefinition.Commands["CMD_DETALHES"].Visible = documento.Status != FNDocumentoStatusListaItens.ItemCadastrada && documento.Status != FNDocumentoStatusListaItens.ItemComDivergencias;
        NOTAFISCAL.FormDefinition.Commands["CMD_EDITAR"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemCadastrada || documento.Status == FNDocumentoStatusListaItens.ItemComDivergencias;
        NOTAFISCAL.FormDefinition.Commands["CMD_NOVOITEM"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemCadastrada || documento.Status == FNDocumentoStatusListaItens.ItemComDivergencias;
        NOTAFISCAL.FormDefinition.Commands["CMD_XMLNFSEENVIO"].Visible = documento.BotaoBaixarXmlNfseEnvioVisivel();
        NOTAFISCAL.FormDefinition.Commands["CMD_RECEBIMENTO"].Visible = documento.ValorNominal > 0 && documento.OperacaoFaturamentoInstance.AtualizaFinanceiro == CMOperacoesFaturamentoAtualizaFinanceiroRadioItens.ItemSim;
        NOTAFISCAL.FormDefinition.Commands["GRP_NFE"].Visible = documento.EhNFe;
        NOTAFISCAL.FormDefinition.Commands["GRP_NFSE"].Visible = documento.EhNFSe;
        NOTAFISCAL.FormDefinition.Commands["CMD_REABRIR"].Visible = documento.PodeReabrir;
        NOTAFISCAL.FormDefinition.Commands["CMD_REENVIAR"].Visible = documento.PodeReenviar;
        NOTAFISCAL.FormDefinition.Commands["CMD_SUBSTITUIRNF"].Visible = documento.PodeSubstituirNFSe;
        NOTAFISCAL.FormDefinition.Commands["CMD_SELECIONAR_NOTAS_DEVOLUCAO"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemCadastrada &&
            (documento.OperacaoInstance.CodigoInterno == Benner.Corporativo.Definicoes.Genericos.GNOperacaoCodigoInternoListaItens.ItemDevolucaoVenda ||
            documento.OperacaoInstance.CodigoInterno == Benner.Corporativo.Definicoes.Genericos.GNOperacaoCodigoInternoListaItens.ItemDevolucaoCompra);
        NOTAFISCAL.FormDefinition.Commands["CMD_SUGERIRENTRAGAS"].Visible = documento.Status == FNDocumentoStatusListaItens.ItemCadastrada || documento.Status == FNDocumentoStatusListaItens.ItemComDivergencias;        
        ((CommandGroup)NOTAFISCAL.EntityViewCommands.Commands["GRP_COMANDOS"]).Items["CMD_DOCUMENTOEXPORTACAO"].Visible = documento.OperacaoFaturamentoInstance != null && documento.OperacaoFaturamentoInstance.EHExportacao.Value;
    }
}
