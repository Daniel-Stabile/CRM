$(() => {
    StartWizard();
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(function (s, e) {
        var etapaAtual = $("#CurrentStep").val();

        OcultarBotaoSelecionarTodos();
        OcultarMensagemSelecao();
        ProcessarSelecao(etapaAtual);

        if (etapaAtual == 2) {
            DeterminarLarguraGridStep2();
            InserirComandoReceberSaldo();
            MapearItensParaJSON();
            AdicionarBadgesGridsPasso2();
        }
    });
});

const conversorDecimal = value => currency(value, { separator: '.', decimal: ',', precision: 4 });

const AtualizarQuantidadeJSONItens = (item) => {
    var listaItens = JSON.parse($("#JsonListaItens").val());

    var handleItem = $(item).attr('name').split('$')[1];
    var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);
    listaItens[indexItemJSON].Quantidade = conversorDecimal($(item).val()).value;

    $("#JsonListaItens").val(JSON.stringify(listaItens));
};

const MapearItensParaJSON = () => {
    $("#STEP2_SELECAO_ITENS_OC_CONTRATO input[name*='QTDE_RECEBIDA']").blur(function () { AtualizarQuantidadeJSONItens(this); });

    var listaItens = JSON.parse($("#JsonListaItens").val());

    $("#STEP2_SELECAO_ITENS_OC_CONTRATO input[name*='QTDE_RECEBIDA']").map(function () {
        var handleItem = $(this).attr('name').split('$')[1];
        var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);

        if (indexItemJSON > -1)
            $(this).val(conversorDecimal(listaItens[indexItemJSON].Quantidade).format());
        else
            listaItens.push({
                Handle: handleItem,
                Quantidade: conversorDecimal($(this).val()).value,
                TipoItem: $(this).parents('tr').children('td[data-field="CODIGOTIPO"]').text()
            });
    });

    $("#JsonListaItens").val(JSON.stringify(listaItens));
};

const AlgumPreRecebimentoSelecionado = () => $('#SelectHandlesInput_STEP1_FORNECEDOR_XML').val().length > 0;

const OcultarBotaoSelecionarTodos = () => $("th.multi-select-column label").hide();

const OcultarMensagemSelecao = () => $('.multi-select-message').hide();

const ResetarAbaSelecao = () => $('a[href="#selecionarItens"]').tab('show');

const AtualizarTipoEFilialSelecionados = (checkbox) => {
    if ($(checkbox).prop("checked")) {
        $('#TipoItemSelecionado').val($(checkbox).parents("tr").children("td[data-field='CODIGOTIPO']").text());
        $('#FilialItemSelecionado').val($(checkbox).parents("tr").children("td[data-field='NOMEFILIAL']").text());
    }
};

const ReceberSaldoQtde = () => {
    $('#STEP2_SELECAO_ITENS_OC_CONTRATO table tbody tr').each(function (index) {
        var campoQtdeEditavel = $('td.editavelQtdeRecebida input', this);
        var saldoQtde = $('[data-field="SALDO"]', this).text();
        campoQtdeEditavel.val(saldoQtde);
        AtualizarQuantidadeJSONItens(campoQtdeEditavel);
    });
};

const InserirComandoReceberSaldo = () => {
    var comandoJaInserido = $("#ComandoReceberSaldoQtde").length > 0;
    if (!AlgumPreRecebimentoSelecionado() && !comandoJaInserido)
        $("#STEP2_SELECAO_ITENS_OC_CONTRATO th[data-field='QTDE_RECEBIDA']").append("<a id='ComandoReceberSaldoQtde' title='Receber saldo total pendente em todos os itens.' name='ComandoReceberSaldoQtde' style='margin-left: 3px;' class='btn btn-xs btn-circle green-seagreen' href='javascript:ReceberSaldoQtde();'><i class='fa fa-line-chart'></i></a>");
};

const DeterminarLarguraGridStep2 = () => {
    var preRecebimentoSelecionado = AlgumPreRecebimentoSelecionado();
    $("#ctl00_Main_STEP2_ITENS_XML").toggle(preRecebimentoSelecionado);

    var classeRemover = preRecebimentoSelecionado ? "col-md-12" : "col-md-6";
    var classeAdicionar = preRecebimentoSelecionado ? "col-md-6" : "col-md-12";

    $("#STEP2_SELECAO_ITENS_OC_CONTRATO").removeClass(classeRemover);
    $("#STEP2_SELECAO_ITENS_OC_CONTRATO").addClass(classeAdicionar);
};

const ProcessarSelecao = (etapaAtual) => {
    if (etapaAtual == 1) {
        AssociarComandoCheckboxWidget('STEP1_FORNECEDOR_XML', 'ProcessarPreRecebimentoSelecionado', false);

        if (AlgumPreRecebimentoSelecionado())
            DesabilitarDemaisPreRecebimentos();
        else
            HabilitarTodasAsLinhas("STEP1_FORNECEDOR_XML");
    }

    if (etapaAtual == 2) {
        var algumItemOcContratoSelecionado = $('#SelectHandlesInput_STEP2_SELECAO_ITENS_OC_CONTRATO').val().length > 0;

        AssociarComandoCheckboxWidget('STEP2_SELECAO_ITENS_OC_CONTRATO', 'ProcessarItemOcContratoApontamentoSelecionado', true);

        if (algumItemOcContratoSelecionado)
            DesabilitarItensInvalidos();
        else
            HabilitarTodasAsLinhas("STEP2_SELECAO_ITENS_OC_CONTRATO");
    }
};

const DesabilitarItensInvalidos = () => {
    var tipoSelecionado = $("#TipoItemSelecionado").val();
    var filialSelecionada = $("#FilialItemSelecionado").val();

    $("#STEP2_SELECAO_ITENS_OC_CONTRATO tr.no-selected").each(function () {
        var tipoLinha = $("td[data-field='CODIGOTIPO']", this).text();
        var filialLinha = $("td[data-field='NOMEFILIAL']", this).text();

        if ((tipoLinha != tipoSelecionado) || (filialLinha != filialSelecionada)) {
            $("td.multi-select-column label", this).addClass("mt-checkbox-disabled");
            $("td.multi-select-column input", this).prop("disabled", true);
        }
    });
};

const DesabilitarDemaisPreRecebimentos = () => {
    var handleSelecionado = $("#SelectHandlesInput_STEP1_FORNECEDOR_XML").val();

    $("#STEP1_FORNECEDOR_XML tr.no-selected").each(function () {
        var handleLinha = $(this).attr("handle");

        if (handleLinha != handleSelecionado) {
            $("td.multi-select-column label", this).addClass("mt-checkbox-disabled");
            $("td.multi-select-column input", this).prop("disabled", true);
        }
    });
};

const HabilitarTodasAsLinhas = (idGrid) => {
    $("#" + idGrid + " tr.no-selected").each(function () {
        $("td.multi-select-column label", this).removeClass("mt-checkbox-disabled");
        $("td.multi-select-column input", this).prop("disabled", false);
    });
};

const AssociarComandoCheckboxWidget = (idWidget, comando, ehDeRegistro) => {
    var checkboxSelecaoPreRecebimentos = $("#" + idWidget + " tr td.multi-select-column input");

    if (checkboxSelecaoPreRecebimentos.length > 0) {
        var events = $._data(checkboxSelecaoPreRecebimentos[0], "events");

        if (events === undefined || events.click === undefined) {
            checkboxSelecaoPreRecebimentos.click(function () {
                if (this.checked) {
                    if (ehDeRegistro) {
                        var handleLinha = $(this).parents('tr').attr("handle");
                        comando += '$' + handleLinha;
                    }

                    __doPostBack('ctl00$Main$' + idWidget, comando);
                }
            });
        }
    }
};

const AdicionarBadgesGridsPasso2 = () => {
    var jsonDadosPainel = JSON.parse($("#JsonDadosPainelPasso2").val());
    $("#portlet_STEP2_REVISAO_ITENS_OC_CONTRATO").find(".actions").html('<div class="row static-info" style="margin: 0px; text-align: center;"><div class="col-lg-6 col-md-6 col-sm-6"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Qtde. itens selecionados</div></div></label><span class="value"><span class="label" style="background-color: #6c757d;"><b style="font-size:20px;">QUANTIDADE_SELECIONADOS</b></span></span></div></div><div class="col-lg-6 col-md-6 col-sm-6"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Valor total selecionado</div></div></label><span class="value"><span class="label" style="background-color: #6c757d;"><b style="font-size:20px;">VALOR_TOTAL_SELECIONADO</b></span></span></div></div></div>'
        .replace('QUANTIDADE_SELECIONADOS', jsonDadosPainel.QuantidadeSelecionados)
        .replace('VALOR_TOTAL_SELECIONADO', jsonDadosPainel.ValorTotalSelecionado));

    if (jsonDadosPainel.TemXML) {
        $("#portlet_STEP2_ITENS_XML").find(".actions").html('<div class="row static-info" style="margin: 0px; text-align: center;"><div class="col-lg-6 col-md-6 col-sm-6"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Quantidade itens XML</div></div></label><span class="value"><span class="label label-primary"><b style="font-size:20px;">QUANTIDADE_XML</b></span></span></div></div><div class="col-lg-6 col-md-6 col-sm-6"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Valor total itens XML</div></div></label><span class="value"><span class="label label-primary"><b style="font-size:20px;">VALOR_TOTAL_XML</b></span></span></div></div></div>'
            .replace('QUANTIDADE_XML', jsonDadosPainel.QuantidadeItensXml)
            .replace('VALOR_TOTAL_XML', jsonDadosPainel.ValorTotalItensXml));

        $("#portlet_STEP2_REVISAO_ITENS_OC_CONTRATO").find(".actions").html('<div class="row static-info" style="margin: 0px; text-align: center;"><div class="col-lg-3 col-md-3 col-sm-3"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Qtde. itens selecionados</div></div></label><span class="value"><span class="label" style="background-color: #6c757d;"><b style="font-size:20px;">QUANTIDADE_SELECIONADOS</b></span></span></div></div><div class="col-lg-3 col-md-3 col-sm-3"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Valor total selecionado</div></div></label><span class="value"><span class="label" style="background-color: #6c757d;"><b style="font-size:20px;">VALOR_TOTAL_SELECIONADO</b></span></span></div></div><div class="col-lg-3 col-md-3 col-sm-3"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Diferença qtde. itens</div></div></label><span class="value"><span class="label" style="background-color: #COR_DIFERENCA_QTDE;"><b style="font-size:20px;">DIFERENCA_QUANTIDADE</b></span></span></div></div><div class="col-lg-3 col-md-3 col-sm-3"><div class="form-group" style="margin: 0px"><label class="control-label name column-nowrap"><div class="label-form"><div class="label-title">Diferença valor total</div></div></label><span class="value"><span class="label" style="background-color: #COR_DIFERENCA_VALOR;"><b style="font-size:20px;">DIFERENCA_VALOR_TOTAL</b></span></span></div></div></div>'
            .replace('QUANTIDADE_SELECIONADOS', jsonDadosPainel.QuantidadeSelecionados)
            .replace('VALOR_TOTAL_SELECIONADO', jsonDadosPainel.ValorTotalSelecionado)
            .replace('COR_DIFERENCA_QTDE', jsonDadosPainel.CorDiferencaQtde)
            .replace('DIFERENCA_QUANTIDADE', jsonDadosPainel.DiferencaQuantidade)
            .replace('COR_DIFERENCA_VALOR', jsonDadosPainel.CorDiferencaValor)
            .replace('DIFERENCA_VALOR_TOTAL', jsonDadosPainel.DiferencaValorTotal));
    }
};

const StartWizard = () => {
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
        });
    }

    selectCurrentStep();
};