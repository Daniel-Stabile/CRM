<%@ Page Title="Condições gerais" Language="C#"
    AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content runat="server" id="Content" ContentPlaceholderId="Main">
    <div class="row">                  
        
        <wes:AjaxForm runat="server"
            ID="CONDICOES_FORM"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_COTACAO_CONDICAO.FORM"
            IncludeRecordInRecentItems="False"
            CompanyFilterMode="None"
            HideDeveloperCommands="False"                
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            Title="Condições gerais >> serão aplicadas a todos itens se alteradas"
            PageWidgetHandle="4" />
    </div>
</asp:Content>