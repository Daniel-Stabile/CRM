<%@ Page Title="Início" Language="C#"  CodeFile="~/aga/e/financeiro/Inicio.aspx.cs" Inherits="financeiroInicioPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Src="~/uc/Financeiro/DashBoardConciliacaoBancaria.ascx" TagPrefix="wes" TagName="DashBoardConciliacaoBancaria" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script src="<%= ResolveUrl("~/Content/js/BennerGrid.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/jquery.table2excel.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/RazaoConta.js")%>"></script>
    <script src="<%= ResolveUrl("~/PortalGerais/e/Scripts/erp.js")%>"></script>
    <script src="<%= ResolveUrl("~/PortalGerais/e/Scripts/dashboards.js")%>"></script>
    <aga:AGAResource runat="server" Src="~/Content/aga/js/complete.js" />
    <div class="row">
        <wes:CommandsPanel runat="server" ID="BOTOES" Title="Botões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="WEB_FN_MODULO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" VerticalOrientation="False" PageWidgetHandle="13551" Level="20" Order="1"  />
    </div>
    <div class="" id="dashboardFinanceiroApp">
        <financeiro-dashboard   data-competencia="<%= Competencia.ToString("MM/yyyy") %>" <%= PermiteColetar ? "permite-coletar" : "" %>  />
    </div>
    <script type="text/javascript">

        if ($("#PERMITEVISUALIZARDASHBOARDFINANCEIRO").val() == "True")
        {
        var app = new window.Vue({
            el: '#dashboardFinanceiroApp',
            store: Benner.DashboardFinanceiroStore
        });
        } 

        $(function () {
		
		
			ExibirMenusModuloFinanceiro();

			
            var steps = [
                {
                    element: '#divConciliacaoBancaria',
                    title: 'Valores de Conciliação bancária',
                    content: 'Acompanhar o percentual de contas bancárias conciliadas e identificar quantas contas faltam conciliar e quantas contas estão sem movimentação. Apenas contas bancárias que possuem o parâmetro “Conta para Conciliação Bancária” marcado em seu cadastro fazem parte deste indicador.',
                    placement: 'bottom',
                    backdrop: true
                },
                {
                    element: '#divPgtosXRcbtos',
                    title: 'Valores de Pagamentos X Recebimentos',
                    content: 'Aqui você monitora o valor dos recebimentos em azul escuro e as previsões de recebimento em azul claro, bem como acompanha o valor dos pagamentos em vermelho e as previsões de pagamento em vermelho claro. A diferença entre recebimentos e pagamentos, considerando as previsões, apresenta o saldo do dia. Não faz parte deste indicador o saldo bancário.',
                    placement: 'left',
                    backdrop: true
                },
                {
                    element: '#divAgingCRE',
                    title: 'Aging de contas a receber',
                    content: 'Apresenta uma lista, organizada em ordem cronológica, com o valor dos títulos que a empresa tem para receber. Os valores são separados por vencidos e a vencer e também por período que inicia em 15 dias e aumenta progressivamente.',
                    placement: 'right',
                    backdrop: true
                },
                {
                    element: '#divAgingCPA',
                    title: 'Aging de contas a pagar',
                    content: 'Apresenta uma lista, organizada em ordem cronológica, com o valor dos títulos que a empresa tem para pagar. Os valores são separados por vencidos e a vencer e também por período que inicia em 15 dias e aumenta progressivamente.',
                    placement: 'left',
                    backdrop: true
                },
                {
                    element: '#lblMsgmColeta',
                    title: 'Informações da última coleta',
                    content: 'Neste ponto informamos se existe uma nova coleta dos valores acontecendo no servidor e em qual data e hora aconteceu a coleta dos valores apresentados.',
                    placement: 'bottom',
                    backdrop: true
                },
                {
                    element: '#inptCompetencia',
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

            if ($("#PERMITEVISUALIZARDASHBOARDFINANCEIRO").val() == "True")
            {
                Benner.Page.addWebTourSteps(steps);
                Benner.Page.initWebTour(false);
            }
            else
                $("#sidebar_MENUINDICADORES").hide();
        });
    </script>
</asp:Content>
