using Benner.Corporativo.Definicoes.Orcamento;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web.UI;

public partial class orcamentoremanejarPage : WesPage
{
    public List<IEntityBase> Remanejamentos { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        FILTRO.DisplayCommandExecutedDefaultMessage = PAINELCOMANDOS.DisplayCommandExecutedDefaultMessage = false;

        FILTRO.CommandExecuted += FILTRO_CommandExecuted;
        PAINELCOMANDOS.OnCommandExecuted += PAINELCOMANDOS_OnCommandExecuted;

        if (!IsPostBack)
            ObterResultadoFiltro();
    }

    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);
    
        string titulo = "Remanejar";
        var filtro = FILTRO.GetEntity();

        if (filtro != null)  
            titulo += " " + filtro["VERSAOORCAMENTO"].GetString();     

        WesBreadcrumbProvider.UpdateCurrentTitle(titulo);
    }

    private void FILTRO_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            var filtro = FILTRO.GetEntity();
            AplicarFiltros(filtro);
            CurrentStep.Value = "2";
            ObterResultadoFiltro(filtro);
        }
    }

    private void ObterResultadoFiltro(EntityBase filtro = null)
    {
        Remanejamentos = new List<IEntityBase>();

        if (filtro != null)
        {
            Remanejamentos.AddRange((IList<IEntityBase>)BennerContext.BusinessComponent.Call("Benner.Corporativo.Orcamento.Remanejamento.Consulta.ConsultorRemanejamento, Benner.Corporativo.Orcamento",
                                                                                             "ObterRemanejados",
                                                                                             filtro));
        }

        ScriptManager.RegisterStartupScript(this, GetType(), "ValoresRemanejados", "ValoresRemanejados(" + JsonConvert.SerializeObject(Remanejamentos) + ");", true);
    }

    private void AplicarFiltros(EntityBase filtro)
    {
        FiltroOrigem.Value = MontarFiltroOrigem(filtro);
        FiltroDestino.Value = MontarFiltroDestino(filtro);

        AplicarFiltroOrigem(FiltroOrigem.Value);
        AplicarFiltroDestino(FiltroDestino.Value);
    }

    private string MontarFiltroOrigem(EntityBase filtro)
    {
        // Deve ser invertido
        return MontarFiltro(filtro, "DESTINO");
    }

    private string MontarFiltroDestino(EntityBase filtro)
    {
        // Deve ser invertido
        return MontarFiltro(filtro, "ORIGEM");
    }

    private string MontarFiltro(EntityBase filtro, string tipo)
    {
        var condicoes = new List<string>();

        if (filtro[CTFiltroRemanejar.FieldNames.VersaoOrcamento].GetDBValue() != null)
            condicoes.Add(string.Format("A.VERSAO = {0}", filtro[CTFiltroRemanejar.FieldNames.VersaoOrcamento].GetInt64()));

        if (filtro["FILIAL" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.FILIAL = {0}", filtro["FILIAL" + tipo].GetInt64()));

        if (filtro["CONTA" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.CONTA = {0}", filtro["CONTA" + tipo].GetInt64()));

        if (filtro["CC" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.CENTROCUSTO = {0}", filtro["CC" + tipo].GetInt64()));
        else if (filtro["CCGERENCIAL" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.CENTROCUSTO = {0}", filtro["CCGERENCIAL" + tipo].GetInt64()));
        else
            condicoes.Add("A.CENTROCUSTO IS NULL");

        if (filtro["PROJETO" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.PROJETO = {0}", filtro["PROJETO" + tipo].GetInt64()));
        else if (filtro["PROJGERENCIAL" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.PROJETO = {0}", filtro["PROJGERENCIAL" + tipo].GetInt64()));
        else
            condicoes.Add("A.PROJETO IS NULL");

        if (filtro["INICIO" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.COMPETENCIA >= @DATA({0})", filtro["INICIO" + tipo].GetDateTime().ToString("dd/MM/yyyy")));

        if (filtro["FIM" + tipo].GetDBValue() != null)
            condicoes.Add(string.Format("A.COMPETENCIA <= @DATA({0})", filtro["FIM" + tipo].GetDateTime().ToString("dd/MM/yyyy")));

        return string.Join(" AND ", condicoes);
    }

    private void AplicarFiltroOrigem(string filtro)
    {
        AplicarFiltro(ORIGEM, filtro);
    }

    private void AplicarFiltroDestino(string filtro)
    {
        AplicarFiltro(DESTINO, filtro);
    }

    private void AplicarFiltro(SimpleGrid grid, string filtro)
    {
        grid.UserDefinedCriteriaWhereClause = filtro;
        grid.ForceUpdate();
    }

    private void PAINELCOMANDOS_OnCommandExecuted(object sender, CommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_VOLTAR")
            CurrentStep.Value = "1";
    }
}
