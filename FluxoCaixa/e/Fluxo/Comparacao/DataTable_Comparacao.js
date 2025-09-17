window.fluxoFinanceiroDatatable;
window.celulasBackground = {};
var app = {};
var pdfWidth = 1500;
var pdfHeight = 500;

$.getScript("../../../../content/custom/datatables.min.js")
    .done(function (script, textStatus) {

        var dictionary = [];
        var fluxos = [];

        var validacaoFluxo = jQuery.parseJSON($('#ctl00_Main_FluxoHandlesHiddenField').val());

        if (validacaoFluxo.msg.length != 0) {
            alert(validacaoFluxo.msg);
            return;
        }

        LoaderCarregando();

        var url = Benner.Page.getApplicationPath() + 'api/FluxoCaixa/FluxoFinanceiroDatatable';
        $.ajax({
            cache: false,
            type: 'POST',
            dataType: 'JSON',
            url: url,
            data: { 'handlesFluxo': validacaoFluxo.handleList }
        }).done(function (data) {
            
            var result = jQuery.parseJSON(data);
            pdfWidth = result.columns.length * 45;
            pdfHeight = result.data.length * 40;
            loadDatatable(result);            
            Benner.ModalMessage.hide();

        }).fail(function (jqXHR, textStatus, error) {
            console.log(textStatus);
            var ex = jQuery.parseJSON(jqXHR.responseText);
            alert(ex.Message);
            console.log(ex.ExceptionMessage);
            Benner.ModalMessage.hide();
        });

        function LoaderCarregando() {
            Benner.ModalMessage.show("Carregando");
        }

        
        function loadDatatable(response) {

            app = new Vue({
                el: '#app-fluxo',
                data: {
                    colunas: [],
                    linhas: [],
                    legendas: [],
                    exibirRealizado: true
                },
                computed: {
                    grupoColunas: function () {
                        var datas = [];

                        if (this.colunas.length > 0) {
                            datas.push({ title: "", colspan: 1 });
                        }

                        if (this.exibirRealizado) {
                            for (var i = 1; i < this.colunas.length; i = i + 2) {

                                datas.push({ title: this.colunas[i].title, colspan: 2 });
                            }
                        }
                        else {
                            for (var i = 1; i < this.colunas.length; i = i + 2) {

                                datas.push({ title: this.colunas[i].title, colspan: 1 });
                            }
                            for (var i = 1; i < this.colunas.length; i = i + 2) {

                                datas.push({ title: this.colunas[i].title, colspan: 1 });
                            }
                        }

                        return datas;
                    }
                },
                methods: {
                    checkBoxRealizadoClick: function () {

                        if (this.exibirRealizado) {
                            $(".td-fx-realizado").hide();
                            
                            pdfWidth = this.linhas[0].length * 23;
                        }
                        else {
                            $(".td-fx-realizado").show();
                            
                            pdfWidth = this.linhas[0].length * 42;
                        }
                    },
                    obterValorCabecalho: function (index) {

                        if (index === 0)
                            return "";

                        if (index % 2 === 0) {
                            return "Realizado";
                        }
                        else {
                            return "Previsto";
                        }
                    },
                    obterClasse: function (index) {

                        if (index === 0)
                            return "";

                        var classe = '';

                        if (response.columns[index].fluxoLabelHandle == dictionary[0].handle) {
                            classe = " td-fx-primeiro-fluxo ";
                        }

                        if (response.columns[index].fluxoLabelHandle == dictionary[1].handle) {
                            classe = " td-fx-segundo-fluxo ";
                        }

                        if (index % 2 === 0) {

                            classe += " td-fx-realizado ";
                        }
                        else {

                            classe += " td-fx-previsto ";
                        }

                        return classe;
                    },
                    obterClasseLinha: function (colunas) {

                        var primeiraCelula = colunas[0];

                        if (primeiraCelula.tipo === "S") {
                            return "row-fx-sintetico";
                        }
                    },
                    exportarPdf: function () {
                        
                        var pdf = montarPdf(this.exibirRealizado);

                        pdfMake.createPdf(pdf).download(response.fluxos[0].nome.replace('.', '') + ' - ' + response.fluxos[1].nome.replace('.', ''));
                    },
                    cellClick: function (cell, index) {

                        if (cell.value !== 0 && (cell.tipo === "R" || cell.tipo === "A")) {
                            abrirDetailModal(cell, index);
                        }
                    },
                    exportarExcel: function () {
                        obterExcel();
                    }
                }
            });

            fluxos = response.fluxos;

            dictionary.push({ handle: fluxos[0].handleFluxo, color: '#d5dfe4', nomeFluxo: fluxos[0].nome });
            dictionary.push({ handle: fluxos[1].handleFluxo, color: '#d2d2d2', nomeFluxo: fluxos[1].nome });

            app.colunas = response.columns;
            app.linhas = response.data;
            app.legendas = dictionary;

            function obterLarguraPdf(exibirRealizado) {
                var largura = 250;

                if (exibirRealizado) {

                    largura = (250 + response.columns.length * 200) / 4.9;
                }
                else {
                    largura = (250 + response.columns.length * 200) / 9;
                }

                return largura;
            }

            function obterAlturaPdf() {

                var largura = response.data.length * 35;

                return largura;
            }

            function montarPdf(exibirRealizado) {                

                var docDefinition = {
                    pageSize: { width: obterLarguraPdf(exibirRealizado), height: obterAlturaPdf() },
                    title: response.fluxos[0].nome,
                    pageOrientation: 'landscape'
                };

                dadosPdf(docDefinition);

                return docDefinition;
            }

            function dadosPdf(doc) {

                function obterColunasPrevistas() {

                    var previstas = [];

                    for (i = 0; i < response.columns.length; i = i + 1) {

                        if (response.columns[i].tipoValorColuna == "P" || i == 0) {
                            previstas.push(response.columns[i]);
                        }
                    }

                    return previstas;
                }

                doc.content = [];

                doc.content.push({ text: response.fluxos[0].nome, style: 'nomeFluxo' });

                var tableLegenda = {
                    body: []
                };

                var legendaPrimeiroFluxo = [];

                legendaPrimeiroFluxo.push({
                    text: dictionary[0].nomeFluxo,
                    style: "primeiroFluxo"
                });

                tableLegenda.body.push(legendaPrimeiroFluxo);

                var legendaSegundoFluxo = [];

                legendaSegundoFluxo.push({
                    text: dictionary[1].nomeFluxo,
                    style: "segundoFluxo"
                });

                tableLegenda.body.push(legendaSegundoFluxo);

                doc.content[0].table = tableLegenda;

                var table = {};
                var content2 = {};

                table.body = [];

                var headerColumns = [];

                var exibirRealizado = $("#checkBoxValorRealizado")[0].checked;

                if (exibirRealizado) {

                    headerColumns.push({ text: "CONTAS GERENCIAIS", style: "tableHeader" });

                    for (i = 1; i < response.columns.length; i = i + 1) {

                        var headerColumn = {};
                        var columnText = response.columns[i].title;

                        headerColumn.colSpan = 2;
                        headerColumn.text = columnText;
                        headerColumn.style = "tableHeader";
                        headerColumns.push(headerColumn);
                    }

                    table.body.push(headerColumns);

                    headerColumns = [];

                    for (i = 0; i < response.columns.length; i = i + 1) {

                        var headerColumn = {};

                        if (i === 0)
                            headerColumn.text = "";
                        else
                            if (i % 2 === 0) {
                                headerColumn.text = "Realizado";
                            }
                            else {
                                headerColumn.text = "Previsto";
                            }

                        headerColumn.style = "tableHeader";
                        headerColumns.push(headerColumn);
                    }

                    table.body.push(headerColumns);

                    var cells = response.data;

                    for (var i = 0; i < cells.length; i++) {

                        var row = [];

                        for (var j = 0; j < cells[i].length; j++) {

                            var cell = {};
                            cell.text = cells[i][j].value;

                            if (response.columns[j].fluxoLabelHandle == dictionary[0].handle) {
                                cell.style = "primeiroFluxo";
                            }

                            if (response.columns[j].fluxoLabelHandle == dictionary[1].handle) {
                                cell.style = "segundoFluxo";
                            }

                            if (!isNaN(cell.text.replaceAll('.', '').replace(',', '.') % 1)) {

                                cell.alignment = 'right';

                                if (cell.text === '00,00' || cell.text === '0,00') {
                                    cell.text = '';
                                }
                            }

                            row.push(cell);
                        }

                        table.body.push(row);
                    }
                }
                else {

                    var colunasPrevistas = obterColunasPrevistas();

                    var novosDados = [];

                    for (i = 0; i < colunasPrevistas.length; i = i + 1) {

                        headerColumn = {};
                        columnText = colunasPrevistas[i].title;

                        headerColumn.text = columnText;
                        headerColumn.style = "tableHeader";
                        headerColumns.push(headerColumn);
                    }

                    table.body.push(headerColumns);

                    headerColumns = [];

                    for (i = 0; i < colunasPrevistas.length; i = i + 1) {

                        headerColumn = {};
                        headerColumn.text = i == 0 ? "" : "Previsto";
                        headerColumn.style = "tableHeader";
                        headerColumns.push(headerColumn);
                    }

                    table.body.push(headerColumns);

                    cells = response.data;

                    for (var i = 1; i < cells.length; i++) {

                        var row = [];

                        for (var j = 0; j < cells[i].length; j++) {

                            if (j != 0 && j % 2 == 0) {
                                continue;
                            }

                            var cell = {};
                            cell.text = cells[i][j].value;

                            if (response.columns[j].fluxoLabelHandle == dictionary[0].handle) {
                                cell.style = "primeiroFluxo";
                            }

                            if (response.columns[j].fluxoLabelHandle == dictionary[1].handle) {
                                cell.style = "segundoFluxo";
                            }

                            if (!isNaN(cell.text.replaceAll('.', '').replace(',', '.') % 1)) {

                                cell.alignment = 'right';

                                if (cell.text === '00,00' || cell.text === '0,00') {
                                    cell.text = '';
                                }
                            }

                            row.push(cell);
                        }

                        table.body.push(row);
                    }
                }

                content2.table = table;

                doc.content.push(content2);


                doc.pageMargins = [10, 10, 10, 10];

                doc.defaultStyle = {};
                doc.defaultStyle.fontSize = 7;

                doc.styles = {};
                doc.styles.tableHeader = {};
                doc.styles.tableHeader.fontSize = 7;
                doc.styles.tableHeader.alignment = 'center';
                doc.styles.tableHeader.bold = true;

                doc.styles.title = {};
                doc.styles.title.fontSize = 9;

                doc.styles.nomeFluxo = {};
                doc.styles.nomeFluxo.margin = [0, 0, 0, 10];

                doc.styles.primeiroFluxo = { fillColor: dictionary[0].color };
                doc.styles.segundoFluxo = { fillColor: dictionary[1].color };

                // Remove spaces around page title
                //doc.content[0].text = doc.content[0].text.trim();
                // Styling the table: create style object
                var objLayout = {};

                // Horizontal line thickness
                objLayout['hLineWidth'] = function (i, node) {
                    return .5;
                };
                // Vertikal line thickness
                objLayout['vLineWidth'] = function (i) { return .5; };
                // Horizontal line color
                objLayout['hLineColor'] = function (i) { return '#aaa'; };
                // Vertical line color
                objLayout['vLineColor'] = function (i) { return '#aaa'; };
                // Left padding of the cell
                objLayout['paddingLeft'] = function (i) { return 2; };
                // Right padding of the cell
                objLayout['paddingRight'] = function (i) { return 2; };

                //http://pdfmake.org/playground.html

                doc.content[1].layout = objLayout;

            }

            function obterExcel() {

                var validacaoFluxo = jQuery.parseJSON($('#ctl00_Main_FluxoHandlesHiddenField').val());

                var exibirRealizado = $("#checkBoxValorRealizado")[0].checked;

                var urlExcel = Benner.Page.getApplicationPath()
                    + 'api/FluxoCaixa/ExcelExport?handlesFluxo%5B%5D='
                    + validacaoFluxo.handleList[0]
                    + '&handlesFluxo%5B%5D='
                    + validacaoFluxo.handleList[1]
                    + '&exibirRealizado='
                    + exibirRealizado;


                $("#frameExport").attr('src', urlExcel);
            }
        }
    })
    .fail(function (jqxhr, settings, exception) {
        console.log("Erro ao carregar JS DataTables " + exception);
    });


$(document).ready(function () {  

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