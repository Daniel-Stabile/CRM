<%@ Page Title="Itens" Language="C#" Inherits="PortalInterno.Suprimentos.Catalogo.SolicitacaoBuscarItens,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="INFORMAES" Title="Informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="PORTAL_INT_ADICIONAR_ITEM_CATALOGO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_SOLICITACAO_BUSCARITENS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="PORTAL_INT_SOLICITACAO_CATALOGO_POR_ITENS.GRID" DefaultFilterName="Pesquisar por" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="15" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_SOLICITACAO_BUSCARITENS" Level="20" Order="20"  />
        <wes:AjaxForm runat="server" ID="CATLOGO" Title="Catálogo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITENS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_VISUALIZAR_CATALOGO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = ( SELECT X.CATALOGOFORNECIMENTO  FROM CP_CATALOGOFORNECIMENTOITENS X WHERE X.HANDLE = @TABELA(CP_CATALOGOFORNECIMENTOITENS))" UserDefinedCommandsVisible="False" PageId="PORTAL_INT_SOLICITACAO_BUSCARITENS" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    