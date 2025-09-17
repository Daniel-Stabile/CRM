<%@ Page Title="Pedidos de empenho/Empenhos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.Documentos.Empenhos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PEDIDOSDEEMPENHOEMPENHO" Title="Pedidos de Empenho/Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOPEDIDOSEMPENHOS.CPACRE.SELECIONAR.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_EMPENHOS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="EMPENHO" Title="Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PEDIDOSDEEMPENHOEMPENHO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOPEDIDOSEMPENHOS.CPACRE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_EMPENHOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    