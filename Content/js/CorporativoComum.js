$(document).ready(function () {
    if (localStorage.getItem('sidebar-state') === null) {
        localStorage.setItem('sidebar-state', 'closed');
        $('#sidebar-menu-toggler').click();
    }
});

//Classe responsável por armazenar funções javascript(Helpers) utilizadas frequentemente nos formulários do corporativo.
function ObterValorQueryString(name, url) {
    if (!url)
        url = window.location.href;

    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);

    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function CriarElementoHtml(nome, texto, valor, selecionado) {

    var elRetorno = document.createElement(nome);
    elRetorno.text = texto
    elRetorno.value = valor;

    if (selecionado) {
        elRetorno.selected = "selected";
    }
    return elRetorno;
}

function ValidarJSON(json) {
    try {
        if (typeof json == 'object') {
            JSON.parse(JSON.stringify(json));
            return true;
        }
        else
            JSON.parse(json);

    } catch (e) {
        return false;
    }
}


//Adiciona o elemento de alerta à página com o texto e tipo informado por parâmetro.
var TiposMensagem = { Alerta: 'A', Erro: 'E', Sucesso: 'S' };
function ExibirMensagem(Mensagem, Tipo, elInserirAntes) {

    var dvMensagem = $('<div />', { id: 'dvMensagem', 'class': 'alert' });
    var btnFechar = $('<button type="button" class="close" data-dismiss="alert"></button>');

    switch (Tipo) {
        case TiposMensagem.Alerta:
            dvMensagem.addClass('alert-warning');
            break;
        case TiposMensagem.Erro:
            dvMensagem.addClass('alert-danger');
            break;
        default:
            dvMensagem.addClass('alert-success');
            break;
    }

    var msgExistente = elInserirAntes.prev();
    if (msgExistente.length > 0 && msgExistente.attr('id') == 'dvMensagem') {
        msgExistente.remove();
    }

    dvMensagem.text(Mensagem).prepend(btnFechar);
    dvMensagem.insertBefore(elInserirAntes);
}

//Esconde as mensagens de 'ação executada com sucesso' dentro do elemento passado como parâmetro
function EsconderMensagemPadraoWES(el) {
    var msg = $(el).find('.alert-info');
    msg.remove();
}

function EsconderMensagem(el) {
    $(el).find('.alert').remove();
}

//Gera números aleatório tendo como base a data atual no momento de chamada da function.
function GerarNumeroAleatorio() {
    return moment().format('YYYYMMDDHHmmssSSS');
}

function LimparClasseTopAction(portlet) {
    // Selecionar todas as divs com a classe "top-actions"
    var topActions = document.querySelectorAll('.top-actions');

    // Iterar sobre cada div com a classe "top-actions"
    topActions.forEach(function (element) {
        // Verificar se há um elemento irmão anterior
        if (element.parentNode !== null) {
            // Verificar se o ID da div anterior começa com "portlet"
            var previousDivId = element.parentNode.id;
            if (previousDivId.startsWith('portlet_' + portlet)) {
                // Remover apenas a classe "top-actions" da div
                element.classList.remove('top-actions');
            }
        }
    });
}

String.prototype.replaceAll = function (pesquisar, alterar) {
    if (alterar === undefined) {
        return this.toString();
    }
    return this.split(pesquisar).join(alterar);
};