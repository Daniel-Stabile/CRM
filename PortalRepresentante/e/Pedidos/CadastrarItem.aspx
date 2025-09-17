<%@ Page Title="Detalhes do pedido" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.CadastrarItemPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("PEDIDO->ORDEMVENDA", "PEDIDO", "ORDEMVENDA");

            AddWebPartStaticConnection("PEDIDO->RESUMO_PEDIDO_VIEW", "PEDIDO", "RESUMO_PEDIDO_VIEW");
            AddWebPartStaticConnection("PEDIDO->RESUMO_PEDIDO_CONDICOES", "ORDEMVENDA", "RESUMO_PEDIDO_CONDICOES");
            AddWebPartStaticConnection("PEDIDO->RESUMO_LOCAL_ENTREGA", "ORDEMVENDA", "RESUMO_LOCAL_ENTREGA");

            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->GridItens", "RESUMO_PEDIDO_VIEW", "GridItens");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->GridDocumentos", "RESUMO_PEDIDO_VIEW", "GridDocumentos");

            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->COMANDOS_RESUMO_PEDIDO_VIEW", "RESUMO_PEDIDO_VIEW", "COMANDOS_RESUMO_PEDIDO_VIEW");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->COMANDOS_CONDICOES", "ORDEMVENDA", "COMANDOS_CONDICOES");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->COMANDOS_RESUMO_LOCAL_ENTREGA", "ORDEMVENDA", "COMANDOS_RESUMO_LOCAL_ENTREGA");

            COMANDOS_RESUMO_PEDIDO_VIEW.ConsumeConnection(PEDIDO);
        }

</script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .page-bar {
            background: #fff;
        }

        #WidgetMasterPedido, #WidgetMasterOrdemVenda {
            display: none;
        }
    </style>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="PEDIDO"
            EntityViewName="PORTAL_REP_PEDIDOCAPA.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
                
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false" />
    </div>

    <div class="row">
        <wes:AjaxForm
            runat="server"
            ID="ORDEMVENDA"
            EntityViewName="PORTAL_REP_ORDENSVENDA.FORM"
            SystemInstanceName="CORPORATIVO"
                
            UserDefinedCommandsVisible="false"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false"
            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(ORDEMVENDA)" />
    </div>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption
                    runat="server"
                    ID="PEDIDOVENDA_TITLE" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="portlet">
                            <div class="portlet-body">

                                <div class="row">
                                    <wes:CommandsPanel
                                        runat="server"
                                        ID="COMANDOS_RESUMO_PEDIDO_VIEW"
                                        EntityViewName="PORTAL_REP_PEDIDOCAPA.FORM"
                                        UserDefinedCommandsVisible="True" SystemInstanceName="CORPORATIVO" />
                                </div>

                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_PEDIDO_VIEW"
                                        EntityViewName="PORTAL_REP_PEDIDOCAPA.FORM"
                                        userdefinedcriteriawhereclause="A.HANDLE = @CAMPO(HANDLE)"
                                        DisplayLabels="True"
                                        ColumnCount="1" />
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab1" Text="Condições gerais">
                                <div class="row">
                                    <wes:CommandsPanel
                                        runat="server"
                                        ID="COMANDOS_CONDICOES"
                                        EntityViewName="PORTAL_REP_PEDIDOCONDICOESGERAIS.FORM"
                                        UserDefinedCommandsVisible="true"
                                        SystemInstanceName="CORPORATIVO" />
                                </div>

                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_PEDIDO_CONDICOES"
                                        EntityViewName="PORTAL_REP_PEDIDOCONDICOESGERAIS.FORM"
                                        DisplayLabels="True"
                                        ColumnCount="1"
                                        EditButtonClass="green" />
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab2" Text="Local de entrega">
                                <div class="row">
                                    <wes:CommandsPanel
                                        runat="server"
                                        ID="COMANDOS_RESUMO_LOCAL_ENTREGA"
                                        EntityViewName="PORTAL_REP_PEDIDOLOCALENTREGA.FORM"
                                        UserDefinedCommandsVisible="true"
                                        SystemInstanceName="CORPORATIVO" />
                                </div>

                                <div class="row">
                                    <erp:SimpleCardView
                                        runat="server"
                                        ID="RESUMO_LOCAL_ENTREGA"
                                        EntityViewName="PORTAL_REP_PEDIDOLOCALENTREGA.FORM"
                                        DisplayLabels="True"
                                        ColumnCount="1" />
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab3" Text="Documentos">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="GridDocumentos"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_REP_PEDIDODOCUMENTOS.GRID"
                                        UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(ORDEMVENDA)"
                                        Title="Documentos >>"
                                        UserDefinedDisableRowSelection="False"
                                        UserDefinedCommandsVisible="True"
                                        UserDefinedSelectColumnVisible="False"
                                        HideDeveloperCommands="False"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="True"
                                        FilterVisible="False"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="10"
                                        Mode="None"
                                        CanInsert="True"
                                        CanUpdate="True"
                                        CanDelete="True"
                                        ShowTitle="True"
                                        ChromeState="Normal"
                                        PageWidgetHandle="1"
                                        FormUrl="~/PortalRepresentante/e/Pedidos/DocumentoEdit.aspx" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GridItens"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_PEDIDOITENS.GRID"
                                UserDefinedCriteriaWhereClause="A.PEDIDOVENDA = @CAMPO(HANDLE)"
                                Title="Itens >>"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedLinkVisible="True"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="True"
                                FilterVisible="False"
                                DefaultFilterName="Todos"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="True"
                                CanDelete="True"
                                ShowTitle="True"
                                ChromeState="Normal"
                                PageWidgetHandle="1"
                                OnCommandExecute="GridItens_CommandExecute"
                                FormUrl="~/PortalRepresentante/e/Pedidos/CadastrarItemEntrega.aspx" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
