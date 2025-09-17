<%@ Page Title="Aprovação de contas a pagar" Language="C#" Inherits="PortalInterno.Financeiro.PortalInternoTesourariaAprovarCPAPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/assets/global/scripts/datatable.js")%>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/assets/global/plugins/datatables/media/js/jquery.dataTables.min.js")%>"></script>
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js")%>"></script>

    <link href="<%=ResolveUrl("~/Content/assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.css")%>" rel="stylesheet" type="text/css" />

    <style>
        .invisivel {
            visibility: hidden;
        }

        .nao-mostrar {
            display: none;
        }

        .informacoes-documento {
            padding-top: 10px;
        }

        .btn-acao {
            width: 125px;
        }

        .alert {
            margin-bottom: 0;
        }

        td.tabela-detalhes {
            padding: 0 !important;
        }

        table.tabela-detalhes {
            table-layout: fixed;
            padding-left: 0 !important;
            padding-right: 0 !important;
        }

        .alert {
            margin-bottom: 10px;
        }

        .botao-modal-recusa {
            margin-bottom: 0;
        }

        .primeira-coluna-orcamento {
            min-width: 220px;
        }

        .primeira-coluna-orcamento-cc {
            padding-left: 0;
            width: 220px;
        }

        .padding-orcamento-cc {
            box-sizing: border-box !important;
            width: 22px;
        }

        .valor-negativo {
            color: red;
        }

        #btnLimparMotivoRecusa {
            margin: 5px 0 5px 0;
        }

        #EspacoGridListagem {
            overflow-x: auto;
            cursor: default;
        }

        #TabelaOrcamento {
            table-layout: fixed;
            width: auto !important;
        }

        thead > tr + tr > th {
            border-top: 0 !important;
        }

        .cabecalho-agrupador {
            text-align: center;
            border-top: 1px dashed #DDD !important;
            border-left: 1px dashed #DDD !important;
            border-right: 1px dashed #DDD !important;
        }

        .valor-orcamento {
            min-width: 112px;
        }

        #TabelaOrcamento table tbody tr:first-child td {
            border-top: 0;
        }

        badge.badge-simple-mini.badge-roundless {
            height: 14px;
        }      

        td {
            overflow-wrap: break-word !important;
        }
    </style>
    <div id="DivDebug" runat="server">
        <asp:UpdatePanel ID="UPDebug" runat="server">
            <ContentTemplate>
                <div id="DivDebugInner" runat="server"></div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" class="caption-subject font-green-sharp bold uppercase">Aprovação</span>
                <span runat="server" class="caption-helper">contas a pagar<asp:Label runat="server" ID="LabelTipoSaldo"></asp:Label></span>
            </div>
        </div>
        <div class="portlet-body">
            <div id="EspacoAlertas"></div>
            <a id="BotaoAprovar" class="btn btn-acao cmd-action green-jungle" onclick="pedirConfirmacaoAprovacao();"><i class="fa fa-thumbs-up"></i>&nbsp;Aprovar</a>
            <a id="BotaoRecusar" class="btn btn-acao cmd-action red-intense" href="#modal-recusa" data-toggle="modal"><i class="fa fa-thumbs-down"></i>&nbsp;Recusar</a>
            <div class="row">
                <div id="EspacoConfirmacaoAprovacao" class="nao-mostrar col-md-6">
                    <wesWidget:RequestConfirmationControl ID="ControleConfirmacao" runat="server" Visible="true"></wesWidget:RequestConfirmationControl>
                </div>
            </div>
            <div id="EspacoGridListagem">
                <div class="row">
                        <wesWidget:SimpleGrid runat="server" ID="GridListagem" Title="Contas a pagar a aprovar" UserDefinedDisableRowSelection="False" FormUrl="" UserDefinedCriteriaWhereClause="" UserDefinedDataSourceParameters="" DisplayRowCommand="False" SystemFilterOnly="False" UserDefinedPageSize="10" DefaultFilterName="Pesquisar" Mode="Fixed" UserDefinedSelectColumnVisible="True" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="False" ChromeState="Normal" EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_LISTAGEM.GRID" PageWidgetHandle="12" />
                </div>
            </div>

            <div id="modal-recusa" class="modal fade" role="dialog" aria-hidden="true" style="display: none">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title">Recusa de contas a pagar</h4>
                        </div>
                        <div class="modal-body">
                            <div class="form-group">
                                Digite o motivo da recusa:
                                        <textarea id="MotivoRecusa" runat="server" class="form-control text-box" rows="4" style="margin-bottom: 0" />
                                <a id="btnLimparMotivoRecusa" class="btn cmd-action grey-steel botao-modal-recusa pull-right" onclick="limparMotivoRecusa();"><i class="fa fa-eraser"></i>&nbsp;Limpar</a>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="modal-footer">
                            <div class="pull-right">
                                <asp:LinkButton ID="BotaoConfirmarRecusa" OnClientClick="aguardarRecusa()" OnClick="AoClicarBotaoConfirmarRecusa" CssClass="btn btn-acao cmd-action red-intense botao-modal-recusa" runat="server"><i class="fa fa-check"></i>&nbsp;Confirmar</asp:LinkButton>
                                <a class="btn btn-acao cmd-action grey-cascade botao-modal-recusa" data-dismiss="modal"><i class="fa fa-times"></i>&nbsp;Cancelar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <asp:Panel ID="InformacoesDocumento" CssClass="informacoes-documento" runat="server">
            <div class="portlet">
                <div class="portlet-title">
                    <div class="caption">
                        <span runat="server" class="caption-subject font-green-sharp bold uppercase">Detalhes</span>
                        <%--<span runat="server" class="caption-helper">contas a pagar<asp:Label runat="server" ID="Label1"></asp:Label></span>--%>
                    </div>
                </div>
                <div class="portlet-body">
                    <erp:ErpTabControl runat="server" ID="TabControlDocumento" ShowBorder="true" RenderAsPortlet="false">
                        <erp:ErpTab runat="server" ID="TabDocumento" Text="Documento">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="row">
                                            <wesWidget:AjaxForm
                                                runat="server"
                                                ID="FormDocumento"
                                                EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_DOCUMENTO.FORM"
                                                FormMode="View"
                                                ShowTitle="false"/>
                                       </div>
                                </div>
                            </div>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="TabParcelas" Text="Parcelas">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="table-responsive">
                                        <div class="row">
                                                <wesWidget:SimpleGrid runat="server" ID="GridParcelas" Title="Parcelas" UserDefinedDisableRowSelection="True" FormUrl="" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="False" SystemFilterOnly="False" UserDefinedPageSize="10" Mode="None" UserDefinedSelectColumnVisible="False" DefaultFilterName="" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="False" ChromeState="Normal" EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_PARCELAS.GRID" PageWidgetHandle="15" />
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="TabImpostosRetidos" Text="Impostos retidos">
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="table-responsive">
										<wesWidget:SimpleGrid 
                                            runat="server" 
                                            ID="GridImpostosRetidos" 
                                            Title="Impostos" 
                                            Subtitle="" 
                                            PortletCssClass="" 
                                            PortletLayout="Default" 
                                            BootstrapCols="12" 
                                            FontIcon="" 
                                            UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" 
                                            ShowTitle="true" 
                                            ProviderWidgetUniqueId="GridListagem" 
                                            ChromeState="Normal" 
                                            CanDelete="False" 
                                            CanUpdate="False" 
                                            CanInsert="False" 
                                            EntityViewName="FN_DOCUMENTOIMPOSTOS.APROVACAOCPA.GRID" 
                                            Mode="None" 
                                            UserDefinedSelectColumnVisible="False" 
                                            UserDefinedPageSize="10" 
                                            SystemFilterOnly="False" 
                                            DisplayRowCommand="False" 
                                            CompanyFilterMode="OnlyCompany" 
                                            ShowExport="True" 
                                            UserDefinedDisableRowSelection="False" 
                                            PageId="RETENCOES" 
                                            Level="20" 
                                            Order="10" />
                                    </div>
                                </div>
                            </div>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="TabOrcamento" Text="Orçamento">
                            <asp:UpdatePanel ID="UPOrcamento" runat="server">
                                <ContentTemplate>
                                    <div id="Orcamento" runat="server"></div>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="TabAssinaturas" Text="Assinaturas">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <div class="row">
                                                <wesWidget:SimpleGrid runat="server" ID="GridAssinaturas" Title="Assinaturas" UserDefinedDisableRowSelection="True" FormUrl="" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="False" SystemFilterOnly="False" UserDefinedPageSize="10" Mode="None" UserDefinedSelectColumnVisible="False" DefaultFilterName="" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="False" ChromeState="Normal" EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_ASSINATURAS.GRID" PageWidgetHandle="14" />
                                      </div>
                                    </div>
                                </div>
                            </div>
                        </erp:ErpTab>
                        <erp:ErpTab runat="server" ID="TabAnexos" Text="Anexos">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <div class="row">
                                                <wesWidget:SimpleGrid runat="server" ID="GridAnexos" Title="Anexos" UserDefinedDisableRowSelection="True" FormUrl="" UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO = @CAMPO(HANDLE)" UserDefinedDataSourceParameters="" ProviderWidgetUniqueId="GridListagem" CompanyFilterMode="None" DisplayRowCommand="False" SystemFilterOnly="False" UserDefinedPageSize="10" Mode="None" UserDefinedSelectColumnVisible="False" DefaultFilterName="" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="True" ChromeState="Normal" EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_ANEXOS.GRID" />
                                            </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="table-responsive">
                                        <div class="row">
                                            <wesWidget:SimpleGrid runat="server" ID="GridImagens" Title="Anexos" Subtitle="Salvos em Banco de Dados" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GridListagem" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_IMAGENS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAINTERNO_APROVARCPA" Level="20" Order="10"  />
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </erp:ErpTab>
                    </erp:ErpTabControl>
                </div>
            </div>
        </asp:Panel>
    </div>

    <div class="modal-backdrop fade in" style="display: none;"></div>

    <script lang="javascript">
        var isPostBack = <%= Page.IsPostBack ? "true" : "false" %>;
        var idGridListagem = "<%= _idGridListagem %>";
        var idTextoMotivoRecusa = "<%= _idTextoMotivoRecusa %>";
        var backdropRecusaTimeoutID;

        controlarBotoesAcao = function() {
            $(".btn-acao").toggleClass("disabled", $("#" + idGridListagem + " input[type='checkbox']:checked").length == 0);
        }

        aoClicarGridListagem = function(e){
            controlarBotoesAcao();
        }

        aguardarRecusa = function() {
            $('#modal-recusa').modal('dismiss');
            $(".modal-backdrop").toggle(true);

            backdropRecusaTimeoutID = setTimeout(function() {
                limparBackdropRecusa();
            }, 10000);

            return false;
        }

        limparBackdropRecusa = function() {
            clearTimeout(backdropRecusaTimeoutID);
            $(".modal-backdrop").toggle(false);
        }

        pedirConfirmacaoAprovacao = function() {
            $("#EspacoConfirmacaoAprovacao").toggleClass("nao-mostrar", false);
            return false;
        }

        alertarErro = function(mensagem) {
            alert(mensagem);
        }

        limparMotivoRecusa = function() {
            $("#"+idTextoMotivoRecusa).val('');
        }

        carregarGridOrcamento = function() {
            var tabela = $("#TabelaOrcamento");
            var tabelaDados = tabela.DataTable({
                searching: false,
                lengthChange: false,
                info: false,
                paging: false,
                autoWidth: false,
                sort: false
            });

            var colunaDetalhes = tabelaDados.column('.coluna-detalhes');
            colunaDetalhes.visible(false);

            function copiarTabelaDetalhes(tabela, linha) {
                var data = tabela.fnGetData(linha);
                var html = data[colunaDetalhes.index()];
                return html;
            }

            var tabelaDados$ = tabela.dataTable();
            tabela.on('click', ' tbody td .row-details', function () {
                var linha = $(this).parents('tr')[0];
                if (tabelaDados$.fnIsOpen(linha)) {
                    $(this).addClass("row-details-close").removeClass("row-details-open");
                    tabelaDados$.fnClose(linha);
                } else {
                    $(this).addClass("row-details-open").removeClass("row-details-close");
                    tabelaDados$.fnOpen(linha, copiarTabelaDetalhes(tabelaDados$, linha), 'tabela-detalhes');
                }
            });
            tabela.find('tbody td .row-details').trigger('click');
        }

        window.onload = function() {
            controlarBotoesAcao();
            $('#'+idGridListagem).click(aoClicarGridListagem);
        }
    </script>
</asp:Content>
