using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Genericos;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

public partial class tesourariaMovimentacaoFormPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IGNOperacaoDao OperacaoDao { get; set; }

    [Inject]
    public IGNPessoaImpostosDao PessoaImpostoDao { get; set; }

    [Inject]
    public IFNParcelaDao ParcelaDao { get; set; }

    [Inject]
    public IFNDocumentoImpostosParcelaDao DocumentoImpostoParcelaDao { get; set; }

    public int CodigoInterno
    {
        get
        {
            int codigoInterno = 0;

            if (Request["ci"] == null)
                return codigoInterno;

            int.TryParse(Request["ci"], out codigoInterno);

            if (codigoInterno > 0)
                return codigoInterno;

            return GNOperacaoCodigoInternoListaItens.GetByDescription(Request["ci"]).Index;
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


    protected override void OnPreRender(EventArgs e)
    {
        base.OnPreRender(e);

        IEntityBase mov = MOVIMENTAO.GetEntity();

        if (mov != null)
        {
            var op = (mov["OPERACAO"].Value as EntityAssociation).Wrap<GNOperacao>(GNOperacao.Get);

            if (mov["DOCUMENTO"].GetInt32() != 0 && FNMovimentacao.PossuiAdiantamentos(ObterCodigoInterno(), mov["DOCUMENTO"].GetInt32(), false))
            {
                FNParametro parametro = FNParametro.Get(new Criteria("A.EMPRESA = " + Company.Current.Handle));

                if (FNMovimentacao.PossuiAdiantamentos(ObterCodigoInterno(), mov["DOCUMENTO"].GetInt32(), false) && parametro.VerificaAdtosBaixa.Value)
                {
                    FormLinkDefinition linkDefinitionNew = new FormLinkDefinition();
                    if (op.Instance.EHContasPagar == true)
                        linkDefinitionNew.Url = "~/aga/e/financeiro/adiantamentos/adt_fornecedor_cliente.aspx?tp=3";
                    else if (op.Instance.EHContasReceber == true)
                        linkDefinitionNew.Url = "~/aga/e/financeiro/adiantamentos/adt_fornecedor_cliente.aspx?tp=4";

                linkDefinitionNew.TargetSystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                linkDefinitionNew.TargetEntityDefinitionName = GNPessoa.GetEntityDefinition().Name;
                linkDefinitionNew.WhereClause = new WhereClause(string.Format("A.HANDLE = {0}", mov["PESSOA"].GetInt32()));
                linkDefinitionNew.IsModalNavigation = false;
                linkDefinitionNew.IsModalPage = true;

                    if (linkDefinitionNew.Url != "")
                       ScriptManager.RegisterStartupScript(this, GetType(), "AlertaAdiantamentos", "setTimeout(() => { var message = document.createElement(\"div\"); message.innerHTML = '<div class=\"alert alert-danger\" id=\"mensagemAdiantamentos\"><strong><a href=\"" + Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkDefinitionNew, false, false, true, true) + "\">Esta parcela possui adiantamentos para baixar! Clique aqui caso deseje baixar os adiantamentos.</a></strong></ div > '; var messagePanel = document.querySelector(\"#ctl00_Main_MOVIMENTAO_UpdatePanel > div.message-panel\"); messagePanel.append(message); }, 1); setTimeout(() => { var mensagemAdiantamentos = document.getElementById('mensagemAdiantamentos'); if (mensagemAdiantamentos) { mensagemAdiantamentos.style.visibility = 'visible'; } }, 1);", true); 

                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "AlertaAdiantamentos", "var messagePanel = document.querySelector(\"#ctl00_Main_MOVIMENTAO_UpdatePanel > div.message-panel\"); messagePanel.append(message); setTimeout(() => { message.style.visibility = 'hidden'; }, 1); }", true);
                }
            }
        }
    }

    private void MOVIMENTAOCommandExecute(object sender, FormCommandExecuteArgs e)
    {
        var mov = MOVIMENTAO.GetEntity();

        if (mov == null)
            throw new BusinessException("Não foi possível recuperar a entidade");

        if (e.CommandName == "Save")
        {
            var parcela = ParcelaDao.GetFirstOrDefault(mov["PARCELA"].GetDBValue().ToInt());

            if (parcela != null && mov["VALOR"].Value.ToDecimal() > parcela.Valor)
                throw new BusinessException("Não foi possível baixar! Valor maior que saldo a baixar.");
            else
                ScriptManager.RegisterStartupScript(this, GetType(), "AlertaAdiantamentos", "var messagePanel = document.querySelector(\"#ctl00_Main_MOVIMENTAO_UpdatePanel > div.message-panel\"); messagePanel.append(message); setTimeout(() => { message.style.visibility = 'hidden'; }, 1); }", true);

            if (parcela != null && parcela.TemRetencaoBaixa.GetValueOrDefault())
            {
                var documento = parcela.DocumentoInstance;
                var documentoImpostosParcela = DocumentoImpostoParcelaDao.GetMany(a => a.ParcelaHandle == parcela.Handle);
                var pessoaImpostos = PessoaImpostoDao.GetMany(a => a.PessoaHandle == documento.PessoaHandle);
                var impostos = pessoaImpostos.Where(a => documentoImpostosParcela.Select(b => b.ImpostoHandle).Contains(a.ImpostoHandle));

                if (impostos.Any(a => a.DecisaoJudicialRetencao == GNPessoaImpostosDecisaoJudicialRetencaoRadioItens.ItemBloquearPagamentoAoFornecedor))
                    throw new BusinessException("Documento possui impostos com bloqueio por decisão judicial que impede pagamento do fornecedor.");
            }
        }
        if (e.CommandName == "New")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "AlertaAdiantamentos", "var messagePanel = document.querySelector(\"#ctl00_Main_MOVIMENTAO_UpdatePanel > div.message-panel\"); messagePanel.append(message); setTimeout(() => { message.style.visibility = 'hidden'; }, 1); }", true);
        }
    }

    private void MOVIMENTAO_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            var cmd = MOVIMENTAO.EntityViewCommands.Commands.FirstOrDefault(p => p.Name == "Save");

            if (cmd != null)
            {
                var movimentacao = MOVIMENTAO.GetEntity();

                CriarVariaveisSessao(movimentacao);
                var codigoInterno = ObterCodigoInterno();

                if (codigoInterno == FNLancamentoCodigoInterno.ciPGV || codigoInterno == FNLancamentoCodigoInterno.ciRCV)
                {
                    FormLinkDefinition linkDefinitionNew = new FormLinkDefinition();
                    linkDefinitionNew.Url = "~/aga/a/financeiro/documentos/lancamentos.aspx";
                    linkDefinitionNew.TargetSystemInstanceName = BennerConfiguration.DefaultSystemInstanceName;
                    linkDefinitionNew.TargetEntityDefinitionName = FNLancamento.GetEntityDefinition().Name;
                    linkDefinitionNew.WhereClause = new WhereClause(string.Format("A.MOVIMENTACAO = {0} AND A.LANCAMENTOTESOURARIA = {1}", movimentacao.Handle, movimentacao[FNMovimentacao.FieldNames.LancamentoTesouraria].GetInt64()));
                    linkDefinitionNew.IsModalNavigation = linkDefinitionNew.IsModalPage = true;
                    SessionVars.SetSessionVar("PRIMEIRAVEZ", null);
                    Response.Redirect(Benner.Tecnologia.Wes.Components.UriBuilder.Create(linkDefinitionNew));
                }
            }
        }

        if (e.CommandName == "New")
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "AlertaAdiantamentos", "var messagePanel = document.querySelector(\"#ctl00_Main_MOVIMENTAO_UpdatePanel > div.message-panel\"); messagePanel.append(message); setTimeout(() => { message.style.visibility = 'hidden'; }, 1); }", true);
        }
    }

    private void CriarVariaveisSessao(EntityBase entidadeOrigem)
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

        var operacao = OperacaoDao.GetFirstOrDefault(handleOperacao);

        if (operacao != null)
            codigoOperacao = operacao.CodigoInterno.Index;

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
        var entities = GetCamposOperacaoValida(this.CodigoInterno, this.OperacaoValida);

        if (entities.Count == 0)
            entities = GetCamposMovimentacaoOperacaoIsNull(this.CodigoInterno);

        var definition = EntityDefinition.GetByName("FN_MOVIMENTACOES");

        var form = FormDefinition.GetByName("FN_MOVIMENTACOES.FORM");

        form.Name = "FN_MOVIMENTACOES.FORM";

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

        if (MOVIMENTAO.FormDefinition != null)
        {
            MOVIMENTAO.FormDefinition.Commands["Delete"].Visible = false;
            MOVIMENTAO.FormDefinition.Commands["New"].Visible = false;
            MOVIMENTAO.FormDefinition.Commands["Edit"].Visible = false;
        }
        return form;
    }
}