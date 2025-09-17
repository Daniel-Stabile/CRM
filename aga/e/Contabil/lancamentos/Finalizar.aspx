<%@ Page Title="Finalizar" Language="C#" Inherits="aga.e.Contabil.lancamentos.Finalizar" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web.Wizards" TagPrefix="wiz" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <aga:AGAResource runat="server" Src="~/content/aga/css/wizard.css" />
    <wiz:WizardStateLoader runat="server" ID="WizardLoader" />
    <wiz:WizardProgressControl runat="server" ID="WizardSteps" FontIconStyle="True" Layout="Thin" />
    <wiz:WizardMessagePanel runat="server" ID="MessagePanel" />

    <div class="portlet light">
        <div class="portlet-body">
            <div class="row">
                <wes:CommandsPanel runat="server" ID="FINALIZAR" Title="Finalizar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" ProviderWidgetUniqueId="" FontIcon="" ShowTitle="false" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.FINALIZARWIZARD.GRID" VerticalOrientation="False" PageWidgetHandle="22578" Level="20" Order="40" />
            </div>
            <div class="row">
                <wes:SimpleGrid runat="server" ID="LANCAMENTOSFEITOS" Title="Lançamentos deste documento" PortletLayout="Default" BootstrapCols="12" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="true" CanInsert="false" CanUpdate="false" CanView="false" EntityViewName="CT_LANCAMENTOSFEITOSWIZARD.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="22967" Level="20" Order="50" />
            </div>
        </div>
    </div>
    <wiz:WizardCommands runat="server" ID="WizardCommands"/>
    <aga:AGAResource runat="server" src="~/content/aga/js/wizard.js" />
</asp:Content>
