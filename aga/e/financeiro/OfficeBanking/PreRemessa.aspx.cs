using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.Financeiro.OfficeBanking;
using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Audit;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

public partial class OfficeBankingPreRemessaPage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IGNPreRemessaDao PreRemessaDao { get; set; }

    [Inject]
    public IFNParcelaPreRemessaDao ParcelaPreRemessaDao { get; set; }

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

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        TTULOS.CommandExecute += TTULOS_CommandExecute;
        TTULOS.GridView.RowDataBound += GridView_RowDataBound;
        TTULOS.RowCommandExecute += TTULOS_RowCommandExecute;
        COMANDOS.OnCommandExecute += COMANDOS_OnCommandExecute;
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
	
	private long ToLongLocal(Handle handle)
    {
        return handle.IsValid() ? handle.Value : 0;
    }

    private void COMANDOS_OnCommandExecute(object sender, CommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_APROVAR":
                BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "EnviarPreRemessaParaAprovacao", ToLongLocal(PreRemessa));

                break;

            case "CMD_CANCELAR":
                if (PreRemessa <= 0)
                    break;

                if (PreRemessa.IsReallyInvalid())
                    break;

                BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "DesvincularTodasParcelasPreRemessa", ToLongLocal(PreRemessa));

                break;

            case "CMD_INFORMACOES":
                var link = new FormLinkDefinition();
                link.TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName;
                link.TargetEntityDefinitionName = "GN_PREREMESSAS";
                link.IsModalPage = true;
                link.TargetFormMode = FormLinkDefinition.FormMode.View;
                link.Url = string.Format("~/aga/a/financeiro/OfficeBanking/InformacoesPreRemessa.aspx/?hdl={0}", PreRemessa);

                string url = Benner.Tecnologia.Wes.Components.UriBuilder.Create(link, absoluteUrl: true, modal: true);

                Response.Redirect(url);
                break;
        }
    }

    private void TTULOS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_REMOVER":
                if (PreRemessa <= 0 || TTULOS.SelectedEntitiesHandles.Count <= 0)
                {
                    throw new BusinessException("Selecione as parcelas a serem removidas.");
                }

                BennerContext.BusinessComponent.Call(
                    "Benner.Corporativo.Financeiro.OfficeBanking.Pagamento.PagamentoAutomatizadoPreRemessa, " +
                    "Benner.Corporativo.Financeiro",
                    "DesvincularParcelasPreRemessa", ToLongLocal(PreRemessa), TTULOS.SelectedEntitiesHandles);

                TTULOS.DeselectAllRows();

                break;

            case "CMD_ADICIONAR":
                e.Command.OutputDefinition.Url = e.Command.OutputDefinition.Url + "?hdl=" + PreRemessa.ToString();
                break;

            case "CMD_RELATORIO":
                SessionVars.SetSessionVar("HANDLEENTIDADERELATORIO", PreRemessa.ToString());
                break;
        }
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        IEnumerable<IFNParcelaPreRemessa> parcelasPreRemessa = ParcelaPreRemessaDao.FetchMany(new Criteria("A.PREREMESSA = :PREREMESSA", new Parameter("PREREMESSA", PreRemessa)));
        IGNPreRemessa preRemessa = PreRemessaDao.GetFirstOrDefault(PreRemessa);

        decimal valorTotal = Convert.ToDecimal(parcelasPreRemessa.Sum(a => a.ParcelaInstance.Valor));
        decimal valoresBaixados = Convert.ToDecimal(parcelasPreRemessa.Sum(a => a.ParcelaInstance.ValoresBaixados));
        decimal valorDescontoTotal = Convert.ToDecimal(parcelasPreRemessa.Sum(a => a.ParcelaInstance.DescontoCondicional));
        decimal valorLiquidoTotal = valorTotal - valoresBaixados - valorDescontoTotal;

        TTULOS.UserDefinedCriteriaWhereClause = "A.PREREMESSA = " + PreRemessa;

        VALORTOTAL_TILE.Value = valorTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        TOTALDESCONTO_TILE.Value = valorDescontoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORESBAIXADOS_TILE.Value = valoresBaixados.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        VALORTOTALLQUIDO_TILE.Value = valorLiquidoTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));

        var status = preRemessa == null ? GNPreRemessaStatusRadioItens.ItemEmPreparacao : preRemessa.Status;

        int statusIndexInt = status.Index.ToInt();
        int itemAguardandoRemessaIndexInt = GNPreRemessaStatusRadioItens.ItemAguardandoRemessa.Index.ToInt();
        bool visualizacao =
            status == GNPreRemessaStatusRadioItens.ItemAguardandoConferencia ||
            statusIndexInt >= itemAguardandoRemessaIndexInt;

        bool edicao =
            status == GNPreRemessaStatusRadioItens.ItemEmPreparacao ||
            status == GNPreRemessaStatusRadioItens.ItemComDivergencias && !visualizacao;

        bool insercao = edicao && Utils.VerificaPermissao("MANTER_PREPARACAO_REMESSA");

        COMANDOS.Commands["CMD_APROVAR"].Enabled = insercao && parcelasPreRemessa.Count() > 0;
        COMANDOS.Commands["CMD_CANCELAR"].Enabled = insercao && parcelasPreRemessa.Count() > 0;
        COMANDOS.Commands["CMD_INFORMACOES"].Enabled = PreRemessa.IsReallyValid();

        TTULOS.GridDefinition.Commands["CMD_RELATORIO"].Enabled = parcelasPreRemessa.Count() > 0;
        TTULOS.GridDefinition.Commands["CMD_ADICIONAR"].Enabled = insercao;
        TTULOS.GridDefinition.Commands["CMD_REMOVER"].Enabled = insercao && parcelasPreRemessa.Count() > 0;

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
        COMANDOS.ForceUpdate();
    }
}
