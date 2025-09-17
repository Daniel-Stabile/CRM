<%@ Page Title="Documento" Language="C#"
    AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" id="Content" ContentPlaceholderId="Main">
    <div class="row">
        
        <wes:AjaxForm runat="server"
            ID="DOCUMENTOSCOTACAO_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_COTACAO_DOCUMENTO.FORM"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            Title="Documento>>documento anexo a cotação"
            PageWidgetHandle="4" />
    </div>
</asp:Content>