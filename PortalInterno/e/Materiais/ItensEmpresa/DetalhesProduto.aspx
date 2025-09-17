<%@ Page Title="Itens de Empresa" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Materiais.ItensEmpresa.DetalhesProdutoPage, Benner.Corporativo.Wes.WebApp" %>

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

        #ErpTabImagem {
            visibility: hidden;
        }

        #tabImagem .tab-content {
            border-style: none;
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

            <div class="row">
                <wes:CommandsPanel
                    runat="server"
                    ID="COMANDOS_PRODUTO"
                    EntityViewName="PORTAL_INT_DETALHEPRODUTO.FORM"
                    UserDefinedCommandsVisible="true"
                    HideDeveloperCommands="True"
                    ShowTitle="false"
                    SystemInstanceName="CORPORATIVO" />
            </div>

            <div class="portlet-body">
                <div class="row">
                    <div class="col-lg-8 col-md-8 col-sm-8">
                        <div class="portlet">
                            <erp:ErpTabControl runat="server" ID="ErpTabControl" ShowBorder="true" RenderAsPortlet="false">
                                <erp:ErpTab runat="server" ID="ErpTabProduto" Text="Produto">
                                    <div class="row">
                                        <erp:SimpleCardView
                                            runat="server"
                                            ID="RESUMO_PRODUTO"
                                            EntityViewName="PORTAL_INT_DETALHEPRODUTO.FORM"
                                            DisplayLabels="True"
                                            HideDeveloperCommands="True"
                                            ShowTitle="false"
                                            ColumnCount="1" />
                                    </div>
                                </erp:ErpTab>

                                <erp:ErpTab runat="server" ID="ErpTabVariacoes" Text="Variações">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server"
                                            ID="GRID_VARIACOES"
                                            SystemInstanceName="CORPORATIVO"
                                            EntityViewName="PORTAL_INT_VARIACOES.GRID"
                                            UserDefinedDisableRowSelection="False"
                                            UserDefinedCommandsVisible="True"
                                            UserDefinedSelectColumnVisible="False"
                                            UserDefinedCriteriaWhereClause="A.CODIGOREFERENCIA = @CAMPO(HANDLE) AND CONJUNTOVARIACOES <> '' "
                                            HideDeveloperCommands="True"
                                            CompanyFilterMode="None"
                                            DisplayRowCommand="True"
                                            FilterVisible="False"
                                            SystemFilterOnly="False"
                                            UserDefinedPageSize="5"
                                            Mode="None"
                                            CanInsert="False"
                                            CanUpdate="False"
                                            CanDelete="False"
                                            ShowTitle="False"
                                            ChromeState="Normal"
                                            PageWidgetHandle="1" />
                                    </div>
                                </erp:ErpTab>

                                <erp:ErpTab runat="server" ID="ErpTabUnidades" Text="Unidades">
                                    <div class="row">
                                        <erp:SimpleCardView
                                            runat="server"
                                            ID="RESUMO_PRODUTO_UNIDADE"
                                            EntityViewName="PORTAL_INT_DETALHEPRODUTO_UNIDADE.FORM"
                                            DisplayLabels="True"
                                            HideDeveloperCommands="True"
                                            ShowTitle="false"
                                            ColumnCount="1" />
                                    </div>
                                </erp:ErpTab>
                            </erp:ErpTabControl>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-4 col-hg-4">
                        <erp:ErpTabControl runat="server" ID="ErpTabImagem" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="tabImagem" Text="Imagem">
                                <div class="row">
                                    <wes:AjaxForm
                                        runat="server"
                                        ID="PROTUTOIMAGEM"
                                        EntityViewName="PORTAL_INT_DETALHEPRODUTO_IMAGEM.FORM"
                                        SystemInstanceName="CORPORATIVO"
                                        UserDefinedCommandsVisible="false"
                                        HideDeveloperCommands="True"
                                        ShowTitle="false"
                                        CanDelete="false"
                                        CanInsert="false"
                                        CanUpdate="false" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <erp:ErpTabControl runat="server" ID="ErpTabMovimentacoes" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTabEstoque" Text="Estoques">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="GRID_ALMOXARIFADOS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_ALMOXARIFADOPRODUTOS.GRID"
                                        Title="Estoques >>"
                                        UserDefinedDisableRowSelection="true"
                                        UserDefinedCommandsVisible="false"
                                        UserDefinedSelectColumnVisible="False"
                                        UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE)"
                                        HideDeveloperCommands="True"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="false"
                                        FilterVisible="False"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="5"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="False"
                                        ChromeState="Normal"
                                        PageWidgetHandle="1" />
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTabPreco" Text="Preços de vendas">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="GRID_PRECOVENDAS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_LISTAPRECOPRODUTOS.GRID"
                                        UserDefinedDisableRowSelection="true"
                                        UserDefinedCommandsVisible="false"
                                        UserDefinedSelectColumnVisible="False"
                                        UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(HANDLE)"
                                        HideDeveloperCommands="True"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="false"
                                        FilterVisible="False"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="5"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="false"
                                        ChromeState="Normal"
                                        PageWidgetHandle="1" />
                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTabCompra" Text="Últimas compras">
                                <div class="row">
                                    <wes:SimpleGrid runat="server"
                                        ID="GRID_COMPRAS"
                                        SystemInstanceName="CORPORATIVO"
                                        EntityViewName="PORTAL_INT_COMPRASPRODUTOS.GRID"
                                        UserDefinedDisableRowSelection="True"
                                        UserDefinedCommandsVisible="False"
                                        UserDefinedSelectColumnVisible="False"
                                        UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT ITEM.HANDLE FROM CM_ITENS ITEM, FN_DOCUMENTOS DOC, CP_RECEBIMENTOFISICO REC, CP_RECEBIMENTOFISICOPAI RECPAI WHERE ITEM.DOCUMENTO = DOC.HANDLE AND DOC.STATUS = 2 AND DOC.ABRANGENCIA = 'R' AND ITEM.HANDLERECEBIMENTOFISICO = REC.HANDLE AND REC.RECEBIMENTOFISICOPAI = RECPAI.HANDLE AND RECPAI.TIPO IN (1, 2, 6) AND ITEM.PRODUTO = @CAMPO(HANDLE))"
                                        HideDeveloperCommands="True"
                                        CompanyFilterMode="None"
                                        DisplayRowCommand="False"
                                        FilterVisible="False"
                                        SystemFilterOnly="False"
                                        UserDefinedPageSize="5"
                                        Mode="None"
                                        CanInsert="False"
                                        CanUpdate="False"
                                        CanDelete="False"
                                        ShowTitle="false"
                                        ChromeState="Normal"
                                        PageWidgetHandle="1" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>

                </div>

                <erp:ErpDefaultPortlet runat="server" Title="Gráficos" TitleDescription="Veja os gráficos">

                    <div class="row" runat="server" id="divGraficos">
                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <erp:ErpDashboardChart ID="graficoEstoquesMensal" runat="server" source="" color="white" />
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-3">
                            <erp:ErpDashboardChart ID="graficoEstoquesAnual" runat="server" source="" color="white" />
                        </div>

                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <erp:ErpDashboardChart ID="graficoComparacaoPreco" runat="server" source="" color="white" />
                        </div>
                    </div>

                </erp:ErpDefaultPortlet>

            </div>
        </div>
    </div>


    <script>
        $(document).ready(function () {

            $("#PROTUTOIMAGEM_IMAGEM .col-md-10").addClass("col-md-12 col-sm-12")
                .removeClass("col-md-10")
                .removeClass("col-sm-10");

            $("#PROTUTOIMAGEM_IMAGEM img").css({
                "display": "block",
                "margin-left": "auto",
                "margin-right": "auto"
            });
        });
    </script>
    
</asp:Content>
