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

public partial class ERP_Financeiro_AnaliseCredito_Cliente : WesPage
{
    protected SimpleGrid PARCELAS_PAGTONEG;

    public class ClienteCredito
    {
        public string DataAbertura { get; set; }
        public string DataPrimeiraCompra { get; set; }
        public string DataConsulta { get; set; }
        public string DataUltimaCompra { get; set; }
        public string DataMaiorCompra { get; set; }
        public string DataMaiorAcumulo { get; set; }

        public string ValorUtilizado { get; set; }
        public string ValorLimiteCredito { get; set; }
        public string ValorDisponivel { get; set; }
        public string ValorUltimaCompra { get; set; }
        public string ValorMaiorCompra { get; set; }
        public string ValorMaiorAcumulo { get; set; }
        public string AtrasoMedio { get; set; }
        public string MaiorAtraso { get; set; }
        public string Situacao { get; set; }

        public List<SaldoPeriodo> Saldos = new List<SaldoPeriodo>();
    }

    public class ResumoMensalResponse
    {
        public List<ResumoMensal> ResumosMensais = new List<ResumoMensal>();
    }

    public class ResumoMensal
    {
        public string MesAno = string.Empty;
        public string MesAnoAnterior = string.Empty;

        public decimal Volume = 0;
        public decimal VolumeAnterior = 0;

        public int Quantidade = 0;
        public int QuantidadeAnterior = 0;
    }

    public class SaldoPeriodo
    {
        public string Agrupamento = "";

        public string LegendaVencido = "";
        public decimal Vencido = 0;
        public decimal PercentualVencido = 0;
        public string LegendaVencer = "";
        public decimal Vencer = 0;
        public decimal PercentualVencer = 0;

        public decimal VencidoAcumulado = 0;
        public decimal PercentualVencidoAcumulado = 0;
        public decimal VencerAcumulado = 0;
        public decimal PercentualVencerAcumulado = 0;
    }

    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        PARCELAS_PAGTONEG.UserDefinedCriteriaWhereClause = @"
            A.HANDLE IN (SELECT PAR.HANDLE
            FROM FN_DOCUMENTOS DOC
             JOIN FN_PARCELAS PAR
               ON ( PAR.DOCUMENTO = DOC.HANDLE )
             JOIN FN_MOVIMENTACOES MOV
               ON ( PAR.HANDLE = MOV.PARCELA  )
             JOIN FN_TIPOSCOBRANCAS TPC 
               ON ( TPC.HANDLE = PAR.TIPOCOBRANCA )
            WHERE TPC.TIPO = 'C'
              AND PAR.VALOR <= PAR.VALORESBAIXADOS
              AND MOV.TIPOMOVIMENTO IN (3,8,14,16)
              AND DOC.PESSOA = @CAMPO(HANDLE))";
    }

    [WebMethod]
    public static ClienteCredito GetClienteCredito(int prCliente)
    {
        var clienteCredito = new Query(
              " SELECT CLIENTE.ABERTURA, CLICREDITO.CLIENTEDESDE, CLICREDITO.VALORLIMITE, CLICREDITO.CREDITOUTILIZADO, (CLICREDITO.VALORLIMITE-CLICREDITO.CREDITOUTILIZADO) DISPONIVEL, CLICREDITO.DATAATUALIZACAO, SITUACAO.NOME SITUACAO, " +
              " CLICREDITO.DATAULTIMACOMPRA, CLICREDITO.VALORULTIMACOMPRA, CLICREDITO.DATAMAIORCOMPRA, CLICREDITO.VALORMAIORCOMPRA, CLICREDITO.DATAMAIORACUMULO, CLICREDITO.VALORMAIORACUMULO, CLICREDITO.ATRASOMEDIO, CLICREDITO.MAIORATRASO, " +
              " CLICREDITO.VENCIDOS5, CLICREDITO.VENCIDOS615, CLICREDITO.VENCIDOS1630, CLICREDITO.VENCIDOS30,  " +
              " CLICREDITO.VENCER5, CLICREDITO.VENCER615, CLICREDITO.VENCER1630, CLICREDITO.VENCER30 " +
              " FROM GN_CLIENTECREDITO CLICREDITO " +
                " JOIN GN_PESSOAS CLIENTE " +
                  " ON ( CLIENTE.HANDLE = CLICREDITO.PESSOA )  " +
                " JOIN GN_CLIENTESITUACOESCREDITO SITUACAO " +
                  " ON ( SITUACAO.HANDLE = CLICREDITO.SITUACAO ) " +
              " WHERE CLICREDITO.PESSOA = :PPESSOA " +
              " ORDER BY CLICREDITO.HANDLE DESC",
              new Benner.Tecnologia.Common.Parameter("PPESSOA", DataType.Integer, prCliente))
              .Execute()
              .FirstOrDefault();
        ClienteCredito result = new ClienteCredito();
        result.DataAbertura = clienteCredito["ABERTURA"].GetDateTime().ToString("dd/MM/yyyy");
        result.DataPrimeiraCompra = clienteCredito["CLIENTEDESDE"].GetDateTime().ToString("dd/MM/yyyy");
        result.DataConsulta = clienteCredito["DATAATUALIZACAO"].GetDateTime().ToString("dd/MM/yyyy HH:mm:ss");
        result.ValorUtilizado = GetBeutyCurr(clienteCredito["CREDITOUTILIZADO"].GetDecimal());
        result.ValorLimiteCredito = GetBeutyCurr(clienteCredito["VALORLIMITE"].GetDecimal());
        result.ValorDisponivel = GetBeutyCurr(clienteCredito["DISPONIVEL"].GetDecimal());

        result.Situacao = clienteCredito["SITUACAO"].GetString();

        result.DataUltimaCompra = clienteCredito["DATAULTIMACOMPRA"].GetDateTime().ToString("dd/MM/yyyy");
        result.ValorUltimaCompra = GetBeutyCurr(clienteCredito["VALORULTIMACOMPRA"].GetDecimal());

        result.DataMaiorCompra = clienteCredito["DATAMAIORCOMPRA"].GetDateTime().ToString("dd/MM/yyyy");
        result.ValorMaiorCompra = GetBeutyCurr(clienteCredito["VALORMAIORCOMPRA"].GetDecimal());

        result.DataMaiorAcumulo = clienteCredito["DATAMAIORACUMULO"].GetDateTime().ToString("dd/MM/yyyy");
        result.ValorMaiorAcumulo = GetBeutyCurr(clienteCredito["VALORMAIORACUMULO"].GetDecimal());

        result.AtrasoMedio = clienteCredito["ATRASOMEDIO"].GetString();
        result.MaiorAtraso = clienteCredito["MAIORATRASO"].GetString();

        result.Saldos.Add(new SaldoPeriodo()
        {
            Agrupamento = "Até 5 dias",
            LegendaVencido = "Vencido até 5 dias",
            LegendaVencer = "Vencer até 5 dias",
            Vencido = clienteCredito["VENCIDOS5"].GetDecimal(),
            VencidoAcumulado = clienteCredito["VENCIDOS5"].GetDecimal(),
            Vencer = clienteCredito["VENCER5"].GetDecimal(),
            VencerAcumulado = clienteCredito["VENCER5"].GetDecimal()
        });
        result.Saldos.Add(new SaldoPeriodo()
        {
            Agrupamento = "6 a 15 dias",
            LegendaVencido = "Vencido entre 6 e 15 dias",
            LegendaVencer = "Vencer entre 6 e 15 dias",
            Vencido = clienteCredito["VENCIDOS615"].GetDecimal(),
            VencidoAcumulado = clienteCredito["VENCIDOS5"].GetDecimal()
                            + clienteCredito["VENCIDOS615"].GetDecimal(),
            Vencer = clienteCredito["VENCER615"].GetDecimal(),
            VencerAcumulado = clienteCredito["VENCER5"].GetDecimal()
                            + clienteCredito["VENCER615"].GetDecimal()
        });
        result.Saldos.Add(new SaldoPeriodo()
        {
            Agrupamento = "16 a 30 dias",
            LegendaVencido = "Vencido entre 16 e 30 dias",
            LegendaVencer = "Vencer entre 16 e 30 dias",
            Vencido = clienteCredito["VENCIDOS1630"].GetDecimal(),
            VencidoAcumulado = clienteCredito["VENCIDOS5"].GetDecimal()
                            + clienteCredito["VENCIDOS615"].GetDecimal()
                            + clienteCredito["VENCIDOS1630"].GetDecimal(),
            Vencer = clienteCredito["VENCER1630"].GetDecimal(),
            VencerAcumulado = clienteCredito["VENCER5"].GetDecimal()
                            + clienteCredito["VENCER615"].GetDecimal()
                            + clienteCredito["VENCER1630"].GetDecimal()
        });

        result.Saldos.Add(new SaldoPeriodo()
        {
            Agrupamento = "Mais de 30 dias",
            LegendaVencido = "Vencido a mais de 30 dias",
            LegendaVencer = "Vencer a mais de 30 dias",
            Vencido = clienteCredito["VENCIDOS30"].GetDecimal(),
            VencidoAcumulado = clienteCredito["VENCIDOS5"].GetDecimal()
                            + clienteCredito["VENCIDOS615"].GetDecimal()
                            + clienteCredito["VENCIDOS1630"].GetDecimal()
                            + clienteCredito["VENCIDOS30"].GetDecimal(),
            Vencer = clienteCredito["VENCER30"].GetDecimal(),
            VencerAcumulado = clienteCredito["VENCER5"].GetDecimal()
                            + clienteCredito["VENCER615"].GetDecimal()
                            + clienteCredito["VENCER1630"].GetDecimal()
                            + clienteCredito["VENCER30"].GetDecimal()
        });

        decimal totalVencer = result.Saldos.Sum(s => s.Vencer);
        decimal totalVencido = result.Saldos.Sum(s => s.Vencido);
        foreach (var recalc in result.Saldos)
        {
            recalc.PercentualVencer = Math.Round(((recalc.Vencer / clienteCredito["CREDITOUTILIZADO"].GetDecimal()) * 100), 2);
            recalc.PercentualVencido = Math.Round(((recalc.Vencido / clienteCredito["CREDITOUTILIZADO"].GetDecimal()) * 100), 2);
            recalc.PercentualVencerAcumulado = Math.Round(((recalc.VencerAcumulado / clienteCredito["CREDITOUTILIZADO"].GetDecimal()) * 100), 2);
            recalc.PercentualVencidoAcumulado = Math.Round(((recalc.VencidoAcumulado / clienteCredito["CREDITOUTILIZADO"].GetDecimal()) * 100), 2);
        }
        return result;
    }

    [WebMethod]
    public static ResumoMensalResponse GetResumoMensal(int prCliente)
    {
        ResumoMensalResponse result = new ResumoMensalResponse();
        var eResumos = new Query(@"
            SELECT ATUAL.MESREFERENCIA, ATUAL.VALORFATURAMENTO, ATUAL.QUANTIDADECOMPRAS,
                   ANOANTERIOR.MESREFERENCIA MESREFERENCIAANTERIOR, ANOANTERIOR.MESREFERENCIA MESREFERENCIAANOANTERIOR, ANOANTERIOR.VALORFATURAMENTO VALORFATURAMENTOANOANTERIOR, ANOANTERIOR.QUANTIDADECOMPRAS QUANTIDADECOMPRASANOANTERIOR
            FROM GN_CLIENTECREDITOMENSAL ATUAL
              LEFT JOIN GN_CLIENTECREDITOMENSAL ANOANTERIOR
                ON ( ANOANTERIOR.PESSOA = ATUAL.PESSOA
                 AND ANOANTERIOR.MESREFERENCIA =  DATEADD(yy,-1,ATUAL.MESREFERENCIA) )
            WHERE ATUAL.PESSOA = :PPESSOA ",
            new Benner.Tecnologia.Common.Parameter("PPESSOA", DataType.Integer, prCliente)).Execute();

        foreach (var item in eResumos)
            result.ResumosMensais.Add(new ResumoMensal()
            {
                MesAno = item["MESREFERENCIA"].GetDateTime().ToString("MM/yyyy"),
                MesAnoAnterior = item["MESREFERENCIAANTERIOR"].GetDateTime().ToString("MM/yyyy"),
                Quantidade = item["QUANTIDADECOMPRAS"].GetInt32(),
                QuantidadeAnterior = item["QUANTIDADECOMPRASANOANTERIOR"].GetInt32(),
                Volume = item["VALORFATURAMENTO"].GetDecimal(),
                VolumeAnterior = item["VALORFATURAMENTOANOANTERIOR"].GetDecimal()
            });

        return result;
    }
    public static string GetBeutyCurr(decimal prCurr)
    {
        return prCurr.ToString("R$ ###,###,##0.00");
    }
}