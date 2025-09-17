<%@ Page Title="Cotação" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.CotacaoPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
    
    
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("RESUMO_COTACAO->ITENSCOTACAO_GRID2", "RESUMO_COTACAO", "ITENS_GRID");
            AddWebPartStaticConnection("RESUMO_COTACAO->DOCUMENTOSCOTACAO_GRID", "RESUMO_COTACAO", "DOCUMENTOSCOTACAO_GRID");
            AddWebPartStaticConnection("RESUMO_COTACAO->BENEFICIOSCOTACAO_GRID", "RESUMO_COTACAO", "BENEFICIOSCOTACAO_GRID");
            AddWebPartStaticConnection("RESUMO_COTACAO->COMANDOS_RESUMO", "RESUMO_COTACAO", "COMANDOS_RESUMO");
        }
        
</script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .table > tbody > tr.ItemCancelado > td {
            text-decoration: line-through;
        }

        #portlet_COMANDOS_RESUMO {
            padding: 0px 0px 0px;
        }
    </style>

    <div class="erp-unbox">
        <div class="portlet light ">
            <div class="portlet-title">
                <erp:ErpPortletTitleCaption runat="server" ID="COTACAO_TITLE" />
                <div class="tools">
                    <a href="javascript:;" class="collapse"></a>
                </div>
            </div>
            <div class="portlet-body">
                <div class="row">
                    <div class="col-md-5 erp-unbox">
                        <div class="row">
                            
                                <wes:CommandsPanel
                                    runat="server"
                                    ID="COMANDOS_RESUMO"
                                    EntityViewName="PORTAL_FOR_COTACAO_RESUMO.FORM"
                                    UserDefinedCommandsVisible="true"
                                SystemInstanceName="CORPORATIVO"
                                ShowTitle="false" />
                        </div>

                        <div class="row">
                            
                            <wes:AjaxForm
                                    runat="server"
                                    ID="RESUMO_COTACAO"
                                    EntityViewName="PORTAL_FOR_COTACAO_RESUMO.FORM"
                                    DisplayLabels="True"
                                FormMode="View"
                                CanDelete="false"
                                CanUpdate="false"
                                CanInsert="false"
                                UserDefinedCommandsVisible="false"
                                ColumnCount="1"
                                ShowTitle="false" />
                            
                    </div>
                    </div>
                    <div class="col-md-7">
                        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab2" Text="Documentos">
                                <div class="row">
                                        <wes:SimpleGrid runat="server"
                                            ID="DOCUMENTOSCOTACAO_GRID"
                                            SystemInstanceName="CORPORATIVO"
                                            EntityViewName="PORTAL_FOR_COTACAO_DOCUMENTOS.GRID"
                                            UserDefinedCriteriaWhereClause="A.COTACAO = @CAMPO(HANDLE)"
                                            Description="Anexe documentos necessários: desenhos, especificações, contratos, pedidos de venda, etc."
                                            UserDefinedDisableRowSelection="False"
                                            UserDefinedSelectColumnVisible="False"
                                            HideDeveloperCommands="False"
                                            CompanyFilterMode="None"
                                            DisplayRowCommand="True"
                                            SystemFilterOnly="False"
                                            UserDefinedPageSize="3"
                                            Mode="None"
                                            CanInsert="True"
                                            CanUpdate="True"
                                            CanDelete="True"
                                            ShowTitle="False"
                                            ChromeState="Normal"
                                            PageWidgetHandle="3"
                                            FormUrl="~/PortalFornecedores/e/Cotacoes/Documento.aspx" />

                                </div>
                            </erp:ErpTab>

                            <erp:ErpTab runat="server" ID="ErpTab3" Text="Benefícios especiais">
                                <div class="row">
                                        <wes:SimpleGrid runat="server"
                                            ID="BENEFICIOSCOTACAO_GRID"
                                            SystemInstanceName="CORPORATIVO"
                                            EntityViewName="PORTAL_FOR_COTACAO_BENEFICIOS.GRID"
                                            UserDefinedCriteriaWhereClause="A.COTACAO = @CAMPO(HANDLE)"
                                            Description="Informe as benefícios especiais oferecidos se o comprador aceitar todos os itens da cotação."
                                            UserDefinedDisableRowSelection="False"
                                            UserDefinedSelectColumnVisible="False"
                                            HideDeveloperCommands="False"
                                            CompanyFilterMode="None"
                                            DisplayRowCommand="True"
                                            SystemFilterOnly="False"
                                            UserDefinedPageSize="3"
                                            Mode="None"
                                            CanInsert="True"
                                            CanUpdate="True"
                                            CanDelete="True"
                                            ShowTitle="False"
                                            ChromeState="Normal"
                                            PageWidgetHandle="3"
                                            FormUrl="~/PortalFornecedores/e/Cotacoes/Beneficio.aspx" />
                                </div>
                            </erp:ErpTab>
                        </erp:ErpTabControl>
                    </div>
                </div>

            </div>
            <div class="erp-unbox">
                <div class="row">
                    
                        <wes:SimpleGrid runat="server"
                            ID="ITENS_GRID"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_FOR_COTACAORODADAS.CUSTOM.GRID"
                            Description="Rodadas de negociação da cotação."
                            UserDefinedCriteriaWhereClause="A.COTACAO = @CAMPO(HANDLE)"
                            UserDefinedDisableRowSelection="False"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="False"
                            CompanyFilterMode="None"
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="50"
                            Mode="None"
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="True"
                            Title="Itens"
                            ChromeState="Normal"
                            PageWidgetHandle="2"
                            FormUrl="~/PortalFornecedores/e/Cotacoes/CotacaoItem.aspx"/>
                </div>

            </div>

        </div>
    </div>

</asp:Content>