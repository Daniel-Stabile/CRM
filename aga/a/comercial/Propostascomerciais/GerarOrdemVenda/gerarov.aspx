<%@ Page Title="Gerar ordem de venda" Language="C#" Inherits="aga.a.Comercial.PropostasComerciais.GerarOrdemVenda.GerarOrdemVendagerarovPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="GERARORDEMDEVENDA" Title="Gerar Ordem de Venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_VTGERARORDEMVENDA.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_E_COMERCIAL_PROPOSTASCOMERCIAIS_GERARORDEMVENDA" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENSPROPOSTA" Title="Itens Proposta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_CONTRATOITENS.CUSTOM.SELECIONAR.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_E_COMERCIAL_PROPOSTASCOMERCIAIS_GERARORDEMVENDA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    