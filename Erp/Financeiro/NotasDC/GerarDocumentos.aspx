<%@ Page Title="Gerar documentos a partir das notas de débito/crédito" Language="C#" Inherits="GerarDocumentosNotasDc" CodeFile="~/Erp/Financeiro/NotasDC/GerarDocumentos.aspx.cs" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="hfDebitoSelecionados" Value="" />
            <asp:HiddenField runat="server" ID="hfQtdDebitoSelecionados" Value="0|0,00" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="hfCreditoSelecionados" Value="" />
            <asp:HiddenField runat="server" ID="hfQtdCreditoSelecionados" Value="0|0,00" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li>
                            <a data-toggle="tab" class="step" href="#tab1">
                                <span class="number">1</span><span class="desc">
                                    <i class="fa fa-check"></i>Lançamentos
                                </span>
                            </a>
                        </li>
                        <li>
                            <a data-toggle="tab" class="step" href="#tab2">
                                <span class="number">2</span><span class="desc">
                                    <i class="fa fa-check"></i>Gerar Documentos
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row" style="padding: 0 15px;">
                                <div style="margin-left: -15px; margin-right: -15px;">
                                    <wes:CommandsPanel runat="server" ID="PAINELCOMANDOS" Title="PAINELCOMANDOS"
                                        Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12"
                                        FontIcon="" ShowTitle="False" ProviderWidgetUniqueId="" ChromeState="Fixed"
                                        CanDelete="False" CanUpdate="False" CanInsert="False"
                                        EntityViewName="FN_VIRTUAL_GERARDOCUMENTOSNDC.PAINELCOMANDOS.GRID"
                                        VerticalOrientation="False" PageId="PAGES_TESTEWIZARD" Level="20" Order="30"
                                        OnCommandExecute="PainelComandos_CommandExecute" />
                                </div>
                                <!-- DÉBITOS -->
                                <div id="GuiaDebitos" class="row">
                                    <div class="col-md-12">
                                        <div class="portlet box blue-soft">
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="fa fa-arrow-up"></i>Débitos
                                                    <span class="badge" id="quantidadeDebitos"
                                                        data-name="qtdDebitos">0</span>
                                                </div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="collapse"
                                                        onclick="mudarEstadoGrupoLancamento('GuiaCreditos')"
                                                        data-original-title="" title="Fechar/Expandir"> </a>
                                                </div>
                                            </div>
                                            <div class="portlet-more">
                                                <small>Total: R$ </small><b id="valorDebitos" data-name="valDebitos">0,00</b>
                                            </div>
                                            <div id="bodyGuiaDebitos" class="portlet-body">
                                                <div class="row">
                                                    <div class="tabbable-line">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active">
                                                                <a href="#tab_debitosSelecionar" data-toggle="tab"
                                                                    aria-expanded="true">Lançamentos</a>
                                                            </li>
                                                            <li>
                                                                <a href="#tab_debitosSelecionados" data-toggle="tab"
                                                                    aria-expanded="true">Selecionados</a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <div class="tab-pane active" id="tab_debitosSelecionar">
                                                                <wes:SimpleGrid runat="server" ID="DEBITOSELECIONAR"
                                                                    Title="Débitos" Subtitle="" PortletCssClass=""
                                                                    PortletLayout="Default" BootstrapCols="12"
                                                                    FontIcon="" ShowTitle="false"
                                                                    ProviderWidgetUniqueId="" ChromeState="Fixed"
                                                                    CanDelete="false" CanUpdate="false"
                                                                    CanInsert="false"
                                                                    EntityViewName="FN_LANCAMENTOSNDC.GERARDOCUMENTOS.CUSTOM.GRID"
                                                                    DefaultFilterName="Padrao" Mode="Selectable"
                                                                    UserDefinedSelectColumnVisible="true"
                                                                    UserDefinedPageSize="10" SystemFilterOnly="False"
                                                                    DisplayRowCommand="True"
                                                                    CompanyFilterMode="OnlyCompany" ShowExport="True"
                                                                    UserDefinedDisableRowSelection="False"
                                                                    PageWidgetHandle="22478" Level="20" Order="20"
                                                                    OnCommandExecute="Selecionar_CommandExecute" />
                                                            </div>
                                                            <div class="tab-pane" id="tab_debitosSelecionados">
                                                                <wes:SimpleGrid runat="server" ID="DEBITOSELECIONADOS"
                                                                    Title="Débitos" Subtitle="" PortletCssClass=""
                                                                    PortletLayout="Default" BootstrapCols="12"
                                                                    FontIcon="" ShowTitle="false"
                                                                    ProviderWidgetUniqueId="" ChromeState="Fixed"
                                                                    CanDelete="false" CanUpdate="false"
                                                                    CanInsert="false"
                                                                    EntityViewName="FN_LANCAMENTOSNDC.GERARDOCUMENTOS.CUSTOM.GRID"
                                                                    Mode="Selectable"
                                                                    UserDefinedSelectColumnVisible="true"
                                                                    UserDefinedPageSize="10" SystemFilterOnly="False"
                                                                    DisplayRowCommand="True"
                                                                    CompanyFilterMode="OnlyCompany" ShowExport="True"
                                                                    UserDefinedDisableRowSelection="False"
                                                                    PageWidgetHandle="22478" Level="20" Order="20"
                                                                    OnCommandExecute="Selecionados_CommandExecute" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- CRÉDITOS -->
                                <div id="GuiaCreditos" class="row">
                                    <div class="col-md-12">
                                        <div class="portlet box red-intense">
                                            <div class="portlet-title">
                                                <div class="caption">
                                                    <i class="fa fa-arrow-down"></i>Créditos <span class="badge"
                                                        id="quantidadeCreditos">0</span>
                                                </div>
                                                <div class="tools">
                                                    <a href="javascript:;" class="expand"
                                                        onclick="mudarEstadoGrupoLancamento('GuiaDebitos')"
                                                        data-original-title="" title="Fechar/Expandir"> </a>
                                                </div>
                                            </div>
                                            <div class="portlet-more">
                                                <small>Total: R$ </small><b id="valorCreditos" data-name="valCreditos">0,00</b>
                                            </div>
                                            <div id="bodyGuiaCreditos" class="portlet-body portlet-collapsed">
                                                <div class="row">
                                                    <div class="tabbable-line">
                                                        <ul class="nav nav-tabs">
                                                            <li class="active">
                                                                <a href="#tab_creditosSelecionar" data-toggle="tab"
                                                                    aria-expanded="true">Lançamentos</a>
                                                            </li>
                                                            <li>
                                                                <a href="#tab_creditosSelecionados" data-toggle="tab"
                                                                    aria-expanded="true">Selecionados</a>
                                                            </li>
                                                        </ul>
                                                        <div class="tab-content">
                                                            <div class="tab-pane active" id="tab_creditosSelecionar">
                                                                <wes:SimpleGrid runat="server" ID="CREDITOSELECIONAR"
                                                                    Title="Débitos" Subtitle="" PortletCssClass=""
                                                                    PortletLayout="Default" BootstrapCols="12"
                                                                    FontIcon="" ShowTitle="false"
                                                                    ProviderWidgetUniqueId="" ChromeState="Fixed"
                                                                    CanDelete="false" CanUpdate="false"
                                                                    CanInsert="false"
                                                                    EntityViewName="FN_LANCAMENTOSNDC.GERARDOCUMENTOS.CUSTOM.GRID"
                                                                    DefaultFilterName="Padrao" Mode="Selectable"
                                                                    UserDefinedSelectColumnVisible="true"
                                                                    UserDefinedPageSize="10" SystemFilterOnly="False"
                                                                    DisplayRowCommand="True"
                                                                    CompanyFilterMode="OnlyCompany" ShowExport="True"
                                                                    UserDefinedDisableRowSelection="False"
                                                                    PageWidgetHandle="22478" Level="20" Order="20"
                                                                    OnCommandExecute="Selecionar_CommandExecute" />
                                                            </div>
                                                            <div class="tab-pane" id="tab_creditosSelecionados">
                                                                <wes:SimpleGrid runat="server" ID="CREDITOSELECIONADOS"
                                                                    Title="Débitos" Subtitle="" PortletCssClass=""
                                                                    PortletLayout="Default" BootstrapCols="12"
                                                                    FontIcon="" ShowTitle="false"
                                                                    ProviderWidgetUniqueId="" ChromeState="Fixed"
                                                                    CanDelete="false" CanUpdate="false"
                                                                    CanInsert="false"
                                                                    EntityViewName="FN_LANCAMENTOSNDC.GERARDOCUMENTOS.CUSTOM.GRID"
                                                                    Mode="Selectable"
                                                                    UserDefinedSelectColumnVisible="true"
                                                                    UserDefinedPageSize="10" SystemFilterOnly="False"
                                                                    DisplayRowCommand="True"
                                                                    CompanyFilterMode="OnlyCompany" ShowExport="True"
                                                                    UserDefinedDisableRowSelection="False"
                                                                    PageWidgetHandle="22478" Level="20" Order="20"
                                                                    OnCommandExecute="Selecionados_CommandExecute" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row" style="padding: 0 15px;">
                                <div class="row">
                                    <wes:AjaxForm runat="server" ID="LANAMENTOMANUALNDC"
                                        EntityViewName="FN_VIRTUAL_GERARDOCUMENTOSNDC.CUSTOM.FORM" FormMode="View"
                                        ShowTitle="false" CanDelete="True" CanUpdate="True" CanInsert="True"
                                        OnCommandExecuted="LANAMENTOMANUALNDC_CommandExecuted" />
                                </div>
                                <div class="row" data-name="resultado">
                                    <div class="col-md-7">
                                        <wes:SimpleGrid runat="server" ID="DOCUMENTORESULTADO"
                                            EntityViewName="FN_DOCUMENTOS.CUSTOM.LANCAMENTONDC.GRID" CanInsert="false"
                                            CanUpdate="false" CanDelete="false"
                                            UserDefinedCriteriaWhereClause=" A.HANDLE IS NULL " ShowTitle="true"
                                            Title="Documentos gerados" />
                                    </div>
                                    <div class="col-md-5">
                                        <wes:SimpleGrid runat="server" ID="LANCAMENTOSRESULTADO"
                                            EntityViewName="FN_LANCAMENTOSNDC.GERARDOCUMENTO.RESULTADO.GRID"
                                            ProviderWidgetUniqueId="DOCUMENTORESULTADO" CanInsert="false"
                                            CanUpdate="false" CanDelete="false" UserDefinedDisableRowSelection="true"
                                            ShowTitle="true" Title="Lançamentos"
                                            UserDefinedCriteriaWhereClause="DOCUMENTOGERADO = @CAMPO(HANDLE)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () { bindResult(); });
        function setActive(el) {
            $('.mt-element-step .mt-step-col').removeClass("active");
            $(el).parent().addClass("active");
        }

        function setInfos() {
            var res = $('#hfQtdDebitoSelecionados').val().split('|');
            $('#quantidadeDebitos').text(res[0]);
            $('#valorDebitos').text(res[1]);

            res = $('#hfQtdCreditoSelecionados').val().split('|');
            $('#quantidadeCreditos').text(res[0]);
            $('#valorCreditos').text(res[1]);
        }

        function bindResult() {
            if ($('div[data-name="resultado"]').find('#DOCUMENTORESULTADO').find('table tbody tr').filter('[rel]').length > 0) {
                if ($('div[data-name="resultado"]').is(":hidden"))
                    $('div[data-name="resultado"]').slideDown('slow');
            }
            else
                $('div[data-name="resultado"]').hide();
        }

        $(function () {
            // default form wizard
            $('#form_wizard').bootstrapWizard({
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;
                },
                onNext: function (tab, navigation, index) {
                },
                onPrevious: function (tab, navigation, index) {
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length;
                    var current = index + 1;
                    var $percent = (current / total) * 100;
                    $('#form_wizard').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            selectCurrentStep = function () {
                var currentStep = $("#CurrentStep").val();
                $('[href="#tab' + currentStep + '"]').tab('show');
            };

            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    selectCurrentStep();
                    setInfos();
                    bindResult();
                });
            }

            selectCurrentStep();
        });

        function mudarEstadoGrupoLancamento(idElemento) {
            var elemento = $('#' + idElemento);
            var elementoAberto = elemento.find('.collapse');

            if (elementoAberto != null && elementoAberto.length == 1) {
                elementoAberto.removeClass('collapse');
                elementoAberto.addClass('expand');
                $('#body' + idElemento).hide();
            }
        }
    </script>

    <style>
        .tabbable-line>.nav-tabs {
            margin: 0 10px;
        }

        .portlet:not(.light) .tabbable-line {
            padding-top: 0px;
        }

        .portlet-more {
            display: block;
            padding: 0px 10px 10px 10px;
            color: white;
            text-indent: 20px;
            margin-top: -10px;
        }

        .portlet-title .badge {
            background-color: rgba(0, 0, 0, 0.2);
            margin-top: -5px;
        }

        .portlet .caption {
            padding-bottom: 0px !important;
        }
    </style>

</asp:Content>