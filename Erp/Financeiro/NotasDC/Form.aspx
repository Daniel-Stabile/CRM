<%@ Page Title="Lançamentos manuais de NDC" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LANAMENTOMANUALNDC" Title="Lançamento NDC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOSNDC.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPOLANCAMENTO = 5" UserDefinedCommandsVisible="True" PageId="ERP_FINANCEIRO_NOTASDC_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANAMENTOMANUALNDC" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.CUSTOM.LANCAMENTOSNDC.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.LANCAMENTONDC = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_NOTASDC_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    