<%@ Page Title="Industrializado" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.OrdemIndustrializado.OrdemIndustrializadoformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INDUSTRIALIZADO" Title="Industrializado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMINDUSTRIALIZADOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORDEMINDUSTRIALIZADO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INSUMOS" Title="Insumos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="INDUSTRIALIZADO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMINDUSTRIALIZADOITENS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMINDUSTRIALIZADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrdemIndustrializadoInsumo/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMINDUSTRIALIZADO_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    