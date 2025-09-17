<%@ Page Title="Distribuição dos centros de custo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DISTRIBUIODOSCENTROSDECUSTO" Title="Distribuição dos centros de custo" Subtitle="Selecione um centro de custo para visualizar e alterar informações." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOSCC.COTACOESCOMPRA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_DISTRIBUICAOCENTROSCUSTO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="DETALHESDOCENTRODECUSTO" Title="Detalhes do centro de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DISTRIBUIODOSCENTROSDECUSTO" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOSCC.COTACOESCOMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_DISTRIBUICAOCENTROSCUSTO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    