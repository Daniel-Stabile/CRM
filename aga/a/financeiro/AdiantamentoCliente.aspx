<%@ Page Title="Adiantamento de cliente" Language="C#" Inherits="aga.a.Financeiro.Compensacoes.AdiantamentoManual" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ADIANTAMENTODECLIENTES" Title="Adiantamento de clientes" Subtitle="Contas a receber" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.ADIANTAMENTOSPESQUISA.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PESSOA FROM FN_DOCUMENTOS WHERE FILIAL IN @FILIAIS)
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ADIANTAMENTOCLIENTE" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    