<%@ Page Title="Carregar itens para inventário" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.inventario.CarregarItensPorProduto" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Carregar itens para inventário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="PD_FILTROITENSORDEMCONTAGEM.INVENTARIO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_INVENTARIO_CARREGARITENSPORPRODUTO" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="CARREGARITENSPARACONTAGEM" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ALMOXARIFADOVARIACOES.ITENSORDEMCONTAGEM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="1=2" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_INVENTARIO_CARREGARITENSPORPRODUTO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    