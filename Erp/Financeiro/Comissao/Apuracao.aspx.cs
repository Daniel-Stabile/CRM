using System;
using System.Web;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Collections.Generic;
using System.Linq;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using Benner.ERP.Comum;

public partial class ERP_Financeiro_Comissao_Apuracao : WesPage
{
    private const string whereDisponiveis = @" 
( ( ( ( A.TIPOMOVIMENTO = 2 ) 
              OR ( A.TIPOMOVIMENTO = 7 ) 
              OR ( A.TIPOMOVIMENTO = 21 ) 
              OR ( A.TIPOMOVIMENTO = 8 ) ) 
           AND ( A.PARCELA IS NULL ) ) 
          OR (( ( A.TIPOMOVIMENTO = 14 ) 
                 OR ( A.TIPOMOVIMENTO = 16 ) 
                 OR ( A.TIPOMOVIMENTO = 3 ) 
                 OR ( A.TIPOMOVIMENTO = 4 
                      AND A.ORIGEMESTORNO IS NULL 
                      AND A.PARCELA IS NULL ) 
                 OR ( A.TIPOMOVIMENTO = 5 ) 
                 OR ( A.TIPOMOVIMENTO = 6 ) )) ) ";

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        DISPONIVEIS.UserDefinedCriteriaWhereClause = whereDisponiveis +
            " AND A.APURACAO IS NULL" +
            " AND A.AGENTEVENDAS = @CAMPO(AGENTEVENDAS)" +
            " AND A.FILIAL = @CAMPO(FILIAL)" +
            " AND A.DATA BETWEEN @CAMPO(DATAINICIAL) AND @CAMPO(DATAFINAL) ";
    }

    protected override void OnLoadComplete(EventArgs e)
    {
        base.OnLoadComplete(e);

        CommandsControl(true, APURADOS);
        CommandsControl(true, DISPONIVEIS);

        CommandsControl(true, APURADOS, "CMD_REMOVERVARIOSAPURADOS");
        CommandsControl(true, DISPONIVEIS, "CMD_APURARVARIOS", "New");

        if (APURACAO.GetEntity() != null)
        {
            CommandsControl(Utils.VerificaPermissao("VISUALIZAR_COMISSOES"), APURADOS, "Edit", "Delete");
            CommandsControl(Utils.VerificaPermissao("VISUALIZAR_COMISSOES"), DISPONIVEIS, "Edit", "Delete");
        }

    }

    public class DataValue
    {
        public DataValue()
        {
            FormattedValue = string.Empty;
        }
        public string FormattedValue { get; set; }
        public object OriginalValue { get; set; }
    }

    public class ApuracaoValores
    {
        public DataValue Receber = new DataValue();
        public DataValue Descontar = new DataValue();
        public DataValue Valor = new DataValue();
    }

    [WebMethod]
    public static ApuracaoValores GetInfoApuracaoComissao(int prHandleApuracao)
    {
        ApuracaoValores result = new ApuracaoValores();
        try
        {
            var valores = new Query(@"
                SELECT
                 @TROCARNULO(APURACAO.VALORBRUTO,0)
                 + @TROCARNULO(APURACAO.VALORNOTASCREDITO ,0) RECEBER,
                
                 @TROCARNULO(APURACAO.VALORADIANTAMENTOADESCONTAR,0)
                 + @TROCARNULO(APURACAO.VALORNOTASDEBITO,0)
                 + @TROCARNULO(APURACAO.DESCONTOSFINANCEIROS,0) DESCONTAR
                FROM FN_DOCUMENTOCOMISSOESAPURACOES APURACAO
                WHERE APURACAO.HANDLE = :PHANDLE ",
                new Benner.Tecnologia.Common.Parameter("PHANDLE", DataType.Integer, prHandleApuracao))
                .Execute().FirstOrDefault();

            if (valores == null)
                return null;

            result.Receber.OriginalValue = valores["RECEBER"].GetDecimal();
            result.Receber.FormattedValue = GetBeutyCurr(valores["RECEBER"].GetDecimal());
            result.Descontar.OriginalValue = valores["DESCONTAR"].GetDecimal();
            result.Descontar.FormattedValue = GetBeutyCurr(valores["DESCONTAR"].GetDecimal());
            result.Valor.OriginalValue = (valores["RECEBER"].GetDecimal() - valores["DESCONTAR"].GetDecimal());
            result.Valor.FormattedValue = GetBeutyCurr(Convert.ToDecimal(result.Valor.OriginalValue));
        }
        catch (Exception e)
        {
            throw e;
        }
        return result;
    }

    [WebMethod]
    public static ApuracaoValores GetInfoDisponiveisComissao(int prHandleApuracao)
    {
        var result = new ApuracaoValores();
        EntityBase infoApuracao; 
        EntityBase valores;

        infoApuracao = new Query(
            "SELECT AGENTEVENDAS, " +
            " FILIAL, " +
            " DATAINICIAL, " +
            " DATAFINAL " +
            "FROM FN_DOCUMENTOCOMISSOESAPURACOES " +
            " WHERE HANDLE = :PHANDLE",
            new Benner.Tecnologia.Common.Parameter("PHANDLE", DataType.Integer, prHandleApuracao)).Execute().FirstOrDefault();

        if (!infoApuracao.HasValue())
            return null;

        try
        {
            valores = new Query(@"
                SELECT
                  SUM(CASE
                    WHEN A.TIPOMOVIMENTO IN ( 1, 2, 3, 7, 21 ) THEN @TROCARNULO(A.VALOR,0)
                    WHEN A.TIPOMOVIMENTO = 16 THEN (@TROCARNULO(A.VALOR,0) * -1)
                    ELSE 0
                  END) RECEBER,
                  SUM(CASE
                    WHEN A.TIPOMOVIMENTO IN ( 4, 5, 6, 8 ) THEN @TROCARNULO(A.VALOR,0)
                    ELSE 0
                  END) DESCONTAR
                FROM   FN_DOCUMENTOCOMISSOES A
                WHERE " + whereDisponiveis +
                " AND A.APURACAO IS NULL " +
                " AND A.AGENTEVENDAS = :PAGENTEVENDAS " +
                " AND A.FILIAL = :PFILIAL " +
                " AND A.DATA BETWEEN :PDATAINICIAL AND :PDATAFINAL ",
                new Benner.Tecnologia.Common.Parameter("PAGENTEVENDAS", DataType.Integer, infoApuracao["AGENTEVENDAS"].GetInt64()),
                new Benner.Tecnologia.Common.Parameter("PFILIAL", DataType.Integer, infoApuracao["FILIAL"].GetInt64()),
                new Benner.Tecnologia.Common.Parameter("PDATAINICIAL", DataType.DateTime, infoApuracao["DATAINICIAL"].GetDateTime()),
                new Benner.Tecnologia.Common.Parameter("PDATAFINAL", DataType.DateTime, infoApuracao["DATAFINAL"].GetDateTime()))
                .Execute().FirstOrDefault();

            if (valores == null)
                return null;

            result.Receber.OriginalValue = valores["RECEBER"].GetDecimal();
            result.Receber.FormattedValue = GetBeutyCurr(valores["RECEBER"].GetDecimal());
            result.Descontar.OriginalValue = valores["DESCONTAR"].GetDecimal();
            result.Descontar.FormattedValue = GetBeutyCurr(valores["DESCONTAR"].GetDecimal());
            result.Valor.OriginalValue = (valores["RECEBER"].GetDecimal() - valores["DESCONTAR"].GetDecimal());
            result.Valor.FormattedValue = GetBeutyCurr(Convert.ToDecimal(result.Valor.OriginalValue));
        }
        catch (Exception e)
        {
            throw e;
        }
        return result;
    }

    public static string GetBeutyCurr(decimal prCurr)
    {
        return prCurr.ToString("R$ ###,###,##0.00");
    }

    protected void DISPONIVEIS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        e.TransitoryVars["HANDLEAPURACAO"] = APURACAO.GetEntityHandle();
        if (e.Command.Name.Equals("CMD_APURARVARIOS"))
        {
            if ((DISPONIVEIS.SelectedEntitiesHandles == null)
                || (!DISPONIVEIS.SelectedEntitiesHandles.Any()))
            {
                var whereGrid = DISPONIVEIS.WhereTraduzido;
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(AGENTEVENDAS)", ":PAGENTEVENDAS");
                whereGrid.AddParameter("PAGENTEVENDAS", APURACAO.GetEntity()["AGENTEVENDAS"].GetInt64());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(FILIAL)", ":FILIAL");
                whereGrid.AddParameter("FILIAL", APURACAO.GetEntity()["FILIAL"].GetInt64());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(DATAINICIAL)", ":PDATAINICIAL");
                whereGrid.AddParameter("PDATAINICIAL", APURACAO.GetEntity()["DATAINICIAL"].GetDateTime());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(DATAFINAL)", ":PDATAFINAL");
                whereGrid.AddParameter("PDATAFINAL", APURACAO.GetEntity()["DATAFINAL"].GetDateTime());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(HANDLE)", ":PHANDLE");
                whereGrid.AddParameter("PHANDLE", APURACAO.GetEntityHandle().Value);
                var qtd = new Query("SELECT COUNT(A.HANDLE) QTD FROM FN_DOCUMENTOCOMISSOES A WHERE " + whereGrid.Where, whereGrid.Parameters.ToArray()).Execute().FirstOrDefault();
                e.Command.RequestConfirmation = true;
                e.Command.RequestConfirmationMessage = "Serão apurados " + qtd["QTD"].GetInt32().ToString() + " registros. Deseja continuar?";
                e.TransitoryVars["WHERECLAUSEDISPONIVEIS"] = whereGrid;
            }
        }

    }

    protected void APURADOS_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        e.TransitoryVars["HANDLEAPURACAO"] = APURACAO.GetEntityHandle();
        if (e.Command.Name.Equals("CMD_REMOVERVARIOSAPURADOS"))
        {
            if ((APURADOS.SelectedEntitiesHandles == null)
                || (!APURADOS.SelectedEntitiesHandles.Any()))
            {
                var whereGrid = APURADOS.WhereTraduzido;
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(AGENTEVENDAS)", ":PAGENTEVENDAS");
                whereGrid.AddParameter("PAGENTEVENDAS", APURACAO.GetEntity()["AGENTEVENDAS"].GetInt64());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(FILIAL)", ":FILIAL");
                whereGrid.AddParameter("FILIAL", APURACAO.GetEntity()["FILIAL"].GetInt64());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(DATAINICIAL)", ":PDATAINICIAL");
                whereGrid.AddParameter("PDATAINICIAL", APURACAO.GetEntity()["DATAINICIAL"].GetDateTime());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(DATAFINAL)", ":PDATAFINAL");
                whereGrid.AddParameter("PDATAFINAL", APURACAO.GetEntity()["DATAFINAL"].GetDateTime());
                whereGrid.Where = whereGrid.Where.Replace("@CAMPO(HANDLE)", ":PHANDLE");
                whereGrid.AddParameter("PHANDLE", APURACAO.GetEntityHandle().Value);

                var qtd = new Query("SELECT COUNT(A.HANDLE) QTD FROM FN_DOCUMENTOCOMISSOES A WHERE " + whereGrid.Where, whereGrid.Parameters.ToArray()).Execute().FirstOrDefault();
                e.Command.RequestConfirmation = true;
                e.Command.RequestConfirmationMessage = "Serão removidos da apuração " + qtd["QTD"].GetInt32().ToString() + " registros. Deseja continuar?";
                e.TransitoryVars["WHERECLAUSEDISPONIVEIS"] = whereGrid;
            }
        }
    }

    private void CommandsControl(bool control, SimpleGrid prSimpleGrid, params string[] prExceptCommands)
    {
        var commands = prSimpleGrid.EntityViewCommands;
        if ((commands != null) && (commands.Commands != null))
            foreach (var item in commands.Commands)
            {
                bool command = false;
                if (prExceptCommands.Length > 0)
                {
                    command = prExceptCommands.Any(exc => item.Name == exc);
                    if (!command)
                        continue;
                }
                item.Visible = control ? command : !command;
                item.Enabled = control ? command : !command;
            }
    }
}
