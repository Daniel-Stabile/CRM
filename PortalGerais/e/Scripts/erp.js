var Erp = {

    // Seleciona a aba salva no tab
    setTabActive: function (id) {
        var idValue = "#" + id + "_curTab";
        $(idValue).each(function () {
            var idTab = "#" + $(this).attr("value");
            if (idTab.length > 1) {
                $(idTab).each(function () { $(this).tab('show'); });
            };
        });
    },

    // Evento para salvar o tab selecionado
    initTabs: function () {
        $("[data-toggle='tab']").click(function () {
            var current = $(this).attr("id");
            var ul = $(this).parent().parent();
            var targetHidden = '#' + $(ul).attr("id") + "_curTab";
            $(targetHidden).each(function () {
                $(this).attr("value", current);
            });
        });
    },

    // Informa a cor de titulo dos portlets
    initPortletTitleColor: function (colorClass) {
        $(".portlet").each(function () {
            // Verifica se tem title preenchido
            var txt = $(this).children('.portlet-title').children('.caption').first('.caption-subject').text();
            var valido = false;
            for (var i = 0; i < txt.length; i++) {
                if (txt.charCodeAt(i) > 32)
                    valido = true;
            }

            if (!valido)
                return;
            
            // Titulo bonito 
            var pos = txt.indexOf('>>');
            if (pos > 0) {
                var parts = txt.split('>>');
                var newTxt = '<span class="caption-subject font-green-sharp bold uppercase">' +
                    parts[0] + '</span><span class="caption-helper">' + parts[1] + '</span>';

                $(this).children().children().first().html(newTxt);
            }            
        });

    },

    setRowGridReadOnly: function () {
        var proc = '.ItemReadOnly input';
        $(proc).each(function () {
            $(this).attr('readonly', 'readonly');
        });

        var proc = '.ItemCancelado input';
        $(proc).each(function () {
            $(this).attr('readonly', 'readonly');
            $(this).css({ 'text-decoration': 'line-through' });
        });

    },

    setTabTick: function (id, text) {

        $(document).ready(function () {
            var target = '#' + id + ' .badge';
            if ($(target).text() != text) {
                $(target).fadeOut(10, function () { $(this).text(text); }).fadeIn(800);
            }
        }
        );

    },

    infoToToastr: function () {
        $('.alert-info').each(function () {
            if (!$(this).hasClass("alert-request-confirmation")) {
                if ($(this).css('display') != 'none') {
                    toastr.info($(this).text());
                    $(this).css('display', 'none');
                };
            };
        });
    },

    enableTitleCollapse: function () {
        $('.portlet-title>.caption').click(function () {
            var x = $(this).parent().find('.tools>.collapse');
            if (x.length == 0)
                x = $(this).parent().find('.tools>.expand');
            if (x)
                $(x).each(function () { $(this).click(); });
        });

        $('.portlet-title>.tools>.collapse').parent().parent().find('.caption').css({ cursor: 'pointer' });
        $('.portlet-title>.tools>.expand').parent().parent().find('.caption').css({ cursor: 'pointer' });
    },


    setWizardStep: function (wizard, step) {

        // Tratar pills
        $('#' + wizard).find('.step').each(function () {
            var nr = parseInt($(this).attr('stepnr'));
            if (nr < step) {
                $(this).parent().addClass('done');
                $(this).parent().removeClass('active');
            }
            else {
                $(this).parent().removeClass('done');
                if (nr == step) {
                    $(this).parent().addClass('active');

                }
                else {
                    $(this).parent().removeClass('active');
                }
            };

        });

        // Tratar o panel
        $('#' + wizard).find('.tab-pane[stepnr]').each(function () {
            var nrp = parseInt($(this).attr('stepnr'));
            if (nrp == step) {
                $(this).addClass('active');
            }
            else {
                $(this).removeClass('active');
            };
        });
    },

    inicializarTabs: function () {
        // é o efeito de ... quando falta espaço pra todas as tabs
        $('.nav-tabs:not(.tabs-left)').tabdrop({text:"..."});
    },

    toggleSimpleGridAllRowsSelection: function(gridID) {
        $(gridID + " thead input[type='checkbox']").click();
    },

    gerarAlertaErro: function(container, mensagem) {
        Metronic.alert({container:$(container), message: mensagem, type: 'danger', close: true, reset: true, icon: 'fa fa-warning'});
    },

    gerarAlertaErroDetalhes: function(divDestino, cabecalho, mensagens) {
        var html = "";
        for (i = 0; i < mensagens.length; i++) {
            html += "<li>" + mensagens[i] + "</li>";
        }
        html = cabecalho + "<ul>" + html + "</ul>";
        Metronic.alert({container:divDestino, message: html, type: 'danger', close: true, reset: true, icon: 'fa fa-warning'});
    },

    criarBarraProgresso: function(percentual, opcoes) {
        if (opcoes === undefined)
            opcoes = {};
        var extender = function(a, b) {
            for (bi in b) {
                if (typeof a[bi] == 'string' && typeof b[bi] == 'string') {
                    if (bi == 'style')
                        a[bi] = a[bi] + '; ' + b[bi];
                    else
                        a[bi] = a[bi] + ' ' + b[bi];
                }
                else if (typeof b[bi] != 'undefined')
                    a[bi] = b[bi];
            }
        };

        var conteudo = opcoes['conteudo'] !== undefined ? opcoes['conteudo'] : '';
        var propriedadesInterior = {
            'style': 'width: ' + percentual + '%',
            'class': 'progress-bar',
            'aria-valuenow': percentual,
            'aria-valuemin': '0',
            'aria-valuemax': '100',
            'html': conteudo
        };
        if (opcoes['cor'] !== undefined)
            propriedadesInterior['style'] += '; background-color:' + opcoes['cor'];
        extender(propriedadesInterior, opcoes['divInterior']);

        var propriedadesExterior = {class: 'progress'};
        if (opcoes['listrada'] === true)
            propriedadesExterior['class'] += ' progress-striped';
        extender(propriedadesExterior, opcoes['divExterior']);

        return $('<div/>', propriedadesExterior)
            .append($('<div/>', propriedadesInterior));
    },
    notificacoes: {
        erroASPNET: function(e) {
            console.debug('Erp.notificacoes.erroASPNET:');
            console.debug(e);
            if (!_.isUndefined(e) && !_.isUndefined(e.responseText) && e.responseText != "") {
                var r = JSON.parse(e.responseText);
                var m = r.ExceptionMessage;
                toastr.error(m, 'Um erro aconteceu');
            } else {
                // formato desconhecido
                toastr.error('Um erro aconteceu');
            }
        }
    },

    ApplicationPath: function() {
        return $('#Wes2008ApplicationPath').val();
    },

    URLServico: function(alvo) {
        return this.ApplicationPath() + 'api/' + alvo;
    },

    dateFromdotNETJSON: function(texto) {
        // /Date... ou "2014-08-01T00:00:00"
        return moment(texto);
    },

    associarCallbackEmGridSelecao: function (nomeGrid, onClickContent) {
        $('#'+nomeGrid).find('td.multi-select-column label > input')
            .attr({ 'onclick': onClickContent });
    },

    contaItensChecadosEmGrid: function(nomeGrid, nomeBotaoContador, captionBotaoContador) {
        var countRegistrosChecados = $('#' + nomeGrid + ' td.multi-select-column label > input:checked').length;
            
        // Verifica a quantidade de registros marcados
        if (countRegistrosChecados === 0) {
            // Se for igual a zero, monta o botão com o ícone e o texto                
            $('#' + nomeBotaoContador).text('').append('<i class="fa fa-flash btn-action"></i> ' + captionBotaoContador + ' ');
        }
        else {
            // Se for maior que zero, monta o botão com o ícone, texto e a quantidade de itens marcados
            $('#' + nomeBotaoContador).text('').append('<i class="fa fa-flash btn-action"></i> ' + captionBotaoContador + ' ' +
                                                '<span class="badge" style="background-color:#337ab7;color:white;">' + countRegistrosChecados + '</span>');
        }
    },
	mudaVisualizacaoDeAcordoItensChecadosEmGrid: function(nomeGrid, nomeBotao){
	    var countRegistrosChecados = $('#'+ nomeGrid +' td.multi-select-column label > input:checked').length;
        // Verifica a quantidade de registros marcados
        if (countRegistrosChecados === 0) {
            // Se for igual a zero, esconde o botão    
            $('#' + nomeBotao).hide();
        }
        else {
            // Se for maior que zero, mostra botão
            $('#' + nomeBotao).show();
        }
    }
};

$(document).ready(function () {
    // prepara o tabdrop após carga do documento (porque o DOM está carregado)
    //Erp.inicializarTabs();
});



