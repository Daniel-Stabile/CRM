<%@ Page Title="Itens da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <style>
        #WidgetMasterRequisicao {
            display: none;
        }
        
        div[data-field=TABTIPO] .radio-inline:nth-of-type(1n+3) {
            display: none !important;
        }
        
    </style>

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="REQUISICAO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_REQUISICAOCADASTRO.FORM"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            UserDefinedCommandsVisible="true"
            CanInsert="true"
            CanUpdate="True"
            CanDelete="true"
            ShowTitle="True"
            Title="Cadastro de itens"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

</asp:Content>
