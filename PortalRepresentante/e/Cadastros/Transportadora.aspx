<%@ Page Title="Transportadora" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_MEUSDADOS_TRANSPORTADORA.FORM"
            Title="Transportadora >> "
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
