<%@ Page Language="C#" Title="Detalhes do item" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <script runat="server">
           
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("DETALHES_FORM->ENTREGAS_GRID", "DETALHES_FORM", "ENTREGAS_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->INSPECOES_GRID", "DETALHES_FORM", "INSPECOES_GRID");
            AddWebPartStaticConnection("DETALHES_FORM->RATEIOS_GRID", "DETALHES_FORM", "RATEIOS_GRID");
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            tabEntregas.SetWidgetTickSource(ENTREGAS_GRID);
            tabInspecoes.SetWidgetTickSource(INSPECOES_GRID);
            tabRateios.SetWidgetTickSource(RATEIOS_GRID);
        }     
    </script>

    <erp:ErpTabControl runat="server" ID="tabPages">

        <erp:ErpTab runat="server" ID="tabDetalhes" Text="Detalhes">
            <div class="row">
                <erp:ErpFilterForm runat="server"
                    ID="DETALHES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ITEM_DETALHES.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="false"
                    CanUpdate="false"
                    CanDelete="False"
                    ShowTitle="false"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>


        <erp:ErpTab runat="server" ID="tabRateios" Text="Rateios">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="RATEIOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ITEM_LANCAMENTOS.GRID"
                    UserDefinedCriteriaWhereClause="A.LANCAMENTOCONTRATOOBJETO = @CAMPO(HANDLE)"
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
                    Title="Entregas"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>


        <erp:ErpTab runat="server" ID="tabEntregas" Text="Previsão entregas">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="ENTREGAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ITEM_ENTREGAS.GRID"
                    UserDefinedCriteriaWhereClause="A.OBJETO = @CAMPO(HANDLE)"
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
                    Title="Entregas"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tabInspecoes" Text="Inspeções adicionais">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="INSPECOES_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_CONTRATOS_ITEM_INSPECOES.GRID"
                    UserDefinedCriteriaWhereClause="A.CONTRATOITEM = @CAMPO(HANDLE)"
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
                    Title="Inspeções"
                    ChromeState="Normal"
                    PageWidgetHandle="3" />
            </div>
        </erp:ErpTab>
    </erp:ErpTabControl>
</asp:Content>
