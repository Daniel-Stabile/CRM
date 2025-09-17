using Benner.Corporativo.Definicoes.Financeiro;
using Benner.ERP.Comum;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;

public partial class OcorrenciaParcelasCpaPage : WesPage
{
    private string ClausulaWhere
    {
        get
        {
            return
                "A.PARCELACANCELADA = 'N' " +
                "AND " +
                "( " +
                "    A.VALOR > A.VALORESBAIXADOS " +
                "    OR " +
                "    ( " +
                "        A.VALOR >= A.VALORESBAIXADOS " +
                "        AND A.DOCUMENTO IN (SELECT HANDLE " +
                "                                FROM FN_DOCUMENTOS " +
                "                            WHERE OPERACAOCANCELAMENTO IS NOT NULL " +
                "                            ) " +
                "    ) " +
                ") " +
                "AND A.DOCUMENTO IN (SELECT HANDLE " +
                "                        FROM FN_DOCUMENTOS " +
                "                    WHERE ENTRADASAIDA = 'E' " +
                "                    )";
        }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        OCORRNCIAPARCELASCPA.UserDefinedCriteriaWhereClause = ClausulaWhere;
        OCORRNCIAPARCELASCPA.FilterControl.FilterExecute += FilterControl_FilterExecute;
        OCORRNCIAPARCELASCPA.CommandExecute += OCORRNCIAPARCELASCPA_CommandExecute;

        ScriptManager.RegisterStartupScript(this, GetType(), "AtribuirMensagem", "AtribuirMensagem();", true);
    }

    private void OCORRNCIAPARCELASCPA_CommandExecute(object sender, Benner.Tecnologia.Wes.Components.GridCommandExecuteArgs e)
    {
        switch (e.Command.Name)
        {
            case "CMD_OCORRENCIASMULTIPLAS":
                var condicao = Where();
                if (hfSelecionaTodosDocumentos.Value == "1")
                {
                    var listaHandles = new Query(@" SELECT A.HANDLE         
                                              FROM FN_PARCELAS A 
                                             WHERE " + string.Join(" AND ", condicao)).Execute();

                    ErpEnvironment.AtribuirSessionVar("PARCELASHANDLES", string.Join(",", listaHandles.GetHandles()));
                }
                else
                {
                    if (OCORRNCIAPARCELASCPA.SelectedEntitiesHandles.Count > 0)
                        ErpEnvironment.AtribuirSessionVar("PARCELASHANDLES", string.Join(",", OCORRNCIAPARCELASCPA.SelectedEntitiesHandles));
                    else
                        throw new BusinessException("Para esta ação você deve selecionar ao menos uma parcela.");
                }
                break;
        }
    }

    private IList<string> Where()
    {
        List<string> condicao = new List<string>();

        long empresaCorrente = BennerContext.Security.GetCurrentCompany(BennerContext.Administration.DefaultSystemInstanceName).Handle;
        string condicaoDefault = string.Format(@"A.EMPRESA = {0} AND EXISTS (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.HANDLE = A.DOCUMENTO AND (((B.ENTRADASAIDA = 'E' OR B.ENTRADASAIDA = 'I') AND (B.TIPODEMOVIMENTO IN(1, 2))) 
            OR ((B.ENTRADASAIDA = 'S' OR B.ENTRADASAIDA = 'O') AND (B.TIPODEMOVIMENTO = 3))))", empresaCorrente);

        long filialCorrente = 0;
        if (BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName) != null)
            filialCorrente = BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName).Handle;

        if (filialCorrente > 0)
            condicaoDefault += string.Format(" AND A.FILIAL = {0}", filialCorrente);

        condicao.Add(condicaoDefault);

        if ((OCORRNCIAPARCELASCPA.FilterEntity != null) && (OCORRNCIAPARCELASCPA.FilterEntity.Definition.Name.Equals(FNFiltroOcorrenciasCpa.GetEntityDefinition().Name)))
        {
            if (!string.IsNullOrEmpty(OCORRNCIAPARCELASCPA.FilterEntity["PESSOA"].Value.ToString()))
            {
                var pessoas = OCORRNCIAPARCELASCPA.FilterEntity["PESSOA"].Value.ToString();
                pessoas = pessoas.Replace("|_|", ",");
                pessoas = pessoas.Replace("|_", "");
                condicao.Add(string.Format("EXISTS (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.HANDLE = A.DOCUMENTO AND B.PESSOA IN ({0}))", pessoas));
            }

            if (!string.IsNullOrEmpty(OCORRNCIAPARCELASCPA.FilterEntity["DOCUMENTO"].Value.ToString()))
            {
                var documentos = OCORRNCIAPARCELASCPA.FilterEntity["DOCUMENTO"].Value.ToString();
                documentos = documentos.Replace("|_|", ",");
                documentos = documentos.Replace("|_", "");
                condicao.Add(string.Format("A.DOCUMENTO IN ({0})", documentos));
            }

            if (OCORRNCIAPARCELASCPA.FilterEntity["VENCPRORROGINICIAL"].GetDateTime() > DateTime.MinValue)
                condicao.Add(string.Format("A.VCTOPRORROGADO >= @DATA({0})", OCORRNCIAPARCELASCPA.FilterEntity["VENCPRORROGINICIAL"].GetDateTime().ToString("dd/MM/yyyy")));

            if (OCORRNCIAPARCELASCPA.FilterEntity["VENCPRORROGFINAL"].GetDateTime() > DateTime.MinValue)
                condicao.Add(string.Format("A.VCTOPRORROGADO <= @DATA({0})", OCORRNCIAPARCELASCPA.FilterEntity["VENCPRORROGFINAL"].GetDateTime().ToString("dd/MM/yyyy")));
        }

        return condicao;
    }

    private void FilterControl_FilterExecute(object sender, Benner.Tecnologia.Wes.Components.FilterExecuteEventArgs e)
    {
        var condicao = Where();
        if (condicao.Count > 1)
        {
            e.WhereClause = new WhereClause();
            e.WhereClause.AddWhereClause(ClausulaWhere);
            e.WhereClause.AddWhereClause(string.Join(" AND ", condicao));
            
            var count = new Query(@" SELECT A.HANDLE         
                                      FROM FN_PARCELAS A 
                                     WHERE " + string.Join(" AND ", condicao)).Execute().Count;

            hfQtdDocumentos.Value = count.ToString();
            hfQtdMaxDocumentos.Value = OCORRNCIAPARCELASCPA.UserDefinedPageSize.ToString();
        }
        else
            OCORRNCIAPARCELASCPA.UserDefinedCriteriaWhereClause = condicao[0];
    }
}