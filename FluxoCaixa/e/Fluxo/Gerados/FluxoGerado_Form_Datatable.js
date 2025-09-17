var fluxoFinanceiroDatatable;
var app = {};
var pdfWidth = 1500;
var pdfHeight = 500;
//var coluna: 0;

//Área de carregamento para os CSS's
$("<link/>", {
    rel: "stylesheet",
    type: "text/css",
    href: "../../../../content/custom/datatables.min.css"
}).appendTo("head");

$("<link/>", {
    rel: "stylesheet",
    type: "text/css",
    href: "FluxoGerado_Form.css"
}).appendTo("head");



//Área de carregamento de scripts terceiros
$.getScript("../../../../content/custom/datatables.min.js")
    .done(function (script, textStatus) {

        var handleFluxo = $('span[data-field="HANDLE"] > input').val();

        if (handleFluxo > 0) {
            LoaderCarregando();

            var url = Benner.Page.getApplicationPath() + 'api/FluxoCaixa/FluxoFinanceiroDatatable';
            $.ajax({
                cache: false,
                type: 'POST',
                dataType: 'JSON',
                url: url,
                data: { 'handlesFluxo': [handleFluxo] }
            }).done(function (data) {
                //alert("complete: " + status + "\n\nResponse: " + jqXHR.responseText);
                var result = jQuery.parseJSON(data);
                if (result !== null) {
                    pdfWidth = result.columns.length * 44;
                    pdfHeight = result.data.length * 40;                
                    loadDatatable(result);
                    LoaderCarregando();
                }

                //$(".td-fx-invisivel").hide();


                Benner.ModalMessage.hide();
                

            }).fail(function (jqXHR, textStatus, error) {
                console.log(textStatus);
                alert(jQuery.parseJSON(jqXHR.responseText).Message);
                Benner.ModalMessage.hide();
                });            
        }

        function LoaderCarregando() {
            Benner.ModalMessage.show("Carregando");
        }

     

        function loadDatatable(response) {

            headerColumns = response.columns;

            app = new Vue({
                el: '#app-fluxo',
                data: {
                    colunas: [],
                    linhas: [],
                    exibirRealizado: true,
                    coluna: 0
                    
                },
                computed: {
                    grupoColunas: function () {
                        var datas = [];
                        var cssClass = '';                   

                        if (this.colunas.length > 0) {
                            datas.push({ title: "Contas Gerenciais", colspan: 1, cssClass: "td-cell-primeira-coluna"});
                        }

                        if (this.exibirRealizado) {
                            for (var i = 1; i < this.colunas.length; i = i + 2) {

                                if (this.colunas[i].visualizaApenasUmaTipo == true) {
                                    datas.push({ title: this.colunas[i].title, colspan: 1, cssClass: cssClass });
                                }
                                else {
                                  datas.push({ title: this.colunas[i].title, colspan: 2, cssClass: cssClass });
                                }
                                    
                            }
                        }
                        else {
                            for (var i = 1; i < this.colunas.length; i = i + 2) {

                                datas.push({ title: this.colunas[i].title, colspan: 1, cssClass: cssClass });
                            }
                        }

                        return datas;
                    }
                },
                methods: {
                    checkBoxRealizadoClick: function () {

                        if (this.exibirRealizado) {
                            $(".td-fx-invisivel").hide();
                            //$("#fx-cabecalho-realizado").hide();
                            pdfWidth = this.linhas[0].length * 24;
                        }
                        else {
                            $(".td-fx-invisivel").show();
                            //$("#fx-cabecalho-realizado").show();
                            pdfWidth = this.linhas[0].length * 44;
                        }
                    },
                    obterValorCabecalho: function (index, coluna) {                        

                        if (index === 0) {
                            return " ";                            
                        }                                             
           
                        if (index % 2 === 0) {
                            return "Realizado";
                        }
                        else {
                            return "Previsto"; 
                        }                                                    
                    },
                    obterClasse: function (coluna, index) {

                        if (index === 0)
                            return "td-cell-primeira-coluna";                                                                                            

                        if (index % 2 === 0) {
                            if (coluna.valorRealizadoVisivel == false)  {
                                return " td-fx-invisivel";
                            }
                            else {
                              if ((coluna.value !== 0 && (coluna.tipo === "R" || coluna.tipo === "A"))) {
                                  return " td-fx-realizado td-fx-possui-detalhe ";
                              }
                              return "td-fx-realizado "; 
                            }                            
                        }
                        else {
                            if (coluna.valorPrevistoVisivel == false)   {
                                return " td-fx-invisivel ";
                            }
                            else {
                              if (coluna.value !== 0 && (coluna.tipo === "R" || coluna.tipo === "A")) {
                                  return " td-fx-previsto td-fx-possui-detalhe ";
                              }
                              return " td-fx-previsto ";  
                            }                            
                        }
                    },
                    obterClasseLinha: function (colunas) {

                        var primeiraCelula = colunas[0];

                        if (primeiraCelula.tipo === "S") {
                            return "row-fx-sintetico";
                        }
                    },
                    exportarPdf: function () {

                        var pdf = montarPdf(this.exibirRealizado);

                        pdfMake.createPdf(pdf).download(response.fluxos[0].nome.replace('.', ''));
                    },
                    cellClick: function (cell, index) {

                        if (index === 0) {
                            return;
                        }

                        if (cell.value !== 0 && (cell.tipo === "R" || cell.tipo === "A")) {
                            abrirDetailModal(cell, index);
                        }
                    },
                    exportarExcel: function () {
                        obterExcel();
                    }
                }
            });

            app.colunas = response.columns;
            app.linhas = response.data;

            function obterLarguraPdf(exibirRealizado) {
                var largura = 250;

                if (exibirRealizado) {

                    largura = (250 + response.columns.length * 200) / 4.5;
                }
                else {
                    largura = (250 + response.columns.length * 200) / 9;
                }

                return largura;
            }

            function obterAlturaPdf() {                

                var largura = response.data.length * 35 / 2;

                if (largura < 200) {
                    return 200;
                }

                return largura;
            }


            function montarPdf(exibirRealizado) {
                
                var docDefinition = {
                    pageSize: { width: obterLarguraPdf(exibirRealizado), height: obterAlturaPdf() },
                    title: response.fluxos[0].nome ,
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

                var table = {};
                var content2 = {};

                table.body = [];

                var headerColumns = [];

                var exibirRealizado = true; //$("#checkBoxValorRealizado")[0].checked;

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

                    cells = response.data;

                    table.body.push(headerColumns);

                    for (var i = 0; i < cells.length; i++) {

                        var row = [];

                        for (var j = 0; j < cells[i].length; j++) {

                            if (j != 0 && j % 2 == 0) {
                                continue;
                            }

                            var cell = {};
                            cell.text = cells[i][j].value;

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
                doc.table = { dontBreakRows: true };

                doc.styles.title = {};
                doc.styles.title.fontSize = 9;

                doc.styles.nomeFluxo = {};
                doc.styles.nomeFluxo.margin = [0, 0, 0, 10];

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

                var handleFluxo = $('span[data-field="HANDLE"] > input').val();

                var exibirRealizado = true; // $("#checkBoxValorRealizado")[0].checked;

                var urlExcel = Benner.Page.getApplicationPath()
                    + 'api/FluxoCaixa/ExcelExport?handlesFluxo%5B%5D='
                    + handleFluxo
                    + '&exibirRealizado='
                    + exibirRealizado;


                $("#frameExport").attr('src', urlExcel);
            }

            function abrirDetailModal(cell, indiceColuna) {

                var realizado = cell.tipo === "R";

                var fluxo = $('span[data-field="HANDLE"] > input').val();

                // Detalhe dos valores
                LoaderCarregando();
                var url = Benner.Page.getApplicationPath() + 'api/FluxoCaixa/FluxoFinanceiroDetail';
                $.ajax({
                    type: 'POST',
                    dataType: 'JSON',
                    url: url,
                    data: {
                        'handleCenario': cell.handleCenario,
                        'indiceColuna': indiceColuna,
                        'handleContaGerencial': cell.handle,
                        'realizado': realizado,
                        'handleFluxo': fluxo
                    }
                }).done(function (data) {

                    var jsonResult = JSON.parse(data);
                    var realizado = jsonResult[0].Realizado;

                    labelData = "Vencimento";

                    if (realizado) {
                        $("#titulo-modal").text("Movimentos");
                        labelData = "Data Movimento";
                    }
                    else {
                        $("#titulo-modal").text("Lançamentos");
                    }

                    var detail = "<table width='100%' border='1' style='font-size: 14px; border-color: grey;'><tr style='font-weight: bold;'><th style='padding-left: 10px;'>Número</th><th style='text-align: center;'>" + labelData + "</th><th style='text-align: right; padding-right: 10px;'>Valor</th></tr> ";
                    $.each(jsonResult, function (key, value) {
                        if (value.Ativo == "N")
                            detail += "<tr style='text-decoration:line-through'>";
                        else
                            detail += "<tr>";
                        detail += "<td style='padding-left: 10px;'>" + value.NumeroLancamento + "</td>";
                        detail += "<td style='text-align: center;'>" + value.DataVencimento + "</td>";
                        detail += "<td style='text-align: right; padding-right: 10px;'>" + value.Valor + "</td></tr>";
                    });
                    detail += "</table>";
                    $('#cenarioDetail [class=modal-body]').html(detail);
                    $('#cenarioDetail').modal('toggle');
                    Benner.ModalMessage.hide();
                }).fail(function (jqXHR, textStatus, errorThrown) {
                    console.log(textStatus);
                    Benner.ModalMessage.hide();
                });
            }                        
        }
    })
    .fail(function (jqxhr, settings, exception) {
        console.log("Erro ao carregar JS DataTables " + exception);
    });