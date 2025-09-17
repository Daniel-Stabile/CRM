<%@ Page Title="Agendas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:HtmlPanel runat="server" ID="AGENDAS_1" Title="Agendas" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGgxIGNsYXNzPSJwYWdlLXRpdGxlIj4gQWdlbmRhcyA8L2gxPg0KPHN0eWxlPg0KICAgIC5jb21tYW5kLWFjdGlvbiB7DQogICAgICAgIG1hcmdpbi1ib3R0b206IDE1cHg7DQogICAgfQ0KPC9zdHlsZT4NCg==" PageId="AGA_AGENDA_AGENDAS" Level="20" Order="5"  />
        <wes:ActionView runat="server" ID="AGENDAS" Title="Agendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" Controller="AgaAgendas" Action="Index" PageId="AGA_AGENDA_AGENDAS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    