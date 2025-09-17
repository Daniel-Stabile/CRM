<%@ Page Title="Concluir pedido" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.ConcluirPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">        
        <wes:AjaxForm runat="server"
            ID="FormPedido"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_PEDIDOCONCLUIR.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            Title="Conclusão de pedido >>"
            OnCommandExecuted="FormPedido_CommandExecuted" />        
    </div>

</asp:Content>


