<%@ Page Title="Início contábil" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contabil.ModuloContabilPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Src="~/uc/Financeiro/DashBoardConciliacaoBancaria.ascx" TagPrefix="wes" TagName="DashBoardConciliacaoBancaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script src="<%= ResolveUrl("~/Content/js/BennerGrid.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/jquery.table2excel.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/RazaoConta.js")%>"></script>

    <aga:AGAResource runat="server" Src="~/Content/aga/js/complete.js" />
    <script type="text/javascript">
		ExibirMenusModuloContabil();
        $(document).ready(function () {
            AGA.Date.setValue("Competencia", moment().format("MM/YYYY"));
            AGA.Date.setReadOnly("Competencia", false);
            AtualizaInfoConciliacaoBancaria(moment().year(), moment().month() + 1);
            AtualizarCompetencia("chartConciliacaoBancaria", moment().year(), moment().month() + 1);
        });

        function CompetenciaChange() {
            var data = new moment(AGA.Date.getValue("Competencia"), "DD/MM/YYYY");
            var year = data.year();
            var month = data.month() + 1;

            AtualizarCompetencia("chartLancamentosD", year, month);
            AtualizarCompetencia("chartLancamentosC", year, month);
            AtualizarCompetencia("chartConciliacaoBancaria", year, month);
            AtualizarCompetencia("chartVariacaoSaldo", year, month);
            AtualizarCompetencia("chartIndicadoresLiquidez", year, month);
            AtualizaInfoConciliacaoBancaria(year, month);

            ErpDashboard.initDashboard();
        }

        function AtualizarCompetencia(id, year, month) {
            var chart = document.getElementById(id);
            var source = chart.getAttribute("source").split("-");
            var index = source[1].split(",");

            document.getElementById(id).setAttribute("source", source[0] + "-" + index[0] + "," + year + "," + month);
        }

        var ExportarVariacaoSaldos = function (id) {
            var el = document.getElementById(id);
            var source = el.getAttribute("source").split("-");
            var index = source[1].split(",");

            var data = new moment(AGA.Date.getValue("Competencia"), "DD/MM/YYYY");
            var year = data.year();
            var month = data.month() + 1;

            if (index[1] != null) {
                year = index[1];
                month = index[2];
            }

            var u = $("#Wes2008ApplicationPath").val() + "api/Contabil/ExportarVariacaoSaldos" + "?ano=" + year + "&mes=" + month;

            toastr.info("Exportar variação de saldos.", "Exportar excel");

            $.ajax({
                context: el,
                dataType: "json",
                type: "POST",
                url: u
            }).done(function (data) {
                Benner.AsyncProcesses.initAjax();
            });
        }

        var ExportarLancamentosPorOrigem = function (id, natureza) {
            var el = document.getElementById(id);
            var source = el.getAttribute("source").split("-");
            var index = source[1].split(",");

            var data = new moment(AGA.Date.getValue("Competencia"), "DD/MM/YYYY");
            var year = data.year();
            var month = data.month() + 1;

            if (index[1] != null) {
                year = index[1];
                month = index[2];
            }

            var rota = natureza == "C" ? "Credito" : "Debito";
            var desc = natureza == "C" ? "Crédito" : "Débito"

            var u = $("#Wes2008ApplicationPath").val() + "api/Contabil/ExportarLancamentosPorOrigem" + rota + "?ano=" + year + "&mes=" + month;

            toastr.info("Exportar quantidade de lançamentos a " + desc + " por origem.", "Exportar excel");

            $.ajax({
                context: el,
                dataType: "json",
                type: "POST",
                url: u
            }).done(function (data) {
                Benner.AsyncProcesses.initAjax();
            });
        }

        //Montar e executar o request, conforme a linha informada no parâmetro.
        var objEnvioPost = {};
        function clickGraphItem(event) {
            var data = new moment(AGA.Date.getValue("Competencia"), "DD/MM/YYYY");
            var year = data.year();
            var month = data.month() + 1;

            objEnvioPost.ContaContabil = event.item.dataContext.Handle;
            objEnvioPost.ContaContabilTexto = event.item.dataContext.Description;
            objEnvioPost.CentroCusto = null;
            objEnvioPost.Projetos = null;
            objEnvioPost.Filial = null;
            objEnvioPost.Competencia = year + '-' + month + '-01';
            objEnvioPost.SaldoAtual = 0;

            setTimeout(function () {
                ObterRazao(objEnvioPost, '#chartVariacaoSaldo');

            }, 300);
        }

        //Métodos a serem executados no evento load da página.
        $(function () {
            //Trazer conteudo do modal e adicionar ao corpo da página
            $("#container").load(Benner.Page.getApplicationPath() + 'ConsultasContabil/RazaoConta', function () {
                $(this).clone().appendTo("body").remove();
            });
        })
    </script>
    <div class="row">
        <wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_CT_MODULO.FORM" VerticalOrientation="False" PageWidgetHandle="13584" Level="20" Order="1" />
    </div>

    <div class="portlet light">
        <div id="container-filtros">
            <div class="col-md-10 col-xs12 col-sm-12">
                <h1 class="page-title">Dashboard <small>contábil</small></h1>
            </div>
            <div class="col-md-2 col-xs12 col-sm-12">
                <aga:AGAFormControl runat="server" ID="MyForm" IsHorizontalForm="false" ReadOnly="true">
                    <div class="row">
                        <aga:AGADateControl DateFormat="MonthYear" ID="Competencia" Name="Competencia" runat="server" ClientChangeCallback="CompetenciaChange" />
                    </div>
                </aga:AGAFormControl>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-xs12 col-sm-12">
                <wes:DashBoardConciliacaoBancaria runat="server" />
            </div>
            <div class="col-lg-4 col-xs12 col-sm-12">
                <div class="portlet solid bordered white">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o null"></i>
                            <span class="null">Débitos por origem</span>
                        </div>
                        <div class="tools">
                            <span class="fa fa-download" style="cursor: pointer" onclick="ExportarLancamentosPorOrigem('chartLancamentosD', 'D');"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="portlet-body">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <erp:ErpDashboardChartNoTitle id="chartLancamentosD" runat="server" source="contabil-0" height="26vh" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-xs12 col-sm-12">
                <div class="portlet solid bordered white">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o null"></i>
                            <span class="null">Créditos por origem</span>
                        </div>
                        <div class="tools">
                            <span class="fa fa-download" style="cursor: pointer" onclick="ExportarLancamentosPorOrigem('chartLancamentosC', 'C');"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="portlet-body">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <erp:ErpDashboardChartNoTitle id="chartLancamentosC" runat="server" source="contabil-1" height="26vh" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 col-xs12 col-sm-12">
                <div class="portlet solid bordered white">
                    <div class="portlet-title">
                        <div class="caption">
                            <i class="fa fa-bar-chart-o null"></i>
                            <span class="null">Variação saldos acima da média</span>
                        </div>
                        <div class="tools">
                            <span class="fa fa-download" style="cursor: pointer" onclick="ExportarVariacaoSaldos('chartVariacaoSaldo');"></span>
                        </div>
                    </div>
                    <div class="row">
                        <div class="portlet-body">
                            <div class="col-lg-12 col-xs-12 col-sm-12">
                                <erp:ErpDashboardChartNoTitle id="chartVariacaoSaldo" runat="server" source="contabil-2" color="white" height="26vh" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-xs-12 col-sm-12">
                <erp:ErpDashboardChart id="chartIndicadoresLiquidez" runat="server" source="contabil-3" color="white" height="26vh" />
            </div>
        </div>
    </div>
    <div id="container"></div>
</asp:Content>
