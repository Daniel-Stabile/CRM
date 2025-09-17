<%@ Page Title="Agendamento" Language="C#" Inherits="aga.a.genericos.AgendamentosPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMAGENDAMENTO" Title="Agendamento" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="fa fa-clock-o" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_GN_AGENDAMENTOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="WEB_GN_AGENDAMENTOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    