using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Wes.Components.WebApp;
using System;
using System.Text;
using System.Collections.Generic;
using System.Linq;
using System.Web.Services;
using System.Web.UI;
using Benner.Corporativo.Definicoes.Financeiro;
using Benner.Tecnologia.Common.Instrumentation;
using Benner.ERP.Comum;
using System.Web.Caching;
using Benner.Tecnologia.Business.Cache;

public partial class AdiantamentoClienteFornecedorPage : WesPage
{
    public class AdiantamentoClienteFornecedor
    {
        public decimal _QuantidadePagos { get; set; }
        public decimal _ValorPagos { get; set; }
        public decimal _ValorPagosSelecionado { get; set; }
        public decimal _QuantidadeCompensados { get; set; }
        public decimal _ValorCompensados { get; set; }
        public decimal _ValorCompensadosSelecionado { get; set; }

        public string QuantidadePagos { get { return this._QuantidadePagos.ToString(); } }
        public string ValorPagos { get { return this._ValorPagos.ToString("#,##0.00"); } }
        public string ValorPagosSelecionado { get { return this._ValorPagosSelecionado.ToString("#,##0.00"); } }
        public string MediaPagos
        {
            get
            {
                decimal retorno = 0m;
                if (this._QuantidadePagos > 0)
                    retorno = (this._ValorPagos / this._QuantidadePagos);

                return retorno.ToString("#,##0.00");
            }
        }
        public string QuantidadeCompensados { get { return this._QuantidadeCompensados.ToString(); } }
        public string ValorCompensados { get { return this._ValorCompensados.ToString("#,##0.00"); } }
        public string ValorCompensadosSelecionado { get { return this._ValorCompensadosSelecionado.ToString("#,##0.00"); } }
        public string MediaCompensados
        {
            get
            {
                decimal retorno = 0m;
                if (this._QuantidadeCompensados > 0)
                    retorno = (this._ValorCompensados / this._QuantidadeCompensados);

                return retorno.ToString("#,##0.00");
            }
        }
        public string RestoSelecionado
        {
            get
            {
                decimal retorno = 0m;
                if (this._ValorPagosSelecionado > 0 && this._ValorCompensadosSelecionado > 0)
                    retorno = (this._ValorCompensadosSelecionado - this._ValorPagosSelecionado) < 0 ? 0 : (this._ValorCompensadosSelecionado - this._ValorPagosSelecionado);
                else if(this._ValorPagosSelecionado > 0)
                    retorno =  0;
                else
                    retorno = _ValorCompensadosSelecionado;

                return retorno.ToString("#,##0.00");
            }
        }

        public AdiantamentoClienteFornecedor()
        {
            this._QuantidadePagos = 0;
            this._ValorPagos = 0;
            this._ValorPagosSelecionado = 0;
            this._QuantidadeCompensados = 0;
            this._ValorCompensados = 0;
            this._ValorCompensadosSelecionado = 0;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        AdtPagos.CommandExecute += AdtPagos_CommandExecute;
        gridCompensados.CommandExecute += gridCompensados_CommandExecute;
        DocumentosPagos.FilterControl.FilterExecute += DocumentosPagos_FilterExecute;

        AdtPagos.GridDefinition.Commands["CMD_COMPENSAR"].Visible = Utils.VerificaPermissao("MANTER_ADIANTAMENTOCLIENTE", "MANTER_ADIANTAMENTOCLIENTEAUT", "MANTER_ADIANTAMENTOFORNECEDORAUT", "MANTER_ADIANTAMENTOFORNECEDOR");
        gridCompensados.GridDefinition.Commands["CMD_EXCLUIRCOMPENSADO"].Visible = Utils.VerificaPermissao("EXCLUIR_ADIANTAMENTOCLIENTE", "EXCLUIR_DEVOLUCAOCLIENTES", "EXCLUIR_ADIANTAMENTOFORNECEDOR");

        if (!Page.IsPostBack)
        {
            AdtPagos.UserDefinedCriteriaWhereClause = MontaWhereAdtPagos(PESSOA.GetEntityHandle());
            gridCompensados.UserDefinedCriteriaWhereClause = MontaWhereCompensados(PESSOA.GetEntityHandle());
            MontarQueryDocumentos();
        }

        AdtPagos.ForceUpdate();
        gridCompensados.ForceUpdate();

        int tipoOperacao = GetTipoOperacao();

        if (tipoOperacao >= 3)
        {
            ErpEnvironment.AtribuirSessionVar("$BAIXAR_SALDO_TIPO_" + BennerContext.Security.GetLoggedUserHandle().ToString(), tipoOperacao == 3 ? "P" : "R");

            ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadInfoTiles", "LoadInfoTiles();", true);
        }
    }

    protected override void OnPreRenderComplete(EventArgs e)
    {
        base.OnPreRenderComplete(e);

        MontarQueryDocumentos();

        DocumentosPagos.ForceUpdate();
    }

    private void AdtPagos_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_COMPENSAR")
        {
            VerificarRegistrosSelecionados(AdtPagos, DocumentosPagos);
            if (TemMaisDeUmAdtOuDocPag())
            {
                var crt = new Criteria("(A.LISTAHANDLEDOCUMENTOS = :LISTAHANDLEDOCUMENTOS AND A.LISTAHANDLEPARCELAS = :LISTAHANDLEPARCELAS AND A.TIPOPARCELA = :TIPOPARCELA)",
                                       new Parameter("LISTAHANDLEDOCUMENTOS", MontarJoin(DocumentosPagos.SelectedEntitiesHandles, "|")),
                                       new Parameter("LISTAHANDLEPARCELAS", MontarJoin(AdtPagos.SelectedEntitiesHandles, "|")),
                                       new Parameter("TIPOPARCELA", GetTipoOperacao()));

                e.Command.OutputDefinition = MontaFormLinkDefinition("../../../../aga/e/financeiro/CompesacaoAdtoDev.aspx",
                                                                     "TV_COMPESANCAODOCUMENTO",
                                                                     crt.GetWhereText(),
                                                                     FormLinkDefinition.FormMode.Insert);
            }
            else
            {
                string crt = "A.PARCELA= " + AdtPagos.SelectedEntitiesHandlesText +
                             " A.TIPOPARCELA = " + GetTipoOperacao() +
                             " A.LISTAHANDLEPARCELAS= " + AdtPagos.SelectedEntitiesHandlesText +
                            " A.LISTAHANDLEDOCUMENTOS= " + DocumentosPagos.SelectedEntitiesHandlesText;


                e.Command.OutputDefinition = MontaFormLinkDefinition("../../../../aga/a/financeiro/zoomdedocumentos/BaixarParcelasAdiantamento.aspx",
                                         "TV_COMPESANCAODOCUMENTO",
                                         crt,
                                         FormLinkDefinition.FormMode.Insert);
            }
            AdtPagos.SelectedEntitiesHandles.Clear();
            AdtPagos.ForceUpdate();
        }
        else if (e.Command.Name == "CMD_BAIXAR")
        {
            StringBuilder errosAcumulados = new StringBuilder();

            if (AdtPagos.SelectedEntitiesHandles == null || !AdtPagos.SelectedEntitiesHandles.Any())
                errosAcumulados.AppendLine("Nenhuma parcela selecionada.");

            if (AdtPagos.SelectedEntitiesHandles.Count() > 1)
                errosAcumulados.AppendLine("Selecione apenas uma parcela para baixar saldo.");

            if (errosAcumulados.Length > 0)
            {
                throw new BusinessException(errosAcumulados.ToString());
            }
            else
            {
                string crt = "A.PARCELA= " + AdtPagos.SelectedEntitiesHandlesText;


                e.Command.OutputDefinition = MontaFormLinkDefinition("../../../../aga/a/financeiro/zoomdedocumentos/BaixarParcelaAdiantamento.aspx",
                                         "FN_MOVIMENTACOES",
                                         crt,
                                         FormLinkDefinition.FormMode.Insert);
            }
        }
    }

    private void VerificarRegistrosSelecionados(SimpleGrid AdtPagos, SimpleGrid DocumentosPagos)
    {
        StringBuilder errosAcumulados = new StringBuilder();

        if (AdtPagos.SelectedEntitiesHandles == null || !AdtPagos.SelectedEntitiesHandles.Any())
            errosAcumulados.AppendLine("- Nenhuma parcela paga selecionada.");

        if (DocumentosPagos.SelectedEntitiesHandles == null || !DocumentosPagos.SelectedEntitiesHandles.Any())
            errosAcumulados.AppendLine("- Nenhuma parcela de documento selecionada.");

        if (errosAcumulados.Length > 0)
        {
            throw new BusinessException("Foram encontrados os seguintes erros: {0}{0}{1}", Environment.NewLine, errosAcumulados.ToString());
        }
    }

    private void MontarQueryDocumentos()
    {
        if (DocumentosPagos.FilterEntity != null && DocumentosPagos.FilterEntity["PESSOA"].GetInt64() > 0)
            DocumentosPagos.UserDefinedCriteriaWhereClause = MontaWhereDocumentosPagos(DocumentosPagos.FilterEntity["PESSOA"].GetInt64());
        else
            DocumentosPagos.UserDefinedCriteriaWhereClause = MontaWhereDocumentosPagos(PESSOA.GetEntityHandle());
    }

    private int GetTipoOperacao()
    {
        if (Request.QueryString.Keys == null || !Request.QueryString.AllKeys.Any(x => x.Equals("tp")) || Request["tp"] == null)
            throw new BusinessException("Parâmetro de tipo de parcela de adiantamento não veio na requisição.");

        var tp = Convert.ToInt32(Request["tp"]);

        if (tp != ((long)TvCompesancaodocumento.TipoOperacao.BaixaAdtoFornecedores) && tp != ((long)TvCompesancaodocumento.TipoOperacao.BaixaAdtoClientes))
            throw new BusinessException("Tipo de parcela de adiantamento informado inválido.");

        return tp;
    }

    private void gridCompensados_CommandExecute(object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_EXCLUIRCOMPENSADO")
        {
            try
            {
                string parcelasCompensadas = RecuperarHandleSelecionados(gridCompensados);

                if (!string.IsNullOrEmpty(parcelasCompensadas))
                {
                    var parameters = new object[2] { parcelasCompensadas, GetTipoOperacao() };

                    BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.AdiantamentoDevolucoes.Movimentacoes.Processamento.ExcluirMovimentacao, Benner.Corporativo.Financeiro",
                                                         "ExcluirMovimentacoes",
                                                         parameters);

                    gridCompensados.UserDefinedCriteriaWhereClause = MontaWhereCompensados(PESSOA.GetEntityHandle());
                    gridCompensados.SelectedEntitiesHandles.Clear();
                    gridCompensados.ForceUpdate();
                }
            }
            catch (Exception ex)
            {
                throw new BusinessException(ex.Message);
            }
        }
        else if (e.Command.Name == "CMD_LANCAMENTOS")
        {
            e.Command.OutputDefinition = MontaFormLinkDefinition(MontarQueryStringLancamentos(),
                                                                 "LANCAMENTOS_ADTO_CLI_FORN.DATASOURCE",
                                                                 MontaWhereLancamentos());
        }
    }

    private string MontarQueryStringLancamentos()
    {
        string resultado = "../../../../aga/e/financeiro/adiantamentos/lancamentos.aspx?ParcelasCompensadas={0}&Tipo={1}&Pessoa={2}";

        return string.Format(resultado, RecuperarHandleSelecionados(gridCompensados), Convert.ToInt64(Request["tp"]), PESSOA.GetEntityHandle());
    }

    private string RecuperarHandleSelecionados(SimpleGrid grid)
    {
        if (grid != null && grid.SelectedEntitiesHandles != null && grid.SelectedEntitiesHandles.Count > 0)
        {
            return MontarJoin(gridCompensados.SelectedEntitiesHandles);
        }
        else
            throw new BusinessException("Nenhum registro selecionado.");
    }

    private string MontarJoin(List<Handle> registros, string separador = ", ")
    {
        return string.Join(separador, registros);
    }

    private FormLinkDefinition MontaFormLinkDefinition(string url, string targetEntityDefinitionName, string where, FormLinkDefinition.FormMode formMode = FormLinkDefinition.FormMode.View)
    {
        return new FormLinkDefinition()
        {
            TargetFormMode = formMode,
            TargetSystemInstanceName = BennerContext.Administration.DefaultSystemInstanceName,
            WhereClause = new WhereClause { Where = where },
            TargetEntityDefinitionName = targetEntityDefinitionName,
            IsModalPage = true,
            Url = url
        };
    }

    private string MontaWhereLancamentos()
    {
        return string.Format(@"A.LANCAMENTOMOVIMENTACAO IN (SELECT HANDLE 
                                                              FROM FN_MOVIMENTACOES 
                                                             WHERE PARCELABAIXA IN ({0}) OR (PARCELA IN ({0}) AND TIPOMOVIMENTO = 19))",
                             RecuperarHandleSelecionados(gridCompensados));
    }

    private string MontaWhereCompensados(long hndlPessoa)
    {
        return string.Format(@"A.HANDLE IN (SELECT PAR.HANDLE
                                              FROM FN_DOCUMENTOS DOC
                                              JOIN FN_PARCELAS PAR ON (PAR.DOCUMENTO = DOC.HANDLE)
                                             WHERE DOC.PESSOA = {0}
                                               AND DOC.EMPRESA = @EMPRESA
                                               AND (PAR.DOCUMENTOSUSPENSO <> 'S' OR PAR.DOCUMENTOSUSPENSO IS NULL)
                                               AND DOC.EHPREVISAO <> 'S'
                                               AND PAR.VALORESCOMPENSADOS <> 0
                                               AND DOC.TIPODEMOVIMENTO = 2
                                               AND DOC.ENTRADASAIDA = '{1}'
                                               AND DOC.FILIAL IN @FILIAIS)", hndlPessoa, GetTipoDocumento());
    }

    private string MontaWhereAdtPagos(long hndlPessoa)
    {
        return string.Format(@"A.HNDLDOCUMENTO IN (SELECT DOC.HANDLE 
                                                     FROM FN_DOCUMENTOS DOC
                                               INNER JOIN FN_PARCELAS PAR ON PAR.DOCUMENTO = DOC.HANDLE
                                               INNER JOIN GN_OPERACOES CO ON CO.HANDLE = DOC.OPERACAO
                                               INNER JOIN FN_MOVIMENTACOES MO ON MO.PARCELA = PAR.HANDLE
                                                    WHERE DOC.PESSOA = {0}
                                                      AND DOC.EMPRESA = @EMPRESA
                                                      AND MO.TIPOMOVIMENTO <> 4
                                                      AND CO.CODIGOINTERNO <> 29
                                                      AND DOC.EHPREVISAO <> 'S'    
                                                      AND DOC.OPERACAOCANCELAMENTO IS NULL
                                                      AND (PAR.DOCUMENTOSUSPENSO <> 'S' OR PAR.DOCUMENTOSUSPENSO IS NULL)
                                                      AND (PAR.PARCELACANCELADA <> 'S' OR PAR.PARCELACANCELADA IS NULL)
                                                      AND PAR.VALORESBAIXADOS > 0
                                                      AND ((ROUND(PAR.VALORESCOMPENSADOS, 2) < PAR.VALORESBAIXADOS) OR PAR.VALORESCOMPENSADOS IS NULL)
                                                      AND PAR.PERMUTA <> 'S'
                                                      AND DOC.TIPODEMOVIMENTO = 2
                                                      AND DOC.ENTRADASAIDA = '{1}'
                                                      AND DOC.FILIAL IN @FILIAIS)", hndlPessoa, GetTipoDocumento());
    }

    private string MontaWhereDocumentosPagos(long hndlPessoa)
    {
        return string.Format(@"A.HANDLE IN (SELECT PAR.HANDLE 
                                              FROM FN_DOCUMENTOS DOC
                                              JOIN FN_PARCELAS PAR ON(PAR.DOCUMENTO = DOC.HANDLE)
                                              JOIN GN_OPERACOES CO ON(CO.HANDLE = DOC.OPERACAO)
                                              JOIN FILIAIS FI ON (FI.HANDLE = DOC.FILIAL)
                                              JOIN FN_TIPOSDOCUMENTOS TD ON (TD.HANDLE = DOC.TIPODOCUMENTO)
                                         LEFT JOIN GN_MOEDAS MO ON (MO.HANDLE = DOC.MOEDA)
                                             WHERE DOC.EMPRESA = @EMPRESA
                                               AND CO.CODIGOINTERNO <> 29
                                               AND DOC.EHPREVISAO <> 'S'
                                               AND PAR.EMABERTO = 'S'
                                               AND (PAR.DOCUMENTOSUSPENSO <> 'S' OR PAR.DOCUMENTOSUSPENSO IS NULL)
                                               AND DOC.TIPODEMOVIMENTO = 1
                                               AND PAR.PERMUTA <> 'S'
                                               AND PAR.REMESSA IS NULL
                                               AND DOC.PESSOA = {0}
                                               AND DOC.ENTRADASAIDA = '{1}'
                                               AND (PAR.VALOR - PAR.VALORESBAIXADOS - "+ SqlResources.IsNull("PAR.VALORDESAGIO", "0") +" ) > 0 " +
                                            "  AND DOC.FILIAL IN @FILIAIS)",
                             hndlPessoa, GetTipoDocumento());
    }

    private string GetTipoDocumento()
    {
        var tipo = Request.QueryString["tp"];

        if (tipo != null)
        {
            if (tipo.ToString() == "4")
                return "S";

            if (tipo.ToString() == "3")
                return "E";
        }

        return string.Empty;
    }

    protected void DocumentosPagos_FilterExecute(object sender, FilterExecuteEventArgs e)
    {
        try
        {
            MontarQueryDocumentos();
        }
        catch (Exception ex)
        {
            throw new BusinessException("DocumentosPagos_FilterExecute():" + ex.Message);
        }
    }

    [WebMethod]
    public static AdiantamentoClienteFornecedor BuscarValoresTiles(long handlePessoa, string tipo)
    {
        AdiantamentoClienteFornecedor result = new AdiantamentoClienteFornecedor();

        try
        {
            DefinirValoresAdiantamentosPagos(handlePessoa, tipo, result);
            DefinirValoresAdiantamentosCompensados(handlePessoa, tipo, result);
            HandlesAdtoSelecionadosCache(0, "", "RemoveCache");
            HandlesDocSelecionadosCache(0, "", "RemoveCache");
            ItensCache(result, true);

            return result;
        }
        catch (Exception ex)
        {
            Logger.LogInformation(ex.Message);
            return result;
        }
    }

    private static void DefinirValoresAdiantamentosPagos(long pessoa, string tipo, AdiantamentoClienteFornecedor dados)
    {
        decimal quantidade = 0, valores = 0;

        string sql = string.Format(@"SELECT COUNT(B.HANDLE) QTD, SUM(B.VALOR) VALORES 
                                       FROM FN_DOCUMENTOS A 
                                       JOIN FN_PARCELAS B ON B.DOCUMENTO = A.HANDLE
                                      WHERE B.HANDLE IN (SELECT PAR.HANDLE FROM FN_DOCUMENTOS DOC
                                                     INNER JOIN FN_PARCELAS PAR ON PAR.DOCUMENTO = DOC.HANDLE
                                                     INNER JOIN GN_OPERACOES CO ON CO.HANDLE = DOC.OPERACAO
                                                     INNER JOIN FN_MOVIMENTACOES MO ON MO.PARCELA = PAR.HANDLE
                                                          WHERE DOC.PESSOA = {0}
                                                            AND DOC.EMPRESA = @EMPRESA
                                                            AND MO.TIPOMOVIMENTO <> 4
                                                            AND CO.CODIGOINTERNO <> 29
                                                            AND DOC.EHPREVISAO <> 'S'
                                                            AND DOC.OPERACAOCANCELAMENTO IS NULL
                                                            AND (PAR.DOCUMENTOSUSPENSO <> 'S' OR PAR.DOCUMENTOSUSPENSO IS NULL)
                                                            AND (PAR.PARCELACANCELADA <> 'S' OR PAR.PARCELACANCELADA IS NULL)
                                                            AND PAR.VALORESBAIXADOS > 0
                                                            AND ((ROUND(PAR.VALORESCOMPENSADOS, 2) < PAR.VALORESBAIXADOS) OR PAR.VALORESCOMPENSADOS IS NULL)
                                                            AND PAR.PERMUTA <> 'S'
                                                            AND DOC.TIPODEMOVIMENTO = 2
                                                            AND DOC.ENTRADASAIDA = '{1}'
                                                            AND DOC.FILIAL IN @FILIAIS)", pessoa, tipo);

        BuscarQuantidadeValores(sql, out quantidade, out valores);

        dados._QuantidadePagos = quantidade;
        dados._ValorPagos = valores;
    }

    private static void DefinirValoresAdiantamentosCompensados(long pessoa, string tipo, AdiantamentoClienteFornecedor dados)
    {
        decimal quantidade = 0, valores = 0;

        string sql = string.Format(@"SELECT COUNT(B.HANDLE) QTD, SUM(B.VALORESCOMPENSADOS) VALORES 
                                       FROM FN_DOCUMENTOS A 
                                       JOIN FN_PARCELAS B ON B.DOCUMENTO = A.HANDLE 
                                      WHERE B.HANDLE IN (SELECT PAR.HANDLE
                                                           FROM FN_DOCUMENTOS DOC
                                                           JOIN FN_PARCELAS PAR ON PAR.DOCUMENTO = DOC.HANDLE
                                                          WHERE DOC.PESSOA = {0}
                                                            AND DOC.EMPRESA = @EMPRESA
                                                            AND (PAR.DOCUMENTOSUSPENSO <> 'S' OR PAR.DOCUMENTOSUSPENSO IS NULL)
                                                            AND DOC.EHPREVISAO <> 'S'
                                                            AND PAR.VALORESCOMPENSADOS > 0
                                                            AND DOC.TIPODEMOVIMENTO = 2
                                                            AND DOC.ENTRADASAIDA = '{1}'
                                                            AND DOC.FILIAL IN @FILIAIS)", pessoa, tipo);

        BuscarQuantidadeValores(sql, out quantidade, out valores);

        dados._QuantidadeCompensados = quantidade;
        dados._ValorCompensados = valores;
    }

    private bool TemMaisDeUmAdtOuDocPag()
    {
        return AdtPagos.SelectedEntitiesHandles.Count > 1 || DocumentosPagos.SelectedEntitiesHandles.Count > 1;
    }

    private static void BuscarQuantidadeValores(string sql, out decimal quantidade, out decimal valores)
    {
        try
        {
            var query = ExecutarBusca(sql);

            quantidade = RecuperarValorCampoQuery(query, "QTD");
            valores = RecuperarValorCampoQuery(query, "VALORES");
        }
        catch (Exception ex)
        {
            throw new BusinessException(ex.Message, ex);
        }
    }

    private static EntityBase ExecutarBusca(string query)
    {
        return Entity.GetFirstOrDefault(new EntityDefinition() { EntitySource = new QuerySource(query) }, new Criteria());
    }

    private static decimal RecuperarValorCampoQuery(EntityBase query, string campo)
    {
        if (query != null)
        {
            var valorCampo = query[campo].GetDBValue();

            if (valorCampo != null)
                return Convert.ToDecimal(valorCampo);
        }
        return 0m;
    }

    [WebMethod]
    public static AdiantamentoClienteFornecedor SomarValoresTiles(int handle, string selecionar, string titulo)
    {
        AdiantamentoClienteFornecedor result = new AdiantamentoClienteFornecedor();

        try
        {
            if (titulo.Contains(titulo))
            {
                var itens = ItensCache(result, false);
                var handlesAdto = HandlesAdtoSelecionadosCache(handle, selecionar, titulo);
                if(handlesAdto != null && handlesAdto.Count > 0)
                    SomarValoresAdiantamentosPagos(handlesAdto, result);
                var handlesDoc = HandlesDocSelecionadosCache(handle, selecionar, titulo);
                if (handlesDoc != null && handlesDoc.Count > 0)
                    SomarValoresAdiantamentosCompensados(handlesDoc, result);
                if (result.QuantidadeCompensados.Equals("0"))
                {
                    result._QuantidadeCompensados = itens.QuantidadeCompensados.ToDecimal();
                    result._ValorCompensados = itens.ValorCompensados.ToDecimal();
                }
                else if (result.QuantidadePagos.Equals("0"))
                {
                    result._QuantidadePagos = itens.QuantidadePagos.ToDecimal();
                    result._ValorPagos = itens.ValorPagos.ToDecimal();
                }
                
            }
            return result;
        }
        catch (Exception ex)
        {
            Logger.LogInformation(ex.Message);
            return result;
        }
    }

    private static void SomarValoresAdiantamentosCompensados(List<int> handlesSelecionados, AdiantamentoClienteFornecedor dados)
    {
        List<decimal> valoresSQL = new List<decimal>();

        foreach (var item in handlesSelecionados)
        {
            var qry = new Query(@"SELECT A.HANDLE HNDLDOCUMENTO, B.AP CHAVE, FILIAL.NOME FILIAL,
                                   A.DATAEMISSAO,
                                   A.DOCUMENTODIGITADO,
                                   A.NUMEROPEDIDO,
                                   B.PARCELADIGITADA,
                                   B.AP,
                                   FT.NOME TIPODOCUMENTO,
                                   A.DATAENTRADA DATAENTRADADOC,
                                   MOEDA.ABREVIATURA MOEDA,
                                   A.DATAENTRADA,
                                   (B.VALOR - B.VALORESBAIXADOS - B.VALORDESAGIO) SALDO,
                                   B.VALOR,
                                   B.VALORESBAIXADOS,
                                   B.VALORMOEDA,
                                   B.HANDLE,
                                   A.HANDLE DOCUMENTO,
                                   B.DATAVENCIMENTO,
                                   B.VCTOPRORROGADO,
                                   C.NOME,
                                   B.VALORDESAGIO,
                                   A.ENTRADASAIDA,
                                   B.TIPOCOBRANCA,
                                   B.VALORESBAIXADOSMOEDA,
                                   A.PESSOA
                              FROM FN_DOCUMENTOS A
                                   JOIN FN_PARCELAS B ON B.DOCUMENTO = A.HANDLE
                                   JOIN GN_OPERACOES C ON A.OPERACAO = C.HANDLE
                                   JOIN FILIAIS FILIAL ON FILIAL.HANDLE = A.FILIAL
                                   JOIN FN_TIPOSDOCUMENTOS TIPODOCUMENTO ON TIPODOCUMENTO.HANDLE = A.TIPODOCUMENTO
                                   LEFT JOIN GN_MOEDAS MOEDA ON MOEDA.HANDLE = A.MOEDA
                                   JOIN FN_TIPOSDOCUMENTOS FT ON (FT.HANDLE = A.TIPODOCUMENTO)
                             WHERE B.AP = :HANDLE
                             ORDER BY A.DATAENTRADA", new Parameter("HANDLE", item))
                                                         .Execute()
                                                         .FirstOrDefault();


            valoresSQL.Add(qry.Fields["SALDO"].ToDecimal());
        }

        dados._ValorCompensadosSelecionado = valoresSQL.Sum(x => x);
    }

    private static void SomarValoresAdiantamentosPagos(List<int> handlesSelecionados, AdiantamentoClienteFornecedor dados)
    {
        List<decimal> valoresSQL = new List<decimal>();

        foreach (var item in handlesSelecionados)
        {
            var qry = new Query(@"SELECT A.HANDLE HNDLDOCUMENTO,
                               B.AP CHAVE,
                               SUM(D.VALORDESAGIO) DESAGIO,
                               A.DATAENTRADA DATAENTRADADOC,
                               A.DATAENTRADA,
                               B.DATAVENCIMENTO,
                               A.HANDLE DOCUMENTO,
                               B.DATALIQUIDACAO,
                               A.DOCUMENTODIGITADO,
                               B.PARCELADIGITADA,
                               B.AP,
                               MO.ABREVIATURA MOEDA,
                               (B.VALORESBAIXADOS - B.VALORESCOMPENSADOS)VALOR,
                               B.VALORESBAIXADOS,
                               B.VALORMOEDA,
                               A.TIPODOCUMENTO,
                               B.VCTOPRORROGADO,
                               FI.NOME FILIAL,
                               A.DATAEMISSAO,
                               B.HANDLE HANLDEPARCELA,
                               C.NOME,
                               B.VALORESBAIXADOSMOEDA,
                               B.VALORESCOMPENSADOSMOEDA,
                               B.VALORESCOMPENSADOS,
                               A.PESSOA
                          FROM FN_DOCUMENTOS A
                               INNER JOIN FN_PARCELAS B ON(B.DOCUMENTO = A.HANDLE)
                               INNER JOIN GN_OPERACOES C ON(C.HANDLE = A.OPERACAO)
                               INNER JOIN FN_MOVIMENTACOES D ON(D.PARCELA = B.HANDLE)
                               LEFT JOIN GN_MOEDAS MO ON(MO.HANDLE = A.MOEDA)
                               JOIN FILIAIS FI ON(FI.HANDLE = A.FILIAL)
                        WHERE B.AP = :HANDLE
                         GROUP BY A.DATAENTRADA,
                               B.DATAVENCIMENTO,
                               A.HANDLE,
                               A.DOCUMENTODIGITADO,
                               B.PARCELADIGITADA,
                               B.AP,
                               MO.ABREVIATURA,
                               B.VALOR,
                               B.VALORESBAIXADOS,
                               B.VALORMOEDA,
                               B.VALORESBAIXADOSMOEDA,
                               A.TIPODOCUMENTO,
                               B.VCTOPRORROGADO,
                               FI.NOME,
                               A.DATAEMISSAO,
                               B.HANDLE,
                               C.NOME,
                               B.VALORESCOMPENSADOS,
                               B.VALORESCOMPENSADOSMOEDA,
                               B.DATALIQUIDACAO,
                               A.PESSOA
                        HAVING((SUM(D.VALORDESAGIO) + ROUND(B.VALORESCOMPENSADOS, 2)) < B.VALORESBAIXADOS)
                               OR((ROUND(B.VALORESCOMPENSADOS, 2) < B.VALORESBAIXADOS)
                               AND(SUM(D.VALORDESAGIO) IS NULL
                               OR SUM(D.VALORDESAGIO) = 0)
                               OR B.VALORESCOMPENSADOS IS NULL)
                         ORDER BY A.DATAENTRADA", new Parameter("HANDLE", item))
                                                         .Execute()
                                                         .FirstOrDefault();


            valoresSQL.Add(qry.Fields["VALOR"].ToDecimal());
        }

        dados._ValorPagosSelecionado = valoresSQL.Sum(x => x);
    }

    public static List<int> HandlesAdtoSelecionadosCache(int doc, string selecionado, string tipo)
    {
        var cache = new BusinessCacheProvider<List<int>>("$TVCompensaAdto");
        if (tipo.Contains("RemoveCache"))
        {
            cache.ClearAll();
            return null;
        }
        int codigo = doc;

        //if (selecionado.Equals(" no-selected") || selecionado.Equals("no-selected"))
        //    return cache.Get(tipo);

        if (cache.Contains(tipo))
        {
            // Pego a cache e realizo a busca do produto
            List<int> codigos = cache.Get(tipo);
            if (codigos.Contains(doc) && selecionado.Contains("no-selected"))
            {
                codigos.Remove(doc);
                return codigos;
            }
            // Caso não encontre adiciono na cache
            else if (!codigos.Contains(doc))
                codigos.Add(doc);

            return codigos;
        }
        // Não existe cache. Por este motivo eu crio e adiciono o produto.
        else
        {
            if (tipo == "ctl00_Main_AdtPagos_SimpleGrid")
            {
                List<int> codigos = new List<int>();

                codigos.Add(doc);
                cache.Set(tipo, codigos, TimeSpan.FromMinutes(5), CacheItemPriority.Normal);
                return codigos;
            }
            else
                return cache.Get("ctl00_Main_AdtPagos_SimpleGrid");
        }
    }
    public static List<int> HandlesDocSelecionadosCache(int doc, string selecionado, string tipo)
    {
        var cache = new BusinessCacheProvider<List<int>>("$TVCompensaDoc");
        if (tipo.Contains("RemoveCache"))
        {
            cache.ClearAll();
            return null;
        }
        int codigo = doc;

        //if (selecionado.Equals(" no-selected") || selecionado.Equals("no-selected"))
        //    return cache.Get(tipo);

        if (cache.Contains(tipo))
        {
            // Pego a cache e realizo a busca do produto
            List<int> codigos = cache.Get(tipo);

            if (codigos.Contains(doc) && selecionado.Contains("no-selected"))
            {
                codigos.Remove(doc);
                return codigos;
            }
            // Caso não encontre adiciono na cache
            else if (!codigos.Contains(doc))
                codigos.Add(doc);

            return codigos;
        }
        // Não existe cache. Por este motivo eu crio e adiciono o produto.
        else
        {
            if(tipo == "ctl00_Main_DocumentosPagos_SimpleGrid")
            {
                List<int> codigos = new List<int>();

                codigos.Add(doc);
                cache.Set(tipo, codigos, TimeSpan.FromMinutes(5), CacheItemPriority.Normal);
                return codigos;
            }
            else
                return cache.Get("ctl00_Main_DocumentosPagos_SimpleGrid");
        }
    }
    public static AdiantamentoClienteFornecedor ItensCache(AdiantamentoClienteFornecedor dados, bool status)
    {
        var cache = new BusinessCacheProvider<AdiantamentoClienteFornecedor>("$TVCompensa");
        if (cache.Contains("item") && status == true)
            cache.ClearAll();

        if (cache.Contains("item"))
        {
            dados = cache.Get("item");
            return dados;
        }
        else
        {
            cache.Set("item", dados, TimeSpan.FromMinutes(5), CacheItemPriority.Normal);
            return dados;
        }
    }
}