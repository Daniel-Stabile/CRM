<%@ Page Title="Liberar/suspender parcelas" Language="C#" Inherits="PortalInterno.Financeiro.PortalInternoFinanceiroLiberarSuspenderParcelasPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <style>
        .seletor-filtro {
            max-width: 130px;
            display: inline;
        }

        .filtro-pesquisar-por {
            padding-bottom: 10px;
            padding-top: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
        }

        .cmd-action {
            margin-top: 5px;
            margin-left: 10px;
            margin-bottom: 0px;
        }

        div.select2-container.form-control {
            display: inline-block !important;
        }

        .modal-body {
            padding-bottom: 5px;
        }

        table td {
            white-space: nowrap;
        }

        #div-liberar-pagamentos tbody tr:nth-child(2n) {
            background-color: rgba(38, 166, 154, 0.10);
        }

        #div-suspender-pagamentos tbody tr:nth-child(2n) {
            background-color: rgba(227, 91, 90, 0.10);
        }

        .multi-select-column {
            width: 32px;
        }

        #modal-suspensao .form-body.form-horizontal {
            padding-right: 0px;
        }

        .filter-search-form {
            padding-bottom: 1px !important;
            margin-bottom: 10px;
        }
    </style>

    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" class="caption-subject font-green-sharp bold uppercase">Parcelas</span>
                <span runat="server" class="caption-helper">liberação e suspensão<asp:Label runat="server" ID="LabelTipoSaldo"></asp:Label></span>
            </div>
        </div>
        <div class="portlet-body">
            <div id="alerta-erros"></div>
            <asp:UpdatePanel runat="server" ID="UPFiltro">
                <ContentTemplate>
                    <div class="form-group filter-search-form note note-info note-bordered">
                        <div class="form-group filtro-topo">
                            Filtro:
                <asp:DropDownList
                    ID="SeletorFiltro"
                    CssClass="form-control seletor-filtro"
                    runat="server"
                    EnableViewState="true"
                    AutoPostBack="true">

                    <asp:ListItem Text="Nenhum" Value="nenhum" />
                    <asp:ListItem Text="Vence hoje" Value="vence-hoje" />
                    <asp:ListItem Text="Vence amanhã" Value="vence-amanha" />
                    <asp:ListItem Text="Pesquisar por" Value="pesquisar-por" />
                </asp:DropDownList>
                        </div>

                        <div id="EspacoFiltroAdicional" runat="server" class="filtro-pesquisar-por">
                            <wesWidget:AjaxForm
                                runat="server"
                                ID="FiltroAdicional"
                                Title="Filtro"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                IncludeRecordInRecentItems="False"
                                CanInsert="True"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                EntityViewName="PORTAL_INT_FIN_LIBERARSUSPENDERPARCELAS_FILTRO.FORM"
                                PageWidgetHandle="101" />
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <erp:ErpTabControl runat="server" ID="TabControlDocumento" ShowBorder="true" RenderAsPortlet="false">
                <erp:ErpTab runat="server" ID="TabLiberarPagamentos" Text="Liberar pagamentos">
                    <div id="div-liberar-pagamentos">
                        <wesWidget:SimpleGrid
                            runat="server"
                            ID="GridListagemLiberar"
                            Title="Listagem de liberar/suspender parcelas"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            CompanyFilterMode="CompanyAndBranch"
                            DisplayRowCommand="True"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="20"
                            Mode="None"
                            UserDefinedSelectColumnVisible="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="True"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_FIN_LIBERARPARCELAS_LISTAGEM.GRID"
                            PageWidgetHandle="100" />
                    </div>
                </erp:ErpTab>
                <erp:ErpTab runat="server" ID="TabSuspenderPagamentos" Text="Suspender pagamentos">
                    <div id="div-suspender-pagamentos">
                        <a class="btn btn-acao cmd-action red-intense" href="#modal-suspensao" data-toggle="modal">
                            <i class="fa fa-lock btn-action"></i>Suspender parcelas</a>
                        <wesWidget:SimpleGrid
                            runat="server"
                            ID="GridListagemSuspender"
                            Title="Listagem de liberar/suspender parcelas"
                            BootstrapCols="12"
                            UserDefinedDisableRowSelection="True"
                            FormUrl=""
                            CompanyFilterMode="CompanyAndBranch"
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedCommandsVisible="False"
                            UserDefinedPageSize="20"
                            Mode="None"
                            UserDefinedSelectColumnVisible="True"
                            DefaultFilterName=""
                            CanInsert="False"
                            CanUpdate="False"
                            CanDelete="False"
                            ShowTitle="True"
                            ChromeState="Normal"
                            EntityViewName="PORTAL_INT_FIN_SUSPENDERPARCELAS_LISTAGEM.GRID" />
                    </div>
                </erp:ErpTab>
            </erp:ErpTabControl>
        </div>
    </div>
    <div id="modal-suspensao" class="modal fade" role="dialog" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="portlet light">
                    <div class="portlet-title">
                        <div class="caption">
                            <span runat="server" class="caption-subject font-green-sharp bold uppercase">Suspensão</span>
                        </div>
                    </div>
                    <div class="portlet-body">
                        <div class="modal-body">
                            <div id="alerta-erros-suspensao"></div>
                            <wesWidget:AjaxForm
                                runat="server"
                                ID="DadosSuspensao"
                                Title="Filtro"
                                BootstrapCols="12"
                                UserDefinedCommandsVisible="True"
                                IncludeRecordInRecentItems="False"
                                CanInsert="True"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                ChromeState="Normal"
                                EntityViewName="PORTAL_INT_FIN_SUSPENDERPARCELAS_DADOSSUSPENSAO.FORM"
                                PageWidgetHandle="101" />
                            <div class="form-body form-horizontal" style="overflow: auto;">
                                <div class="pull-right">
                                    <a id="btnLimparMotivoRecusa" class="btn grey-steel botao-modal-recusa pull-right" onclick="limparDadosSuspensao();"><i class="fa fa-eraser"></i>&nbsp;Limpar</a>
                                </div>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <div class="modal-footer">
                            <div class="pull-right">
                                <a onclick="executarSuspensao()" class="btn red-intense"><i class="fa fa-check"></i>&nbsp;Confirmar</a>
                                <a class="btn grey-cascade" data-dismiss="modal"><i class="fa fa-times"></i>&nbsp;Cancelar</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        _idSeletorFiltro = "#<%= SeletorFiltro.ClientID %>";
        _idGridListagemLiberar = "#<%= GridListagemLiberar.ClientID %>";
        _uidGridListagemLiberar = "<%= GridListagemLiberar.UniqueID %>";
        _uidDadosSuspensao = "<%= DadosSuspensao.UniqueID %>";

        function executarSuspensao() {
            $("#modal-suspensao .btn").addClass("disabled");
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(fimRequisicaoSuspensao);
            __doPostBack(_uidDadosSuspensao, 'Save');
        }

        function fimRequisicaoSuspensao() {
            $("#modal-suspensao .btn").removeClass("disabled");
            Sys.WebForms.PageRequestManager.getInstance().remove_endRequest(fimRequisicaoSuspensao);
        }

        function limparDadosSuspensao() {
            $("#modal-suspensao .select2-container.form-control").select2('data', null);
            $("#modal-suspensao textarea").val('');
        }

        function aoAbrirModalSuspensao() {
            $("#alerta-erros-suspensao").html('');
        }

        function fecharModalSuspensao() {
            $('#modal-suspensao').modal('hide');
        }

        function limpar(id) {
            $(id).html('');
        }

        function comecoRequisicao() {
            limpar('#alerta-erros');
            limpar('#alerta-erros-suspensao');

        }

        function fimRequisicao() {
            ajustarFiltroParaPadrao();
        }

        function ajustarFiltroParaPadrao() {
            acoes = $('.filtro-pesquisar-por .form-actions');
            if ($('.filtro-pesquisar-por').is(':visible')) {
                acoes.addClass('filter-actions pull-right');
                acoes.detach();
                $('.filtro-topo').append($(acoes));
            } else {
                $('.filtro-topo .filter-actions').remove();
            }
        }

        $("#modal-suspensao").on("show.bs.modal", aoAbrirModalSuspensao);
        Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(comecoRequisicao);
        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(fimRequisicao);
    </script>
</asp:Content>