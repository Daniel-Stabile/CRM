window.fluxoFinanceiroDatatable;
//var responseDatatable;
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

        var dictionary = [];
        jQuery.fn.dataTable.Api.register('row.addByPos()', function (data, index) {
            //insert the row
            this.row.add(data);
            //move added row to desired index
            var rowCount = this.data().length - 1,
                insertedRow = this.row(rowCount).data(),
                tempRow;

            for (var i = rowCount; i >= index; i--) {
                tempRow = this.row(i - 1).data();
                this.row(i).data(tempRow);
                this.row(i - 1).data(insertedRow);
            }

            return this;
        });


        $('#col-reg-4 div div.region-button').on('click', function () {
            if (fluxoFinanceiroDatatable)
                fluxoFinanceiroDatatable.draw();
        });


        var validacaoFluxo = jQuery.parseJSON($('#ctl00_Main_FluxoHandlesHiddenField').val());

        if (validacaoFluxo.msg.length != 0) {
            alert(validacaoFluxo.msg)
            return;
        }

        var url = Benner.Page.getApplicationPath() + 'api/FluxoCaixa/FluxoFinanceiroDatatable';
        $.ajax({
            cache: false,
            type: 'POST',
            dataType: 'JSON',
            url: url,
            data: { 'handlesFluxo': validacaoFluxo.handleList }
        }).done(function (data) {
            //alert("complete: " + status + "\n\nResponse: " + jqXHR.responseText);
            var result = jQuery.parseJSON(data)
            loadDatatable(result);
            fluxoFinanceiroDatatable.draw();
        }).fail(function (jqXHR, textStatus, error) {
            console.log(textStatus);
            var ex = jQuery.parseJSON(jqXHR.responseText)
            alert(ex.Message);
            console.log(ex.ExceptionMessage);
        });


        function loadDatatable(response) {

            var handleList = response.data.map(x => x.map(y => y.fluxoLabelHandle).filter(z => z != null && z !== 0));

            var resultx = Array.prototype.concat.apply([], handleList);

            var uniqueHandles = [];
            $.each(resultx, function (i, el) {
                if ($.inArray(el, uniqueHandles) === -1) uniqueHandles.push(el);
            });


            uniqueHandles.forEach(element => {
                var color = ['#9A9487', '#758028', '#E89BC5', '#8D84A8', '#157485', '#53C2C2', '#EAB241', '#D4FAEC', '#A96389', '#01A6AD'];
                var randomColor = null;

                do {
                    var randomColorTemp = color[Math.floor(Math.random() * 10)];
                    if (dictionary.filter(x => x.color == randomColorTemp).length > 0)
                        continue;
                    randomColor = randomColorTemp
                } while (randomColor == null);

                dictionary.push({ handle: element, color: randomColor });
            });


            function getAllIndexes(arr, val) {
                var indexes = [], i;
                for (i = 0; i < arr.length; i++)
                    if (arr[i].tipoValorColuna !== ''
                        && arr[i].tipoValorColuna !== 'P'
                        && arr[i].tipoValorColuna === val)
                        indexes.push(i);
                return indexes;
            }

            function getAllIndexesByHandle(arr, val) {
                var indexes = [], i;
                for (i = 0; i < arr.length; i++)
                    if (arr[i].fluxoLabelHandle !== ''
                        && arr[i].fluxoLabelHandle == val)
                        indexes.push(i);
                return indexes;
            }

            function getAllIndexesForHidden(arr) {
                var indexes = [], i;
                for (i = 0; i < arr.length; i++)
                    if (arr[i].tipoValorColuna !== ''
                        && arr[i].tipoValorColuna !== null
                        && arr[i].tipoValorColuna !== 'P')
                        indexes.push(i);
                return indexes;
            }

            $('.visibility-control').on('change', function () {
                var value = $(this).val();
                var checked = $(this).is(":checked");
                var indexes = getAllIndexes(response.columns, value);
                fluxoFinanceiroDatatable.columns(indexes).visible(checked);
            });

            hiddenColumnsIndexes = getAllIndexesForHidden(response.columns);
            var datatableOptions = {
                aoColumnDefs: configureColumnDefsCallback(response.columns),
                scrollCollapse: true,
                scrollY: "600px",
                processing: false,
                serverSide: false,
                filter: false,
                paging: false,
                ordering: false,
                info: false,
                orderMulti: false,
                order: [
                    [1, 'asc']
                ],
                dom: 'Bfrtip',
                buttons: [
                    {
                        text: "&nbsp;&nbsp;Excel",
                        extend: 'excel',
                        title: () => $("#breadcrumbUpdatePanel div ul li a:eq(1)").text(),
                        className: 'btn green-meadow fa fa-file-excel-o'
                    },
                    {
                        text: "&nbsp;&nbsp;PDF",
                        extend: 'pdfHtml5',
                        orientation: 'landscape',
                        pageSize: 'TABLOID',
                        title: () => $("#breadcrumbUpdatePanel div ul li a:eq(1)").text(),
                        className: 'btn red fa fa-file-pdf-o'
                    }
                ],
                columns: configureColumns(response),
                
                data: response.data,
                rowCallback: configureRowCallback,
                headerCallback: configureHeaderCallback,
                drawCallback: configureDrawCallback,
                initComplete: configureInitComplete
            };

            function configureColumnDefsCallback(columns) {
                var list = new Array();


                for (let index = 0; index < dictionary.length; index++) {
                    let element = dictionary[index];
                    var columnsIndexes = getAllIndexesByHandle(columns, element.handle)
                    list.push({ "className": "handle-fluxo-" + element.handle, "aTargets": columnsIndexes });
                }

                var hiddenColumnsIndexes = getAllIndexesForHidden(columns);
                list.push({ "bVisible": false, "aTargets": hiddenColumnsIndexes });

                return list;
            }

            const TAMANHO_MAXIMO_TABELA_SEM_SCROLL = 12;
            if (response.columns.length > TAMANHO_MAXIMO_TABELA_SEM_SCROLL) {
                datatableOptions.scrollX = true;
                datatableOptions.fixedColumns = {
                    leftColumns: 1
                }
            }

            var nivelMaximo = 1;
            var qtdCaracteresMaximo = 30;

            function configureColumns(result) {

                $.each(result.data, function (index, value) {
                    var nivel = value[0].nivel.split(".").length;
                    if (nivel > nivelMaximo) {
                        nivel = nivelMaximo;
                    }

                    var qtdCaracteres = value[0].value.length;
                    if (qtdCaracteres > qtdCaracteresMaximo) {
                        qtdCaracteresMaximo = qtdCaracteres;
                    }
                });

                $.each(result.columns, function (index, value) {
                    var firstColumnWidth = (qtdCaracteresMaximo * 7) + (nivelMaximo * 10);
                    var maxFirstColumnWidth = 350;
                    if (firstColumnWidth > maxFirstColumnWidth) {
                        firstColumnWidth = maxFirstColumnWidth;
                    }
                    if (index === 0) {
                        value.width = firstColumnWidth + "px";
                        value.className = 'details-control';
                    }
                    value.render = function (data, type, row, meta) {
                        return data.value;
                    };

                });

                return result.columns;
            }

            function configureRowCallback(row, data, index) {
                const FIRST_COLUMN_INDEX = 0;
                var nivel = data[FIRST_COLUMN_INDEX].nivel;
                var tipo = data[FIRST_COLUMN_INDEX].tipo;
                var handleCenario = data[FIRST_COLUMN_INDEX].handleCenario;

                $(row).css('font-weight', 'normal');
                $(row).attr('data-handle', null);

                $(row).attr('data-tipo-registro', tipo);
                $(row).attr('data-nivel', nivel);
                $(row).attr('data-nivel', nivel);
                $(row).attr('data-handle-cenario', handleCenario);


                if (tipo === "S") {
                    $(row).css('font-weight', 'bold');
                }

                if (tipo === "A") {
                    $(row).attr('data-handle', nivel);
                }

                var nivelAtual = nivel.split(".").length;
                $('td:first', $(row)).css('padding-left', nivelAtual * 10 + "px");
            }

            function configureHeaderCallback(thead, data, start, end, display) {
                $('th:not(:first)', $(thead)).css('text-align', 'right');
            }

            function configureDrawCallback(settings) {
                $('td:not(:first)', $('tbody tr', this)).css('text-align', 'right');
            }

            function configureInitComplete(settings, json) {

                configureFixedColumns();

                $('#ftable tbody').on('click', 'tr[data-tipo-registro=A] td.details-control', function () {
                    var tr = $(this).closest('tr');
                    var nivel = tr.data('nivel');
                    var handleCenario = tr.data('handleCenario');
                    var row = fluxoFinanceiroDatatable.row(tr);
                    var rowIndex = row.index() + 1;
                    var insertAtIndex = row.index() + 2;


                    for (var i = 0; i < response.columns.length; i++) {
                        if (response.columns[i].tipoValorColuna !== 'p' && response.columns[i].tipoValorColuna !== '') {
                            var column = window.fluxoFinanceiroDatatable.column(i);
                            column.visible(false);
                        }

                    }


                    if ($('#ftable tbody tr[data-nivel^="' + nivel + '."]').length) { //esconder
                        fluxoFinanceiroDatatable
                            .rows($('[data-nivel^="' + nivel + '."]'))
                            .remove()
                            .draw();
                    } else { // exbibir

                        // adicionar novos dados na linha abaixo da que está "abrindo"
                        var url = Benner.Page.getApplicationPath() + 'api/FluxoCaixa/FluxoFinanceiroDatatableAnalitico';
                        $.ajax({
                            type: 'POST',
                            dataType: 'JSON',
                            url: url,
                            data: { 'handleCenario': handleCenario, 'handleFluxo': handleFluxo },
                        }).done(function (data) {
                            var result = jQuery.parseJSON(data)
                            $.each(result.data, function (i, el) {
                                fluxoFinanceiroDatatable
                                    .row
                                    .addByPos(el, insertAtIndex + i)
                                    .draw();
                            });
                        }).fail(function (jqXHR, textStatus, errorThrown) {
                            console.log(textStatus);
                            alert(textStatus)
                        });
                    }


                    configureFixedColumns();
                });


                dictionary.forEach(element => {
                    $('.handle-fluxo-' + element.handle).css('background-color', element.color);
                });
            }


            var intervalFixedColumns;

            function configureFixedColumns() {
                intervalFixedColumns = setInterval(configureFixedColumnsInterval, 100);
                $(".dt-buttons").css("transform", "translateY(-160%)");
            }

            function configureFixedColumnsInterval() {
                var trs = $('.DTFC_Cloned tr[data-tipo-registro=A]');
                if (trs) {
                    $(trs).css('cursor', 'pointer');
                    $(trs).hover(
                        function () {
                            $(this).css('text-decoration', 'underline');
                        },
                        function () {
                            $(this).css('text-decoration', 'none');
                        });
                    trs.on('click', function () {
                        //carregarLancamentos(this, $(this).data('handle'));
                    });

                    clearInterval(intervalFixedColumns);
                }
            }

            window.fluxoFinanceiroDatatable = $('#ftable').DataTable(datatableOptions);



            // Add event listener for opening and closing details
            $('#table_id_3 tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    // This row is already open - close it
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    // Open this row
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                }
            });
        }
    })
    .fail(function (jqxhr, settings, exception) {
        console.log("Erro ao carregar JS DataTables " + exception);
    });
