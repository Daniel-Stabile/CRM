<%@ Page Title="Performance Geral" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_VT_FILTROUSUARIO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_PERFORMANCE_INICIOGESTOR" Level="50" Order="10"  />
        <wes:ActionView runat="server" ID="K_PERFORMANCEMS" Title="Performance Mês" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_FILTRO" ChromeState="Normal" Controller="CrmPerformance" Action="TilesPerformanceUsuario" PageId="K_PAGES_K_CRM_PERFORMANCE_INICIOGESTOR" Level="50" Order="20"  />
        <wes:ActionView runat="server" ID="K_PERFORMANCEANO" Title="Performance Ano" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_FILTRO" ChromeState="Normal" Controller="CrmPerformance" Action="TilesPerformanceUsuarioAno" PageId="K_PAGES_K_CRM_PERFORMANCE_INICIOGESTOR" Level="50" Order="30"  />
        </div>
    
      </asp:Content>
    