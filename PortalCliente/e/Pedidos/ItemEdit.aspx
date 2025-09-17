<%@ Page Title="Alterar item" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <div class="row">        
        <wes:AjaxForm runat="server"
            ID="FormItem"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_PEDIDOITEM.EDIT.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            Title="Item >>"
            ChromeState="Normal"
            PageWidgetHandle="1" />
     </div>
</asp:Content>


