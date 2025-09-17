<%@ Page Title="Performance" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:ActionView runat="server" ID="K_PERFORMANCEMES" Title="Performance mes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="CrmPerformance" Action="TilesPerformanceUsuario" PageId="K_PAGES_K_CRM_PERFORMANCE_INICIOUSUARIO" Level="50" Order="10"  />
        <wes:ActionView runat="server" ID="K_PERFORMANCEANO" Title="Performance Ano" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="CrmPerformance" Action="TilesPerformanceUsuarioAno" PageId="K_PAGES_K_CRM_PERFORMANCE_INICIOUSUARIO" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    