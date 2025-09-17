<%@ Page Title="Grupo de relatórios" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Grupo de relatórios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_R_GRUPOSRELATORIOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PRODUCAO__UPSRELATOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_450" Title="Relatórios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" EntityViewName="AGA_R_GRUPORELATORIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="( 
  EXISTS 
  ( 
    SELECT HANDLE FROM R_RELATORIOS 
    WHERE HANDLE = A.RELATORIO 
    AND ACESSORESTRITO = 'N' 
  ) 
  OR 
  EXISTS 
  ( 
    SELECT RELATORIO FROM R_RELATORIOUSUARIOS 
    WHERE RELATORIO = A.RELATORIO 
    AND USUARIO = @USUARIO 
  ) 
) AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t648_at450_hs4084175.aspx" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__UPSRELATOS_FORM" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    