<%@ Page Title="Lançamentos manuais de NDC" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="NOTASDEDBITOCRDITO" Title="Notas de Débito/Crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOSNDC.CUSTOM.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOLANCAMENTO = 5" FormUrl="~/Erp/Financeiro/NotasDC/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="ERP_FINANCEIRO_NOTASDC_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    