<%@ Page Title="K200 - Plano de Contas Consolidado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="K200 - Plano de Contas Consolidado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_REGISTROK200.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ED_CARGA_REGISTRO_K030__ED_REGISTRO_K200_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_8452" Title="K210 - Mapeamento dos Planos de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_ED_REGISTROK210.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGISTROK200 = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5863_at8452_hsd9ff338e.aspx" UserDefinedDisableRowSelection="False" PageId="ED_CARGA_REGISTRO_K030__ED_REGISTRO_K200_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    