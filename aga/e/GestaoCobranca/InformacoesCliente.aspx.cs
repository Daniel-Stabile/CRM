using Benner.Corporativo.Comum;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Corporativo.Definicoes.GestaoDeCobranca;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Business.Cache;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common.Services;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.UI.WebControls;
using Benner.Corporativo.Definicoes.Financeiro.Interfaces;

public partial class cobrancaInformacoesClientePage : WesPage
{
    [Inject]
    public ISessionVars SessionVars { get; set; }

    [Inject]
    public IFNParcelaDao ParcelaDao { get; set; }

    [Inject]
    public IRenegociadorDocumento RenegociadorDocumento { get;set; }

    private BusinessCacheProvider<Handle> _clienteCache = new BusinessCacheProvider<Handle>("cliente");
    private BusinessCacheProvider<List<Handle>> _titulosCache = new BusinessCacheProvider<List<Handle>>("titulos");
    private List<Handle> TitulosCache
    {
        get
        {
            return _titulosCache.Get("titulos");
        }
        set
        {
            if (value == null)
                _titulosCache.Clear("titulos");
            else
                _titulosCache.Set("titulos", value);
        }
    }

    private Handle ClienteCache
    {
        get
        {
            return _clienteCache.Get("cliente");
        }
        set
        {
            if (value == null)
                _clienteCache.Clear("cliente");
            else
                _clienteCache.Set("cliente", value);
        }
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        var cliente = INFORMAES.GetEntityHandle();
        TTULOS.SelectedEntitiesHandles.Clear();
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);

        ATIVIDADES.GridView.RowDataBound += ATIVIDADES_GridView_RowDataBound;
        ATIVIDADES.CommandExecute += ATIVIDADES_CommandExecute;

        TTULOS.CommandExecute += TTULOS_CommandExecute;
        TTULOS.GridView.RowDataBound += TTULOS_GridView_RowDataBound;
        TTULOS.FilterControl.FilterExecute += FilterControl_FilterExecute;

        RENEGOCIAES.CommandExecute += RENEGOCIAES_CommandExecute;

        if (INFORMAES.GetEntity() != null)
        {
            SessionVars.SetSessionVar("HANDLE", INFORMAES.GetEntityHandle().ToString());

            if (ClienteCache != null && !ClienteCache.Equals(INFORMAES.GetEntityHandle()))
                TitulosCache = null;
        }
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        if (!IsPostBack)
            PreencherCache();

        TTULOS.CompanyFilterMode = CompanyFilterMode.OnlyCompany;

        if ((TTULOS.FilterEntity != null) && (TTULOS.FilterEntity.TransitoryVars.ContainsKey("MOSTRARTODOS")) && (TTULOS.FilterEntity.TransitoryVars["MOSTRARTODOS"] != null))
            if (TTULOS.FilterEntity.TransitoryVars["MOSTRARTODOS"].Equals("S"))
                TTULOS.CompanyFilterMode = CompanyFilterMode.None;

        INFORMAES.DataLoad();

        if (ClienteCache.IsReallyValid())
        {
            AtualizaValoresTiles();
            AtualizarWidgets();

            WesBreadcrumbProvider.UpdateCurrentTitle(INFORMAES.GetEntity()["NOME"].GetString());
        }

    }

    private void RENEGOCIAES_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_EFETIVAR":
                GCSimulacao simulacao = GCSimulacao.GetFirstOrDefault(e.Entity.Handle);
                RenegociadorDocumento.EfetivarSimulacaoRenegociacao(simulacao);
                break;
        }
    }

    private void TTULOS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_RENEGOCIAR":
                if ((TTULOS.FilterEntity != null) && (TTULOS.FilterEntity.TransitoryVars.ContainsKey("MOSTRARTODOS")) && (TTULOS.FilterEntity.TransitoryVars["MOSTRARTODOS"] != null))
                    if (TTULOS.FilterEntity.TransitoryVars["MOSTRARTODOS"].Equals("S"))
                        throw new BusinessException("Para utilizar o botão Renegociar é necessário desmarcar a opção Mostrar títulos de todas as empresas e selecionar os títulos desejados.");

                if (TTULOS.SelectedEntitiesHandles.Count <= 0)
                    throw new BusinessException("Nenhum titulo selecionado.");

                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause = new WhereClause("A.CLIENTE = :CLIENTE AND A.EMPRESA = :EMPRESA AND A.PARCELASDARENEGOCIACAO = ':PARCELAS'");
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause.Parameters
                    .Add(new Benner.Tecnologia.Common.Parameter("CLIENTE", INFORMAES.GetEntity()["HANDLE"].GetInt64()));
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause.Parameters
                    .Add(new Benner.Tecnologia.Common.Parameter("EMPRESA", BennerContext.Security.GetCurrentCompany(BennerContext.Administration.DefaultSystemInstanceName).Handle));
                BennerVars.UserVars["PARCELASDARENEGOCIACAO"] = string.Join(",", new List<Handle>(TTULOS.SelectedEntitiesHandles.ToArray()).ConvertAll(i => i.ToString()).ToArray());

                break;

            case "CMD_HISTORICO":
                var where = string.Format("A.EMPRESA = {0} AND A.CLIENTE = {1}",
                      BennerContext.Security.GetCurrentCompany(BennerContext.Administration.DefaultSystemInstanceName).Handle,
                      INFORMAES.GetEntityHandle());

                if (TTULOS.SelectedEntitiesHandles.Count > 0)
                {
                    var documento = string.Join(",", TTULOS.SelectedEntitiesHandles);
                    var query = new Query("SELECT DISTINCT DOCUMENTO FROM FN_PARCELAS WHERE HANDLE IN (" + documento + ")")
                        .Execute()
                        .Select(x => x.Fields["DOCUMENTO"])
                        .ToList();
                    documento = string.Join(",", query);
                    where += string.Format(" AND (A.DOCUMENTO IN ({0}) OR A.DOCUMENTO IS NULL)", documento);
                }

                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause = new WhereClause(where);

                break;

            case "CMD_AVISOCOBRANCA":
                if (TTULOS.SelectedEntitiesHandles.Count <= 0)
                    throw new BusinessException("Nenhum titulo selecionado.");

                SessionVars.SetSessionVar("PARCELASGESTAOCOBRANCA", TTULOS.SelectedEntitiesHandles.BuildInSqlClause("A.HANDLE"));

                break;

            case "CMD_ANEXARARQUIVO":
                if (TTULOS.SelectedEntitiesHandles.Count <= 0)
                    throw new BusinessException("Nenhum título selecionado.");

                var parcelasDoc = new EntityAggregation();

                foreach (Handle handle in TTULOS.SelectedEntitiesHandles)
                {
                    parcelasDoc.Add(handle);
                }

                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause = new WhereClause("A.PARCELAS = :PARCELAS");
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause.Parameters.Add(new Benner.Tecnologia.Common.Parameter("PARCELAS", parcelasDoc));

                break;

        }
    }

    private void TTULOS_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
            return;

        var entity = e.Row.DataItem as EntityBase;

        ModificarLinha(entity, e);
    }

    private void FilterControl_FilterExecute(object sender, FilterExecuteEventArgs e)
    {
        TitulosCache = null;
        AtualizarWidgets();
        PreencherCache();
        AtualizaValoresTiles();
    }

    private void ATIVIDADES_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_REGISTRAR":
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause = new WhereClause("A.CLIENTE = :CLIENTE AND A.EMPRESA = :EMPRESA");
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause.Parameters
                    .Add(new Benner.Tecnologia.Common.Parameter("CLIENTE", INFORMAES.GetEntity()["HANDLE"].GetInt64()));
                ((EntityLinkDefinition)e.Command.OutputDefinition).WhereClause.Parameters
                    .Add(new Benner.Tecnologia.Common.Parameter("EMPRESA", BennerContext.Security.GetCurrentCompany(BennerContext.Administration.DefaultSystemInstanceName).Handle));
                break;
        }
    }

    private void ATIVIDADES_GridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType != DataControlRowType.DataRow)
                return;
 
        var entity = e.Row.DataItem as EntityBase;
  
        RenderAudit(e, entity);
    }

    private static void RenderAudit(GridViewRowEventArgs e, EntityBase entity)
    {
        if (!entity["DESCRICAO"].IsNull && !string.IsNullOrEmpty(entity["DESCRICAO"].GetString()))
        {
            var usuario = entity["PATH_USUARIO"].GetString();
            var data = entity["DATA"].GetDateTime();
            var descricao = entity["DESCRICAO"].GetString();
            var contato = entity["CONTATO"].GetString();

            StringBuilder icone = new StringBuilder();
            usuario.Split(' ').ToList().ForEach(i => icone.Append(i[0]));

            StringBuilder builder = new StringBuilder();
            builder.AppendLine("<section style=\"display: grid;grid-template-columns: 20% 80%\">");
            builder.AppendLine(string.Format("<div><button class=\"btn btn-icon-only btn-circle btn-sm usuario\">{0}</button></div>", icone.ToString().ToUpper()));
            builder.AppendLine("<div>");
            builder.AppendLine(string.Format("<p style=\"margin-bottom:5px;Font-size:90%\"><strong>{0}</strong></p>", usuario));
            builder.AppendLine(string.Format("<p style=\"margin-bottom:5px;Font-size:75%\"><span style=\"color: #999999;\">{0}</span></p>", contato));
            builder.AppendLine(string.Format("<p style=\"margin-bottom:5px;Font-size:90%\">{0}</p>", descricao));
            builder.AppendLine(string.Format("<p style=\"margin-bottom:5px;Font-size:75%\"><span style=\"color: #999999;\">{0} às {1}</span></p>",
                data.ToShortDateString(), data.ToShortTimeString()));
            builder.AppendLine("</div>");
            builder.AppendLine("</section>");
 
            e.Row.CellByName("CUSTOM").CreateLiteral(builder.ToString());
        }
    }

    private void ModificarColunaHistorico(EntityBase entity, GridViewRowEventArgs e)
    {
        if (entity["HISTORICO"].IsNull)
            return;

        e.Row.CellByName("HISTORICO").CreatePopover(
            "fa fa-history",
            "default",
            "Histórico do título",
            entity["HISTORICO"].GetString(),
            false,
            PlacementPopover.Left,
            TriggerPopover.Hover);
    }

    private void ModificarLinha(EntityBase entity, GridViewRowEventArgs e)
    {
        if (!entity["PARCELARENEGOCIADA"].IsNull || ParcelaDao.EhParcelaRenegociada(entity["HANDLE"].GetInt64()))
            e.Row.BackColor = System.Drawing.Color.Gray;
    }

    private void AtualizaValoresTiles()
    {
        decimal valorVencido = 0;
        decimal valorMulta = 0;
        decimal valorJuros = 0;

        if (TitulosCache != null)
        {
            valorVencido = TitulosCache.Sum(a => ParcelaDao.CalcularValorVencido(a, DateTime.Now));
            valorMulta = TitulosCache.Sum(a => ParcelaDao.CalcularMulta(a, DateTime.Now));
            valorJuros = TitulosCache.Sum(a => ParcelaDao.CalcularJuros(a, DateTime.Now));
        }

        decimal valorTotal = valorVencido + valorMulta + valorJuros;

        VENCIDO.Value = valorVencido.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        MULTA.Value = valorMulta.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        JUROS.Value = valorJuros.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
        TOTAL.Value = valorTotal.ToString("C", System.Globalization.CultureInfo.GetCultureInfo("pt-br"));
    }

    private void AtualizarWidgets()
    {
        TTULOS.DataLoad();
        ATIVIDADES.DataLoad();
        ATIVIDADES.ForceUpdate();
        VENCIDO.ForceUpdate();
        MULTA.ForceUpdate();
        JUROS.ForceUpdate();
        TOTAL.ForceUpdate();
    }

    private void PreencherCache()
    {
        if (INFORMAES.GetEntity() != null)
            ClienteCache = INFORMAES.GetEntityHandle();

        if (TTULOS.DataSource != null && TTULOS.DataSource.Count > 0)
            TitulosCache = TTULOS.DataSource.Select(a => a.Handle).ToList();
    }
}
