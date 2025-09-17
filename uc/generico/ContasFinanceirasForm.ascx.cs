using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Business;
using Benner.Corporativo.Definicoes.Web.Genericos;
using Benner.Corporativo.DataContracts.Web.Financeiro;
using Benner.Tecnologia.Wes.Components;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Tecnologia.Common.Components;

public partial class uc_generico_ContasFinanceirasForm : System.Web.UI.UserControl
{
    private Entities<EntityBase> LancsParaExcluir { get; set; }
    private Entities<EntityBase> LancCCParaExcluir { get; set; }

    public EntityBase Origem { get; set; }
    public string OrigemCampo { get; set; }
    public FNLancamentoTipoListaItens Tipo { get; set; }

    public SimpleGrid GridLancamentosUC { get { return gridLancamentos; } }
    public AjaxForm FormLancamentosUC { get { return formLancamentos; } }
    //public SimpleGrid GridLancamentoCCUC { get { return gridLancamentoCC; } }
    //public AjaxForm FormLancamentoCCUC { get { return formLancamentoCC; } }


    private long HandleLancamentoAnterior
    {
        get
        {
            var v = Session["HandleLancamentoAnterior"];
            return (v == null ? 0 : (long)v);
        }
        set
        {
            Session["HandleLancamentoAnterior"] = value;
        }
    }

    private Entities<EntityBase> ObterLancamentos()
    {
        if (Session["repoLancamentos"] == null)
            throw new BusinessException("Ainda não carregou o cache de lançamentos.");
        //Session["repoLancamentos"] = new Entities<FNLancamento>();
        return (Entities<EntityBase>)Session["repoLancamentos"];
    }
    private EntityBase ObterLancamento(Handle handle)
    {
        return ObterLancamentos().Find(e => (e.Handle.Value == handle));
    }

    private Entities<EntityBase> ObterLancamentoCC()
    {
        var handleLanc = gridLancamentos.GetEntity().Handle.Value;
        return ObterLancamentoCC(handleLanc);
    }

    private Entities<EntityBase> ObterLancamentoCC(long handleLanc)
    {
        if (Session["repoLancamentoCC" + handleLanc] == null)
            //Session["repoLancamentoCC"] = new Entities<FNLancamentoCC>();
            throw new BusinessException("Ainda não carregou o cache de lançamentos.");
        return (Entities<EntityBase>)Session["repoLancamentoCC" + handleLanc];
    }

    private void LimparRepositoriosSessao()
    {
        Session["repoLancamentos"] = null;
        var sessionsToRemove = Session.Keys.Cast<string>().Where(key => key.StartsWith("repoLancamentoCC")).ToList();
        foreach (var key in sessionsToRemove)
            Session.Remove(key);

    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!IsPostBack)
            LimparRepositoriosSessao();
        else
        {
            if (formLancamentoCC.InMemoryEntity != null)
            {
                formLancamentoCC.InMemoryEntity.TransitoryVars["LANCAMENTO"] = formLancamentos.InMemoryEntity;
                //formLancamentos.InMemoryEntity.TransitoryVars["NATUREZASUGERIDA"] = "";

            }
        }


        LancsParaExcluir = new Entities<EntityBase>();
        LancCCParaExcluir = new Entities<EntityBase>();


        gridLancamentos.GetEntitiesMethod = GetEntitiesMethodImplLancamentos;
        gridLancamentos.SelectEntityMethod = GetSelectMethodLancamentos;

        gridLancamentoCC.GetEntitiesMethod = GetEntitiesMethodImplLancamentoCC;

        formLancamentos.GetEntityMethod = GetEntityMethodImplLancamentos;
        formLancamentos.CreateEntityMethod = CreateEntityMethodImplLancamentos;
        formLancamentos.SaveEntityMethod = SaveEntityMethodImplLancamentos;
        formLancamentos.DeleteEntityMethod = DeleteEntityMethodImplLancamentos;
        formLancamentos.CommandExecute += FormLancamentos_CommandExecute;

        formLancamentoCC.GetEntityMethod = GetEntityMethodImplLancamentoCC;
        formLancamentoCC.CreateEntityMethod = CreateEntityMethodImplLancamentoCC;
        formLancamentoCC.SaveEntityMethod = SaveEntityMethodImplLancamentoCC;
        //formLancamentoCC.DeleteEntityMethod = DeleteEntityMethodImplLancamentoCC;

    }

    private Entities<EntityBase> CreateClone(Entities<EntityBase> entitiesOrigem)
    {
        var entitiesClone = new Entities<EntityBase>();
        foreach (var lancamento in entitiesOrigem)
        {
            var entityClone = Entity.CreateClone(lancamento.Definition, lancamento);
            entityClone.Handle = lancamento.Handle;
            entitiesClone.Add(entityClone);
        }
        return entitiesClone;
    }

    private EntityBase CreateClone(EntityBase entity)
    {
        if (entity.Fields.ContainsKey("_CONTEXTID"))
            entity.Fields.Remove("_CONTEXTID");

        var entityClone = Entity.CreateClone(entity.Definition, entity);
        entityClone.Handle = entity.Handle;

        return entityClone;
    }

    #region Grid Lancamentos
    private Entities<EntityBase> GetEntitiesMethodImplLancamentos(EntityViewBase entityViewBase, Criteria criteria)
    {
        // Confiamos que o get do grid vai acontecer antes de qualquer interação com os forms, então na primeira chamada do get do grid é feito no estilo "padrão" para carregar o que tem na base, depois é que vai ficar pegando o cache
        if (Session["repoLancamentos"] == null)
        {
            var lancamentos = Entity.GetMany(entityViewBase, criteria);
            Session["repoLancamentos"] = lancamentos;
        }
        return (Entities<EntityBase>)Session["repoLancamentos"];
    }

    private EntityBase GetSelectMethodLancamentos(Handle handle)
    {
        return ObterLancamento(handle);
    }

    #endregion

    #region Grid Lancamentos Centro de Custos
    private Entities<EntityBase> GetEntitiesMethodImplLancamentoCC(EntityViewBase entityViewBase, Criteria criteria)
    {
        var handleLanc = criteria.Parameters["HANDLE"].Value;
        if (Session["repoLancamentoCC" + handleLanc] == null)
            Session["repoLancamentoCC" + handleLanc] = Entity.GetMany(entityViewBase, criteria);
        return (Entities<EntityBase>)Session["repoLancamentoCC" + handleLanc];
    }
    #endregion

    #region Form Lancamentos
    private EntityBase GetEntityMethodImplLancamentos(EntityViewBase entityView, Criteria criteria, GetMode mode, TransitoryData transitoryData)
    {
        var handle = GetHandleFromCriteria(criteria);
        var entity = GetSelectMethodLancamentos(handle);

        //if (entity == null)
        //    throw new BusinessException("Não encontrou a entidade para o Criteria: " + criteria);

        //if (mode == GetMode.Read)
        //    entity = ObterLancamentosBck().Find(e => (e.Handle.Value == handle));

        //return entity;

        if (formLancamentos.InMemoryEntity != null && formLancamentos.InMemoryEntity.Handle == handle)
            return formLancamentos.InMemoryEntity;

        var entityClone = CreateClone(entity);

        entityClone.Handle = entity.Handle;
        return entityClone;

    }

    private EntityBase CreateEntityMethodImplLancamentos(EntityViewBase entityView, NameValueDictionary suggestedValues, TransitoryData transitoryData)
    {
        var entity = Entity.Create(entityView, suggestedValues, transitoryData);
        return entity;
    }

    private void SaveEntityMethodImplLancamentos(EntityBase entity)
    {
        if (entity.Handle.IsInvalid())
        {
            var newHandle = ObterLancamentos().Where(e => e.Handle < 0).Count();
            entity.Handle = new Handle((++newHandle) * -1);
            ObterLancamentos().Add(entity);
        }
        else
        {
            var entityOnSession = ObterLancamentos().First(e => e.Handle.Equals(entity.Handle.Value));

            ObterLancamentos().Remove(entityOnSession);
            ObterLancamentos().Add(CreateClone(entity));
        }
    }

    private void FormLancamentos_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == PredefinedAction.ActionType.Cancel.ToString())
            formLancamentos.InMemoryEntity = null;
        else if (e.CommandName == PredefinedAction.ActionType.New.ToString())
            formLancamentos.InMemoryEntity = Entity.Create(formLancamentos.EntityViewBase, formLancamentos.GetSuggestedValues(formLancamentos.InMemoryEntity.Definition), formLancamentos.InMemoryEntity.TransitoryData);
    }
    #endregion

    #region Form Lancamentos Centro de Custos
    private EntityBase GetEntityMethodImplLancamentoCC(EntityViewBase entityView, Criteria criteria, GetMode mode, TransitoryData transitoryData)
    {
        var handle = GetHandleFromCriteria(criteria);
        var entity = ObterLancamentoCC().Find(e => (e.Handle.Value == handle));
        if (entity == null)
        {
            entity = ObterLancamentoCC(HandleLancamentoAnterior).Find(e => (e.Handle.Value == handle));
            if (entity == null)
                throw new BusinessException("Não encontrou a entidade para o Criteria: " + criteria + ". Nem no lançamento anterior: " + HandleLancamentoAnterior);
        }
        if (HandleLancamentoAnterior != gridLancamentos.GetEntity().Handle.Value)
            HandleLancamentoAnterior = gridLancamentos.GetEntity().Handle.Value;

        return entity;
        //return Entity.Get(entityView, criteria, mode, transitoryData);
    }

    private EntityBase CreateEntityMethodImplLancamentoCC(EntityViewBase entityView, NameValueDictionary suggestedValues, TransitoryData transitoryData)
    {
        var entity = Entity.Create(entityView, suggestedValues, transitoryData);
        entity.Handle = new Handle();
        return entity;
    }

    private void SaveEntityMethodImplLancamentoCC(EntityBase entity)
    {
        var jaExiste = ObterLancamentoCC().Find(e => e.Handle.Equals(entity.Handle.Value));
        if (jaExiste == null)
            ObterLancamentoCC().Add(entity);
    }
    #endregion

    private long GetHandleFromCriteria(Criteria criteria)
    {
        var par = criteria.Parameters.Find(p => p.Name == "AHANDLE");
        if (par == null)
            par = criteria.Parameters.Find(p => p.Name == "HANDLE");
        if (par == null)
            throw new BusinessException("Não encontrou o handle no Criteria: " + criteria);
        return Convert.ToInt64(par.Value);
    }
    
    private void DeleteEntityMethodImplLancamentos(EntityBase entity)
    {
        var entityOnSession = ObterLancamentos().First(e => e.Handle.Equals(entity.Handle.Value));
        ObterLancamentos().Remove(entityOnSession);

        LancsParaExcluir.Add(entity);
        //entity.Delete();
    }
    
    /*
    private EntityBase CreateEntityMethodImplLancamentoCC(EntityViewBase entityView, NameValueDictionary suggestedValues, TransitoryData transitoryData)
    {
        return Entity.Create(entityView, suggestedValues, transitoryData);
    }
    */
    
    private void DeleteEntityMethodImplLancamentoCC(EntityBase entity)
    {
        ObterLancamentoCC().Remove(entity);
        LancCCParaExcluir.Add(entity);
        //entity.Delete();
    }

    protected void GravarRegistros(object sender, EventArgs e)
    {
        /*      var parametro = Registros();
              try
              {
                  BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Web.ContasFinanceiras, Benner.Corporativo.Financeiro", "GravarLancamentos", parametro);
                  divMsgRetorno.Visible = false;
                  msgRetorno.InnerHtml = "";

                  ScriptManager.RegisterStartupScript(this.Page, this.Page.GetType(), "ModalCommand_modal", "$('#ModalCommand_modal').modal('hide');", true);
              }
              catch (Exception exp)
              {
                  divMsgRetorno.Visible = true;
                  msgRetorno.InnerHtml = exp.Message;
              }
      */
    }

    private void InserirRegistroLancamento(EntityBase entidade, Entities<EntityBase> lancamentosCC = null)
    {
        /*
        gridLancamentos.GetEntitiesMethod = new Grid.GetEntitiesDelegate(GetEntitiesContasFinanceiras);
        var registrosGridLancamento = (Entities<EntityBase>)gridLancamentos.DataSource;
        var lancamento = new LancamentosContaFinanceiraModel()
        {
            conta = entidade["CONTA"].GetString(),
            handleConta = entidade["CONTA"].GetInt64(),
            filial = entidade["FILIAL"].GetString(),
            handleFilial = entidade["FILIAL"].GetInt64(),
            natureza = entidade["NATUREZA"].GetString(),
            tipoNatureza = entidade["NATUREZA"].GetString().Substring(0, 1),
            valor = entidade["VALOR"].GetDecimal().ToString("C2"),
            valorOriginal = entidade["VALOR"].GetDecimal(),
            tipoOrigem = (int)OrigemDoFormulario(),
            handleOrigem = HandleItemOrigemFormulario(),
            tipoTipo = (int)TipoOrigemDoFormulario(),
            historico = entidade["HISTORICO"].GetString()
        };

        BuscarLancamentosCC(entidadeLancamento, lancamento);

        if (entidade.Fields.ContainsKey("CENTROCUSTO") && entidade["CENTROCUSTO"].GetInt64() > 0)
            lancamento.lancamentosCC = InserirRegistroLancamentoCC(lancamento.lancamentosCC, entidade);

        if (lancamentosCC != null)
            lancamento.lancamentosCC = InserirListaRegistroLancamentoCC(lancamentosCC);

        registrosGridLancamento.Add(lancamento);
        gridLancamentos.DataBind();
        */
    }
    /*
    private Entities<EntityBase> GetEntitiesContasFinanceiras(EntityViewBase entityViewBase, Criteria criteria)
    {
        return List<LancamentosContaFinanceiraModel>)ViewState["registrosLancamentos"];
    }

    private Entities<EntityBase> Registros()
    {
        return (Entities<EntityBase>)ViewState["registrosLancamentos"];
    }
    */

    protected void CONTASFINANCEIRAS_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        //var entidade = CONTASFINANCEIRAS.GetEntity();
        //InserirRegistroLancamento(entidade, WebGNContaFinanceira.SugerirRateioCC(entidade["CONTA"].GetInt64(), entidade["VALOR"].GetDecimal()));
    }

    protected void CONTASFINANCEIRAS_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        //var entidade = CONTASFINANCEIRAS.GetEntity();

        //if (entidade["VALOR"].GetDecimal() <= 0)
        //throw new BusinessException("O valor deve ser maior que zero!");

        //entidade["LIGACAO"].Value = BuscarLigacao();
    }

    protected void CENTRODECUSTO_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        /*
        if (gridLancamentos.SelectedIndex >= 0)
        {
            VerificarSaldoLancamento();

            var registroAtual = RegistroSelecionado();
            var entidade = CENTRODECUSTO.GetEntity();
            var entityAssociationFNContas = new EntityAssociation(registroAtual.handleConta, EntityDefinition.GetByName("FN_CONTAS")); //associar a conta para validar na entidade
            var entityAssociationFiliais = new EntityAssociation(registroAtual.handleFilial, EntityDefinition.GetByName("FILIAIS")); //associar a filial para validar na entidade
            entidade["CONTA"].Value = entityAssociationFNContas;
            entidade["FILIAL"].Value = entityAssociationFiliais;
            entidade["LIGACAO"].Value = BuscarLigacao();
            if (entidade["VALOR"].GetDecimal() <= 0)
                throw new BusinessException("O valor deve ser maior que zero!");
        }
        else
        {
            throw new BusinessException("Cadastre/Selecione uma conta financeira primeiro!");
        }
        */

    }

    protected void CENTRODECUSTO_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        /*
        if (gridLancamentos.SelectedIndex >= 0)
        {
            var entidade = CENTRODECUSTO.GetEntity();

            var lancamentosCC = RegistroSelecionado().lancamentosCC;
            gridLancamentosCC.DataSource = lancamentosCC;
            InserirRegistroLancamentoCC(lancamentosCC, entidade);
            gridLancamentosCC.DataBind();
        }
        */
    }


}