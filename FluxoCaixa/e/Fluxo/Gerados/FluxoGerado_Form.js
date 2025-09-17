//Área para varáveis globais
window.formParaAbrir = "";
window.somenteVisualizacao = false;

$.getScript("FluxoGerado_Form_Datatable.js");
$.getScript("FluxoGerado_Form_Grafico.js");


function exibeRegiao1ou2() {
    if ($('#regiaoEsquerda.col-lg-1').length == 1) {
        toggleLeftDivs();
    }
    $(window).scrollTop(0);
}

function exibeRegiao3ou4() {
    if ($('#regiaoDireita').hasClass('col-lg-1'))
        toggleLeftDivs();

    $(window).scrollTop(0);

    reloadDataTable();
}

$('.overlay').on('click', function () {
    $('#sidebar div.formulario:not(.hide) a.btn-cancel').click();
    fechaModalLateral();
});

$('#OpenSidebarAtrasoMedioCPA').on('click', function () {
    abreFormSimulacao(4);
});

$('#OpenSidebarAtrasoMedioCRE').on('click', function () {
    abreFormSimulacao(8);
});

$('#OpenSidebarAlterarVencCPA').on('click', function () {
    abreFormSimulacao(2);
});

$('#OpenSidebarAlterarVencCRE').on('click', function () {
    abreFormSimulacao(6);
});

$('#OpenSidebarSusPagCPA').on('click', function () {
    abreFormSimulacao(3);
});

$('#OpenSidebarSusPagCRE').on('click', function () {
    abreFormSimulacao(7);
});

$('#OpenSidebarAntRecCRE').on('click', function () {
    abreFormSimulacao(9);
});

$('#OpenSidebarTransfOUT').on('click', function () {
    abreFormSimulacao(10);
});

$('#OpenSidebarAplResOUT').on('click', function () {
    abreFormSimulacao(11);
});

$('#OpenSidebarEmpFinOUT').on('click', function () {
    abreFormSimulacao(12);
});

function abreFormSimulacao(tipo, isEditing, somenteVisualizacao) {
    
    switch (tipo) {
        case 2:
        case 'CPA - Alterar Vencimento':
            exibeFormSidebar('#FrmSimulacaoFluxoAltVencCpa', 2, isEditing, somenteVisualizacao);
            break;
        case 3:
        case 'CPA - Suspender Pagamento':
            exibeFormSidebar('#FrmSimulacaoFluxoSusPagCpa', 3, isEditing, somenteVisualizacao);
            break;
        case 4:
        case 'CPA - Atraso Médio':
            exibeFormSidebar('#FrmSimulacaoFluxoAtrMedioCpa', 4, isEditing, somenteVisualizacao);
            break;
        case 6:
        case 'CRE - Alterar Vencimento':
            exibeFormSidebar('#FrmSimulacaoFluxoAltVencCre', 6, isEditing, somenteVisualizacao);
            break;
        case 7:
        case 'CRE - Suspender Recebimento':
            exibeFormSidebar('#FrmSimulacaoFluxoSusPagCre', 7, isEditing, somenteVisualizacao);
            break;
        case 8:
        case 'CRE - Atraso Médio':
            exibeFormSidebar('#FrmSimulacaoFluxoAtrMedioCre', 8, isEditing, somenteVisualizacao);
            break;
        case 9:
        case 'CRE - Antecipação de Recebíveis':
            exibeFormSidebar('#FrmSimulacaoFluxoAntRecCre', 9, isEditing, somenteVisualizacao);
            break;
        case 10:
        case 'OUT - Transferências':
            exibeFormSidebar('#FrmSimulacaoFluxoTransfOut', 10, isEditing, somenteVisualizacao);
            break;
        case 11:
        case 'OUT - Aplicação Resgate':
            exibeFormSidebar('#FrmSimulacaoFluxoAplResOut', 11, isEditing, somenteVisualizacao);
            break;
        case 12:
        case 'OUT - Empréstimos e Financiamentos':
            exibeFormSidebar('#FrmSimulacaoFluxoEmpFinOut', 12, isEditing, somenteVisualizacao);
            break;
        default:
            break;
    }
}


function hideAllForms() {
    $('#FrmSimulacaoFluxoAtrMedioCpa').addClass('hide');
    $('#FrmSimulacaoFluxoAtrMedioCre').addClass('hide');
    $('#FrmSimulacaoFluxoAltVencCpa').addClass('hide');
    $('#FrmSimulacaoFluxoAltVencCre').addClass('hide');
    $('#FrmSimulacaoFluxoSusPagCpa').addClass('hide');
    $('#FrmSimulacaoFluxoSusPagCre').addClass('hide');
    $('#FrmSimulacaoFluxoAntRecCre').addClass('hide');
    $('#FrmSimulacaoFluxoTransfOut').addClass('hide');
    $('#FrmSimulacaoFluxoAplResOut').addClass('hide');
    $('#FrmSimulacaoFluxoEmpFinOut').addClass('hide');
}

function openSideBar(idForm, tipo, isEditing, somenteVisualizacao) {
    $('#sidebar').show().animate({ width: '80%', padding: '15px' }, { duration: 0 });
    $('.overlay').addClass('active');
    $('.collapse.in').toggleClass('in');
    $('a[aria-expanded=true]').attr('aria-expanded', 'false');

    if (somenteVisualizacao) {
        btnToHide = '.btn-new';

        $('#sidebar ' + idForm + ' ' + btnToHide).exists(function () {
            $('#sidebar ' + idForm + ' ' + btnToHide).hide();
        });
    }
    else {
        $.blockUI({ baseZ: 20000, message: '' });
        btnToClick = isEditing ? '.btn-edit' : '.btn-new';
        $('#sidebar ' + idForm + ' ' + btnToClick).exists(function () {
            $('#sidebar ' + idForm + ' ' + btnToClick).click();
            $('#sidebar ' + idForm + ' select[data-field="TIPO"]').exists(function () {
                $('#sidebar ' + idForm + ' select[data-field="TIPO"] option[value=' + tipo + ']').prop('selected', true);
                $('#sidebar ' + idForm + ' select[data-field="TIPO"]').prop('disabled', true);
                $('#sidebar ' + idForm + ' a.btn-cancel').click(function () { fechaModalLateral(); });
                $('#sidebar ' + idForm + ' a.btn-save').click(function () { fechaModalLateralAoSalvar(idForm); });

                if (tipo == 2 || tipo == 3 || tipo == 4) {
                    $('#sidebar ' + idForm + ' select[data-field="CATEGORIACLIENTE"]').parent().parent().parent().parent().hide();
                }

                if (tipo == 6 || tipo == 7 || tipo == 8) {
                    $('#sidebar ' + idForm + ' select[data-field="CATEGORIAFORNECEDOR"]').parent().parent().parent().parent().hide();
                }
            });
        });
        $.unblockUI();
    }
}

function toggleLeftDivs() {
    $('#setaDir').toggleClass("hide");
    $('#setaEsq').toggleClass("hide");
    $('#regiaoEsquerda').toggleClass("col-lg-1 col-md-1");
    $('#regiaoEsquerda').toggleClass("col-lg-11 col-md-11");
    $('#regiaoDireita').toggleClass("col-lg-1 col-md-1");
    $('#regiaoDireita').toggleClass("col-lg-11 col-md-11");

    $('#div_reg_1').toggleClass("hide");
    $('#div_reg_2').toggleClass("hide");
    $('#div_reg_3').toggleClass("hide");
    $('#div_reg_4').toggleClass("hide");

    $('.title-toggle').toggleClass("hide");
}

$.fn.exists = function (callback) {
    var self = this;
    var interval = setInterval(function () {
        self = $(self.selector);

        if (self.length) {
            var args = [].slice.call(arguments, 1);
            callback.call(self, args);
            clearInterval(interval);
        }
    }, 100);
};

function fechaModalLateralAoSalvar() {
    $('.alert.alert-warning button.close').click();
    $('.alert.alert-danger button.close').click();
}

function fechaModalLateral() {
    hideAllForms();
    $('#sidebar').animate({ width: '0px', padding: 0 }, { duration: 300 });
    $('.overlay').removeClass('active');
    trataComandosEditar();
    Benner.ModalMessage.hide();
}

function exibeFormSidebar(idForm, tipo, isEditing, somenteVisualizacao) {
    hideAllForms();
    $(idForm).removeClass('hide');
    openSideBar(idForm, tipo, isEditing, somenteVisualizacao);
}

function trataComandosEditar() {

    $('#GrdSimulacoes table a[id^=CMD_EDIT]')
        .attr('href', 'javascript:void(0);')
        .attr('onClick', "abreFormSimulacaoModal(this);");

    $('#GrdSimulacoes table a[id^=CMD_EDIT]')
        .closest('td').next().next()
        .attr('href', 'javascript:void(0);')
        .attr('onClick', "abreFormSimulacaoReadOnly(this);");
}

function abreFormSimulacaoReadOnly(link) {
    var postBack = $(link).closest('td').next().attr('onclick').replace('javascript:', '');
    window.formParaAbrir = $(link).text();
    window.somenteVisualizacao = true;

    eval(postBack);
}

function abreFormSimulacaoModal(link) {
    var postBack = $(link).closest('td').next().attr('onclick').replace('javascript:', '');
    window.formParaAbrir = $('a', $(link).closest('td').next().next()).text();
    window.somenteVisualizacao = false;

    eval(postBack);
}

function EndRequestHandler(sender, args) {

    if (window.formParaAbrir != "") {        
        abreFormSimulacao(window.formParaAbrir, true, window.somenteVisualizacao);
        window.formParaAbrir = "";
    }    

    trataComandosEditar();
    desabilitaNovo();
    desabilitaTipo();
    bindCancelar();
    
    if (sender._activeElement.className == "btn blue btn-save command-action predef-action editable") {

        if (($('.alert.alert-warning').length === 0) && ($('.alert.alert-danger').length === 0))
            fechaModalLateral();
        else {
            $('#sidebar a.btn-cancel').click(function () { fechaModalLateral(); });
        }
    }

    Benner.ModalMessage.hide();
}

function bindCancelar() {
    
    $("#top-CMD_CANCELAR")
        .attr('href', 'javascript:void(0);')
        .attr('onClick', "fechaModalLateral();");
}

function desabilitaNovo() {
    $('#sidebar .btn-new').hide();
}

function desabilitaTipo() {
    $('#sidebar select[data-field="TIPO"]').prop('disabled', true);
}

function BeginRequestHandler(sender, args) {
    if (window.formParaAbrir != undefined) {
        $.blockUI({ message: '' });
    }
}

function ControlaVisibilidadeEdicao() {

    var handleFluxo = $('span[data-field="HANDLE"] > input').val();

    if (handleFluxo < 0) {
        EscondeItens();
    }
    else {
        ExibeItens();
    }
}

function EscondeItens() {
    $('#col-reg-2').hide();
    $('#col-reg-3').hide();
    $('#col-reg-4').hide();
}

function ExibeItens() {
    $('#col-reg-2').show();
    $('#col-reg-3').show();
    $('#col-reg-4').show();
}

function MostraRegiao1() {
    exibeRegiao1ou2();
    $('#div_reg_2').addClass('collapse');
    $('#col-reg-2').addClass('top-float');
    $('#div_reg_1').removeClass('collapse');
    $('#col-reg-1').removeClass('bottom-float');

}

function MostraRegiao2() {
    exibeRegiao1ou2();
    $('#div_reg_1').addClass('collapse');
    $('#col-reg-1').addClass('top-float');
    $('#div_reg_2').removeClass('collapse');
    $('#col-reg-2').removeClass('bottom-float');

}

function MostraRegiao3() {
    exibeRegiao3ou4();
    $('#div_reg_4').addClass('collapse');
    $('#col-reg-4').addClass('top-float');
    $('#div_reg_3').removeClass('collapse');
    $('#col-reg-3').removeClass('bottom-float');

}

function MostraRegiao4() {
    exibeRegiao3ou4();
    $('#div_reg_3').addClass('collapse');
    $('#col-reg-3').addClass('top-float');
    $('#div_reg_4').removeClass('collapse');
    $('#col-reg-4').removeClass('bottom-float');

    reloadDataTable();
}

function reloadDataTable() {
    setTimeout(function () { $(".td-fx-invisivel").hide(); }, 100);
}

function MostraRegiaoDataTable() {
    //LoaderCarregando();

    setTimeout(function () {
        if ($('#div_reg_1 [class*=alert-warning]').length == 0) {
            $(".td-fx-invisivel").hide();
        }
    }, 1500);
}

function LoaderCarregando() {
    Benner.ModalMessage.show("Carregando");
}

$(document).ready(function () {
    $('#sidebar').hide();

    //Ocultar informações sobre simulação para fluxos projetados
    if ($('input[data-field=TIPO]').val() === "3")
        $('#div_reg_2').hide();

    if ($('input[data-field=NOME]').val() !== '') {
        if ($('.form-view-mode').length > 0) {
            MostraRegiaoDataTable();
        }
    }

    Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

    trataComandosEditar();

    ControlaVisibilidadeEdicao();

    $(".btn.blue.btn-save.command-action.predef-action.editable").click(ExibeItens);

    var scroll = setInterval(function () {

        $('tbody', '#app-fluxo').scroll(function (e) {

            $('thead', '#app-fluxo').css("left", -$("tbody", '#app-fluxo').scrollLeft());
            $('thead th:nth-child(1)', '#app-fluxo').css("left", $("tbody", '#app-fluxo').scrollLeft());
            $('tbody td:nth-child(1)', '#app-fluxo').css("left", $("tbody", '#app-fluxo').scrollLeft());

            clearInterval(scroll);
        });

    }, 2000);

    setInterval(function () {

        $("#app-fluxo table, #app-fluxo thead, #app-fluxo tbody").width(function () {

            return $("#fx-fluxo-container").width();
        });
    }, 2000);

});