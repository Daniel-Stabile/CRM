<%@ Page Title="Documento padrão" Language="C#" Inherits="aga.e.Contabil.lancamentos.DocumentoPadrao" %>
   
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
                <wes:AjaxForm runat="server" ID="DOCUMENTO" Title="Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_DOCUMENTOS.WIZARD.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22559" Level="20" Order="10" />
            </div>
        </div>
    </div>
    <wiz:WizardCommands runat="server" ID="WizardCommands" />
    <aga:AGAResource runat="server" src="~/content/aga/js/wizard.js" />
</asp:Content>
    