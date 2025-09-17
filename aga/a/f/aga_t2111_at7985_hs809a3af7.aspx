<%@ Page Title="Cláusulas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATO_INC__CLAUSULAS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="PARGRAFOS" Title="Parágrafos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOCLAUSULAS.PARAGRAFOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CLAUSULA = @CAMPO(HANDLE)) AND (A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2111_at3691_hsa4ad6627.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_INC__CLAUSULAS_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    