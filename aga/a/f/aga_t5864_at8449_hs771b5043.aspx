<%@ Page Title="K300 - Saldos das Contas Consolidadas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="K300 - Saldos das Contas Consolidadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_REGISTROK300.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_REGISTRO_K030__ED_REGISTRO_K300_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8453" Title="K310 - Empresas Detentoras das Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_REGISTROK310.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGISTROK300 = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5865_at8453_hsc0e7314c.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_REGISTRO_K030__ED_REGISTRO_K300_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    