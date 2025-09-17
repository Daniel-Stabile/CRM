using Benner.Corporativo.Comum.Helpers.QueryMaker;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Business.Cache;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Helpers;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Caching;
using System.Web.UI;

public partial class tesourariaMovimentacaoLancamentoManualFormPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }
    [Inject]
    public IQueryMaker QueryMaker { get; set; }
    [Inject]
    public FNMovimentacaoDao MovimentacaoDao { get; set; }

    public int CodigoInterno
    {
        get
        {
            return (Request["ci"] == null) ? 0 : int.Parse(Request["ci"].ToString());
        }
    }

    public int OperacaoValida
    {
        get
        {
            return (Request["opv"] == null) ? 0 : int.Parse(Request["opv"].ToString());
        }
    }

    protected override void OnInit(EventArgs e)
    {
        MOVIMENTAO.GetFormDefinitionMethod = GetFormDefinition;
        MOVIMENTAO.CommandExecute += MOVIMENTAOCommandExecute;
        MOVIMENTAO.CommandExecuted += MOVIMENTAO_CommandExecuted;
        if (Page.IsPostBack)
            MOVIMENTAO.FormDefinition = GetFormDefinition(string.Empty, string.Empty);

        base.OnInit(e);
    }

    private void MOVIMENTAOCommandExecute(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            IEntityBase mov = MOVIMENTAO.GetEntity();
            if (mov == null)
                throw new BusinessException("Não foi possível recuperar a entidade");

            FNParcela parcela = FNParcela.GetFirstOrDefault(mov["PARCELA"].GetDBValue().ToInt());
            if (parcela != null && mov["VALOR"].Value.ToDecimal() > parcela.Valor)
                throw new BusinessException("Não foi possível baixar! Valor maior que saldo a baixar.");
        }
    }

    private void MOVIMENTAO_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            var cmd = MOVIMENTAO.EntityViewCommands.Commands.FirstOrDefault(p => p.Name == "Save");

            if (cmd != null)
            {
                IFNMovimentacao movimentacao = ConverterMovimentacao(MOVIMENTAO.GetEntity());
                var cacheMovimentacao = new BusinessCacheProvider<IFNMovimentacao>("FNMovimentacao");
                var cacheHandles = new BusinessCacheProvider<IList<Handle>>("HandleMovimentacoes");

                var codigoInterno = ObterCodigoInterno();

                IList<Handle> handlesMov = cacheHandles.Get("HandleMovimentacoes");

                if (handlesMov != null)
                {
                    movimentacao.Handle = handlesMov[handlesMov.Count - 1]+1;
                    handlesMov.Add(movimentacao.Handle);
                    cacheHandles.Set("HandleMovimentacoes", handlesMov, TimeSpan.FromMinutes(15), CacheItemPriority.Normal);
                }
                else
                {                    

                    movimentacao.Handle = FnMovimentacaoNewHandle();
                    IList<Handle> handlesMovi = new List<Handle>() { movimentacao.Handle };
                    cacheHandles.Set("HandleMovimentacoes", handlesMovi, TimeSpan.FromMinutes(15), CacheItemPriority.Normal);
                }

                CriarVariaveisSessao(movimentacao);

                cacheMovimentacao.Set(movimentacao.Handle.ToString(), movimentacao, TimeSpan.FromMinutes(15), CacheItemPriority.Normal);

                var handleLancto = MOVIMENTAO.GetEntity()["LANCAMENTOTESOURARIA"].GetInt64();
                SalvarPreLancamento(handleLancto);

                SessionVars.SetSessionVar("DESTINO", GetLinkRedirectConcluir(handleLancto.ToString()));

                if (codigoInterno == FNLancamentoCodigoInterno.ciPGV || codigoInterno == FNLancamentoCodigoInterno.ciRCV)
                {                  

                    FormLinkDefinition linkDefinitionNew = new FormLinkDefinition();
                    linkDefinitionNew.Url = "~/aga/a/financeiro/documentos/lancamentos.aspx";
                    linkDefinitionNew.TargetSystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                    linkDefinitionNew.TargetEntityDefinitionName = FNLancamento.GetEntityDefinition().Name;
                    linkDefinitionNew.WhereClause = new WhereClause(string.Format("A.MOVIMENTACAO = {0} AND A.LANCAMENTOTESOURARIA = {1}", movimentacao.Handle, movimentacao[FNMovimentacao.FieldNames.LancamentoTesouraria].GetInt64()));
                    linkDefinitionNew.IsModalNavigation = false;
                    linkDefinitionNew.IsModalPage = true;
                    Response.Redirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkDefinitionNew));
                }
                //this.CloseModalOrRedirectToPrevious();]

                this.Page.CloseModalAndRefreshOrRedirect(url: GetLinkRedirectConcluir(handleLancto.ToString()));

            }
        }

    }

    private IFNMovimentacao ConverterMovimentacao(EntityBase movimentacao)
    {
        IFNMovimentacao mov = MovimentacaoDao.Create();
        foreach (var campo in movimentacao.Fields)
            if (campo.Key != "_CONTEXTID" && movimentacao.Fields.ContainsKey(campo.Key))
                mov[campo.Key].SetDBValue(movimentacao[campo.Key].GetDBValue());

        return mov;
    }

    private ITSLancamento PegarDocumentoCache(string documentoHandle)
    {
        var chaveCache = documentoHandle;
        var cache = new BusinessCacheProvider<ITSLancamento>("TSLancamento");

        var doc = cache.Get(chaveCache);
        if (doc != null)
            return doc;

        throw new BusinessException("Documento expirado, por favor reinicie o processo");
    }

    private void CriarVariaveisSessao(IFNMovimentacao entidadeOrigem)
    {
        if (entidadeOrigem != null)
        {
            SessionVars.SetSessionVar("ENTIDADEORIGEM", string.Format("{0}|{1}", entidadeOrigem.Definition.Name, entidadeOrigem.Handle));
            SessionVars.SetSessionVar("CODIGOINTERNO", ((int)ObterCodigoInterno()).ToString());
            SessionVars.SetSessionVar("SOMENTELEITURA", "N");
            SessionVars.SetSessionVar("DESTINO", string.Empty);
        }
    }

    private FNLancamentoCodigoInterno ObterCodigoInterno()
    {
        var handleOperacao = MOVIMENTAO.GetEntity()["OPERACAO"].GetInt64();
        int codigoOperacao = 0;

        var operacao = QueryMaker.NewQuery("GN_OPERACOES")
                                 .QueryField("CODIGOINTERNO")
                                 .Where(new Handle(handleOperacao))
                                 .ExecQuery();

        if (operacao != null && operacao.Count > 0)
            codigoOperacao = operacao[0]["CODIGOINTERNO"].GetInt32();

        return (FNLancamentoCodigoInterno)Enum.ToObject(typeof(FNLancamentoCodigoInterno), codigoOperacao);
    }

    private Entities<EntityBase> GetCamposOperacaoValida(int codicoInterno, int operacaoValida)
    {
        return new Query(@"SELECT C.NOME, A.LEGENDAFORMULARIO, A.SOLEITURA, A.OPCIONAL FROM FN_MOVIMENTACAOCAMPOS A
            INNER JOIN Z_CAMPOS C ON C.HANDLE = A.CAMPO
            WHERE A.CODIGOINTERNO = :CODIGOINTERNO AND
                A.MOVIMENTACAOOPERACAO IN (SELECT HANDLE FROM FN_MOVIMENTACAOOPERACOES WHERE EMPRESA = A.EMPRESA AND OPERACAO = :OPERACAOVALIDA)
            ORDER BY A.ORDEM",
           new Parameter("CODIGOINTERNO", codicoInterno),
           new Parameter("OPERACAOVALIDA", operacaoValida)).Execute();
    }

    private Entities<EntityBase> GetCamposMovimentacaoOperacaoIsNull(int codigoInterno)
    {
        return new Query(@"SELECT C.NOME, A.LEGENDAFORMULARIO, A.SOLEITURA, A.OPCIONAL FROM FN_MOVIMENTACAOCAMPOS A
            INNER JOIN Z_CAMPOS C ON C.HANDLE = A.CAMPO
            WHERE A.CODIGOINTERNO = :CODIGOINTERNO 
                AND A.MOVIMENTACAOOPERACAO IS NULL 
                AND A.EMPRESA = :EMPRESA
            ORDER BY A.ORDEM",
           new Parameter("CODIGOINTERNO", codigoInterno),
           new Parameter("EMPRESA", BennerContext.Security.GetEntityCurrentCompany("FN_MOVIMENTACAOCAMPOS"))).Execute();
    }

    private FormDefinition GetFormDefinition(string systemInstanceName, string entityViewName)
    {
        var msg = string.Empty;
        var entities = GetCamposOperacaoValida(this.CodigoInterno, this.OperacaoValida);

        if (entities.Count == 0)
            entities = GetCamposMovimentacaoOperacaoIsNull(this.CodigoInterno);

        if (entities.Count == 0)
        {
            if (CodigoInterno == FNLancamentoCodigoInterno.ciTRF.ToInt())
                msg = "Para operação do tipo 'TRANSFERÊNCIA' por favor utilizar o botão 'Transferência Bancária' na tela de tesouraria.";
            else
                msg = "Operação inválida.Utilize uma operação financeira com um dos códigos internos a seguir: -Baixa de contas a pagar -Baixa de contas a receber -Baixa por lucros e perdas -Recebimento à vista -Pagamento à vista -Adiantamento de cliente -Adiantamento de fornecedor -Devolução de venda -Devolução de compra -Estorno de baixa de fornecedores -Estorno de baixa de clientes -Estorno por lucros e perdas -Pagto de Devolução de cliente -Pagto de Devolução de fornecedor -Devolucao de Adiantamento de cliente -Devolucao de Adiantamento de fornecedor. Configuração pode ser encontrada no papel Administrador->Operações->Código interno tesouraria.";

            MOVIMENTAO.ShowWidgetMessage(msg, MessageType.Warning);
            return null;
        }

        var definition = EntityDefinition.GetByName("VTFNMOVIMENTACOES_LANCAMENTOMA");

        var form = FormDefinition.GetByName("VTFNMOVIMENTACOES_LANCAMENTOMA.FORM");

        form.Name = "VTFNMOVIMENTACOES_LANCAMENTOMA.FORM";

        form.FieldDefinitions.Clear();
        form.Pages.Clear();

        var page = new FormPage();
        form.Pages.Add(page);

        List<string> camposAdicionados = new List<string>();

        foreach (var entity in entities)
        {
            var name = entity["NOME"].GetString();
            var fieldDefinition = definition.FieldDefinitions[name];
            var formFieldDefinition = new FormFieldDefinition(fieldDefinition);
            if (fieldDefinition is AssociationFieldDefinition)
                formFieldDefinition = new FormFieldAssociationDefinition(fieldDefinition);
            formFieldDefinition.Title = entity["LEGENDAFORMULARIO"].GetString();
            formFieldDefinition.DataAccessLevel = entity["SOLEITURA"].GetBoolean() ? FieldDefinition.AccessLevel.Read : FieldDefinition.AccessLevel.Edit;
            formFieldDefinition.Required = !entity["OPCIONAL"].GetBoolean();
            formFieldDefinition.Visible = true;
            form.FieldDefinitions.Add(formFieldDefinition);
            page.Items.Add(new FormPageField(name));

            camposAdicionados.Add(name);

            if (name.Equals("PARCELA"))
            {
                FormFieldAssociationDefinition associationDefinition = form.FieldDefinitions["PARCELA"] as FormFieldAssociationDefinition;
                if (associationDefinition != null)
                {
                    associationDefinition.LookupResultFields = "AP,VCTOPRORROGADO";
                }
            }

            if (name.Equals("PESSOA"))
            {
                FormFieldAssociationDefinition associationDefinition = form.FieldDefinitions["PESSOA"] as FormFieldAssociationDefinition;
                if (associationDefinition != null)
                {
                    associationDefinition.LookupResultFields = "NOME,CGCCPF";
                }
            }
        }

        form.FieldDefinitions.Add(new FormFieldDefinition(definition.FieldDefinitions["LANCAMENTOTESOURARIA"]));
        camposAdicionados.Add("LANCAMENTOTESOURARIA");

        form.FieldDefinitions.Add(new FormFieldDefinition(definition.FieldDefinitions["OPERACAO"]));
        camposAdicionados.Add("OPERACAO");

        form.FieldDefinitions.Add(new FormFieldDefinition(definition.FieldDefinitions["FILIAL"]));
        camposAdicionados.Add("FILIAL");

        foreach (var campo in definition.FieldDefinitions)
            if (!camposAdicionados.Contains(campo.Name))
                form.FieldDefinitions.Add(new FormFieldDefinition(campo));

        return form;
    }

    private void SalvarPreLancamento(long lancamentoHandle)
    {

        var cache = new BusinessCacheProvider<ITSLancamento>("TSLancamento");
        var cacheHandles = new BusinessCacheProvider<IList<Handle>>("HandleMovimentacoes");
        var cacheMovimentacao = new BusinessCacheProvider<IFNMovimentacao>("FNMovimentacao");

        var handleLancto = lancamentoHandle.ToString();

        ITSLancamento lancamento = cache.Get(handleLancto);
        IList<Handle> handleMovimentacoes = cacheHandles.Get("HandleMovimentacoes");
        IList<IFNMovimentacao> movimentacoesCriadas = new List<IFNMovimentacao>();

        foreach (Handle handle in handleMovimentacoes)
            movimentacoesCriadas.Add(cacheMovimentacao.Get(handle.ToString()));

        lancamento.AtualizaSaldo = SetAtualizaSaldoLancamento(lancamento);

        BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.LancamentoManualServices, Benner.Corporativo.Financeiro", "SalvarLancamento", lancamento, movimentacoesCriadas);

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
    private long FnMovimentacaoNewHandle()
    {
        try
        {
            // O correto nao funciona... quando vai para o Save, pula 1 HANDLE, tornando-o inválido
            //var novoHandleEntidade = BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.LancamentoManualServices, Benner.Corporativo.Financeiro", "GetNewHandleMovimentacao");
            //return novoHandleEntidade.ToLong();

            return new Query("SELECT MAX(HANDLE)+1 HANDLE FROM FN_MOVIMENTACOES").ExecuteFirstOrDefault()["HANDLE"].GetDBValue().ToLong();
        }
        catch (Exception)
        {
            throw;
        }
    }

    private bool SetAtualizaSaldoLancamento(ITSLancamento lancamento)
    {
        var atualizaSaldo = lancamento.OperacaoInstance.AtualizaSaldoTesouraria == true ? true : false;
        return atualizaSaldo;

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
