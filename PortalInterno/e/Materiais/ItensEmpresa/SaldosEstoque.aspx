<%@ Page Title="Documento" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Materiais.ItensEmpresa.SaldosEstoquePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }

        #WidgetMasterProduto {
            display: none;
        }
    </style>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="PRODUTO"
            EntityViewName="PORTAL_INT_DETALHEPRODUTO.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
            ShowTitle="false"
            HideDeveloperCommands="True"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
    </div>

    <div class="erp-unbox">
        <div class="portlet light">

            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="PRODUTO_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRID_FILIAIS"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_PRODUTOSALDOSFILIAL.GRID"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedCriteriaWhereClause="A.PRODUTOPAI = @CAMPO(PRODUTOPAI)"
                                HideDeveloperCommands="True"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="false"
                                SystemFilterOnly="false"
                                UserDefinedPageSize="5"
                                Title="Filiais >>"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="true"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRID_VARIACOES"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_PRODUTOSALDOSALMOXARIFADOVARIACOES.GRID"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE) AND EXISTS (SELECT X.HANDLE FROM PD_PRODUTOVARIACOESMESTRE X WHERE X.CODIGOREFERENCIA = @CAMPO(HANDLE) AND X.CONJUNTOVARIACOES IS NOT NULL) "
                                HideDeveloperCommands="True"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="false"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="5"
                                Title="Variações >>"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="true"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRID_ALMOXARIFADOS"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_PRODUTOSALDOSALMOXARIFADOPRODUTOS.GRID"
                                Title="Almoxarifados >>"
                                UserDefinedDisableRowSelection="false"
                                UserDefinedCommandsVisible="true"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE)"
                                HideDeveloperCommands="True"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="false"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="5"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="true"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRID_LOTES"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_PRODUTOSALDOSLOTES.GRID"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE)"
                                HideDeveloperCommands="True"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="false"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="5"
                                Title="Lotes >>"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="true"
                                ChromeState="Normal"
                                PageWidgetHandle="1" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
