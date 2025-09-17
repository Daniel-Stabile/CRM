<%@ Page Title="Aprovar requisições de movimentação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REQUISIODEMOVIMENTAO" Title="Requisição de movimentação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_ATIVO_MOVIMENTACAOREQUISICOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="PORTAL_INT_ATIVO_APROVARMOVIMENTACAO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MOVIMENTAES" class="active"><a data-toggle="tab" href="#tabMOVIMENTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Movimentações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabMOVIMENTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MOVIMENTAES" Title="Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIODEMOVIMENTAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_ATIVO_MOVIMENTACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/CadastroMovimentacao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_ATIVO_APROVARMOVIMENTACAO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    