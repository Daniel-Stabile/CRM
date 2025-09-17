using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Financeiro.OfficeBanking;
using Benner.ERP.Comum;
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

public partial class OfficeBankingPreRemessaAConfirmarPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IFNParcelaPreRemessaDao ParcelaPreRemessaDao { get; set; }

    [Inject]
    public IFNParcelaDao ParcelaDao { get; set; }

    [Inject]
    public IGNPreRemessaDao PreRemessaDao { get; set; }

    public Handle PreRemessa
    {
        get
        {
            var handle =  Request.QueryString["hdl"];

            if (!string.IsNullOrEmpty(handle))
                return new Handle(handle);

            return 0;
        }
    }

    public bool AguardandoAprovacao
    {
        get
        {
            return PreRemessaDao.GetFirstOrDefault(PreRemessa).Status == GNPreRemessaStatusRadioItens.ItemAguardandoConferencia;
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        TTULOS.CustomCommandsVisible = Utils.VerificaPermissao("VISUALIZAR_APROVACAO_PREPARACAO_REMESSA");
        COMANDOS.CustomCommandsVisible = Utils.VerificaPermissao("VISUALIZAR_APROVACAO_PREPARACAO_REMESSA");
        COMANDOS.OnCommandExecute += COMANDOS_OnCommandExecute;
        COMANDOS.OnCommandExecuted += COMANDOS_OnCommandExecuted;
        TTULOS.CommandExecute += TTULOS_CommandExecute;
        TTULOS.RowCommandExecute += TTULOS_RowCommandExecute;
        TTULOS.GridView.RowDataBound += GridView_RowDataBound;
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

    private void COMANDOS_OnCommandExecute(object sender, CommandExecuteArgs e)
    {
        if (PreRemessa.IsReallyInvalid() || !AguardandoAprovacao)
            throw new BusinessException("Não foi possível obter as informações da preparação de remessa.");
    }

    private void TTULOS_RowCommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "View":
                var link = new FormLinkDefinition()
                {
                    IsModalPage = true,
                    TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
                    TargetEntityDefinitionName = FNParcela.GetEntityDefinition().Name,
                    WhereClause = new WhereClause(e.Entity["PARCELA"].GetInt64()),
                    Url = TTULOS.FormUrl
                };

                string url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link, absoluteUrl: true, modal: true, modalSize: CommandModalSize.FullPage);

                Response.Redirect(url);

                break;
        }
    }

    private void TTULOS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (PreRemessa.IsReallyInvalid() || !AguardandoAprovacao)
            throw new BusinessException("Não foi possível obter as informações da preparação de remessa.");

        switch (e.Command.Name)
        {
            case "CMD_RELATORIO":
                SessionVars.SetSessionVar("HANDLEENTIDADERELATORIO", PreRemessa.ToString());
                break;
        }
    }

    private void COMANDOS_OnCommandExecuted(object sender, CommandExecuteArgs e)
    {
        if(PreRemessa.IsReallyInvalid() || !AguardandoAprovacao)
            throw new BusinessException("Não foi possível obter as informações da preparação de remessa.");

        switch (e.Command.Name)
        {
            case "CMD_APROVAR":
                BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "AprovarPreRemessa", PreRemessa.ToLong());
                break;

            case "CMD_RECUSAR":
                BennerVars.UserVars["HANDLEENTIDADEMOTIVO"] = PreRemessa.ToString();
                break;

            default:
                break;
        }
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);
        Criteria whereParcelaPreRemessas = new Criteria(string.Format("A.PREREMESSA = (SELECT HANDLE FROM GN_PREREMESSAS WHERE HANDLE = {0} AND STATUS = 2)", PreRemessa));

        IEnumerable<IFNParcelaPreRemessa> preRemessas = ParcelaPreRemessaDao.FetchMany(whereParcelaPreRemessas);

        decimal valorTotal = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.Valor));
        decimal valoresBaixados = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.ValoresBaixados));
        decimal valorDescontoTotal = Convert.ToDecimal(preRemessas.Sum(a => a.ParcelaInstance.DescontoCondicional));
        decimal valorLiquidoTotal = valorTotal - valoresBaixados - valorDescontoTotal;

        TTULOS.UserDefinedCriteriaWhereClause = whereParcelaPreRemessas.Where;

        #region Atualizar valores Tiles

        VALORTOTAL_TILE.Value = valorTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        TOTALDESCONTO_TILE.Value = valorDescontoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORESBAIXADOS_TILE.Value = valoresBaixados.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORTOTALLQUIDO_TILE.Value = valorLiquidoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));

        #endregion

        #region Atualizar Widgets

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
        COMANDOS.ForceUpdate();

        #endregion
    }
}
