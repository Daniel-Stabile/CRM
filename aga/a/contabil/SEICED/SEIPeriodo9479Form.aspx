<%@ Page Title="Mensal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="SEICEDMENSAL" Title="SEI-CED - Mensal - Módulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="SEI_PERIODOS_9479_FORM" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="SEI_PERIODOS_MENSAL_COMANDOS.FORM" VerticalOrientation="False" PageId="SEI_PERIODOS_9479_FORM" Level="20" Order="5"  />
        <wes:AjaxForm runat="server" ID="SEI_PERIODOS_9479_FORM" Title="Cadastro do período mensal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="SEI_PERIODOS_PERIODOS_MENSAL.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="SEI_PERIODOS_9479_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    