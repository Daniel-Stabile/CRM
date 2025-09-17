<%@ Page Title="Centro de custo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.Contabil.lancamentos.CC" MasterPageFile="~/Default20.master" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web.Wizards" TagPrefix="wiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <aga:AGAResource runat="server" Src="~/content/aga/css/wizard.css" />
    <wiz:WizardStateLoader runat="server" ID="WizardLoader" />
    <wiz:WizardProgressControl runat="server" ID="WizardSteps" FontIconStyle="True" Layout="Thin" />
    <wiz:WizardMessagePanel runat="server" ID="MessagePanel" />
    <wiz:WizardCommands runat="server" ID="WizardCommands"/>

    <div class="portlet light">
        <div class="portlet-body">
            <div class="row">
                <wes:AjaxForm runat="server" ID="CENTRODECUSTO" Title="Centro de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CENTROSDECUSTOFEITOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.WIZARD.FORM" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22575" Level="20" Order="20"/>
            </div>
            <div class="row">
                <wes:SimpleGrid runat="server" ID="CENTROSDECUSTOFEITOS" Title="Centros de custo a débito feitos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOCC.WIZARD.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22577" Level="20" Order="30" />
            </div>
        </div>
    </div>
    <aga:AGAResource runat="server" Src="~/content/aga/js/wizard.js" />
    <script type="text/javascript">
        var btnVoltar = $('#top-CMD_VOLTAR');
        var btnAvancar = $('#top-CMD_PROXIMO');

        $(function () {
            ExibirAvancarVoltar();
            var Pagina = window.Sys.WebForms.PageRequestManager.getInstance();
            if (!Pagina.get_isInAsyncPostBack()) {
                Pagina.add_endRequest(function () {
                    $('#ctl00_Main_CENTROSDECUSTOFEITOS_MsgUser.alert-info').remove();
                    ExibirAvancarVoltar();                        
                });
            }
        })


        function ExibirAvancarVoltar() {

            var barraForm = $('#ctl00_Main_CENTRODECUSTO_toolbar')
	        var barraGrid = $('#ctl00_Main_CENTROSDECUSTOFEITOS_toolbar');

            btnVoltar.addClass("btn command-action custom-action blue");

            //$('#top-CMD_PROXIMO', barraForm).remove();
            //$('#top-CMD_VOLTAR', barraForm).remove();    
            
            barraGrid.hide();
            if (btnAvancar.length > 0) {
                btnAvancar.addClass("btn command-action custom-action blue");
                btnAvancar.appendTo(barraForm);
                btnVoltar.css('margin-left', '4px');
	        }
            btnVoltar.appendTo(barraForm);
        }

    </script>
</asp:Content>
