<%@ Page Title="Histórico do item" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.HistoricoOrdemCompra" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ITEM" Title="Item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOS.COTACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_HISTORICOCOTACOES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITEM_1" Title="Itens" Subtitle="Selecione um item para visualizar as ordens de compra" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITEM" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAITENS.COTACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FAMILIA = @CAMPO(FAMILIA) AND A.PRODUTO = @CAMPO(PRODUTO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_HISTORICOCOTACOES" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="ORDENSDECOMPRA" Title="Ordens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITEM_1" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRA.COTACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(ORDEMCOMPRA)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_HISTORICOCOTACOES" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    