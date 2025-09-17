<%@ Page Title="SPED" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:CommandsPanel runat="server" ID="SPEDCOMANDOS" Title="SPED Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_ED_MODULO.CUSTOM.FORM" VerticalOrientation="False" PageId="MENU_SPED" Level="20" Order="1"  />
        <wes:MenuWidget runat="server" ID="MENU" Title="SPED" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" MenuID="AGA_SPED" PageId="MENU_SPED" Level="20" Order="2"  />
        </div>
    
        <style>
              .modal-full.modal-dialog {
    position: relative; 
    overflow: hidden; 
    width: 68%;
}

              </style>
      </asp:Content>
    