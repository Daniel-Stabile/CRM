<%@ Page Title="Evento de agenda" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.Agenda.EventoAgendaPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMEVENTO" Title="Evento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_AGENDA_EVENTOAGENDA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    