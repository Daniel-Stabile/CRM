<%@ Page Title="Composição dos valores faturados" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.dashboard.ValoresFaturados,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="DASHBOARD" Title="Dashboard" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_DWDASHBOARDCOMERCIAL.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_DASHBOARD_VALORESFATURADOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="VALORES" Title="Valores" Subtitle="faturados" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DASHBOARD" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="DASHBOARD_COMERCIAL_VALORESFATURADOS.DATASOURCE.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DASHBOARD = @CAMPO(HANDLE) AND A.TIPO = 1" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_DASHBOARD_VALORESFATURADOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    