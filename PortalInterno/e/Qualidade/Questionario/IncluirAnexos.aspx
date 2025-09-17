<%@ Page Title="Incluir Anexos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="ANEXOS_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_QL_RESPOSTAANEXO.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="False"
            CanDelete="True"
            ShowTitle="True"
            Title="Anexos"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>
</asp:Content>
