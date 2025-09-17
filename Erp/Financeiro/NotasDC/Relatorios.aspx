<%@ Page Title="Relatório Notas Débito/Crédito" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RELATRIOS" Title="Relatórios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="R_RELATORIOS.TEC.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DETALHE IN (SELECT DET.HANDLE
                     FROM R_DETALHES DET
                       JOIN Z_TABELAS TAB
                         ON (TAB.HANDLE = DET.TABELA)
                       WHERE DET.RELATORIO = A.HANDLE
                         AND TAB.NOME = 'FN_LANCAMENTOSNDC')
" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="ERP_FINANCEIRO_NOTASDC_RELATORIOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    