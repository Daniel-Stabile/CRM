<%@ Page Title="Detalhes da ordem de venda" Language="C#" AutoEventWireup="true" 
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">        
        protected override void LoadWebPartConnections()
        {


            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->ORDEMVENDA", "RESUMO_PEDIDO_VIEW", "ORDEMVENDA");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->RESUMO_COMANDOS", "RESUMO_PEDIDO_VIEW", "RESUMO_COMANDOS");

            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->TAB_FINANCEIRO", "RESUMO_PEDIDO_VIEW", "TAB_FINANCEIRO");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->TAB_RECEBIMENTOS", "RESUMO_PEDIDO_VIEW", "TAB_RECEBIMENTOS");
            AddWebPartStaticConnection("RESUMO_PEDIDO_VIEW->ORDEM_VENDA_ITENS", "RESUMO_PEDIDO_VIEW", "ORDEM_VENDA_ITENS");
            AddWebPartStaticConnection("ORDEM_VENDA_ITENS->ORDEM_VENDA_ITENS_ENTREGAS", "ORDEM_VENDA_ITENS", "ORDEM_VENDA_ITENS_ENTREGAS");
        }

        //
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            var entidade = RESUMO_PEDIDO_VIEW.GetEntity();

            ORDENSVENDA_TITLE.Title = entidade["NUMEROOV"].GetString() + " - R$ " + entidade["VALORLIQUIDO"].GetString() + " - " + entidade["PESSOA"].GetString();

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
            ID="ORDEMVENDA"
            EntityViewName="PORTAL_CLI_ORDENSVENDA.FORM"
            SystemInstanceName="CORPORATIVO"
            UserDefinedCommandsVisible="false"
            CanDelete="false"
            CanInsert="false"
            CanUpdate="false"
            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" />
    </div>


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
                        <div class="row">
                            <wes:CommandsPanel runat="server" 
                                ID="RESUMO_COMANDOS" 
                                EntityViewName="PORTAL_INT_ORDENS_VENDA_GERAL.FORM"
                                UserDefinedCommandsVisible="true"                          
                                SystemInstanceName="CORPORATIVO" />
                        </div>

                        <div class="row">
                            <erp:SimpleCardView
                                runat="server"
                                ID="RESUMO_PEDIDO_VIEW"
                                EntityViewName="PORTAL_INT_ORDENS_VENDA_GERAL.FORM"                                   
                                DisplayLabels="True"
                                ColumnCount="1" />
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab1" Text="Financeiro">
                                <div class="erp-unbox">
                                    <div class="row">
                                        <erp:SimpleCardView ID="TAB_FINANCEIRO" runat="server"
                                            EntityViewName="PORTAL_INT_ORDENS_VENDA_FINANCEIRO.FORM"
                                            DisplayLabels="True"
                                            EditButtonClass="green" />
                                    </div>
                                </div>
                            </erp:ErpTab>
                            <erp:ErpTab runat="server" ID="ErpTab2" Text="Recebimentos">
                                <div class="erp-unbox">
                                    <div class="row">
                                        <wes:SimpleGrid ID="TAB_RECEBIMENTOS" runat="server"
                                            EntityViewName="PORTAL_INT_ORDENS_VENDA.RECEBIMENTOS.GRID"
                                            UserDefinedCriteriaWhereClause="A.ORDEMVENDA = @CAMPO(HANDLE)"
                                            SystemInstanceName="CORPORATIVO"
                                            UserDefinedCommandsVisible="False"
                                            DisplayRowCommand="False"
                                            CanInsert="False"
                                            CanUpdate="False"
                                            CanDelete="False"                                            
                                            HideDeveloperCommands ="True"/>
                                    </div>
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>   
                    </div>                                          
                </div>
                    <div class="row">
                        <div class="col-lg-6 col-md-6 col-sm-6"">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="ORDEM_VENDA_ITENS"
                                    SystemInstanceName="CORPORATIVO"
                                    EntityViewName="PORTAL_INT_ORDENS_VENDA_ITENS.GRID"
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
                                    PageWidgetHandle="3" />
                            </div>
                        </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="ORDEM_VENDA_ITENS_ENTREGAS"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_INT_ORDENS_VENDA_ENTREGAS.GRID"
                                Title="Entregas >>"
                                UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
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
                                PageWidgetHandle="2" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
