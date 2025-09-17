<%@ Page Title="Lançamento de dimensões gerenciais" Language="C#" Inherits="aga.a.Financeiro.Documentos.DimensoesGerenciais" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTAS" Title="CONTAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOS.DIMENSOES_GERENCIAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_DIMENSOES_GERENCIAIS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ESTRUTURAGERENCIAL" Title="ESTRUTURA GERENCIAL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONTAS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTODIMENSOES.DIMENSAO_GERENCIAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(HANDLE) " ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_DIMENSOES_GERENCIAIS" Level="20" Order="20"  />
        <wes:AjaxForm runat="server" ID="NOVOLANCAMENTOESTRUTURA" Title="Novo lancamento estrutura" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ESTRUTURAGERENCIAL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTODIMENSOES.DIMENSAO_GERENCIAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_DOCUMENTOS_DIMENSOES_GERENCIAIS" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    