<%@ Page Title="Informações regularização entregas" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_636271757528659305" Title="Informações regularização &gt;&gt; Previsões de entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_636271759868342460" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="PORTAL_INT_REGULARIZACAO_ENTREGA_SOLICITACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_INT_SOLICITACAO_INFOSREGULARIZACAOENTREGA" Level="20" Order="6"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_636271759868342460" Title="Entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PORTAL_INT_REGULARIZACAO_ENTREGA_SOLICITACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_SOLICITACAO_INFOSREGULARIZACAOENTREGA" Level="20" Order="12"  />
        </div>
    
      </asp:Content>
    