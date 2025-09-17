$(function () {

    ExibeOcultaTodosDetalhes = function (campo) {
        var exibe = false;
        if ($(campo).hasClass('fa-plus-square')) {
            $(campo).addClass('fa-minus-square').removeClass('fa-plus-square');
            exibe = true;
        } else {
            $(campo).addClass('fa-plus-square').removeClass('fa-minus-square');
        }

        var btnDetalhes = $('tbody .btnExibeDetalhes');
        btnDetalhes.each(function () {
            ExibeOcultaDetalhes(this, exibe);
        });

        btnDetalhes = $('tfoot .btnExibeDetalhesTotais');
        btnDetalhes.each(function () {
            ExibeOcultaDetalhes(this, exibe);
        });
    };

    ExibeOcultaDetalhes = function (campo, exibe) {
        var linha = $(campo).parent().parent();

        if (!linha.next('tr').hasClass('detalhes')) {
            var colspan = $(campo).parents("table").find('tr:first').children().length;
            $("<tr class=detalhes><td colspan="+colspan+">Nenhum registro encontrado.</td></tr>").insertAfter(linha);
        }
            

        if ($(campo).hasClass('fa-plus-square') || exibe) {
            $(campo).addClass('fa-minus-square').removeClass('fa-plus-square');
            var lDetalhes = linha.nextUntil(':not([class="detalhes"])');
            if (lDetalhes.length == 0)
                lDetalhes = linha.nextUntil('[class*="detalhesTotais"]');
            lDetalhes.show();
        } else {
            $(campo).addClass('fa-plus-square').removeClass('fa-minus-square');
            var lDetalhes = linha.nextUntil(':not([class="detalhes"])');
            if (lDetalhes.length == 0)
                lDetalhes = linha.nextUntil('[class*="detalhesTotais"]');
            lDetalhes.hide();
        }
    };

    ExportarGridExcelClick = function (grid, name, sheetName) {
        $(grid).table2excel({
            filename: name,
            name: name,
            exclude: ".noExl",
            sheetName: sheetName
        });
    };

});


