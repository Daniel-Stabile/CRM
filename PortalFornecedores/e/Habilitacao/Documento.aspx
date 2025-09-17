<%@ Page Title="Documento" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <div class="row">
        
        <wes:AjaxForm runat="server"
            ID="DOCUMENTO_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_HABILITACAO_DOCUMENTO.FORM"
            Title="Documento >> documento/certificado"
            UserDefinedSelectColumnVisible="False"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>
