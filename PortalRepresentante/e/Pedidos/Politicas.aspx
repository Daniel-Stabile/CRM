<%@ Page Title="Politicas" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.PoliticasPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("THE_GRID", "GridPoliticas", "GridRegras");
    }
</script>


<asp:content runat="server" id="Content1" contentplaceholderid="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridPoliticas"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_POLITICAS.GRID"
            UserDefinedDisableRowSelection="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Politicas comerciais"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>

    <hr />

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="GridRegras"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_POLITICAREGRAS.GRID"
            UserDefinedCriteriaWhereClause="A.POLITICACOMERCIAL = @CAMPO(HANDLE)"
            UserDefinedDisableRowSelection="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Regras"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>


</asp:content>


