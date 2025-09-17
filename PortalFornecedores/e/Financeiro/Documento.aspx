<%@ Page Title="Documento" Language="C#" AutoEventWireup="true"
    Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="col-md-4">
        <div class="row">
            <wes:AjaxForm
                runat="server"
                ID="FORMDOCUMENTO"
                FormMode="View"
                Title="Documento"
                BootstrapCols="12"
                ShowTitle="True"
                EntityViewName="FN_DOCUMENTOS.PORTALFORNECEDORES.FORM"
                ChromeState="Fixed"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                IncludeRecordInRecentItems="True"
                UserDefinedCommandsVisible="True"
                PageWidgetHandle="57522" />
        </div>
    </div>
    <!-- <div class="col-md-4"> -->
    <div class="col-md-8">
        <div class="row">
            <wes:Tile runat="server"
                ID="TILESALDODOCUMENTO"
                PortletCssClass=""
                PortletLayout="none"
                BootstrapCols="6"
                ShowTitle="true"
                ProviderWidgetUniqueId="FORMDOCUMENTO"
                ChromeState="Normal"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_SALDODOCUMENTO.DATASOURCE.GRID"
                CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                CriteriaWhereClauseTotalValue="A.HANDLE = @CAMPO(HANDLE)"
                Prefix="R$"
                Description=""
                TotalValue="VALORNOMINAL"
                ValueFormat="N2"
                Value="SALDO"
                Status="VALORLABEL"
                Color="blue"
                Icon="fa fa-money"
                ValueAggregation="None"
                TileType="Progress"
                PageWidgetHandle="57533"
                Level="20"
                Order="30" />

            <wes:Tile runat="server"
                ID="TILESTATUSDOCUMENTO"
                Title="Status Documento"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="None"
                BootstrapCols="6"
                FontIcon=""
                ShowTitle="true"
                ProviderWidgetUniqueId="FORMDOCUMENTO"
                ChromeState="Normal"
                CanDelete="True"
                CanUpdate="True"
                CanInsert="True"
                EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_STATUSDOCUMENTO.DATASOURCE.GRID"
                CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                Value="STATUS"
                Description="Situação"
                Color="CLASSE"
                Icon="ICONE"
                ValueAggregation="None"
                TileType="Default"
                PageWidgetHandle="57579"
                Level="20"
                Order="30" />
        </div>
        <!-- InicioTabs -->
        <div class="tabbable tabbable-custom erp-border">
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tabPARCELAS" data-toggle="tab" aria-expanded="false">Parcelas</a>
                </li>
                <li class="">
                    <a href="#tabIMPOSTOSRETIDOS" data-toggle="tab" aria-expanded="false">Impostos retidos</a>
                </li>
                <li class="">
                    <a href="#tabITENS" data-toggle="tab" aria-expanded="false">Itens</a>
                </li>
                <li class="">
                    <a href="#tabOCS" data-toggle="tab" aria-expanded="false">Ordens de compras</a>
                </li>				
            </ul>
            <!-- <ul class="nav nav-tabs"> -->
            <div class="tab-content">
                <div class="tab-pane fade active in" id="tabPARCELAS">
                    <div class="row">
                        <wes:ActionView
                            runat="server"
                            ID="GridParcelasBaixa"
                            Title="" 
                            Subtitle="" 
                            PortletCssClass="" 
                            PortletLayout="Default" 
                            BootstrapCols="12" 
                            FontIcon="" 
                            ShowTitle="false" 
                            ProviderWidgetUniqueId="" 
                            ChromeState="Fixed" 
                            Controller="Parcelas"
                            Action="Index"
                            Level="20"
                            Order="10" />
                    </div>
                    <!-- <div class="row"> tabPARCELAS -->
                </div>
                <!-- <div class="tab-pane fade active in" id="tabPARCELAS"> -->
                <div class="tab-pane fade" id="tabIMPOSTOSRETIDOS">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="RETENCOES_GRID"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_FOR_FINANCEIRO_RETENCOES.GRID"
                            UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                            UserDefinedDisableRowSelection="True"
                            UserDefinedCommandsVisible="True"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="False"
                            CompanyFilterMode="None"
                            DisplayRowCommand="False"
                            FilterVisible="False"
                            SystemFilterOnly="True"
                            UserDefinedPageSize="5"
                            Mode="None"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="False"
                            Title="Impostos retidos >> retenções do documento"
                            ChromeState="Normal"
                            PageWidgetHandle="2" />
                    </div>
                    <!-- <div class="row"> tabIMPOSTOSRETIDOS -->
                </div>
                <!-- <div class="tab-pane fade" id="tabIMPOSTOSRETIDOS"> -->
                <div class="tab-pane fade" id="tabITENS">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="GRIDITENS"
                            FormMode="View"
                            Title=""
                            BootstrapCols="12"
                            ShowTitle="False"
                            EntityViewName="CM_ITENS.PORT_FORNECEDORES.CONSULTAFINANCEIRA.GRID"
                            ChromeState="Fixed"
                            CanDelete="False"
                            CanUpdate="False"
                            CanInsert="False"
                            IncludeRecordInRecentItems="True"
                            UserDefinedCommandsVisible="True"
                            UserDefinedCriteriaWhereClause="A.DOCUMENTO IN ( SELECT D2.HANDLE FROM FN_DOCUMENTOS D1 JOIN FN_DOCUMENTOS D2 ON D1.HANDLE = D2.DOCUMENTOORIGEM WHERE D1.HANDLE = @CAMPO(HANDLE) )"
                            PageWidgetHandle="57510" />
                    </div>
                    <!-- <div class="row"> tabITENS -->
                </div>
                <div class="tab-pane fade" id="tabOCS">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="GRIDOC"
                            FormMode="View"
                            Title=""
                            BootstrapCols="12"
                            ShowTitle="False"
                            EntityViewName="PORTAL_FOR_ORDENSCOMPRA.GRID"
                            ChromeState="Fixed"
                            CanDelete="False"
							FormUrl="~/PortalFornecedores/e/OrdemCompra/OrdemCompra.aspx"							
                            CanUpdate="False"
                            CanInsert="False"
                            IncludeRecordInRecentItems="True"
                            UserDefinedCommandsVisible="False"
                            UserDefinedCriteriaWhereClause="EXISTS (SELECT X.HANDLE FROM FN_DOCUMENTOS X WHERE X.HANDLE = (SELECT G.HANDLE FROM FN_DOCUMENTOS G WHERE G.DOCUMENTOORIGEM = @CAMPO(HANDLE) AND ABRANGENCIA = 'R') AND (X.ABRANGENCIA = 'R' AND X.HANDLE IN (SELECT W.DOCUMENTO FROM CM_ITENS W, CP_ORDENSCOMPRAITENS Z WHERE W.ORDEMCOMPRAITEM = Z.HANDLE AND Z.ORDEMCOMPRA = A.HANDLE)) AND (X.FILIAL IN @FILIAIS))"
                            PageWidgetHandle="57510" />
                    </div>
                </div>				
            </div>
            <!-- <div class="tab-content"> -->
        </div>
        <!-- <div class="portlet-body"> -->
    </div>
    <!-- <div class="col-md-8"> -->

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDPARCELAS", "FORMDOCUMENTO", "GRIDPARCELAS");
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDITENS", "FORMDOCUMENTO", "GRIDITENS");
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDITENS", "FORMDOCUMENTO", "GRIDOC");
            AddWebPartStaticConnection("RESUMO_VIEW->RETENCOES_GRID", "FORMDOCUMENTO", "RETENCOES_GRID");
            AddWebPartStaticConnection("GRIDPARCELASGRIDPAGAMENTOS", "GRIDPARCELAS", "GRIDPAGAMENTOS");
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDPARCELASBAIXA", "FORMDOCUMENTO", "GRIDPARCELASBAIXA");
        }

    </script>
</asp:Content>
