<%@ Page Title="Validações - Grupo de regras" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Validações - Grupo de regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_GRUPOREGRAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ATIVO_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6247" Title="Condições para regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_GN_REGRAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'P') AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3486_at6247_hs3fd08d66.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ATIVO_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_6244" Title="Regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_GN_REGRAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO IN ('V','A')) AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3486_at6244_hs49eaa085.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_ATIVO_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="15"  />
        </div>
    
      </asp:Content>
    