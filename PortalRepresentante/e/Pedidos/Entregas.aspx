<%@ Page Title="Entregas" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:content runat="server" id="Content" contentplaceholderid="Main">

    <style>
        /* Não mostrar "Operação executada" */
        .PagerStyle td.totCell {
            text-align: left;
        }
    </style>

    <div class="row">
        <wes:EditableGrid runat="server"
            ID="ENTREGAS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_PEDIDOITEMENTREGAS.EDIT.GRID"
            Title="Entregas >>"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="True"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>
</asp:content>
