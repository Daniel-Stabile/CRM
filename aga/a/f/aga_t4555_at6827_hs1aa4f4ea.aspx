<%@ Page Title="Planos/Metas de venda - Em execução" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Planos/Metas de venda - Em execução" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_PLANOMETAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_GN_PLANOMETAS_VENDA__PLANOEMEXECUCAO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6841" Title="Parâmetro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_GN_PLANOMETAPARAMETROS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PLANOMETAITEM IS NULL AND (A.PLANOMETAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4557_at6841_hseef29455.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_GN_PLANOMETAS_VENDA__PLANOEMEXECUCAO_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    