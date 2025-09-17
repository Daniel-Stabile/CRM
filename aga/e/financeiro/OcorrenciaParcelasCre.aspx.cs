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

public partial class OcorrenciaParcelasCrePage : WesPage
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
                "                    WHERE ENTRADASAIDA = 'S' " +
                "                    )";
        }
    }

    protected void Page_Load(object sender, System.EventArgs e)
    {
        OCORRNCIAPARCELASCRE.UserDefinedCriteriaWhereClause = ClausulaWhere;
        OCORRNCIAPARCELASCRE.FilterControl.FilterExecute += FilterControl_FilterExecute;
        OCORRNCIAPARCELASCRE.CommandExecute += OCORRNCIAPARCELASCRE_CommandExecute;

        ScriptManager.RegisterStartupScript(this, GetType(), "AtribuirMensagem", "AtribuirMensagem();", true);
    }

    private void OCORRNCIAPARCELASCRE_CommandExecute(object sender, Benner.Tecnologia.Wes.Components.GridCommandExecuteArgs e)
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
                    if (OCORRNCIAPARCELASCRE.SelectedEntitiesHandles.Count > 0)
                        ErpEnvironment.AtribuirSessionVar("PARCELASHANDLES", string.Join(",", OCORRNCIAPARCELASCRE.SelectedEntitiesHandles));
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
        string condicaoDefault = string.Format(@"A.EMPRESA = {0} AND EXISTS (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.HANDLE = A.DOCUMENTO AND (((B.ENTRADASAIDA = 'S' OR B.ENTRADASAIDA = 'O') AND (B.TIPODEMOVIMENTO IN(1, 2))) 
            OR ((B.ENTRADASAIDA = 'E' OR B.ENTRADASAIDA = 'I') AND (B.TIPODEMOVIMENTO = 3))))", empresaCorrente);

        long filialCorrente = 0;
        if (BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName) != null)
            filialCorrente = BennerContext.Security.GetCurrentBranch(BennerContext.Administration.DefaultSystemInstanceName).Handle;

        if (filialCorrente > 0)
            condicaoDefault += string.Format(" AND A.FILIAL = {0}", filialCorrente);

        condicao.Add(condicaoDefault);

        if ((OCORRNCIAPARCELASCRE.FilterEntity != null) && (OCORRNCIAPARCELASCRE.FilterEntity.Definition.Name.Equals(FNFiltroOcorrenciasCre.GetEntityDefinition().Name)))
        {
            if (!string.IsNullOrEmpty(OCORRNCIAPARCELASCRE.FilterEntity["PESSOA"].Value.ToString()))
            {
                var pessoas = OCORRNCIAPARCELASCRE.FilterEntity["PESSOA"].Value.ToString();
                pessoas = pessoas.Replace("|_|", ",");
                pessoas = pessoas.Replace("|_", "");
                condicao.Add(string.Format("EXISTS (SELECT B.HANDLE FROM FN_DOCUMENTOS B WHERE B.HANDLE = A.DOCUMENTO AND B.PESSOA IN ({0}))", pessoas));
            }

            if (!string.IsNullOrEmpty(OCORRNCIAPARCELASCRE.FilterEntity["DOCUMENTO"].Value.ToString()))
            {
                var documentos = OCORRNCIAPARCELASCRE.FilterEntity["DOCUMENTO"].Value.ToString();
                documentos = documentos.Replace("|_|", ",");
                documentos = documentos.Replace("|_", "");
                condicao.Add(string.Format("A.DOCUMENTO IN ({0})", documentos));
            }

            if (OCORRNCIAPARCELASCRE.FilterEntity["VENCPRORROGINICIAL"].GetDateTime() > DateTime.MinValue)
                condicao.Add(string.Format("A.VCTOPRORROGADO >= @DATA({0})", OCORRNCIAPARCELASCRE.FilterEntity["VENCPRORROGINICIAL"].GetDateTime().ToString("dd/MM/yyyy")));

            if (OCORRNCIAPARCELASCRE.FilterEntity["VENCPRORROGFINAL"].GetDateTime() > DateTime.MinValue)
                condicao.Add(string.Format("A.VCTOPRORROGADO <= @DATA({0})", OCORRNCIAPARCELASCRE.FilterEntity["VENCPRORROGFINAL"].GetDateTime().ToString("dd/MM/yyyy")));
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
            hfQtdMaxDocumentos.Value = OCORRNCIAPARCELASCRE.UserDefinedPageSize.ToString();
        }
        else
            OCORRNCIAPARCELASCRE.UserDefinedCriteriaWhereClause = condicao[0];
    }
}