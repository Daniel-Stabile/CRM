<%@ Page Title="Requisições" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Aquisicoes.Requisicoes.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FILTRO->REQUISICOES_GRID", "FILTRO", "REQUISICOES_GRID");
            AddWebPartStaticConnection("REQUISICOES_GRID->REQUISICAOITENS_GRID", "REQUISICOES_GRID", "REQUISICAOITENS_GRID");
        }
        
    </script>

    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_REQAQUISICOES_FILTRO.FORM"
            Title="Filtro"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>

    <div class="row">        
        <erp:ErpSimpleGrid runat="server"
            ID="REQUISICOES_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_REQAQUISICOESPAI.GRID"
            Title="Requisições"
            UserDefinedCriteriaWhereClause="@WHERECLAUSE"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="5"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
            PageWidgetHandle="2" />
    </div>


    <div class="row">
        
        <wes:SimpleGrid runat="server"
            ID="REQUISICAOITENS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_REQAQUISICOESITENS.GRID"
            UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="True"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Itens da requisição"
            ChromeState="Normal"
            PageWidgetHandle="3" />
    </div>


</asp:Content>
