<%@ Page Title="Adicionar Transferências Remessa" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.AdicionarTransferenciasRemessa" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="TRANSFERNCIAS" Title="TRANSFERÊNCIAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TS_LANCAMENTOS.SELECIONARTRANSFERENCIAS.GRID" DefaultFilterName="Filtro Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="CONCILIADO = 'N' AND
CANCELADO = 'N' AND REMESSA IS NULL AND
OPERACAO IN (SELECT HANDLE FROM GN_OPERACOES WHERE CODIGOINTERNO = 9)
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_ADICIONARTRANSFERENCIASREMESSA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    