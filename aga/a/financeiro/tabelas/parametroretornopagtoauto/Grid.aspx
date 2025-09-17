<%@ Page Title="Parâmetros retorno pagamento automatizado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDPARAMETROSRETORNOPAGAMENTOAUTOMATIZADO" Title="Parâmetros retorno pagamento automatizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_HBRETORNOREGRAS.PAGTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO='P'" FormUrl="~/aga/a/financeiro/tabelas/parametroretornopagtoauto/Form.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_TABELAS_PARAMETRORETORNOPAGTOAUTO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    