<%@ Page Title="Contatos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" id="Content1" ContentPlaceholderId="Main">
    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FrmCadastroContatoCliente"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="GN_PESSOACONTATOS.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="False"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:Content>


