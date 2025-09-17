<%@ Page Title="Visões" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Visões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_W_VISOES.FORM" CanDelete="True" CanUpdate="True" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ARCHITECT__VISOES_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3585" Title="Relatórios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_VISAORELATORIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VISAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2473_at3585_hsf69d00c.aspx" UserDefinedDisableRowSelection="False" PageId="ARCHITECT__VISOES_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_3584" Title="Visões substitutas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_W_VISOESSUBSTITUTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VISAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2432_at3584_hs64275d9c.aspx" UserDefinedDisableRowSelection="False" PageId="ARCHITECT__VISOES_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    