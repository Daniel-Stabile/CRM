using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Financeiro.ContasFinanceiras;
using Benner.Corporativo.Financeiro.LancamentosFinanceiros;
using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;

public partial class ContasFinanceirasContasFinanceirasPage : WesPage
{
    #region Propriedades
    private ContasFinanceirasHelper _helper;

    public FNLancamentoCodigoInterno CodigoInterno
    {
        get
        {
            LinkDefinition linkDefinition = EnsureLinkDefinition();
            FNLancamentoCodigoInterno codigoInterno;

            if (linkDefinition.Parameters["CODIGOINTERNO"] == null || !Enum.TryParse(linkDefinition.Parameters["CODIGOINTERNO"].ToString(), out codigoInterno))
                throw new BusinessException("Necessário preencher o código interno.");

            return codigoInterno;
        }
    }

    public bool SomenteLeitura
    {
        get
        {
            LinkDefinition linkDefinition = EnsureLinkDefinition();
            bool retorno = false;

            if (linkDefinition.Parameters["SOMENTELEITURA"] == null || !bool.TryParse(linkDefinition.Parameters["SOMENTELEITURA"].ToString(), out retorno))
                retorno = false;

            return retorno;
        }
    }

    public EntityBase EntidadeOrigem
    {
        get
        {
            LinkDefinition linkDefinition = EnsureLinkDefinition();
            EntityBase entidadeOrigem = null;

            if (linkDefinition.Parameters["ENTIDADEORIGEM"] != null)
                entidadeOrigem = (EntityBase)linkDefinition.Parameters["ENTIDADEORIGEM"];

            if (entidadeOrigem == null)
                throw new BusinessException("Faltou preencher a entidade origem");

            return entidadeOrigem;
        }
    }

    public FormLinkDefinition Destino
    {
        get
        {
            LinkDefinition linkDefinition = EnsureLinkDefinition();
            FormLinkDefinition destino = null;

            if (linkDefinition.Parameters["DESTINO"] != null)
            {
                destino = new FormLinkDefinition();
                destino.Url = linkDefinition.Parameters["DESTINO"].ToString();
            }
            return destino;
        }
    }

    private LinkDefinition EnsureLinkDefinition()
    {
        var linkDefinition = this.GetLinkDefinition();


        if (linkDefinition == null)
            throw new BusinessException("A origem não informou os parâmetros necessários.");

        return linkDefinition;
    }

    protected ContasFinanceirasHelper Helper
    {
        get
        {
            if (_helper == null)
                _helper = ContasFinanceirasHelper.CreateInstance(this.CodigoInterno, this.EntidadeOrigem);

            return _helper;
        }
    }

    /// <summary>
    /// Lista com todos os lançamentos atuais da origem (EntidadeOrigem - Documento, Contrato, Fatura, etc).
    /// Lançamentos que já existiam na base tem o handle válido, novos registros tem o handle negativo, lançamentos excluídos não estão presentes na lista.
    /// </summary>
    private Entities<EntityBase> LancamentosEntities
    {
        get
        {
            return Session["repoLancamentos"] as Entities<EntityBase>;
        }
        set
        {
            Session["repoLancamentos"] = value;
        }
    }

    /// <summary>
    /// Retorna a lista dos centros de custos do ATUAL lançamento da página.
    /// CCs que já existiam na base tem o handle válido, novos registros tem o handle negativo, CCs excluídos não estão presentes na lista.
    /// </summary>
    private Entities<EntityBase> CentrosDeCustoEntities
    {
        get
        {
            return GetCentroCustos(formLancamentos.GetEntity());
        }
    }
    #endregion Propriedades

    #region Overrides
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        OcultarComandos();
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (!IsPostBack)
            LancamentosEntities = null;

        gridLancamentos.GetEntitiesMethod = GetEntitiesMethodImplLancamentos;
        gridLancamentoCC.GetEntitiesMethod = GetEntitiesMethodImplLancamentoCC;

        gridLancamentos.SelectEntityMethod = GetSelectMethodLancamentos;
        gridLancamentoCC.SelectEntityMethod = GetSelectMethodLancamentosCC;

        formLancamentos.GetEntityMethod = GetEntityMethodImplLancamentos;
        formLancamentoCC.GetEntityMethod = GetEntityMethodImplLancamentoCC;

        formLancamentos.CreateEntityMethod = CreateEntityMethodImplLancamentos;
        formLancamentoCC.CreateEntityMethod = CreateEntityMethodImplLancamentosCC;

        formLancamentoCC.CanInsert = formLancamentos.GetEntity() != null && formLancamentos.GetEntity().State == EntityState.Read;

        formLancamentos.SaveEntityMethod = SaveEntityMethodImplLancamentos;
        formLancamentoCC.SaveEntityMethod = SaveEntityMethodImplLancamentoCC;

        formLancamentos.DeleteEntityMethod = (EntityBase entity) => { };
        formLancamentoCC.DeleteEntityMethod = (EntityBase entity) => { };

        formLancamentos.CommandExecute += FormLancamentos_CommandExecute;
        formLancamentoCC.CommandExecute += FormLancamentoCC_CommandExecute;
    }
    #endregion Overrides

    #region Grid
    private Entities<EntityBase> GetEntitiesMethodImplLancamentos(EntityViewBase entityViewBase, Criteria criteria)
    {
        // Confiamos que o get do grid vai acontecer antes de qualquer interação com os forms, então na primeira chamada do get do grid é feito no estilo "padrão" para carregar o que tem na base, depois é que vai ficar pegando o cache
        if (LancamentosEntities == null)
        {
            var lancamentos = Entity.GetMany(entityViewBase, GetWhereClauseGridLancamentos());
            lancamentos.ForEach(l => l.TransitoryData = new TransitoryData());
            LancamentosEntities = lancamentos;
        }
        formLancamentos.InMemoryEntity = LancamentosEntities.FirstOrDefault();

        return LancamentosEntities;
    }

    private Entities<EntityBase> GetEntitiesMethodImplLancamentoCC(EntityViewBase entityViewBase, Criteria criteria)
    {
        var retorno = new Entities<EntityBase>();
        var handleLanc = criteria.Parameters["HANDLE"].Value as long?;
        var lancamento = LancamentosEntities.Find(l => l.Handle.Equals(handleLanc));

        if (lancamento != null)
        {
            if (lancamento.TransitoryData.Keys.Contains("CC"))
                retorno = GetCentroCustos(lancamento);
            else
            {
                retorno = Entity.GetMany(entityViewBase, criteria);
                lancamento.TransitoryData["CC"] = retorno;
            }

            formLancamentoCC.InMemoryEntity = retorno.FirstOrDefault();
        }

        return retorno;
    }

    private EntityBase GetSelectMethodLancamentos(Handle handle)
    {
        return LancamentosEntities != null ? LancamentosEntities.Find(l => l.Handle.Equals(handle)) : null;
    }

    private EntityBase GetSelectMethodLancamentosCC(Handle handle)
    {
        return GetCentroCusto(handle);
    }
    #endregion Grid

    #region Form
    private EntityBase CreateEntityMethodImplLancamentos(EntityViewBase entityView, NameValueDictionary suggestedValues, TransitoryData transitoryData)
    {
        suggestedValues = FNLancamento.SugereValoresCamposLancamento(suggestedValues, Helper);
        var entity = Entity.Create(entityView, suggestedValues, ObterParametrosEntidadeLancamento());
        return entity;
    }

    private EntityBase CreateEntityMethodImplLancamentosCC(EntityViewBase entityView, NameValueDictionary suggestedValues, TransitoryData transitoryData)
    {
        suggestedValues = FNLancamentoCC.SugereValoresCamposCC(suggestedValues, formLancamentos.GetEntity(), Helper, ObterParametrosEntidadeCC());
        var entity = Entity.Create(entityView, suggestedValues, ObterParametrosEntidadeCC());
        entity.TransitoryVars["lancamento"] = formLancamentos.GetEntity();
        return entity;
    }

    private EntityBase GetEntityMethodImplLancamentos(EntityViewBase entityView, Criteria criteria, GetMode mode, TransitoryData transitoryData)
    {
        var handle = GetHandleFromCriteria(criteria);

        var entity = GetSelectMethodLancamentos(handle);
        return entity;
    }

    private EntityBase GetEntityMethodImplLancamentoCC(EntityViewBase entityView, Criteria criteria, GetMode mode, TransitoryData transitoryData)
    {
        var handle = GetHandleFromCriteria(criteria);
        EntityBase entity;

        entity = GetCentroCusto(handle);

        if (entity != null)
            entity.TransitoryVars["lancamento"] = formLancamentos.GetEntity();

        return entity;
    }

    private void SaveEntityMethodImplLancamentos(EntityBase entity)
    {
        FNLancamento.Validar(entity, Helper);

        if (entity.Handle.IsInvalid())
        {
            var newHandle = LancamentosEntities.Count() + 1;
            entity.Handle = new Handle((++newHandle) * -1);
        }
        else
        {
            var entityOnSession = LancamentosEntities.First(e => e.Handle.Equals(entity.Handle.Value));
            LancamentosEntities.Remove(entityOnSession);
            RedistribuirValoresCC(entity as FNLancamento);
            UpdateOriginalValues(entity);
            gridLancamentoCC.ForceUpdate();
        }
        entity.TransitoryData["PERSISTIR"] = true;
        entity.SetPropertyValue("State", EntityState.Read);

        LancamentosEntities.Add(entity);
        SelecionaItemNoGrid();
    }

    private void SaveEntityMethodImplLancamentoCC(EntityBase entity)
    {
        FNLancamentoCC.Validar(formLancamentos.GetEntity(), entity, CentrosDeCustoEntities);

        if (entity.Handle.IsInvalid())
        {
            var newHandle = CentrosDeCustoEntities.Count() + 1;
            entity.Handle = new Handle((++newHandle) * -1);
        }
        else
        {
            var entityOnSession = GetCentroCusto(entity.Handle);
            CentrosDeCustoEntities.Remove(entityOnSession);
        }

        entity.TransitoryData["PERSISTIR"] = true;
        entity.SetPropertyValue("State", EntityState.Read);

        CentrosDeCustoEntities.Add(entity);
    }

    private void FormLancamentos_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == PredefinedAction.ActionType.Cancel.ToString())
        {
            CancelEntity(e.Entity);
            gridLancamentos.ForceUpdate();
        }
        else if (e.CommandName == PredefinedAction.ActionType.Delete.ToString())
        {
            var entity = LancamentosEntities.First(l => l.Handle.Equals(e.Entity.Handle));
            LancamentosEntities.Remove(entity);
            SelecionaItemNoGrid();
        }
    }

    private void FormLancamentoCC_CommandExecute(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == PredefinedAction.ActionType.Cancel.ToString())
            CancelEntity(e.Entity);
        else if (e.CommandName == PredefinedAction.ActionType.Delete.ToString())
            RemoverCentroDeCustos(e.Entity);
    }
    #endregion Form

    #region Métodos auxiliares Lancamentos
    private void CancelEntity(EntityBase entity)
    {
        foreach (var oldValue in entity.OriginalFieldValues)
            entity.Fields[oldValue.Key] = oldValue.Value;
    }

    private void UpdateOriginalValues(EntityBase entity)
    {
        foreach (var field in entity.Fields)
            entity.OriginalFieldValues[field.Key] = field.Value;
    }

    private Entities<EntityBase> GetCentroCustos(EntityBase lancamento)
    {
        var entities = new Entities<EntityBase>();

        if (lancamento != null)
        {
            if (lancamento.TransitoryData.Keys.Contains("CC"))
                entities = lancamento.TransitoryData["CC"] as Entities<EntityBase>;
            else
                lancamento.TransitoryData["CC"] = entities;
        }

        return entities;
    }

    private EntityBase GetCentroCusto(Handle handle)
    {
        var lancamento = formLancamentos.GetEntity();
        return GetCentroCustos(lancamento).Find(e => (e.Handle.Value == handle));
    }

    private long GetHandleFromCriteria(Criteria criteria)
    {
        var par = criteria.Parameters.Find(p => p.Name == "AHANDLE");
        if (par == null)
            par = criteria.Parameters.Find(p => p.Name == "HANDLE");
        if (par == null)
            throw new BusinessException("Não encontrou o handle no Criteria: " + criteria);
        return Convert.ToInt64(par.Value);
    }

    private TransitoryData ObterParametrosEntidadeLancamento()
    {
        var td = new TransitoryData();
        td["CODIGOINTERNO"] = this.CodigoInterno;
        td["ENTIDADEORIGEM"] = this.EntidadeOrigem;
        td["SOMAVALORES"] = LancamentosEntities.Sum(x => x["VALOR"].GetDecimal());
        return td;
    }

    private TransitoryData ObterParametrosEntidadeCC()
    {
        var td = new TransitoryData();
        td["CODIGOINTERNO"] = this.CodigoInterno;
        td["ENTIDADEORIGEM"] = this.EntidadeOrigem;
        td["ENTIDADELANCAMENTO"] = formLancamentos.InMemoryEntity as FNLancamento;
        td["SOMAVALORESCC"] = CentrosDeCustoEntities.Sum(x => x["VALOR"].GetDecimal());
        return td;
    }

    private void RedistribuirValoresCC(FNLancamento lancamento)
    {
        if (lancamento.OriginalFieldValues["VALOR"].ToDecimal() != lancamento.Valor)
        {
            decimal maiorPerc = 0;
            var handleMaiorPerc = new Handle();
            var listaCC = GetCentroCustos(lancamento as EntityBase);
            decimal sobraValor = lancamento.Valor.Value;
            decimal sobraPerc = 100;
            decimal sobraVlrMoeda = lancamento.ValorMoeda != null ? lancamento.ValorMoeda.Value : 0;
            decimal sobraVlrMoeda1 = lancamento.ValorMoeda1 != null ? lancamento.ValorMoeda1.Value : 0;
            decimal sobraVlrMoeda2 = lancamento.ValorMoeda2 != null ? lancamento.ValorMoeda2.Value : 0;

            foreach (var item in listaCC)
            {
                var cc = item as FNLancamentoCC;
                var ccPerc = cc.Percentual.Value;
                var novoValor = Math.Round((lancamento.Valor.Value * ccPerc) / 100, 2);

                if (novoValor == 0)
                {
                    RemoverCentroDeCustos(item);
                }
                else
                {
                    if (cc.Percentual.Value > maiorPerc)
                    {
                        maiorPerc = cc.Percentual.Value;
                        handleMaiorPerc = cc.Handle;
                    }
                    cc.Valor = novoValor;
                    cc.ValorMoeda = lancamento.MoedaHandle.Value == Utils.MoedaPadrao() ? 0 :
                                     Math.Round((lancamento.ValorMoeda.Value * ccPerc) / 100, 2);
                    cc.ValorMoeda1 = Math.Round((lancamento.ValorMoeda1.Value * ccPerc) / 100, 2);
                    cc.ValorMoeda2 = Math.Round((lancamento.ValorMoeda2.Value * ccPerc) / 100, 2);

                    cc.Valor = novoValor;
                    sobraPerc = sobraPerc - cc.Percentual.Value;
                    sobraValor = sobraValor - cc.Valor.Value;
                    sobraVlrMoeda = sobraVlrMoeda - cc.ValorMoeda.Value;
                    sobraVlrMoeda1 = sobraVlrMoeda - cc.ValorMoeda1.Value;
                    sobraVlrMoeda2 = sobraVlrMoeda - cc.ValorMoeda2.Value;
                    item.TransitoryData["PERSISTIR"] = true;
                }
            }

            if (handleMaiorPerc.IsValid() && (sobraPerc != 0 || sobraValor != 0 || sobraVlrMoeda != 0 || sobraVlrMoeda1 != 0 || sobraVlrMoeda2 != 0))
            {
                var cc = listaCC.Find(x => x.Handle == handleMaiorPerc) as FNLancamentoCC;
                cc.Valor += sobraValor;
                cc.Percentual += sobraPerc;
                cc.ValorMoeda += sobraVlrMoeda;
                cc.ValorMoeda1 += sobraVlrMoeda1;
                cc.ValorMoeda2 += sobraVlrMoeda2;
                cc.TransitoryData["PERSISTIR"] = true;
            }
        }
    }

    private void RemoverCentroDeCustos(EntityBase e)
    {
        var entity = CentrosDeCustoEntities.First(l => l.Handle.Equals(e.Handle));
        CentrosDeCustoEntities.Remove(entity);
    }

    private void OcultarComandos()
    {
        if (SomenteLeitura)
        {
            //Pegar o asp:Buton que ainda será criado
            botaoConfirmar.Visible = false;
            botaoCancelar.Visible = false;
            formLancamentos.CanDelete = formLancamentos.CanInsert = formLancamentos.CanUpdate = false;
            formLancamentoCC.CanDelete = formLancamentoCC.CanInsert = formLancamentoCC.CanUpdate = false;
        }
    }

    private Criteria GetWhereClauseGridLancamentos()
    {
        string ligacaoAdicional = Helper.GetFiltroLigacaoAdicional();
        string campoLigacao = Helper.GetCampoLigacao();
        string campoHandle = Helper.GetCampoHandle();
        var handleDocumento = Helper.EntidadeOrigem[campoHandle].GetInt64();
        
        if (handleDocumento == 0)
        {
            var handle = Helper.EntidadeOrigem["HANDLE"].GetInt64();
            return new Criteria(string.Format("A.{0} = {1}" + (ligacaoAdicional != "" ? " AND " + ligacaoAdicional : ""), campoLigacao, handle));
        }
        else
        {
            return new Criteria(string.Format("A.{0} = {1}" + (ligacaoAdicional != "" ? " AND " + ligacaoAdicional : ""), campoLigacao, handleDocumento));
        }
    }

    private void SelecionaItemNoGrid()
    {
        ScriptManager.RegisterStartupScript(this, this.GetType(), "SelecionaItemGrid", "SelecionaItemGrid();", true);
        formLancamentoCC.InMemoryEntity = null;
    }

    protected PersistirLancamentosFinanceirosRequest GetLancamentosRequest()
    {
        var request = new PersistirLancamentosFinanceirosRequest();
        request.Helper = Helper;
        request.WhereBuscarLancamentos = GetWhereClauseGridLancamentos().GetWhereText();
        request.Lancamentos = new Dictionary<LancamentoFinanceiroRequest, List<LancamentoCCRequest>>();

        foreach (var item in LancamentosEntities)
        {
            var lancamento = new LancamentoFinanceiroRequest()
            {
                LancamentoFinanceiro = item,
                Persistir = item.TransitoryData.ContainsKey("PERSISTIR")
            };

            var lancamentosCC = new List<LancamentoCCRequest>();

            if (!item.TransitoryData.ContainsKey("CC"))
            {
                Criteria criteria = new Criteria("A.LANCAMENTO = :HANDLE",
                    new Benner.Tecnologia.Common.Parameter("HANDLE", lancamento.LancamentoFinanceiro.Handle));

                item.TransitoryData["CC"] = Entity.GetMany(FNLancamentoCC.GetEntityDefinition(), criteria);
            }

            foreach (var ccItem in item.TransitoryData["CC"] as Entities<EntityBase>)
            {
                var lancamentoCC = new LancamentoCCRequest()
                {
                    LancamentoCC = ccItem,
                    Persistir = ccItem.TransitoryData.ContainsKey("PERSISTIR")
                };
                lancamentosCC.Add(lancamentoCC);
            }

            request.Lancamentos.Add(lancamento, lancamentosCC);
        }

        return request;
    }
    #endregion Métodos auxiliares Lancamentos

    #region Eventos
    protected void BotaoConfirmar_OnClick(object sender, EventArgs e)
    {
        divMsgRetorno.Visible = false;
        msgRetorno.InnerHtml = string.Empty;

        try
        {
            var request = GetLancamentosRequest();
            BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.LancamentosFinanceiros.PersistirLancamentosFinanceiros, Benner.Corporativo.Financeiro", "Persistir", request);
            CloseModalAndRedirect();
        }
        catch (Exception ex)
        {
            divMsgRetorno.Visible = true;
            msgRetorno.InnerHtml = ex.Message.Replace("\n", "</span><br/><span>");
        }
    }

    protected void BotaoCancelar_OnClick(object sender, EventArgs e)
    {
        CloseModalAndRedirect();
    }

    private void CloseModalAndRedirect()
    {
        if (Destino != null)
        {
            var ret = Benner.Tecnologia.Wes.Components.UriBuilder.Create(Destino);
            Response.Redirect(ret);
        }
        else
            this.CloseModalAndRefreshOrRedirect();
    }
    #endregion Eventos
}
