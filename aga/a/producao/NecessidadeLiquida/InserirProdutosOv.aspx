<%@ Page Title="Inserir Produtos a Partir da Ordem Venda" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.NecessidadeLiquida.NecessidadeLiquidaInserirProdutosOvPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="NECESSIDADELIQUIDA" Title="Necessidade Liquida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_NECESSIDADELIQUIDA.ADICIONARPRODUTOSVENDAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_INSERIRPRODUTOSOV" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PRODUTOSDASORDENSDEVENDA" Title="Produtos das Ordens de Venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MRP_NECESSIDADES.NECESSIDADELIQUIDA.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_NECESSIDADELIQUIDA_INSERIRPRODUTOSOV" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    