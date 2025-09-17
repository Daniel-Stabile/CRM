using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Ninject;
using System;
using Benner.Tecnologia.Wes.Components.WebApp;
using System.Web.UI.WebControls;
using Benner.Corporativo.Definicoes.Financeiro.OfficeBanking;
using System.Collections.Generic;
using Benner.Tecnologia.Common;
using System.Linq;
using Parameter = Benner.Tecnologia.Common.Parameter;
using Benner.Tecnologia.Business;
using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Financeiro;

public partial class OfficeBankingConfirmarRemessaPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IFNParcelaPreRemessaDao ParcelaPreRemessaDao { get; set; }

    [Inject]
    public IFNContaTesourariaDao ContaTesourariaDao { get; set; }

    public Handle PreRemessa
    {
        get
        {
            var handle = Request.QueryString["hdl"];

            if (!string.IsNullOrEmpty(handle))
                return new Handle(handle);

            return 0;
        }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        CONTA.CommandExecuted += CONTA_CommandExecuted;
        CONTA.GridView.SelectedIndexChanging += GridView_SelectedIndexChanging;
        REMESSA.CommandExecuted += REMESSA_CommandExecuted;
        TTULOS.CommandExecute += TTULOS_CommandExecute;
        TTULOS.GridView.RowDataBound += GridView_RowDataBound;
        COMANDOS.OnCommandExecute += COMANDOS_OnCommandExecute;
        COMANDOS.OnCommandExecuted += COMANDOS_OnCommandExecuted;
    }


    private void COMANDOS_OnCommandExecuted(object sender, CommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_VOLTAR":
                CurrentStep.Value = "2";
                break;

            case "CMD_APROVAR":
                bool? ret = BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "AprovarPreRemessaSegundaAlcada", (IGNPreRemessa)REMESSA.GetEntity()) as bool?;

                if ((bool)ret)
                    this.CloseModalOrRedirectToPrevious();

                break;
        }

    }

    private void CONTA_CommandExecuted(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_PROXIMO")
        {
            CurrentStep.Value = "2";
            SessionVars.SetSessionVar("CONTALANCAMENTO", CONTA.GetEntity()["HANDLE"].Value.ToString());
            PreencherFormRemessa();
        }
    }

    private void REMESSA_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        switch (e.CommandName)
        {
            case "CMD_PROXIMO":
                CurrentStep.Value = "3";
                break;

            case "CMD_VOLTAR":
                CurrentStep.Value = "1";
                break;
        }
    }

    private void GridView_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        CurrentStep.Value = "2";
        SessionVars.SetSessionVar("CONTALANCAMENTO", CONTA.GetEntity()["HANDLE"].Value.ToString());
        PreencherFormRemessa();
        REMESSA.ForceUpdate();
    }

    private void PreencherFormRemessa()
    {
        REMESSA.InMemoryEntity = Entity.Get(REMESSA.FormDefinition, PreRemessa);
        REMESSA.ForceUpdate();
    }

    public bool AguardandoAprovacaoSegundaAlcada
    {
        get
        {
            return new Query("SELECT STATUS FROM GN_PREREMESSAS WHERE HANDLE = :HANDLE", new Parameter("HANDLE", PreRemessa)).ExecuteFirstOrDefault()["STATUS"].GetDBValue().ToLong() == 4;
        }
    }

    private void COMANDOS_OnCommandExecute(object sender, CommandExecuteArgs e)
    {
        if(e.Command.Name == "CMD_APROVAR")
            if (!AguardandoAprovacaoSegundaAlcada || PreRemessa.IsReallyInvalid())
                throw new BusinessException("Não foi possível obter as informações da pré-remessa.");
    }

    private void TTULOS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (!AguardandoAprovacaoSegundaAlcada || PreRemessa.IsReallyInvalid())
            throw new BusinessException("Não foi possível obter as informações da pré-remessa ou a mesma não está aguardando aprovação.");

        switch (e.Command.Name)
        {
            case "CMD_REMOVER":
                if (PreRemessa <= 0 || TTULOS.SelectedEntitiesHandles.Count <= 0)
                    break;

                BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "DesvincularParcelasPreRemessa", PreRemessa.ToLong(), TTULOS.SelectedEntitiesHandles);

                break;

            case "CMD_RELATORIO":
                SessionVars.SetSessionVar("HANDLEENTIDADERELATORIO", PreRemessa.ToString());
                break;
        }
    }

    private void GridView_RowDataBound(object sender, System.Web.UI.WebControls.GridViewRowEventArgs e)
    {
        if (e.Row.RowType != System.Web.UI.WebControls.DataControlRowType.DataRow)
            return;

        var entity = e.Row.DataItem as EntityBase;

        string log = entity["HISTORICO"].IsNull ? string.Empty : entity["HISTORICO"].GetString();
        bool HasDivergences = !string.IsNullOrWhiteSpace(log);

        string mensagem = HasDivergences ? log : "Não há divergências.";
        string fontIcon = HasDivergences ? "fa fa-history" : "fa fa-check";

        e.Row.CellByName("HISTORICO").CreatePopover(
            fontIcon,
            "default",
            "Histórico do título",
            mensagem,
            false,
            PlacementPopover.Right,
            TriggerPopover.Hover);
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        Criteria whereParcelaPreRemessas = new Criteria(string.Format("A.PREREMESSA = (SELECT HANDLE FROM GN_PREREMESSAS WHERE HANDLE = {0} AND STATUS = 4)", PreRemessa));

        IEnumerable<IFNParcelaPreRemessa> preRemessas = ParcelaPreRemessaDao.FetchMany(whereParcelaPreRemessas);
        IEnumerable<FNContaTesouraria> contasTesouraria = FNContaTesouraria.FetchMany(new Criteria("A.EMPRESA = @EMPRESA"));

        decimal valorTotal = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.Valor));
        decimal valoresBaixados = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.ValoresBaixados));
        decimal valorDescontoTotal = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.DescontoCondicional));
        decimal valorLiquidoTotal = valorTotal - valoresBaixados - valorDescontoTotal;

        decimal saldo = contasTesouraria.Sum(a => a.ObterSaldo(a.Handle.ToInt()));
        decimal saldoFuturo = contasTesouraria.Sum(a => a.ObterSaldoFuturo(a.Handle.ToInt()));
        decimal saldoTotal = contasTesouraria.Sum(a => a.ObterSaldoTotal(a.Handle.ToInt()));

        TTULOS.UserDefinedCriteriaWhereClause = whereParcelaPreRemessas.Where;

        #region Atualizar valores Tiles

        VALORTOTAL_TILE.Value = valorTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        TOTALDESCONTO_TILE.Value = valorDescontoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORESBAIXADOS_TILE.Value = valoresBaixados.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORTOTALLQUIDO_TILE.Value = valorLiquidoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));

        #endregion

        AtualizarWidgets();
    }

    private void AtualizarWidgets()
    {
        TTULOS.DataLoad();
        VALORTOTAL_TILE.DataLoad();
        TOTALDESCONTO_TILE.DataLoad();
        VALORESBAIXADOS_TILE.DataLoad();
        VALORTOTALLQUIDO_TILE.DataLoad();

        VALORTOTAL_TILE.ForceUpdate();
        TOTALDESCONTO_TILE.ForceUpdate();
        VALORESBAIXADOS_TILE.ForceUpdate();
        VALORTOTALLQUIDO_TILE.ForceUpdate();
        TTULOS.ForceUpdate();
    }
}
