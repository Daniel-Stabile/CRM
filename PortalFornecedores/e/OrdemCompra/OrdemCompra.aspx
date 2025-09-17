<%@ Page Title="Ordem de compra" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.OrdemCompra.OrdemCompraPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("OrdemCompra->ITENS_GRID", "RESUMO_VIEW", "ITENS_GRID");
            AddWebPartStaticConnection("OrdemCompra->DOCUMENTOFINANCEIRO", "RESUMO_VIEW", "DOCUMENTOFINANCEIRO");
            AddWebPartStaticConnection("OrdemCompra->RESUMO_COMANDOS", "RESUMO_VIEW", "RESUMO_COMANDOS");
        }

    </script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" ID="ORDEM_TITLE" />
            </div>
            <div class="portlet-body">

                <div class="row">
                    <div class="col-md-4 erp-unbox">
                        <div class="row">

                           <wes:CommandsPanel runat="server" 
                                ID="RESUMO_COMANDOS"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA.FORM"
                                UserDefinedCommandsVisible="true"
                                ShowTitle="false"
                                SystemInstanceName="CORPORATIVO" />
                        </div>

                        <div class="row">

                            <erp:SimpleCardView
                                runat="server"
                                ID="RESUMO_VIEW"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA.FORM"
                                DisplayLabels="True"
                                ColumnCount="1"
                                ShowTitle="false"
                                OnTranslateText="ResumoForm_OnTranslateText" />
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="ITENS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_ORDENSCOMPRA_ITENS.GRID"
                                UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="False"
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
                                ShowTitle="True"
                                Title="Itens >> produtos e serviços que fazem parte da ordem de compra"
                                ChromeState="Normal"
                                PageWidgetHandle="2"
                                FormUrl="~/PortalFornecedores/e/OrdemCompra/Item.aspx" />
                        </div>

                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="DOCUMENTOFINANCEIRO"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_FOR_FINANCEIRO_DOCUMENTOS.GRID"
                                UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT X.DOCUMENTOORIGEM FROM FN_DOCUMENTOS X WHERE X.ABRANGENCIA = 'R' AND X.HANDLE IN (SELECT W.DOCUMENTO FROM CM_ITENS W INNER JOIN CP_ORDENSCOMPRAITENS Z ON Z.ORDEMCOMPRA = @CAMPO(HANDLE) WHERE W.ORDEMCOMPRAITEM = Z.HANDLE) AND X.FILIAL IN @FILIAIS)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="False"
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
                                ShowTitle="True"
                                Title="Documento financeiro"
                                ChromeState="Normal"
                                PageWidgetHandle="2"
                                FormUrl="~/PortalFornecedores/e/Financeiro/Documento.aspx" />
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
