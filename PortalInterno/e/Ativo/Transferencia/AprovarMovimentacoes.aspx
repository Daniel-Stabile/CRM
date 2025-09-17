<%@ Page Title="Aprovar requisições de movimentação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APROVAESAPROVARREQUISIESDEMOVIMENTAO" Title="Aprovações &gt;&gt; Aprovar requisições de movimentação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_ATIVO_ITEMMOVIMENTACAOREQUISICOES.APROVACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" FormUrl="~/PortalInterno/e/Ativo/Transferencia/AprovarMovimentacao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_ATIVO_APROVARMOVIMENTACOES" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    