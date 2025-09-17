<%@ Page Title="Detalhes do pedido" Language="C#" AutoEventWireup="true"
    Inherits="PortalCliente.Pedidos.ConsultarDetalhesPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->PedidoItens", "RESUMO_PEDIDO_VIEW", "PedidoItens");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->CondicaoRecebimento", "RESUMO_PEDIDO_VIEW", "CondicaoRecebimento");
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
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="ORDENSVENDA_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="portlet">
                            <div class="portlet-body">
                                <div class="row">                                    
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_PEDIDO_VIEW"
                                        EntityViewName="PORTAL_CLI_ORDENSVENDA.FORM"
                                        UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                        DisplayLabels="True"
                                        ColumnCount="1" />
                                 </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">                            
                            <wes:SimpleGrid runat="server"
                                ID="CondicaoRecebimento"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_CONDICOES.GRID"
                                Title="Condições de Recebimento >> "
                                UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="3" />                            
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
                            
                            <wes:SimpleGrid runat="server"
                                ID="PedidoItens"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_CLI_PEDIDOITEM.GRID"
                                Title="Itens >>"
                                UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                SystemFilterOnly="False"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="2"
                                FormUrl="~/PortalCliente/e/Pedidos/ConsultarDetalhesItem.aspx" />
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
