<%@ Page Title="Pedidos de empenho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSDEEMPENHO" class="active"><a data-toggle="tab" href="#tabPEDIDOSDEEMPENHO">Pedidos de empenho</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabPEDIDOSDEEMPENHO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PEDIDOSDEEMPENHO" Title="Pedidos de empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_EMPENHOS_PEDIDOSEMPENHOS_FORMEMPENHO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PEDIDOSDEEMPENHO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PEDIDOEMPENHO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMPENHOS_PEDIDOSEMPENHOS_FORMEMPENHO" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    