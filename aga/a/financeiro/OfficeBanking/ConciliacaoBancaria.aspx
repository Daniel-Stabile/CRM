<%@ Page Title="Conciliação Bancária" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.ConciliacaoBancaria" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTAS" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_CONTASTESOURARIA.CUSTOM.GRID" DefaultFilterName="Contas com Extrato Bancário" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAINATIVA IS NULL) OR (A.CONTAINATIVA = 'N') AND A.CONTACONCILIACAO = 'S'" FormUrl="~/aga/a/financeiro/ContaTesouraria.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_CONCILIACAOBANCARIA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    