<%@ Page Title="Cotação" Language="C#" AutoEventWireup="true"
    Inherits="PortalFornecedores.Cotacoes.CotacaoItemPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("WIDGETPAI->RESUMO_COTACAO", "WIDGETPAI", "RESUMO_COTACAO");
            AddWebPartStaticConnection("RESUMO_COTACAO->COMANDOS_CONDICOES", "RESUMO_COTACAO", "COMANDOS_CONDICOES");
            AddWebPartStaticConnection("WIDGETPAI->MOTIVORODADA", "WIDGETPAI", "MOTIVORODADA");
            AddWebPartStaticConnection("WIDGETPAI->ITENS_GRID", "WIDGETPAI", "ITENS_GRID");
            AddWebPartStaticConnection("RESUMO_COTACAO->COMANDOS_RESUMO", "RESUMO_COTACAO", "COMANDOS_RESUMO");
            AddWebPartStaticConnection("RESUMO_COTACAO->VIEW_CONDICOES", "RESUMO_COTACAO", "VIEW_CONDICOES");
        }

        protected void COMANDOS_CONDICOES_DataLoaded(object sender, EventArgs e)
        {
            VIEW_CONDICOES.ForceUpdate();
        }
        </script>

    <style>
        .page-content {
            background: #F1F3FA;
        }

        .table > tbody > tr.ItemCancelado > td {
            text-decoration: line-through;
        }

        #WIDGETMESTRE {
            display: none;
        }

    </style>

    <div id="WIDGETMESTRE">
		    <wes:AjaxForm 
                 ID="WIDGETPAI"
                runat="server"
                FormMode="View"
                BootstrapCols="12"
                UserDefinedCommandsVisible="True"
                UserDefinedCriteriaWhereClause=" A.HANDLE = @CAMPO(HANDLE)" 
                IncludeRecordInRecentItems="False"
                CanInsert="False"
                CanUpdate="False"
                CanDelete="False"
                ShowTitle="False"
                ChromeState="Normal"
                HideDeveloperCommands="true"
                EntityViewName="CP_WEB_COTACAORODADAS.CUSTOM.FORM"
                PageWidgetHandle="110"  />
    </div>

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
                                    EntityViewName="PORTAL_FOR_COTACAO_RESUMO_ITEM.FORM"
                                    UserDefinedCommandsVisible="true"
                                    ShowTitle="false"
                                    SystemInstanceName="CORPORATIVO" />
                                <wes:AjaxForm
                                    runat="server"
                                    ID="RESUMO_COTACAO"
                                    EntityViewName="PORTAL_FOR_COTACAO_RESUMO_RODADA.FORM"
                                    DisplayLabels="True"
                                    ColumnCount="1"
                                    FormMode="View"
                                    CanInsert="False"
                                    CanUpdate="False"
                                    CanDelete="False" 
                                    ShowTitle="false"
                                    UserDefinedCriteriaWhereClause=" A.HANDLE = @CAMPO(COTACAO)"
                                    HideDeveloperCommands="false"
                                    EditButtonClass="green" />
                         </div>
                    </div>
                    <div class="col-md-7">
                        <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                            <erp:ErpTab runat="server" ID="ErpTab1" Text="Condições gerais">
                                <div class="erp-unbox">
                                    <div class="row">
                                            <wes:AjaxForm 
                                            runat="server"
                                            ID="VIEW_CONDICOES" 
                                            FormMode="View"
                                            BootstrapCols="12"
                                            UserDefinedCommandsVisible="True"
                                            IncludeRecordInRecentItems="False"
                                            CanInsert="False"
                                            CanUpdate="False"
                                            CanDelete="False"
                                            ShowTitle="False"
                                            ChromeState="Normal"
                                            HideDeveloperCommands="false"
                                            EntityViewName="PORTAL_FOR_COTACAO_CONDICAO.FORM"
                                            PageWidgetHandle="110"  />	
                                    </div>
                                </div>
                            </erp:ErpTab>
                            <erp:ErpTab runat="server" ID="ErpTab2" Text="Motivo Rodada">
                                <div class="row">
		                                <wes:AjaxForm 
                                            runat="server"
                                            ID="MOTIVORODADA" 
                                            FormMode="ReadOnly"
                                            BootstrapCols="12"
                                            UserDefinedCommandsVisible="True"
                                            IncludeRecordInRecentItems="False"
                                            CanInsert="False"
                                            CanUpdate="False"
                                            CanDelete="False"
                                            ShowTitle="False"
                                            ChromeState="Normal"
                                            HideDeveloperCommands="true"
                                            EntityViewName="PORTAL_FOR_COMANDOS_MOTIVO_RODADA_ANEXO.FORM"
                                            PageWidgetHandle="110"  />
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
                            EntityViewName="PORTAL_FOR_COTACAO_ITENS.GRID"
                            Description="Itens da rodada."
                            UserDefinedCriteriaWhereClause="A.COTACAO = @CAMPO(COTACAO) AND A.RODADA = @CAMPO(HANDLE)"
                            UserDefinedDisableRowSelection="False"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="False"
                            CompanyFilterMode="None"
                            DisplayRowCommand="True"
                            SystemFilterOnly="True"
                            UserDefinedPageSize="50"
                            Mode="Selectable"
                            CanInsert="False"
                            CanUpdate="True"
                            CanDelete="False"
                            ShowTitle="True"
                            Title="Itens participantes da rodada"
                            ChromeState="Normal"
                            PageWidgetHandle="2"
                            FormUrl="~/PortalFornecedores/e/Cotacoes/Item.aspx"
                            OnCommandExecute="ItensSimples_CommandExecute" />
                </div>

            </div>

        </div>
    </div>

</asp:Content>