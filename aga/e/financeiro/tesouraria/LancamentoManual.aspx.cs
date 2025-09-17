using Benner.Corporativo.Comum;
using Benner.Corporativo.Comum.Helpers.QueryMaker;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Wes.WebApp;
using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Business.Cache;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Helpers;
using Ninject;
using System;
using System.Collections.Generic;
using System.Web.Caching;

public partial class tesourariaLancamentoManualPage : PortalBase.CorpBasePage
{

    [Inject]
    public ISessionVars SessionVars { get; set; }
    [Inject]
    public IQueryMaker QueryMaker { get; set; }
    [Inject]
    public ITSLancamentoDao LancamentoDao { get; set; }

    [Inject]
    public IFNMovimentacaoDao MovimentacaoDao { get; set; }


    private List<GridCellAdapter> _adapters;
    private Dictionary<int, Tuple<decimal, decimal>> _saldosContasExibidas;
    private readonly List<int> _handlesContasObtidasGrid = new List<int>();

    CommandGroup _newOperationGroup;


    protected void Page_Load(object sender, System.EventArgs e)
    {
        var filialSelecionada = Utils.ObterFilialCorrente();
        
        if (filialSelecionada != 0)
        {
            SELEODECONTA.FilterWhereClause = new WhereClause("A.FILIAL = @FILIAL");
        }        

        SELEODECONTA.CommandExecuted += SELEODECONTA_CommandExecuted;
        FORMTS_LANCAMENTOS.CommandExecuted += FORMTS_LANCAMENTOS_CommandExecuted;

        if (IsPostBack && !string.IsNullOrEmpty(DocumentoCriado.Value))
           ConfigureFormDefinition(PegarDocumento(DocumentoCriado.Value.ToLong()));

        MOVIMENTACOES.CommandExecuted += MOVIMENTACOES_CommandExecuted;

        if (string.IsNullOrEmpty(DocumentoCriado.Value))
           LimparCache();

        SELEODECONTA.GridView.SelectedIndexChanging += GridView_SelectedIndexChanged;
    }

    private void GridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        CurrentStep.Value = "2";
        SessionVars.SetSessionVar("CONTALANCAMENTO", SELEODECONTA.GetEntity()["HANDLE"].Value.ToString());
        FORMTS_LANCAMENTOS.ForceUpdate();
    }

    private void LimparCache()
    {
        var cacheMovimentacao = new BusinessCacheProvider<IFNMovimentacao>("FNMovimentacao");
        var cacheHandles = new BusinessCacheProvider<IList<Handle>>("HandleMovimentacoes");

        cacheMovimentacao.ClearAll();
        cacheHandles.ClearAll();
    }

    private void SELEODECONTA_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_PROXIMO")
        {
            CurrentStep.Value = "2";
            SessionVars.SetSessionVar("CONTALANCAMENTO", e.Entity.Handle.ToString());
            FORMTS_LANCAMENTOS.ForceUpdate();
        }
    }

    protected override void OnPreRender(System.EventArgs e)
    {
        base.OnPreRender(e);

        ConfigureFormDefinition();
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        ConfigureFormDefinition();
        base.OnLoadComplete(e);
    }

    private void ConfigureFormDefinition()
    {
        if (!string.IsNullOrEmpty(DocumentoCriado.Value))
            ConfigureFormDefinition(PegarDocumento(DocumentoCriado.Value.ToLong()));
    }

    private void FORMTS_LANCAMENTOS_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if ((e.CommandName == "Cancel"))
            CurrentStep.Value = "1";
        else if (e.CommandName == "Save")
        {
            ITSLancamento documentoManual = LancamentoDao.Create();

            foreach (var campo in e.Entity.Fields)
                if (campo.Key != "HANDLE" && campo.Key != "_CONTEXTID")
                    documentoManual[campo.Key].SetDBValue(e.Entity[campo.Key].GetDBValue());


            documentoManual.Handle = TsLancamentoNewHandle();
            e.Entity.Handle = documentoManual.Handle;

            if (VerificaOperacao(documentoManual))
            {
                //Deve verificar o Valor Lancamento para prosseguir
                if (PersisteValorLancamento(documentoManual))
                {
                    FORMTS_LANCAMENTOS.ShowWidgetMessage("Valor Lançamento deve ser maior que zero!", MessageType.Warning);
                    return;
                }

                List<IFNMovimentacao> mov = new List<IFNMovimentacao>();
                SalvarTSLancamento(documentoManual, mov);

                CriarVariaveisSessao(documentoManual);

                var operacao = documentoManual.OperacaoInstance;

                if (Utils.EmpresaPublica() && operacao.CodigoInterno == Benner.Corporativo.Definicoes.Genericos.GNOperacaoCodigoInternoListaItens.ItemSimples &&
                    documentoManual.NaturezaLancamento == TSLancamentoNaturezaLancamentoRadioItens.ItemDebito && !operacao.EstornoEmpenhoSimples.GetValueOrDefault() && !operacao.EstornoCreditoSimples.GetValueOrDefault())
                {
                    FormLinkDefinition linkDefinitionEmpenho = new FormLinkDefinition();
                    linkDefinitionEmpenho.Url = "~/aga/a/financeiro/tesouraria/Empenhos.aspx";
                    linkDefinitionEmpenho.TargetSystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                    linkDefinitionEmpenho.TargetEntityDefinitionName = TSLancamentoEmpenho.GetEntityDefinition().Name;
                    linkDefinitionEmpenho.WhereClause = new WhereClause("A.LANCAMENTO = :LANCAMENTO", new Benner.Tecnologia.Common.Parameter("LANCAMENTO", documentoManual.Handle));
                    linkDefinitionEmpenho.IsModalNavigation = false;
                    linkDefinitionEmpenho.IsModalPage = true;

                    var urlEmpenho = Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkDefinitionEmpenho, modal: true, modalSize: CommandModalSize.FullPage);

                    Response.Redirect(urlEmpenho);
                }

                FormLinkDefinition linkDefinitionNew = new FormLinkDefinition();
                linkDefinitionNew.Url = "~/aga/a/financeiro/documentos/lancamentos.aspx";
                linkDefinitionNew.TargetSystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                linkDefinitionNew.TargetEntityDefinitionName = FNLancamento.GetEntityDefinition().Name;
                linkDefinitionNew.WhereClause = new WhereClause("A.LANCAMENTOTESOURARIA = :LANCAMENTOTESOURARIA", new Benner.Tecnologia.Common.Parameter("LANCAMENTOTESOURARIA", documentoManual.Handle));
                linkDefinitionNew.IsModalNavigation = false;
                linkDefinitionNew.IsModalPage = true;

                var url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkDefinitionNew, modal: true, modalSize: CommandModalSize.FullPage);

                //Caso seja Aviso Credito/Debito, deve ir pro passo 3
                if (documentoManual.OperacaoInstance.CodigoInterno == Benner.Corporativo.Definicoes.Genericos.GNOperacaoCodigoInternoListaItens.ItemSimples)
                {
                    SessionVars.SetSessionVar("DESTINO", GetLinkRedirectConcluir(documentoManual.Handle.ToString()));                    
                }

                Response.Redirect(url);
            }
            else
            {
                MOVIMENTACOES.UserDefinedCriteriaWhereClause = "A.LANCAMENTOTESOURARIA = " + documentoManual.Handle;
                List<IFNMovimentacao> mov = new List<IFNMovimentacao>();
                SalvarTSLancamento(documentoManual, mov);
                DocumentoCriado.Value = documentoManual.Handle.ToString();
                CriarVariaveisSessao(documentoManual);
                CurrentStep.Value = "3";
                _newOperationGroup = null;
                MOVIMENTACOES.ForceUpdate();
            }            
        }
    }

    private bool PersisteValorLancamento(ITSLancamento documentoManual)
    {
        if (documentoManual.ValorLancamento <= 0)
        {
            return true;
        }
        return false;
    }

    private void MOVIMENTACOES_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {

        if (e.Command.Name == "CMD_CONCLUIR")
        {
            try
            {
                var lancamento = LancamentoDao.GetFirstOrDefault(DocumentoCriado.Value.ToLong());

                var lancamentoHandle = DocumentoCriado.Value.ToLong();

                var movimentacoes = MovimentacaoDao.GetMany(a => a.LancamentoTesourariaHandle == lancamentoHandle);

               if (movimentacoes.Count == 0)
               {
                   MOVIMENTACOES.ShowWidgetMessage("É necessário incluir uma movimentação para concluir o processo.", MessageType.Warning);
                   return;
               }

                ConcluirTSLancamento(lancamento, movimentacoes);

                var ret = GetLinkRedirectConcluir(lancamento.Handle.ToString());

                Response.Redirect(ret);

            }
            catch (Exception ex)
            {
                MOVIMENTACOES.ShowWidgetMessage(ex.Message, MessageType.Error);
            }
        }
        else if (e.Command.Name == "CMD_VOLTAR")
        {
            CurrentStep.Value = "2";
        }
    }

    private bool VerificaOperacao(ITSLancamento documentoManual)
    {
        bool contr = false;
        bool simples = false;
        bool conc = false;

        if ((documentoManual.TipoOrigem != null) &&
              (documentoManual.Conciliado != null) &&
              (documentoManual.OperacaoInstance.CodigoInterno > 0))
        {
            contr = (documentoManual.TipoOrigem == TSLancamentoTipoOrigemListaItens.ItemContratos);
            simples = (documentoManual.OperacaoInstance.CodigoInterno == 8);
            conc = (documentoManual.Conciliado == true);
        }

        documentoManual.AtualizaSaldo = documentoManual.OperacaoInstance.AtualizaSaldoTesouraria == true ? true : false;

        return !(!simples || (conc && simples) || contr);
    }

    private void CriarVariaveisSessao(ITSLancamento entidadeOrigem)
    {
        if (entidadeOrigem != null)
        {
            SessionVars.SetSessionVar("ENTIDADEORIGEM", string.Format("{0}|{1}", entidadeOrigem.Definition.Name, entidadeOrigem.Handle));
            SessionVars.SetSessionVar("CODIGOINTERNO", ((int)ObterCodigoInterno(entidadeOrigem.OperacaoHandle)).ToString());
            SessionVars.SetSessionVar("SOMENTELEITURA", "N");
            SessionVars.SetSessionVar("DESTINO", "~/aga/e/financeiro/tesouraria/Grid.aspx");
        }
    }

    private FNLancamentoCodigoInterno ObterCodigoInterno(long operacaoHandle)
    {
        var handleOperacao = operacaoHandle;
        int codigoOperacao = 0;

        var operacao = QueryMaker.NewQuery("GN_OPERACOES")
                                 .QueryField("CODIGOINTERNO")
                                 .Where(new Handle(handleOperacao))
                                 .ExecQuery();

        if (operacao != null && operacao.Count > 0)
            codigoOperacao = operacao[0]["CODIGOINTERNO"].GetInt32();

        return (FNLancamentoCodigoInterno)Enum.ToObject(typeof(FNLancamentoCodigoInterno), codigoOperacao);
    }

    private void ConfigureFormDefinition(ITSLancamento documentoManual)
    {
        var lancamento = documentoManual;
        MOVIMENTACOES.GridDefinition.Commands.RemoveAll(c => c.Name == "OperacaoNovo");


        if (_newOperationGroup == null)
            _newOperationGroup = GetNewOperationsGroup(lancamento);

        if (_newOperationGroup.Items.Count > 0)
            MOVIMENTACOES.GridDefinition.Commands.Add(_newOperationGroup);
    }

    private CommandGroup GetNewOperationsGroup(ITSLancamento lancamento)
    {
        if (lancamento == null || lancamento.Handle.IsInvalid())
            throw new InvalidOperationException("Lançamento é nulo ou inválido");

        var operacao = lancamento["OPERACAO"].GetInt32();
        var query = new Query(@"SELECT A.OPERACAO1, O.CODIGOINTERNO, O.NOME FROM GN_OPERACAOOPERACOES A
            INNER JOIN GN_OPERACOES O ON O.HANDLE = A.OPERACAO1
            WHERE A.OPERACAO = :OPERACAO", new Benner.Tecnologia.Common.Parameter("OPERACAO", operacao));

        var entities = query.Execute();

        var group = new CommandGroup();
        group.Name = "OperacaoNovo";
        group.UrlImage = "fa fa-plus";
        group.Color = "green";
        group.Title = "Novo";

        foreach (var entity in entities)
        {
            if (lancamento.Handle.IsValid())
            {
                var command = new Command(string.Format("Operacao{0}", entity["OPERACAO1"].GetInt32()), entity["NOME"].GetString());

                command.Context = FunctionContext.Table;
                command.ShowModal = true;
                command.ModalSize = CommandModalSize.FullPage; 
                var link = new FormLinkDefinition();
                link.Url = string.Format("~/aga/e/financeiro/tesouraria/MovimentacaoForm.aspx?opv={0}&ci={1}", entity["OPERACAO1"].GetInt32(), entity["CODIGOINTERNO"].GetInt32());
                link.TargetFormMode = FormLinkDefinition.FormMode.Insert;
                link.TargetEntityDefinitionName = "FN_MOVIMENTACOES"; 
                link.TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
                link.WhereClause = new WhereClause("A.LANCAMENTOTESOURARIA = :LANCAMENTO AND A.OPERACAO = :OPERACAO");
                link.WhereClause.Parameters.Add(new Benner.Tecnologia.Common.Parameter("LANCAMENTO", lancamento.Handle));
                link.WhereClause.Parameters.Add(new Benner.Tecnologia.Common.Parameter("OPERACAO", entity["OPERACAO1"].GetInt32()));
                command.OutputDefinition = link;
                group.Items.Add(command);
            }
        }
        return group;
    }

    private ITSLancamento PegarDocumento(long documentoHandle)
    {
        return LancamentoDao.GetFirstOrDefault(documentoHandle);
    }

    private bool VerificaMovimentacoes()
    {
        var cache = new BusinessCacheProvider<IList<Handle>>("HandleMovimentacoes");

        var doc = cache.Get("HandleMovimentacoes");

        return (doc != null);
    }

    private long TsLancamentoNewHandle()
    {
        try
        {
            var novoHandleEntidade = BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.LancamentoManualServices, Benner.Corporativo.Financeiro", "GetNewHandle");
            return novoHandleEntidade.ToLong();
        }
        catch (Exception)
        {
            throw;
        }        
    }


    private void SalvarTSLancamento(ITSLancamento lancamento, IList<IFNMovimentacao> movimentacoesCriadas)
    {        
        BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.LancamentoManualServices, Benner.Corporativo.Financeiro", "SalvarLancamento", lancamento, movimentacoesCriadas);
    }

    private void ConcluirTSLancamento(ITSLancamento lancamento, IList<IFNMovimentacao> movimentacoesCriadas)
    {
        BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.LancamentoManualServices, Benner.Corporativo.Financeiro", "ConcluirLancamento", lancamento, movimentacoesCriadas);
    }

    private string GetLinkRedirectConcluir(string handleLancamento)
    {      

        var linkHelper = FormLinkDefHelper.MontaFormLinkDefinition(
                       "~/aga/e/financeiro/tesouraria/Form.aspx",
                       "TS_LANCAMENTOS",
                       "A.HANDLE = " + handleLancamento,
                       FormLinkDefinition.FormMode.ViewElseInsert);

        linkHelper.IsModalNavigation = false;
        linkHelper.IsModalPage = false;

        var linkHelperCreate = Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkHelper);
        return linkHelperCreate;
    }

}

