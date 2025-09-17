<%@ Page Title="Incentivos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Incentivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_INCENTIVOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS__INCENTIVOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3889" Title="Período" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_APURACAOINCENTIVOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="(A.INCENTIVO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1832_at3889_hs6e4bbd9b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS__INCENTIVOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    