<%@ Page Title="Pedidos de Empenho" Language="C#" Inherits="aga.a.orcamento.PedidosEmpenhosForm,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMCT_PEDIDOSEMPENHOS" class="active"><a data-toggle="tab" href="#tabFORMCT_PEDIDOSEMPENHOS">Pedidos de Empenho</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabFORMCT_PEDIDOSEMPENHOS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMCT_PEDIDOSEMPENHOS" Title="Pedidos de Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PEDIDOSEMPENHOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORCAMENTO_EMPENHOS_PEDIDOSEMPENHOS_FORM" Level="20" Order="100"  /></div>
      </div>
      <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMCT_PEDIDOSEMPENHOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_ASSINATURAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PEDIDOEMPENHO = @CAMPO(HANDLE)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORCAMENTO_EMPENHOS_PEDIDOSEMPENHOS_FORM" Level="20" Order="110"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    