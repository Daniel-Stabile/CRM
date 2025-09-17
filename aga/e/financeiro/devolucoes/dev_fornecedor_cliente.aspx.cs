using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Benner.Tecnologia.Wes.Components;
using Benner.Tecnologia.Business;
using Benner.Tecnologia.Common.Components;
using Benner.Tecnologia.Common;
using Benner.Tecnologia.Wes.Components.WebApp;
using System.Web.Services;
using Benner.Corporativo.Definicoes.Financeiro;
using System.Text;
using Benner.Tecnologia.Common.Instrumentation;
using Benner.ERP.Comum;

public partial class DevolucoesClienteFornecedorPage : WesPage
{
    public class DevolucoesClienteFornecedor
    {
        public decimal _QuantidadePagos { get; set; }
        public decimal _ValorPagos { get; set; }
        public decimal _QuantidadeCompensados { get; set; }
        public decimal _ValorCompensados { get; set; }



        public string QuantidadePagos { get { return this._QuantidadePagos.ToString(); } }
        public string ValorPagos { get { return this._ValorPagos.ToString("#,##0.00"); } }
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

        public DevolucoesClienteFornecedor()
        {
            this._QuantidadePagos = 0;
            this._ValorPagos = 0;
            this._QuantidadeCompensados = 0;
            this._ValorCompensados = 0;
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        DevolucoesPagas.CommandExecute += DevolucoesPagas_CommandExecute;
        Compensados.CommandExecute += Compensados_CommandExecute;

        if (!Page.IsPostBack)
        {
            DevolucoesPagas.UserDefinedCriteriaWhereClause = MontaWhereCompensadosEDevPagos(PESSOA.GetEntityHandle());
            Compensados.UserDefinedCriteriaWhereClause = MontaWhereCompensadosEDevPagos(PESSOA.GetEntityHandle());
        }

        DocumentosPagos.UserDefinedCriteriaWhereClause = MontaWhereDocumentosPagos(PESSOA.GetEntityHandle());

        DevolucoesPagas.GridDefinition.Commands["CMD_COMPENSAR"].Visible = Utils.VerificaPermissao("MANTER_ADIANTAMENTOCLIENTE", "MANTER_ADIANTAMENTOFORNECEDOR", "MANTER_DEVOLUCAOFORNECEDOR", "MANTER_DEVOLUCAOCLIENTES", "MANTER_ADIANTAMENTOCLIENTEAUT");
        Compensados.GridDefinition.Commands["CMD_EXCLUIRCOMPENSADO"].Visible = Utils.VerificaPermissao("EXCLUIR_ADIANTAMENTOCLIENTE", "EXCLUIR_ADIANTAMENTOFORNECEDOR", "EXCLUIR_DEVOLUCAOCLIENTES", "EXCLUIR_DEVOLUCAOFORNECEDOR", "MANTER_ADIANTAMENTOCLIENTEAUT");

        DevolucoesPagas.ForceUpdate();
        DocumentosPagos.ForceUpdate();
        Compensados.ForceUpdate();
        Movimentacoes.ForceUpdate();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "LoadInfoTiles", "LoadInfoTiles();", true);
    }

    private void DevolucoesPagas_CommandExecute(Object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_COMPENSAR")
        {
            VerificarRegistrosSelecionados(DevolucoesPagas, DocumentosPagos);

            var crt = new Criteria("(A.LISTAHANDLEDOCUMENTOS = :LISTAHANDLEDOCUMENTOS AND A.LISTAHANDLEPARCELAS = :LISTAHANDLEPARCELAS AND A.TIPOPARCELA = :TIPOPARCELA)",
                                   new Parameter("LISTAHANDLEDOCUMENTOS", MontarJoin(DocumentosPagos.SelectedEntitiesHandles, "|")),
                                   new Parameter("LISTAHANDLEPARCELAS", MontarJoin(DevolucoesPagas.SelectedEntitiesHandles, "|")),
                                   new Parameter("TIPOPARCELA", GetTipoOperacao()));

            e.Command.OutputDefinition = MontaFormLinkDefinition("../../../../aga/e/financeiro/CompesacaoAdtoDev.aspx",
                                                                 "TV_COMPESANCAODOCUMENTO",
                                                                 crt.GetWhereText(),
                                                                 FormLinkDefinition.FormMode.Insert);
            DevolucoesPagas.SelectedEntitiesHandles.Clear();
            DevolucoesPagas.ForceUpdate();
        }
    }

    private void VerificarRegistrosSelecionados(SimpleGrid devPagos, SimpleGrid documentosPagos)
    {
        StringBuilder errosAcumulados = new StringBuilder();

        if (devPagos.SelectedEntitiesHandles == null || !devPagos.SelectedEntitiesHandles.Any())
            errosAcumulados.AppendLine("- Nenhuma parcela paga selecionada.");

        if (documentosPagos.SelectedEntitiesHandles == null || !documentosPagos.SelectedEntitiesHandles.Any())
            errosAcumulados.AppendLine("- Nenhuma parcela de documento selecionada.");

        if (errosAcumulados.Length > 0)
        {
            throw new BusinessException("Foram encontrados os seguintes erros: {0}{0}{1}", Environment.NewLine, errosAcumulados.ToString());
        }
    }

    private int GetTipoOperacao()
    {
        if (Request.QueryString.Keys == null || !Request.QueryString.AllKeys.Any(x => x.Equals("tp")) || Request["tp"] == null)
            throw new BusinessException("Parâmetro de tipo de parcela de devolução não veio na requisição.");

        var tp = Convert.ToInt32(Request["tp"]);

        if (tp != ((long)TvCompesancaodocumento.TipoOperacao.DevolucaoClientes) && tp != ((long)TvCompesancaodocumento.TipoOperacao.DevolucaoFornecedores))
            throw new BusinessException("Tipo de parcela de devolução informado inválido.");

        return tp;
    }

    private void Compensados_CommandExecute(Object sender, GridCommandExecuteArgs e)
    {
        if (e.Command.Name == "CMD_EXCLUIRCOMPENSADO")
        {
            try
            {
                string parcelasCompensadas = RecuperarHandleSelecionados(Compensados);

                if (!string.IsNullOrEmpty(parcelasCompensadas))
                {
                    var parameters = new object[2] { parcelasCompensadas, GetTipoOperacao() };

                    BennerContext.BusinessComponent.Call("Benner.Corporativo.Financeiro.Tesouraria.AdiantamentoDevolucoes.Movimentacoes.Processamento.ExcluirMovimentacao, Benner.Corporativo.Financeiro",
                                                         "ExcluirMovimentacoes",
                                                         parameters);

                    Compensados.UserDefinedCriteriaWhereClause = MontaWhereCompensadosEDevPagos(PESSOA.GetEntityHandle());
                    Compensados.SelectedEntitiesHandles.Clear();
                    Compensados.ForceUpdate();
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

        return string.Format(resultado, RecuperarHandleSelecionados(Compensados), Convert.ToInt64(Request["tp"]), PESSOA.GetEntityHandle());
    }

    private string RecuperarHandleSelecionados(SimpleGrid grid)
    {
        if (grid == null || grid.SelectedEntitiesHandles == null || grid.SelectedEntitiesHandles.Count > 0)
        {
            return MontarJoin(Compensados.SelectedEntitiesHandles);
        }
        else
            throw new BusinessException("Nenhum registro selecionado.");
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

    private string MontaWhereCompensadosEDevPagos(long hndlPessoa)
    {
        return string.Format(@"A.EMPRESA = @EMPRESA
                                AND A.PESSOA = {0}
                                AND A.ENTRADASAIDA = '{1}' 
                                AND A.FILIAL IN @FILIAIS", hndlPessoa, GetEntradaSaida());
    }

    protected void DocumentosPagos_FilterExecute(object sender, FilterExecuteEventArgs e)
    {
        try
        {
            EntityAssociation pessoa = (EntityAssociation)e.Entity.Fields["PESSOA"];
            DocumentosPagos.UserDefinedCriteriaWhereClause = MontaWhereDocumentosPagos(Convert.ToInt64(pessoa.Handle));
        }
        catch (Exception ex)
        {
            throw new BusinessException("DocumentosPagos_FilterExecute():" + ex.Message);
        }
    }

    private string MontaWhereLancamentos()
    {
        return string.Format(@"A.LANCAMENTOMOVIMENTACAO IN (SELECT HANDLE 
                                                              FROM FN_MOVIMENTACOES 
                                                             WHERE PARCELABAIXA IN ({0}))",
                                 RecuperarHandleSelecionados(Compensados));
    }

    private string MontaWhereDocumentosPagos(long hndlPessoa)
    {
        return string.Format(@"A.EMPRESA = @EMPRESA
                                AND A.PESSOA = {0}
                                AND A.ENTRADASAIDA = '{1}'
                                AND A.FILIAL IN @FILIAIS", hndlPessoa, GetEntradaSaidaDocumentosPagos());
    }

    [WebMethod]
    public static DevolucoesClienteFornecedor BuscarValoresTiles(int handlePessoa, string tipo)
    {
        return BuscaValores(handlePessoa, tipo);
    }

    public static DevolucoesClienteFornecedor BuscaValores(long pessoa, string tipo)
    {
        DevolucoesClienteFornecedor result = new DevolucoesClienteFornecedor();

        try
        {
            DefinirValoresDevolucoesPagos(pessoa, tipo, result);
            DefinirValoresDevolucoesCompensados(pessoa, tipo, result);

            return result;
        }
        catch (Exception ex)
        {
            Logger.LogInformation(ex.Message);
            return result;
        }
    }

    private static void DefinirValoresDevolucoesCompensados(long pessoa, string tipo, DevolucoesClienteFornecedor dados)
    {
        decimal quantidade = 0, valores = 0;

        string sql = string.Format(@"SELECT COUNT(A.HANDLE) QTD, SUM(B.VALORESBAIXADOS) VALORES 
                                                           FROM FN_DOCUMENTOS A
                                                           JOIN FN_PARCELAS B ON B.DOCUMENTO = A.HANDLE
                                                          WHERE A.PESSOA = {0}
                                                            AND A.EMPRESA = @EMPRESA
                                                            AND (B.DOCUMENTOSUSPENSO <> 'S' OR B.DOCUMENTOSUSPENSO IS NULL)
                                                            AND A.EHPREVISAO <> 'S'
                                                            AND B.HANDLE IN (SELECT C.PARCELABAIXA
                                                                                 FROM FN_MOVIMENTACOES C
                                                                                WHERE C.PARCELABAIXA = B.HANDLE)
                                                            AND A.TIPODEMOVIMENTO = 3
                                                            AND A.ENTRADASAIDA = '{1}'
                                                            AND A.FILIAL IN @FILIAIS", pessoa, tipo);
        
        BuscarQuantidadeValores(sql, out quantidade, out valores);

        dados._QuantidadeCompensados = quantidade;
        dados._ValorCompensados = valores;
    }

    private static void DefinirValoresDevolucoesPagos(long pessoa, string tipo, DevolucoesClienteFornecedor dados)
    {
        decimal quantidade = 0, valores = 0;

        string sql = string.Format(@"SELECT COUNT(A.HANDLE) QTD, SUM(B.VALOR) VALORES
                                            FROM FN_DOCUMENTOS A
                                                INNER JOIN FN_PARCELAS B ON B.DOCUMENTO = A.HANDLE
                                                INNER JOIN GN_OPERACOES CO ON CO.HANDLE = A.OPERACAO
                                                    WHERE A.PESSOA = {0}
                                                    AND A.EMPRESA = @EMPRESA
                                                    AND CO.CODIGOINTERNO <> 29
                                                    AND A.EHPREVISAO <> 'S'
                                                    AND A.OPERACAOCANCELAMENTO IS NULL
                                                    AND (B.DOCUMENTOSUSPENSO <> 'S' OR B.DOCUMENTOSUSPENSO IS NULL)
                                                    AND B.EMABERTO = 'S'
                                                    AND ((ROUND(B.VALORESCOMPENSADOS, 2) < B.VALORESBAIXADOS) OR B.VALORESCOMPENSADOS IS NULL OR B.VALORESCOMPENSADOS = 0)
                                                    AND B.PERMUTA <> 'S'
                                                    AND A.TIPODEMOVIMENTO = 3
                                                    AND A.ENTRADASAIDA = '{1}' 
                                                    AND A.FILIAL IN @FILIAIS", pessoa, tipo);

        BuscarQuantidadeValores(sql, out quantidade, out valores);

        dados._QuantidadePagos = quantidade;
        dados._ValorPagos = valores;
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

    private string MontarJoin(List<Handle> registros, string separador = ", ")
    {
        return string.Join(separador, registros);
    }
    private string GetEntradaSaidaDocumentosPagos()
    {
        var tipo = GetTipoOperacao();

        return tipo == (int)TvCompesancaodocumento.TipoOperacao.DevolucaoFornecedores ? "E" : "S";        
    }

    private string GetEntradaSaida()
    {
        var tipo = GetTipoOperacao();

        return tipo == (int)TvCompesancaodocumento.TipoOperacao.DevolucaoFornecedores ? "S" : "E";
    }
}
