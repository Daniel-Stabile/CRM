<%@ Page Language="C#" Title="Detalhes do contrato" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script runat="server">
           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("DETALHES_FORM->CLAUSULAS_GRID", "DETALHES_FORM", "CLAUSULAS_GRID");
            AddWebPartStaticConnection("CLAUSULAS_GRID->PARAGRAFOS_GRID", "CLAUSULAS_GRID", "PARAGRAFOS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->PESSOAS_GRID", "DETALHES_FORM", "PESSOAS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->DOCUMENTOS_GRID", "DETALHES_FORM", "DOCUMENTOS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->PREMISSAS_GRID", "DETALHES_FORM", "PREMISSAS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->ANEXOS_GRID", "DETALHES_FORM", "ANEXOS_GRID");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            tabClausulas.SetWidgetTickSource(CLAUSULAS_GRID);
            tabPessoas.SetWidgetTickSource(PESSOAS_GRID);
            tabDocumentos.SetWidgetTickSource(DOCUMENTOS_GRID);
            tabPremissas.SetWidgetTickSource(PREMISSAS_GRID);
            tabAnexos.SetWidgetTickSource(ANEXOS_GRID);
        }     
    </script>

    <erp:ErpTabControl runat="server" ID="tabPages">

        <erp:ErpTab runat="server" ID="tabDetalhes" Text="Detalhes">
            <div class="row">
                <erp:ErpFilterForm runat="server"
                    ID="DETALHES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_DETALHES.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="False"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabClausulas" Text="Cláusulas">


            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="CLAUSULAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_CLAUSULAS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE) AND A.CLAUSULA IS NULL"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Cláusulas"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="PARAGRAFOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_CLAUSULAS.GRID"
                    UserDefinedCriteriaWhereClause="A.CLAUSULA = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="True"
                    Title="Parágrafos"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>

        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabPessoas" Text="Pessoas">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="PESSOAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_PESSOAS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Cláusulas"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabDocumentos" Text="Documentos">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="DOCUMENTOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_DOCUMENTOS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabPremissas" Text="Premissas">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="PREMISSAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_PREMISSAS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tabAnexos" Text="Anexos">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="ANEXOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ANEXOS.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="10"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>

    </erp:ErpTabControl>
</asp:Content>
