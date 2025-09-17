<%@ Page Title="Eventos da EFD-Reinf" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="EVENTOSDAEFDREINF" Title="Eventos da EFD-Reinf" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_REINF_TABELA_EVENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_REINF_TABELA_EVENTOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    