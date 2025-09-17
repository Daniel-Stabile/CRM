using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using Benner.Corporativo.Definicoes.Administracao;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components;
using Newtonsoft.Json;

public partial class CorporativoPortalGerencialIndicadoresPage : PortalBase.CorpBasePage
{
    public string DefinicaoEmpresas = string.Empty;
    public string DefinicaoIndicadores = string.Empty;
    public string DefinicaoGeral = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        // BennerContext.BusinessComponent.Call(
        //     "Benner.Corporativo.Contabil.PortalGerencial.CalculadorLancamentosPG, Benner.Corporativo.Contabil",
        //     "CalcularTudo");

        CarregarDefinicaoGeral();
        CarregarDefinicaoIndicadores();
        CarregarDefinicaoEmpresas();
    }

    private void CarregarDefinicaoGeral()
    {
        var competencias = new Query(
            "SELECT MIN(COMPETENCIA) INICIO, MAX(COMPETENCIA) FIM FROM POGE_LANCAMENTOS"
        ).Execute()
        .FirstOrDefault();

        DefinicaoGeral = JsonConvert.SerializeObject(new
        {
            DataInicial = competencias["INICIO"].GetDateTime(),
            DataFinal = competencias["FIM"].GetDateTime()
        });
    }

    private void CarregarDefinicaoEmpresas()
    {
        var empresas = new Query(
            "SELECT HANDLE, CNPJ CODIGO, NOME FROM POGE_EMPRESAS ORDER BY NOME "
        ).Execute()
        .Select(x => new
        {
            Handle = x["HANDLE"].GetInt64(),
            Codigo = x["CODIGO"].GetString(),
            Nome = x["NOME"].GetString()
        });

        var grupos = new Query(
            "SELECT GRUPO.HANDLE, GRUPO.CODIGO, GRUPO.NOME, EMPRESA.EMPRESA FROM POGE_GRUPOSEMPRESAS GRUPO JOIN POGE_GRUPOEMPRESASEMPRESAS EMPRESA ON EMPRESA.GRUPOEMPRESAS = GRUPO.HANDLE ORDER BY NOME "
        ).Execute()
        .GroupBy(x => x["HANDLE"].GetInt64())
        .Select(x =>
        {
            var p = x.First();
            return new
            {
                Codigo = p["CODIGO"].GetInt32().ToString(),
                Nome = p["NOME"].GetString(),
                Empresas = x.Select(y => y["EMPRESA"].GetInt64()).ToList()
            };
        });

        DefinicaoEmpresas = JsonConvert.SerializeObject(new
        {
            Empresas = empresas,
            Grupos = grupos
            
        });
    }

    private void CarregarDefinicaoIndicadores()
    {
        var indicadoresSaldos = new Query(
                "SELECT * FROM POGE_INDICADORES"
            ).Execute()
            .Where(x => x["TIPO"].GetInt32() == 5)
            .Select(x => new
            {
                Handle = x["HANDLE"].GetInt64(),
                Identificacao = x["IDENTIFICACAO"].GetString()
            })
            .ToList();

        var definicao = new
        {
            IndicadoresSaldosMeses = indicadoresSaldos
        };

        DefinicaoIndicadores = JsonConvert.SerializeObject(definicao);
    }
}
