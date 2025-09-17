<%@ Page Title="Devoluções cliente/fornecedor" Language="C#" Inherits="aga.a.Financeiro.Compensacoes.DevolucaoManual,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DEVOLUESCLIENTEFORNECEDOR" Title="Devoluções cliente/fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.ADTDEV.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S' OR A.EHFORNECEDOR = 'S'" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="GN_PESSOAS_DEVOLUCOES_CLIENTEFORNECEDOR" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    