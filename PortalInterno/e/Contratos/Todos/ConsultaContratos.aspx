<%@ Page Title="Contratos" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
       
        <wes:SimpleGrid runat="server"
            ID="CONTRATOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONSULTA_CONTRATOS_GENERICO.GRID"
            UserDefinedCriteriaWhereClause=" A.FILIAL IN @FILIAIS AND A.STATUS >= 2"
            Title="Contratos >> listagem"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="False"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            DisplayRowCommand="False"
            DefaultFilterName=""
            SystemFilterOnly="True"
            UserDefinedPageSize="20"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Contratos/Todos/VisualizarContrato.aspx" />
    </div>
</asp:Content>
