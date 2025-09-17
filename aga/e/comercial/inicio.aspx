<%@ Page Title="Início" Language="C#" CodeFile="~/aga/e/comercial/inicio.aspx.cs" Inherits="comercialinicioPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/pdfmake/pdfmake.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/jszip/jszip.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/FileSaver.js/FileSaver.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/fabric.js/fabric.min.js"></script>
    <div class="row">
        <wes:CommandsPanel
            runat="server"
            ID="COMERCIALCOMANDOS"
            Title="Operações disponíveis"
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="12"
            FontIcon=""
            ShowTitle="false"
            ProviderWidgetUniqueId=""
            ChromeState="Fixed"
            CanDelete="True"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="WEB_CM_MODULO.GRID"
            VerticalOrientation="False"
            Level="20"
            Order="10" />
    </div>
    <div id="dashboardComercialApp">
        <comercial-dashboard-comercial data-competencia="<%= Competencia.ToString("MM/yyyy") %>" permite-coletar="<%= PermiteColetar %>" ></comercial-dashboard-comercial>
    </div>
    <style>
        #portlet_COMERCIALCOMANDOS {
            padding: 10px 15px 4px;
        }

        .dashboard-stat2 {
            padding-bottom: 10px;
        }

            .dashboard-stat2 .display {
                margin: 0;
            }
    </style>
    <script>
		ExibirMenusModuloComercial();
        if ($("#PERMITEVISUALIZARDASHBOARD").val() == "True")
        {
        var app = new window.Vue({
            el: '#dashboardComercialApp',
            store: Benner.DashboardComercialStore
        });
        }

        function AtualizaDashBoardCharts(data) {
            $('.chart').each(function () {
                ErpPlotChartMultiLineNew(this, data, true);
            });
        };

        $(function () {
            var steps = [
                {
                    element: '#NotasFiscais',
                    title: 'Notas fiscais',
                    content: 'Quantidade total de notas de faturamento emitidas no mês e o percentual em relação ao mês anterior. Para ver detalhes ou exportar um relatório análitico, utilize a lupa.',
                    placement: 'bottom',
                    backdrop: true
                },
                {
                    element: '#ValorFaturado',
                    title: 'Valor faturado',
                    content: 'Valor total das notas de faturamento emitidas no mês e o percentual em relação ao mês anterior.',
                    placement: 'right',
                    backdrop: true
                },
                {
                    element: '#TicketMedio',
                    title: 'Ticket médio',
                    content: 'Valor médio de uma compra. O ticket médio é calculado utilizando valor faturado dividido pela quantidade de notas de faturamento.',
                    placement: 'left',
                    backdrop: true
                },
                {
                    element: '#FaltaFaturar',
                    title: 'Falta faturar',
                    content: 'Quanto falta faturar no mês. A composição do valor considera itens a faturar de ordem de venda, contratos com apontamentos, entregas e faturamentos e notas fiscais com status aguardando emissão.',
                    placement: 'left',
                    backdrop: true
                },
                {
                    element: '.chart',
                    title: 'Gráfico últimos 12 meses',
                    content: 'Aqui você visualiza a evolução dos últimos 12 meses referente a quantidade de notas fiscais, valor faturado e ticket médio.',
                    placement: 'top',
                    backdrop: true
                },
                {
                    element: '#labelColeta',
                    title: 'Informações da última coleta',
                    content: 'Neste ponto informamos se existe uma nova coleta dos valores acontecendo no servidor e em qual data e hora aconteceu a coleta dos valores apresentados.',
                    placement: 'bottom',
                    backdrop: true
                },
                {
                    element: '#inputCompetencia',
                    title: 'Filtro de competência',
                    content: 'Sempre sugerimos a competência atual, sinta-se a vontade para mudá-la se necessário.',
                    placement: 'bottom',
                    backdrop: true
                },
                {
                    element: '#btnColetar',
                    title: 'Nova coleta de valores',
                    content: 'As informações apresentadas são geradas a cada uma hora no servidor, clique aqui se ocorreu alguma movimentação nos valores e você precisa da informação atualizada agora.',
                    placement: 'bottom',
                    backdrop: true
                }
            ];

            if ($("#PERMITEVISUALIZARDASHBOARD").val() == "True")
            {
            Benner.Page.addWebTourSteps(steps);
            Benner.Page.initWebTour(false);
            }
        });

    </script>
</asp:Content>
