<%@ Page Title="Anexo" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
        
        <wes:AjaxForm runat="server"
            ID="ANEXO_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_QUESTIONARIO_QUESTAO_ANEXO.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            Title="Anexo >> incluir/alterar anexos"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>
</asp:Content>
