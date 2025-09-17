<%@ Page Language="C#" Title="Contratos de compra" AutoEventWireup="true"
    Inherits="PortalInterno.Contratos.Compra.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <div class="row">
    
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_CONTRATOS_FILTRO.FORM"
            Title="Filtro"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause="A.TIPO = 1"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    
    </div>

    <div class="row">        
        <erp:ErpSimpleGrid runat="server"
            ID="CONTRATOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTALINTERNO_CONTRATOS_COMPRA.GRID"
            Title="Contratos de compra"
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


    <erp:ErpTabControl runat="server" ID="tabDetalhes">
        <erp:ErpTab runat="server" ID="tabItens" Text="Itens">
            <div class="row">
                <erp:ErpSimpleGrid runat="server"
                    ID="CONTRATOOBJETOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_COMPRAOBJETOS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="true"
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
                    ShowTitle="False"
                    Title="Objetos do contrato"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
                </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabAditivos" Text="Aditivos">
            <div class="row">
                <erp:ErpSimpleGrid runat="server"
                    ID="ADITIVOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ADITIVOS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="true"
                    UserDefinedCommandsVisible="true"
                    UserDefinedSelectColumnVisible="false"
                    HideDeveloperCommands="false"
                    CompanyFilterMode="None"
                    DisplayRowCommand="true"
                    FilterVisible="false"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="false"
                    ShowTitle="false"
                    Title="Aditivos"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabApontamentos" Text="Apontamentos">
            <div class="row">
                <erp:ErpSimpleGrid runat="server"
                    ID="APONTAMENTOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_APONTAMENTOS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="true"
                    UserDefinedCommandsVisible="true"
                    UserDefinedSelectColumnVisible="false"
                    HideDeveloperCommands="false"
                    CompanyFilterMode="None"
                    DisplayRowCommand="true"
                    FilterVisible="false"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="false"
                    ShowTitle="false"
                    Title="Apontamentos"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>

    </erp:ErpTabControl>



</asp:Content>
