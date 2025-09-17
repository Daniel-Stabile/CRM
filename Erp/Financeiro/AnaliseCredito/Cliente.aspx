<%@ Page Title="Cliente" Language="C#" Inherits="aga.e.Financeiro.AnaliseCredito.Cliente" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="AnaliseCliente" ContentPlaceHolderID="Main" runat="Server">
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/pdfmake/pdfmake.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/jszip/jszip.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/FileSaver.js/FileSaver.min.js"></script>
    <script src="../../../Content/assets/plugins/amcharts/plugins/export/libs/fabric.js/fabric.min.js"></script>
    <style>
        #ResumoMensal {
            width: 100%;
            height: 360px;
        }

        #ResumoMensalComparativo {
            width: 100%;
            height: 360px;
        }

        #saldoDevedor {
            width: 100%;
            height: 300px;
        }

        table.tableColumnValue {
            width: 100%;
            text-align: right;
        }

        td.valueSaldo {
            padding-right: 24px;
            width: 50%;
        }

        .note {
            font-family: "Open Sans", sans-serif;
        }

        .block.caption {
            font-size: 20px;
        }

        .note td {
            padding-right: 10px;
            font-size: 12px;
            vertical-align: text-bottom;
        }

        td.textValue {
            font-size: 15px !important;
        }

        .note.note-success {
            color: #27a4b0;
        }

        .note.note-info {
            color: #327ad5;
        }

        .note.note-warning {
            color: #c29d0b;
        }

        .note.note-danger {
            color: #e73d4a;
        }

        .currencyvalue {
            display: inline-table;
            white-space: nowrap;
        }
    </style>
    <div class="row" style="padding-left: 10px;">
        <div class="col-xs-12 col-sm-12 col-md-4 col-lg-4">
            <div class="row">
                <div class="row">
                    <div>
                        <wes:AjaxForm runat="server" ID="ANALISECLIENTE" FormMode="View" Title="Análise Cliente"
                            BootstrapCols="12" ShowTitle="True" EntityViewName="GN_PESSOAS.ANALISECREDITO.FORM"
                            CanDelete="False" CanUpdate="True" CanInsert="False" ChromeState="Fixed"
                            IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="967"
                            HideDeveloperCommands="false" OnCommandExecute="ANALISECLIENTE_CommandExecute" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-8">
            <div class="tabbable-line portlet light">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_overview" data-toggle="tab" aria-expanded="true"><i class="fa fa-pie-chart font-dark"></i>&nbsp;Overview</a></li>
                    <li class=""><a href="#tab_saldoDevedor" data-toggle="tab" aria-expanded="true"><i class="fa fa-arrow-down font-red"></i>&nbsp;Saldo devedor</a></li>
                    <li class=""><a href="#tab_resumoMensal" data-toggle="tab" aria-expanded="true"><i class="fa fa-area-chart"></i>&nbsp;Resumo mensal</a></li>
                    <li class=""><a href="#tab_documentos" data-toggle="tab" aria-expanded="true"><i class="fa fa-file-text-o"></i>&nbsp;Documentos</a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_overview">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="note note-success">
                                    <div class="block caption"><b>Última compra</b></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Data</td>
                                                <td class="textValue" data-field="CUSTOM_DATAULTIMACOMPRA"></td>
                                            </tr>
                                            <tr>
                                                <td>Valor</td>
                                                <td class="currencyvalue textValue" data-field="CUSTOM_VALORULTIMACOMPRA"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="note note-info">
                                    <div class="block caption"><b>Maior compra</b></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Data</td>
                                                <td class="textValue" data-field="CUSTOM_DATAMAIORCOMPRA"></td>
                                            </tr>
                                            <tr>
                                                <td>Valor</td>
                                                <td class="currencyvalue textValue" data-field="CUSTOM_VALORMAIORCOMPRA"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="note note-warning">
                                    <div class="block caption"><b>Maior acúmulo</b></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Data</td>
                                                <td class="textValue" data-field="CUSTOM_DATAMAIORACUMULO"></td>
                                            </tr>
                                            <tr>
                                                <td>Valor</td>
                                                <td class="currencyvalue textValue" data-field="CUSTOM_VALORMAIORACUMULO"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="note note-danger">
                                    <div class="block caption"><b>Atrasos</b></div>
                                    <table>
                                        <tbody>
                                            <tr>
                                                <td>Médio</td>
                                                <td class="textValue" data-field="CUSTOM_ATRASOMEDIO"></td>
                                            </tr>
                                            <tr>
                                                <td>Maior</td>
                                                <td class="textValue" data-field="CUSTOM_MAIORATRASO"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div>
                                <wes:SimpleGrid runat="server" ID="PARCELAS_PAGTONEG"
                                    ProviderWidgetUniqueId="ANALISECLIENTE" UserDefinedPageSize="6"
                                    UserDefinedCriteriaWhereClause="" Mode="Search" ShowTitle="true"
                                    Title="Pagamentos negativados" CompanyFilterMode="CompanyAndBranch"
                                    DisplayRowCommand="false" UserDefinedDisableRowSelection="true" CanInsert="false"
                                    CanUpdate="false" CanDelete="false"
                                    EntityViewName="FN_PARCELAS.ANALISECREDITO.PAGTONEG.GRID" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab_saldoDevedor">
                        <div id="saldoDevedor" class="portlet"></div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="projecaoMesQuantidade" class="portlet box green">
                                    <div class="portlet-title">
                                        <div class="caption">
                                            <i class="fa fa-line-chart"></i>Detalhes
                                        </div>
                                        <div class="tools">
                                            <a href="javascript:;" class="collapse" data-original-title="" title=""></a>
                                        </div>
                                    </div>
                                    <div class="portlet-body" style="display: block;">
                                        <div class="table-scrollable">
                                            <table class="table table-striped table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Período</th>
                                                        <th class="text-center">Vencido</th>
                                                        <th class="text-center">Acumulado</th>
                                                        <th class="text-center">Vencer</th>
                                                        <th class="text-center">Acumulado</th>
                                                    </tr>
                                                </thead>
                                                <tbody class="tableDetailSaldo">
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab_resumoMensal">
                        <div class="row">
                            <div id="ResumoMensalComparativo" class="portlet"></div>
                        </div>
                        <div class="row">
                            <wes:SimpleGrid runat="server" ID="SimpleGrid1" ChromeState="Normal"
                                ProviderWidgetUniqueId="ANALISECLIENTE" UserDefinedPageSize="12"
                                UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" Mode="Search"
                                DefaultFilterName="" ShowTitle="true" Title="Detalhes Resumo Mensal"
                                CompanyFilterMode="CompanyAndBranch" DisplayRowCommand="false"
                                UserDefinedDisableRowSelection="true" CanInsert="false" CanUpdate="false"
                                CanDelete="false" EntityViewName="GN_CLIENTECREDITOMENSAL.ANALISECREDITO.GRID" />

                        </div>
                    </div>
                    <div class="tab-pane" id="tab_documentos">
                        <div class="row">
                            <div>
                                <wes:SimpleGrid runat="server" ID="PARCELAS_DOCUMENTOS"
                                    ProviderWidgetUniqueId="ANALISECLIENTE" UserDefinedPageSize="6"
                                    UserDefinedCriteriaWhereClause="A.DOCUMENTO IN ( SELECT DOC.HANDLE FROM FN_DOCUMENTOS DOC WHERE DOC.PESSOA = @CAMPO(HANDLE) ) "
                                    Mode="Selectable" DefaultFilterName="Em Aberto" ShowTitle="true" Title="Documentos"
                                    CompanyFilterMode="CompanyAndBranch" DisplayRowCommand="false"
                                    UserDefinedDisableRowSelection="true" CanInsert="false" CanUpdate="false"
                                    CanDelete="false" EntityViewName="FN_PARCELAS.ANALISECREDITO.DOCUMENTOS.GRID" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function () {
            LoadInfoClienteCredito();
            LoadInfoResumoMensal();
        });

        $(function () {
            var pagina = Sys.WebForms.PageRequestManager.getInstance();
            if (!pagina.get_isInAsyncPostBack()) {
                pagina.add_endRequest(HideUneditableFields);
            }
            
            HideUneditableFields();
        });

        function HideUneditableFields() {
            $('input[data-field="CUSTOM_UTILIZADO"]').css("opacity", "0").css("height", "15");
            $('input[data-field="CUSTOM_DISPONIVEL"]').css("opacity", "0").css("height", "15");
        }

        function GetHandleCliente() {
            return $('#ANALISECLIENTE').find('input[name="ctl00$Main$ANALISECLIENTE$HANDLE_HiddenField"]').val()
        }
        function LoadInfoClienteCredito() {
            App.blockUI({ target: '#saldoDevedor', animate: true });
            App.blockUI({ target: '.note', animate: true });

            spars = JSON.stringify({ 'prCliente': GetHandleCliente() });
            $.ajax({
                type: "POST",
                url: "Cliente.aspx/GetClienteCredito",
                data: spars,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    bindNotesClienteCredito(response.d);
                    bindTableSaldos(response.d.Saldos);
                    plotChartSaldos(response.d.Saldos);
                },
                complete: function (data) {
                    App.unblockUI('#saldoDevedor');
                    App.unblockUI('.note');
                }
            });
        }

        function bindNotesClienteCredito(prDados) {
            setNoteValue("CUSTOM_DATAULTIMACOMPRA", prDados.DataUltimaCompra);
            setNoteValue("CUSTOM_VALORULTIMACOMPRA", prDados.ValorUltimaCompra);

            setNoteValue("CUSTOM_DATAMAIORCOMPRA", prDados.DataMaiorCompra);
            setNoteValue("CUSTOM_VALORMAIORCOMPRA", prDados.ValorMaiorCompra);

            setNoteValue("CUSTOM_DATAMAIORACUMULO", prDados.DataMaiorAcumulo);
            setNoteValue("CUSTOM_VALORMAIORACUMULO", prDados.ValorMaiorAcumulo);

            setNoteValue("CUSTOM_ATRASOMEDIO", prDados.AtrasoMedio);
            setNoteValue("CUSTOM_MAIORATRASO", prDados.MaiorAtraso);
        }

        function bindTableSaldos(prSaldos) {
            rowsDetalhes = "";
            $.each(prSaldos, function (i, currentItem) {
                rowsDetalhes += addRowDetalhes(currentItem);
            });
            $('.tableDetailSaldo').html(rowsDetalhes);
        }

        function plotChartSaldos(prSaldos) {
            var chart = AmCharts.makeChart("saldoDevedor", {
                "type": "serial",
                "theme": "light",
                "dataDateFormat": "MM/YYYY",
                "precision": 2,
                "valueAxes": [
                    {
                        "id": "v1",
                        "title": "Saldo",
                        "position": "left",
                        "autoGridCount": false,
                        "labelFunction": function (value) {
                            return "R$ " + Math.round(value) + "";
                        }
                    }, {
                        "id": "v2",
                        "title": "Saldo Acumulado",
                        "gridAlpha": 0,
                        "position": "right",
                        "autoGridCount": false
                    }],
                "graphs": [
                    {
                        "id": "g4",
                        "valueAxis": "v1",
                        "lineColor": "#D05454",
                        "fillColors": "#D05454",
                        "fillAlphas": 1,
                        "type": "column",
                        "title": "Vencido",
                        "valueField": "Vencido",
                        "clustered": false,
                        "columnWidth": 0.5,
                        "legendValueText": "R$ [[value]]",
                        "balloonText": "[[title]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"
                    }, {
                        "id": "g1",
                        "valueAxis": "v2",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletColor": "#FFFFFF",
                        "bulletSize": 5,
                        "hideBulletsCount": 50,
                        "lineThickness": 2,
                        "lineColor": "#D05454",
                        "type": "smoothedLine",
                        "title": "Acumulado",
                        "useLineColorForBulletBorder": true,
                        "valueField": "VencidoAcumulado",
                        "balloonText": "[[title]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"

                    },
                    {
                        "id": "g3",
                        "valueAxis": "v1",
                        "lineColor": "#3FABA4",
                        "fillColors": "#3FABA4",
                        "fillAlphas": 1,
                        "type": "column",
                        "title": "Vencer",
                        "valueField": "Vencer",
                        "clustered": false,
                        "columnWidth": 0.3,
                        "legendValueText": "R$ [[value]]",
                        "balloonText": "[[title]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"
                    }, {
                        "id": "g2",
                        "valueAxis": "v2",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletColor": "#FFFFFF",
                        "bulletSize": 5,
                        "hideBulletsCount": 50,
                        "lineThickness": 2,
                        "lineColor": "#3FABA4",
                        "type": "smoothedLine",
                        "dashLength": 5,
                        "title": "Acumulado",
                        "useLineColorForBulletBorder": true,
                        "valueField": "VencerAcumulado",
                        "balloonText": "[[title]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"
                    }],
                "chartCursor": {
                    "pan": true,
                    "valueLineEnabled": true,
                    "valueLineBalloonEnabled": true,
                    "cursorAlpha": 0,
                    "valueLineAlpha": 0.2
                },
                "categoryField": "Agrupamento",
                "categoryAxis": {
                    "parseDates": false,
                    "dashLength": 1,
                    "minorGridEnabled": true
                },
                "numberFormatter": {
                    "precision": -1,
                    "decimalSeparator": ",",
                    "thousandsSeparator": "."
                },
                "legend": {
                    "useGraphSettings": true,
                    "position": "top",
                    "useDefaultMarker": true,
                    "valueFunction": function (graphDataItem, valueText) {
                        return "";
                    }
                },
                "balloon": {
                    "borderThickness": 1,
                    "shadowAlpha": 0
                },
                "export": {
                    "enabled": true
                },
                "dataProvider": prSaldos
            });
        }

        function setNoteValue(field, value) {
            $('.note').find('td[data-field="' + field + '"]').text(value);
        }

        function addRowDetalhes(saldoDetalhe) {
            return '<tr><td>' + saldoDetalhe.Agrupamento + '</td><td class=""><table class="tableColumnValue"><tbody>' +
                '<tr><td class="valueSaldo">' + saldoDetalhe.Vencido.toLocaleString() + '</td><td>' + saldoDetalhe.PercentualVencido + '%</td></tr>' +
                '</tbody></table></td><td class=""><table class="tableColumnValue"><tbody>' +
                '<tr><td class="valueSaldo">' + saldoDetalhe.VencidoAcumulado.toLocaleString() + '</td><td>' + saldoDetalhe.PercentualVencidoAcumulado + '%</td></tr>' +
                '</tbody></table></td><td class=""><table class="tableColumnValue"><tbody>' +
                '<tr><td class="valueSaldo">' + saldoDetalhe.Vencer.toLocaleString() + '</td><td>' + saldoDetalhe.PercentualVencer + '%</td></tr>' +
                '</tbody></table></td><td class=""><table class="tableColumnValue"><tbody>' +
                '<tr><td class="valueSaldo">' + saldoDetalhe.VencerAcumulado.toLocaleString() + '</td><td>' + saldoDetalhe.PercentualVencerAcumulado + '%</td></tr>' +
                '</tbody></table></td></tr>';
        }

        function LoadInfoResumoMensal() {
            App.blockUI({ target: '#ResumoMensalComparativo', animate: true });
            spars = JSON.stringify({ 'prCliente': GetHandleCliente() });
            $.ajax({
                type: "POST",
                url: "Cliente.aspx/GetResumoMensal",
                data: spars,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    plotResumoMensalComparativo(response.d.ResumosMensais);
                },
                complete: function (data) {
                    App.unblockUI('#ResumoMensalComparativo');
                }
            });
        }

        function plotResumoMensalComparativo(prResumosMensais) {
            var chart = AmCharts.makeChart("ResumoMensalComparativo", {
                "type": "serial",
                "theme": "light",
                "dataDateFormat": "MM/YYYY",
                "precision": 2,
                "valueAxes": [
                    {
                        "id": "v1",
                        "title": "Faturamento",
                        "position": "left",
                        "autoGridCount": false,
                        "labelFunction": function (value) {
                            return Math.round(value);
                        }
                    }, {
                        "id": "v2",
                        "title": "Quantidade",
                        "gridAlpha": 0,
                        "position": "right",
                        "autoGridCount": false,
                        "labelFunction": function (value) {
                            return Math.round(value);
                        }
                    }],
                "graphs": [
                    {
                        "id": "g3",
                        "valueAxis": "v1",
                        "lineColor": "#e1ede9",
                        "fillColors": "#e1ede9",
                        "fillAlphas": 1,
                        "type": "column",
                        "title": "Faturamento anterior",
                        "valueField": "VolumeAnterior",
                        "clustered": false,
                        "columnWidth": 0.5,
                        "legendValueText": "[[value]]",
                        "balloonText": "Faturameto em [[MesAnoAnterior]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"
                    }, {
                        "id": "g4",
                        "valueAxis": "v1",
                        "lineColor": "#62cf73",
                        "fillColors": "#62cf73",
                        "fillAlphas": 1,
                        "type": "column",
                        "title": "Faturamento",
                        "valueField": "Volume",
                        "clustered": false,
                        "columnWidth": 0.3,
                        "legendValueText": "[[value]]",
                        "balloonText": "Faturamento em [[MesAno]]<br /><b style='font-size: 130%'>R$ [[value]]</b>"
                    }, {
                        "id": "g2",
                        "valueAxis": "v2",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletColor": "#FFFFFF",
                        "bulletSize": 5,
                        "hideBulletsCount": 50,
                        "lineThickness": 2,
                        "lineColor": "#e1ede9",
                        "type": "smoothedLine",
                        "dashLength": 5,
                        "title": "Quantidade anterior",
                        "useLineColorForBulletBorder": true,
                        "valueField": "QuantidadeAnterior",
                        "balloonText": "Quantidade em  [[MesAnoAnterior]]<br /><b style='font-size: 130%'>[[value]]</b>"
                    }, {
                        "id": "g1",
                        "valueAxis": "v2",
                        "bullet": "round",
                        "bulletBorderAlpha": 1,
                        "bulletColor": "#FFFFFF",
                        "bulletSize": 5,
                        "hideBulletsCount": 50,
                        "lineThickness": 2,
                        "lineColor": "#20acd4",
                        "type": "smoothedLine",
                        "title": "Quantidade",
                        "useLineColorForBulletBorder": true,
                        "valueField": "Quantidade",
                        "balloonText": "Quantidade em [[MesAno]]<br /><b style='font-size: 130%'>[[value]]</b>"

                    }],
                "chartScrollbar": {
                    "graph": "g1",
                    "oppositeAxis": false,
                    "offset": 30,
                    "scrollbarHeight": 50,
                    "backgroundAlpha": 0,
                    "selectedBackgroundAlpha": 0.1,
                    "selectedBackgroundColor": "#888888",
                    "graphFillAlpha": 0,
                    "graphLineAlpha": 0.5,
                    "selectedGraphFillAlpha": 0,
                    "selectedGraphLineAlpha": 1,
                    "autoGridCount": true,
                    "color": "#AAAAAA"
                },
                "chartCursor": {
                    "pan": true,
                    "valueLineEnabled": true,
                    "valueLineBalloonEnabled": true,
                    "cursorAlpha": 0,
                    "valueLineAlpha": 0.2
                },
                "categoryField": "MesAno",
                "categoryAxis": {
                    "parseDates": false,
                    "dashLength": 1,
                    "minorGridEnabled": true
                },
                "numberFormatter": {
                    "precision": -1,
                    "decimalSeparator": ",",
                    "thousandsSeparator": "."
                },
                "legend": {
                    "equalWidths": false,
                    "useGraphSettings": true,
                    "position": "top",
                    "valueFunction": function (graphDataItem, valueText) {
                        return "";
                    }
                },
                "balloon": {
                    "borderThickness": 2,
                    "shadowAlpha": 0
                },
                "export": {
                    "enabled": true
                },
                "dataProvider": prResumosMensais,
                "listeners": [{
                    "event": "init",
                    "method": function (e) {
                        e.chart.zoomToIndexes(e.chart.dataProvider.length - 6, e.chart.dataProvider.length - 1);
                    }
                }]
            });
        }

    </script>
</asp:Content>