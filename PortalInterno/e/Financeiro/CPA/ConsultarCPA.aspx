<%@ Page Title="Consultar contas a pagar" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Financeiro.ConsultarCPA, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="TITULOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CONTAS_PAGAR_CONSULTAR.GRID"
            Title="Contas a pagar >> Pesquisar contas a pagar"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="True"
            DefaultFilterName=""       
            UserDefinedCriteriaWhereClause=""         
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="1"
            FormUrl="~/PortalInterno/e/Financeiro/CPA/VisualizarCPA.aspx"
                />
    </div>
</asp:Content>
