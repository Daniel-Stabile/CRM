<%@ Page Title="Apontamento - Desmontagens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APONTAMENTO" Title="Desmontagem - Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDENSDESMONTAGEM_APONTAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
    SELECT A2.HANDLE
    FROM PR_ORDENSDESMONTAGEM A2
    JOIN PD_PRODUTOS B2 ON A2.PRODUTO = B2.HANDLE
    JOIN PD_FAMILIASPRODUTOS C2 ON A2.FAMILIA = C2.HANDLE
    JOIN PD_PRODUTOVARIACOESMESTRE D2 ON A2.VARIACAO = D2.HANDLE
    JOIN PD_ALMOXARIFADOS E2 ON A2.ALMOXARIFADOORIGEM = E2.HANDLE
    WHERE A2.STATUS &gt; 1 AND A2.FILIAL = @FILIAL)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDENSDESMONTAGEM_APONTAMENTO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    