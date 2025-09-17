<%@ Page Title="Alterar transportadora" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.TransportadoraEditPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FormItem"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_PEDIDOTRANSPORTADORA.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            Title="Transportadora >>"
            OnCommandExecute="FormItem_CommandExecute" />
    </div>

</asp:Content>
