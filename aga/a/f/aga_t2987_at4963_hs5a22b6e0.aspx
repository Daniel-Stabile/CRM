<%@ Page Title="Instruções bancárias - Todas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Instruções bancárias - Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_IE_INSTRUCOESBANCO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="IE_CARGA_INSTRUCOESBANCO__TODAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_4959" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_IE_INSTRUCAOBANCOANEXOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INSTRUCAOBANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2989_at4959_hs99cbcef8.aspx" UserDefinedDisableRowSelection="False" PageId="IE_CARGA_INSTRUCOESBANCO__TODAS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_4960" Title="Históricos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_IE_HISTORICOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INSTRUCAOBANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2945_at4960_hs78ba6973.aspx" UserDefinedDisableRowSelection="False" PageId="IE_CARGA_INSTRUCOESBANCO__TODAS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    