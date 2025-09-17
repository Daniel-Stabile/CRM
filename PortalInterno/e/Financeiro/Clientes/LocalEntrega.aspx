<%@ Page Title="Local de entrega" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {

        }        
    </script>

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CLIENTE_LOCALENTREGA.FORM"
            Title="Local de entrega >> "
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            UserDefinedCommandsVisible="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

</asp:Content>
