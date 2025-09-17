<%@ Page Title="Manutenção Frotas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MENU" class="active"><a data-toggle="tab" href="#tabMENU">Manutenção Frotas</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabMENU">
                    <div class="row">
    <wes:MenuWidget runat="server" ID="MENU" Title="Manutenção Frotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" MenuID="AGA_MANUTENCAO_FROTAS" PageId="MENU_MANUTENCAO_FROTAS" Level="20" Order="2"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    