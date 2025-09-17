<%@ Page Title="Histórico" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:content runat="server" id="Content" contentplaceholderid="Main">
    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="AUDITORIA_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_FOR_QUESTIONARIO_HISTORICO.GRID"
            Title="Histórico>>"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            UserDefinedPageSize="10"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>
</asp:content>
