<%@ Page Title="Itens de OC" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.ordensCompra.ItemOrdemCompra" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ITENSDEOC" Title="Itens de OC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAITENS.ITENSOC.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ITENSOC" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DADOSFINANCEIROS" class="active"><a data-toggle="tab" href="#tabDADOSFINANCEIROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Dados financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TEXTODECOMPRA"><a data-toggle="tab" href="#tabTEXTODECOMPRA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Texto de compra")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDADOSFINANCEIROS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DADOSFINANCEIROS" Title="Dados financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSDEOC" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAITENS.DADOSFINANCEIROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ITENSOC" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTEXTODECOMPRA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="TEXTODECOMPRA" Title="Texto de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSDEOC" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAITENS.TEXTODECOMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_ITENSOC" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    