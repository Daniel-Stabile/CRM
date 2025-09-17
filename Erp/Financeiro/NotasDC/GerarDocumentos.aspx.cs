using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Security;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;

public partial class GerarDocumentosNotasDc : WesPage
{
    const string whereBase = " ( A.DOCUMENTOGERADO IS NULL ) AND ( A.STATUS IS NULL OR A.STATUS = 2 ) ";

    const string whereDebito = "( " + whereBase + " AND ( A.NATUREZA = 'D' ) ) ";
    const string whereCredito = "( " + whereBase + " AND ( A.NATUREZA = 'C' ) ) ";

    private List<Handle> GetHiddenFieldListHandles(string prValue)
    {
        if (string.IsNullOrEmpty(prValue))
            return new List<Handle>();

        List<long> handlesList = Newtonsoft.Json.JsonConvert.DeserializeObject<List<long>>(Scramble.ScrambleText(prValue));

        return handlesList.Select(x => new Handle { Value = x.ToLong() }).ToList();
    }

    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);
        WesBreadcrumbProvider.UpdateCurrentTitle("Gerar documentos a partir das notas de débito/crédito");
    }

    public List<Handle> HandlesCreditoSelecionados
    {
        get
        {
            return GetHiddenFieldListHandles(hfCreditoSelecionados.Value);
        }
        set
        {
            decimal valor = 0;
            if (value.Count > 0)
            {
                var ent = new Query("SELECT SUM(VALOR) VALOR FROM FN_LANCAMENTOSNDC WHERE " + Criteria.BuildInSqlClause("HANDLE", Criteria.RestrictionsClause.In, value)).Execute().FirstOrDefault();
                if (ent != null)
                    valor = ent["VALOR"].GetDecimal();
            }
            hfQtdCreditoSelecionados.Value = value.Count.ToString() + "|" + valor.ToString("###,###,##0.00");
            hfCreditoSelecionados.Value = Scramble.ScrambleText(Newtonsoft.Json.JsonConvert.SerializeObject(value));
        }
    }

    public List<Handle> HandlesDebitoSelecionados
    {
        get
        {
            return GetHiddenFieldListHandles(hfDebitoSelecionados.Value);
        }
        set
        {
            decimal valor = 0;
            if (value.Count > 0)
            {
                var ent = new Query("SELECT SUM(VALOR) VALOR FROM FN_LANCAMENTOSNDC WHERE " + Criteria.BuildInSqlClause("HANDLE", Criteria.RestrictionsClause.In, value)).Execute().FirstOrDefault();
                if (ent != null)
                    valor = ent["VALOR"].GetDecimal();
            }
            hfQtdDebitoSelecionados.Value = value.Count.ToString() + "|" + valor.ToString("###,###,##0.00");
            hfDebitoSelecionados.Value = Scramble.ScrambleText(Newtonsoft.Json.JsonConvert.SerializeObject(value));
        }
    }
    
    protected void Page_Load(object sender, System.EventArgs e)
    {
        DEBITOSELECIONADOS.DisplayCommandExecutedDefaultMessage = false;
        DEBITOSELECIONAR.DisplayCommandExecutedDefaultMessage = false;
        CREDITOSELECIONADOS.DisplayCommandExecutedDefaultMessage = false;
        CREDITOSELECIONAR.DisplayCommandExecutedDefaultMessage = false;

        PAINELCOMANDOS.DisplayCommandExecutedDefaultMessage = false;
        PAINELCOMANDOS.OnCommandExecute += PAINELCOMANDOS_OnCommandExecute;
    }

    private void PAINELCOMANDOS_OnCommandExecute(object sender, CommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_PROXIMO")
            CurrentStep.Value = "2";
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        AtualizarGrids(DEBITOSELECIONADOS, DEBITOSELECIONAR, HandlesDebitoSelecionados, whereDebito);
        AtualizarGrids(CREDITOSELECIONADOS, CREDITOSELECIONAR, HandlesCreditoSelecionados, whereCredito);

        DisableCommands(DEBITOSELECIONAR, "CMD_REMOVER");
        DisableCommands(CREDITOSELECIONAR, "CMD_REMOVER");

        DisableCommands(DEBITOSELECIONADOS, "CMD_SELECIONAR");
        DisableCommands(CREDITOSELECIONADOS, "CMD_SELECIONAR");

    }

    protected void Selecionar_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (!e.Command.Name.Equals("CMD_SELECIONAR"))
            return;
        var gridSelecionar = (sender as SimpleGrid);
        if (gridSelecionar.SelectedEntitiesHandles.Count <= 0)
            return;
        SimpleGrid gridSelecionado = null;
        List<Handle> handles = null;
        string sWhere = string.Empty;

        if (gridSelecionar.ID.Contains("CREDITOSELECIONAR"))
        {
            gridSelecionado = CREDITOSELECIONADOS;
            sWhere = whereCredito;
            handles = HandlesCreditoSelecionados;
            handles.AddRange(gridSelecionar.SelectedEntitiesHandles);
            HandlesCreditoSelecionados = handles;

        }
        else if (gridSelecionar.ID.Contains("DEBITOSELECIONAR"))
        {
            gridSelecionado = DEBITOSELECIONADOS;
            sWhere = whereDebito;
            handles = HandlesDebitoSelecionados;
            handles.AddRange(gridSelecionar.SelectedEntitiesHandles);
            HandlesDebitoSelecionados = handles;
        }

        AtualizarGrids(gridSelecionado, gridSelecionar, handles, sWhere);
    }

    protected void Selecionados_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (!e.Command.Name.Equals("CMD_REMOVER"))
            return;
        SimpleGrid gridSelecionado = (sender as SimpleGrid);
        if (gridSelecionado.SelectedEntitiesHandles.Count <= 0)
            return;
        SimpleGrid gridSelecionar = null;
        List<Handle> handles = null;
        string sWhere = string.Empty;

        if (gridSelecionado.ID.ToLower().Contains("credito"))
        {
            gridSelecionar = CREDITOSELECIONAR;
            sWhere = whereCredito;
            handles = HandlesCreditoSelecionados;
            handles.RemoveAll(h => gridSelecionado.SelectedEntitiesHandles.Any(hh => h.Value == hh.Value));
            HandlesCreditoSelecionados = handles;
        }
        else if (gridSelecionado.ID.ToLower().Contains("debito"))
        {
            gridSelecionar = DEBITOSELECIONAR;
            sWhere = whereDebito;
            handles = HandlesDebitoSelecionados;
            handles.RemoveAll(h => gridSelecionado.SelectedEntitiesHandles.Any(hh => h.Value == hh.Value));
            HandlesDebitoSelecionados = handles;
        }

        AtualizarGrids(gridSelecionado, gridSelecionar, handles, sWhere);
    }

    private static void AtualizarGrids(SimpleGrid gridSelecionado, SimpleGrid gridSelecionar, List<Handle> handles, string Where)
    {
        if (handles.Count > 0)
        {
            gridSelecionado.UserDefinedCriteriaWhereClause = Where + " AND " + Criteria.BuildInSqlClause("A.HANDLE", Criteria.RestrictionsClause.In, handles);
            gridSelecionar.UserDefinedCriteriaWhereClause = Where + " AND " + Criteria.BuildInSqlClause("A.HANDLE", Criteria.RestrictionsClause.NotIn, handles);
        }
        else
        {
            gridSelecionado.UserDefinedCriteriaWhereClause = Where + " AND A.HANDLE IS NULL ";
            gridSelecionar.UserDefinedCriteriaWhereClause = Where + " AND A.HANDLE IS NOT NULL ";
        }
        gridSelecionado.ForceUpdate();
        gridSelecionar.ForceUpdate();
    }

    private void DisableCommands(SimpleGrid prSimpleGrid, params string[] prExceptCommands)
    {
        var commands = prSimpleGrid.EntityViewCommands;
        if ((commands != null) && (commands.Commands != null))
            foreach (var item in commands.Commands)
            {
                item.Visible = !prExceptCommands.Any(exc => item.Name == exc);
                item.Enabled = item.Visible.Value;
            }
    }

    protected void LANAMENTOMANUALNDC_CommandExecuted(object sender, FormCommandExecuteArgs e)
    {
        if (e.CommandName == "Save")
        {
            var dataEntity = LANAMENTOMANUALNDC.InMemoryEntity;
            if (HandlesCreditoSelecionados.Count > 0)
                dataEntity.TransitoryVars["WHERECREDITOS"] = Criteria.BuildInSqlClause("A.HANDLE", Criteria.RestrictionsClause.In, HandlesCreditoSelecionados);
            else
                dataEntity.TransitoryVars["WHERECREDITOS"] = "A.HANDLE IS NULL";

            if (HandlesDebitoSelecionados.Count > 0)
                dataEntity.TransitoryVars["WHEREDEBITOS"] = Criteria.BuildInSqlClause("A.HANDLE", Criteria.RestrictionsClause.In, HandlesDebitoSelecionados);
            else
                dataEntity.TransitoryVars["WHEREDEBITOS"] = "A.HANDLE IS NULL";

            string result =
                BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.LancamentosNDC.GeradorDocumentoNdc, Benner.Corporativo.Financeiro",
                "GerarDocumentos",
                dataEntity,
                dataEntity.TransitoryVars) as string;
            LANAMENTOMANUALNDC.ShowWidgetMessage(result, MessageType.Information);

            DOCUMENTORESULTADO.UserDefinedCriteriaWhereClause = " A.HANDLE IN ( "
                + " SELECT NDC.DOCUMENTOGERADO FROM FN_LANCAMENTOSNDC NDC WHERE ( ( " + dataEntity.TransitoryVars["WHERECREDITOS"].ToString().Replace("A.", "NDC.") + " ) " +
                                                                             " OR ( " + dataEntity.TransitoryVars["WHEREDEBITOS"].ToString().Replace("A.", "NDC.") + " ) ) ) ";
            DOCUMENTORESULTADO.ForceUpdate();
        }
        else if (e.CommandName == "Cancel")
        {
            CurrentStep.Value = "1";
        }
    }
}