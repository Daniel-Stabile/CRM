<%@ Page Title="Nova cobrança bancária" Language="C#" CodeFile="~/aga/e/financeiro/cobrancabancaria/Inserir.aspx.cs" Inherits="InserirCobrancaBancariaPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Nova cobrança bancária</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Selecione as parcelas</span></a></li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row">
                                <wes:AjaxForm runat="server"
                                    ID="FORMNOVACOBRANCABANCARIA"
                                    Title="Nova cobrança bancária"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    EntityViewName="WEB_FN_INSERIRCOBRANCABANCARIA.FORM"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    IncludeRecordInRecentItems="True"
                                    UserDefinedCommandsVisible="True"
                                    PageWidgetHandle="22203"
                                    Level="20"
                                    Order="10" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <wes:SimpleGrid runat="server"
                                    ID="PARCELAS"
                                    Title="Selecione as parcelas"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="COBRANCABANCARIA_TITULOS_OCORRENCIAS.DATASOURCE.GRID"
                                    Mode="Fixed"
                                    DefaultFilterName="Padrão"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="False"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22856"
                                    Level="20"
                                    Order="20" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../../../../Content/js/CorporativoGrid.js"></script>
    <script type="text/javascript" src="../../../../Content/js/jquery.table2excel.js"></script>
    <script type="text/javascript">
        $(function () {

            $('#form_wizard').bootstrapWizard({
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false;
                },
                onNext: function (tab, navigation, index) { },
                onPrevious: function (tab, navigation, index) { },
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

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    selectCurrentStep();
                    AlterarExportarPlanilhaJS();
                    AjustarCamposFiltro();
                });
            }
            selectCurrentStep();
        });

        function AjustarCamposFiltro() {
            var tituloDocumentos = $('#ctl00_Main_PARCELAS_GERAL_DOCUMENTOS');
            var camposDocumentos = tituloDocumentos.parent().children('.row');
            tituloDocumentos.css('font-size', '16px');
            tituloDocumentos.css('border-bottom', 'none');
            tituloDocumentos.css('margin-bottom', '10px');
            camposDocumentos.css('margin-bottom', '-30px');
            camposDocumentos.css('margin-top', '-30px');

            var buscaAvancada = $('#ctl00_Main_PARCELAS_GERAL_BUSCAAVANCADA');
            if (buscaAvancada.parent().children('.row').length > 0) {
                buscaAvancada.css('border-bottom', '2px solid #a0c2ec');
                buscaAvancada.css('font-weight', '500');
            } else {
                buscaAvancada.hide();
            }
        }

        function AlterarExportarPlanilhaJS() {
            $('#ctl00_Main_PARCELAS_SimpleGrid_ctl01_ExportToExcel').attr('href', '#');

            $('#ctl00_Main_PARCELAS_SimpleGrid .fa-download').closest('a').click(function (e) {
                e.preventDefault();
                var nomePlanilha = 'Parcelas_' + GerarIdRamdomico() + '.xlsx';
                ExportarPlanilha($('#ctl00_Main_PARCELAS_SimpleGrid'), nomePlanilha, 'ParcelasRemessa');
            })
        }

        function afterAsyncPostBack() {
            
            // no clique de um input checkbox
            $('input[type="checkbox"]').on('click', function () {
                inicializaCMD_SALVAR();
                // zera a variável que controla o valor
                var valorTotal = 0;
                // para cada checkbox, que esteja checado, que não seja o checkbox que marca todos
                $('input[type="checkbox"]:checked:not(#ctl00_Main_PARCELAS_SimpleGrid_ctl01_SelectAllCheckBoxHeader)').each(function () {
                    // busca o TR do checkbox
                    parentTR = $(this).parents('tr:eq(0)');

                    // busca o primeiro TD do tipo currency (campo Valor)
                    TDValor = $(parentTR).children('td[data-field="VALOR"]:first');
                    
                    // busca o texto do filho do TD e remove o cifrão
                    strValor = $(TDValor).children().text().replace(/[^0-9,-]+/g,"").replace(',','.');

                    // converte
                    valorTotal += strValor ? Number(strValor) : 0;
                    
                    // se possui valor, monta um novo html pro CMD_ADICIONAR
                    if (valorTotal > 0) {
                        valorFormatado = valorTotal.toLocaleString('pt-BR', { style: 'currency', currency: 'BRL' });
                        $("#top-CMD_OK").html("<i class='fa fa-check btn-action'></i> Salvar (" + valorFormatado + ")");
                    }
                });
            });

        }

        function inicializaCMD_SALVAR() {
            $("#top-CMD_OK").html("<i class='fa fa-check btn-action'></i> Salvar")
        }

        Sys.Application.add_init(appl_init);
        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_endRequest(EndHandler);
        }
		
		function EndHandler() {
            afterAsyncPostBack();
        }
    </script>
</asp:Content>
