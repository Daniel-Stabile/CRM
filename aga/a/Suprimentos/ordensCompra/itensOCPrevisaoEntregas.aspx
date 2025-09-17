<%@ Page Title="Previsão de entregas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PREVISODEENTREGAS" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PREVISAODEENTREGASGRID" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAENTREGA.PREVISAODEENTREGAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ITENSOCPREVISAOENTREGAS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PREVISAODEENTREGASGRID" Title="Previsaodeentregasgrid" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAENTREGA.PREVISAODEENTREGAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/suprimentos/ordensCompra/itensOCPrevisaoEntregas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ITENSOCPREVISAOENTREGAS" Level="20" Order="20"  />
        </div>
    
        <style>
              #PREVISAODEENTREGASGRID th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    