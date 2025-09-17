<%@ Page Title="EMPENHOS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMPENHOS" class="active"><a data-toggle="tab" href="#tabEMPENHOS">Empenhos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO">Histórico</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MOVIMENTAES"><a data-toggle="tab" href="#tabMOVIMENTAES">Movimentações</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOS"><a data-toggle="tab" href="#tabPEDIDOS">Pedidos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabEMPENHOS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="EMPENHOS" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_EMPENHOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_EMPENHOSCADASTRO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="EMPENHOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_STATUS.HISTORICO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE) AND HANDLETABELAORIGEM = 2150" FormUrl="~/aga/a/orcamento/historicomensagem.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMPENHOSCADASTRO" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabMOVIMENTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="MOVIMENTAES" Title="Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="EMPENHOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_ORCAMENTO_CT_EMPENHOMOVIMENTACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.EMPENHO = @CAMPO(HANDLE)" FormUrl="~/aga/a/orcamento/movimentacoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMPENHOSCADASTRO" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabPEDIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PEDIDOS" Title="Pedidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="EMPENHOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT PEDIDO FROM CT_EMPENHOPEDIDO WHERE EMPENHO =@CAMPO(HANDLE)) " FormUrl="~/aga/a/orcamento/empenhos/PedidosEmpenhos/Formempenho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMPENHOSCADASTRO" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    