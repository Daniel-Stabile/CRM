/// <reference path="~/Scripts/jquery-2.1.0.intellisense.js" />
/// <reference path="~/Scripts/jquery-2.1.0.js" />


var AGADev = function () {
    return {

        showGridInfo: function (portlet) {
            // Verifica dados de GRID
            var linhas = $(portlet).find('tr[handle]');
            if (linhas.length == 0)
                return false;

            var msg = "Handles do grid: \n";
            $(linhas).each(function (index, obj) {
                msg += '\n';
                var linha = $(obj).attr("handle");
                var tds = $(obj).find("td:not(.column-action)");
                if (tds.length > 0) {
                    for (var i = 0; ((i < tds.length) && (linha.length < 50)) ; i++) {
                        linha += ' | ' + $(tds[i]).text();
                    }
                }
                msg += linha + '\n';
            });
            alert(msg);
            return true;
        },

        showFormInfo: function (portlet) {
            // Verifica dados de GRID
            var campos = $(portlet).find('[data-field]');
            if (campos.length == 0)
                return false;

            var valores = {};

            $(campos).each(function (index, obj) {
                var nome = $(obj).attr('data-field');
                var valor = $(obj).attr('value');
                if (valor) {
                    if (valor.length > 50)
                        valor = valor.substring(0, 50);
                }

                if (valor)
                    valores[nome] = valor;
            });

            var lista = [];
            for (var p in valores) {
                lista.push({ nome: p, valor: valores[p] });
            }
            lista.sort(function (a, b) { return (a.nome > b.nome) ? 1 : (a.nome < b.nome ? -1 : 0); });

            var msg = 'Valores dos campos(HANDLE = ' + valores["HANDLE"] + '): \n';
            for (var i = 0; i < lista.length; i++) {
                msg += lista[i].nome + ': ' + lista[i].valor + ' \n';
            }

            alert(msg);
            return true;
        },

        inspect: function (e) {
            var portlet = $(e.target).closest('.portlet');

            if (AGADev.showGridInfo(portlet))
                return;

            if (AGADev.showFormInfo(portlet))
                return;
        }
    };
}();

$(document).ready(function () {

    var html = '<a class="no-border btn btn-default btn-sm aga-dev"><i class="fa fa-bug"></i></a>';
    $(".portlet-title>.actions>.btn-group").append(html);

    $(document).on("click", ".aga-dev", AGADev.inspect);



});