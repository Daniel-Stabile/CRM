<%@ Page Title="Valores falta faturar" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.dashboard.ValoresFaltaFaturar,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FALTAFATURAR" Title="Falta faturar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_DWDASHBOARDCOMERCIAL.FALTAFATURAR.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_DASHBOARD_VALORESFALTAFATURAR" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FALTAFATURAR" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="DASHBOARD_COMERCIAL_FALTAFATURAR.DATASOURCE.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DASHBOARD = @CAMPO(HANDLE) AND A.TIPO = 2" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_DASHBOARD_VALORESFALTAFATURAR" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    