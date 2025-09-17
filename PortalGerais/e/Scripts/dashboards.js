var ErpDashboard = {
    initDashboard: function () {
        AtualizarDashBoardStats();
        AtualizaDashBoardCharts();
    }
};

var AtualizarDashBoardStats = function () {
    $('.dashboard-stat').each(function () {

        var id = this.getAttribute('source');
        if (!id) return;
        var idParts = id.split('-');
        var param = 0;

        if (idParts.length == 2)
            param = parseInt(idParts[1]);

        // Bloquear interface
        App.blockUI({ target: this, boxed: false, textOnly: true, message: " " });

        var u = $("#Wes2008ApplicationPath").val() + "api/ErpDashboard";
        var Sufix = this.getAttribute('controllerSufix');
        if (Sufix)
            u = u + Sufix;

        $.ajax({
            context: this,
            dataType: "json",
            url: u,
            data: { name: idParts[0], param: param }
        }).done(function (data) {

            // Verifica se oculta
            if (data.Value == '0') {
                if ($(this).hasClass("erp-hidezero")) {
                    $(this).parent().css({ display: 'none' });
                };
            };

            // Preencher informações
            var removePad = false;
            var node = $(this).find('.details > .desc');
            if (node) {
                node.empty();

                var txt = data.Text;
                if (txt.startsWith('<div>')) {

                    node.html(txt);
                    removePad = true;
                }
                else {
                    node.text(txt);
                }
            }

            node = $(this).find('.details > .number');
            if (node) {
                node.empty();
                node.text(data.Value);
                if (removePad) {
                    node.css({ 'padding-top': '5px' });
                }

            };

            // Troca a imagem
            var newImageClass = data.ImgClass ? data.ImgClass : "fa fa-question";
            $(this).find('.visual > i').attr('class', newImageClass);

            // Coloca a url
            if ((data.Url) && (data.Url.length > 0)) {
                var linkUrl = data.Url;
                var linkCaption = data.UrlName;

                if ((!linkCaption) || (linkCaption.length == 0))
                    linkCaption = 'Ver mais';

                linkCaption = linkCaption + '<i class="m-icon-swapright m-icon-white"></i>';

                var link = $(this).find('.more');
                if (link) {
                    link.attr('href', linkUrl);
                    link.empty();
                    link.html(linkCaption);
                }
            };

            // Liberar interface
            App.unblockUI(this);
        });

    });

};

var AtualizaDashBoardCharts = function () {
    $('.chartSummary').remove();
    $('.chart').each(function () {
        var src = this.getAttribute('source');

        if (src == null) return;

        var idParts = src.split('-');
        if ((idParts.length != 2) && (idParts.length != 3)) return;

        // Bloquear interface
        App.blockUI({ target: this, boxed: false, message: "Carregando..." });

        var u = $("#Wes2008ApplicationPath").val() + "api/ErpDashboard";
        var Sufix = this.getAttribute('controllerSufix');
        if (Sufix)
            u = u + Sufix;

        $.ajax({
            context: this,
            dataType: "json",
            url: u,
            async: true,
            data: { chartIdentifier: src }
        }).done(function (data) {
            ErpPlotChart(this, data);

            // Liberar interface
            App.unblockUI(this);
        });
    });
};

var ErpPlotChart = function (el, data) {
    if (data.ChartType == 'line')
        ErpPlotChartLineNew(el, data);

    if (data.ChartType == 'pizza')
        ErpPlotChartPizza(el, data);

    //if (data.ChartType == 'bar')
    //    ErpPlotChartBar(el, data);

    if (data.ChartType == 'bar')
        ErpPlotChartBarNew(el, data);

    if (data.ChartType == 'twobar')
        ErpPlotChartTwoBar(el, data);

    if (data.ChartType == 'twobarstacked')
        ErpPlotChartBarTwoBarStacked(el, data);

    if (data.ChartType == 'twobarstackedformated')
        ErpPlotChartBarTwoBarStackedWithFormatedValues(el, data);

    if (data.ChartType == 'multiline')
        ErpPlotChartMultiLineNew(el, data);

    if (data.ChartType == 'LineandBar')
        ErpPlotChartLineAndBar(el, data);

    if (data.ChartType == 'Clustered')
        clusteredChart(el, data);

    if (data.ChartType == 'notfound')
        ErpPlotChartNotFound(el, data);

    if (data.ChartType == 'notdata')
        ErpPlotChartNotData(el, data);

};

var ErpPlotChartNotData = function (el, data) {
    $('.chart').each(function () {
        if (this == el) {
            $(this).empty();
            $(this).text("Sem valores para apresentar.");
        };
    });
}

var ErpPlotChartNotFound = function (el, data) {
    $('.chart').each(function () {
        if (this == el) {
            $(this).empty();
            $(this).text("As informações para o Gráfico não foram encontradas.");
            SetChartTitle(this, "", "fa fa-question", "");
        };
    });
};

var ErpPlotChartLine = function (el, data) {

    var i = 0;
    var dataList = [];
    var tickList = [];
    while (i < data.Values.length) {
        tickList[i] = [i, data.Values[i].Name];
        dataList[i] = [i, data.Values[i].Value];
        i++;
    }
    var dataSet = [{ label: data.ValueName, data: dataList, color: '#0070FF' }];

    var options = {
        series: {
            lines: { show: true, label: true, fill: true },
            points: { radius: 3, fill: true, show: true }
        },
        xaxis: { ticks: tickList },
        yaxis: { axisLabel: data.ValueName, tickFormatter: function (v, axis) { return v.AsLabel(data.IsCurrency, data.Decimais); } },
        legend: { show: false },
        grid: { hoverable: true, borderWidth: 0 }
    };

    var previousPoint = null, previousLabel = null;

    $.fn.UseTooltip = function () {
        $(this).bind("plothover", function (event, pos, item) {
            if (item) {
                if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                    previousPoint = item.dataIndex;
                    previousLabel = item.series.label;
                    $("#tooltip").remove();
                    var y = item.datapoint[1];
                    var content = data.IsCurrency ? y.AsMoney() : y.AsFormat(data.Decimais);
                    var w = $(this).width();
                    var offSet = (item.pageX / w) * (-7 * content.length);
                    showTooltip(item.pageX + offSet, item.pageY - 40, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    };

    $(document).ready(function () {
        $('.chart').each(function () {
            if (this == el) {
                DoChart(this, dataSet, options, data);
                $(this).UseTooltip();
            }
        });
    });

};

var ErpPlotChartLineNew = function (el, data) {

    var chart = AmCharts.makeChart(el, {
        "theme": "none",
        "export": { "enabled": true },
        "type": "serial",
        "marginRight": 80,
        "autoMarginOffset": 20,
        "marginTop": 20,
        "dataProvider": data.Values,
        "valueAxes": [{
            "id": "v1",
            "axisAlpha": 0,
            "gridAlpha": 0,
            "position": "left",
            "title": data.ValueName,
            "labelFunction": function (value, valueText, valueAxis) { return value.AsLabel(data.IsCurrency, data.Decimais); }
        }],
        "graphs": [{
            "id": "g1",
            "balloonFunction": function (dataItem, g) { return dataItem.category + "<br><b>" + dataItem.values.value.AsLabel(data.IsCurrency, data.Decimais) + "</b>"; },
            "bullet": "round",
            "bulletBorderAlpha": 0,
            "bulletBorderColor": "#FFFFFF",
            "bulletSize": 10,
            "hideBulletsCount": 50,
            "lineThickness": 2,
            "valueField": "Value"
        }],
        "chartCursor": {
            "categoryBalloonDateFormat": "DD",
            "cursorAlpha": 0.1,
            "fullWidth": true,
            "valueBalloonsEnabled": true,
            "zoomable": false
        },

        "categoryField": "Name",
        "categoryAxis": {
            "parseDates": false,
            "axisAlpha": 0,
            "gridAlpha": 0,
            "minHorizontalGap": 60
        },
        "export": {
            "enabled": false
        }
        ,
        "exportConfig": {
            "menuBottom": "2px",
            "menuRight": "2px",
            "menuItems": [{
                "icon": $("#Wes2008ApplicationPath").val() + "/Content/assets/global/plugins/amcharts/images/export.png",
                "format": 'png'
            }],
            "menuItemOutput": { "fileName": "grafico" }
        }


    });

    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);

};

var ErpPlotChartPizza = function (el, data) {
    CorpComponents.AmCharts.CriarBaseGraficoPizza(el, data.Values, "Name");
    
    if (data.Title != null)
        SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
};

var ErpPlotChartBar = function (el, data) {

    var i = 0;
    var dataList = [];
    var tickList = [];
    while (i < data.Values.length) {
        tickList[i] = [i, data.Values[i].Name];
        dataList[i] = [i, data.Values[i].Value];
        i++;
    }
    var dataSet = [{ label: data.ValueName, data: dataList }];

    var options = {
        series: { bars: { show: true } },
        bars: { align: "center", barWidth: 0.8 },
        xaxis: { ticks: tickList },
        yaxis: {
            axisLabel: data.ValueName,
            tickFormatter: function (v, axis) { return v.AsLabel(data.IsCurrency, data.Decimais); }
        },
        legend: { show: false },
        grid: { hoverable: true, borderWidth: 2 }
    };

    var previousPoint = null, previousLabel = null;

    $.fn.UseTooltip = function () {
        $(this).bind("plothover", function (event, pos, item) {
            if (item) {
                if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                    previousPoint = item.dataIndex;
                    previousLabel = item.series.label;
                    $("#tooltip").remove();

                    var y = item.datapoint[1];
                    var content = data.IsCurrency ? y.AsMoney() : y.AsFormat(data.Decimais);
                    showTooltip(item.pageX - 30, item.pageY - 35, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    };

    $(document).ready(function () {
        $('.chart').each(function () {
            if (this == el) {
                DoChart(this, dataSet, options, data);
                $(this).UseTooltip();
            }
        });
    });

};

var ErpPlotChartBarTwoBarStacked = function (el, data) {
    var chart = AmCharts.makeChart(el, {
        "type": "serial",
        "categoryField": "Categoria",
        "startDuration": 0,
        "path": Benner.Page.getApplicationPath() + "content/assets/plugins/amcharts/",
        "language": "pt",
        "categoryAxis":
            {
                "gridPosition": "start"
            },
        "trendLines": [],
        "chartCursor": {
            "enabled": true
        },
        "graphs": [
            {
                "fillAlphas": 1,
                "fillColors": "rgb(181, 34, 34)",
                "lineColor": "rgb(181, 34, 34)",
                "id": data.IdBarra11,
                "title": data.TituloBarra11,
                "type": "column",
                "valueField": "ValorBarra11",
                "clustered": true,
                "balloonText": "[[title]]: <b style='font-size: 100%'>[[value]]</b>"
            },
            {
                "fillAlphas": 1,
                "fillColors": "rgb(181, 34, 34, 0.5)",
                "lineColor": "rgb(181, 34, 34, 0.5)",
                "id": data.IdBarra12,
                "title": data.TituloBarra12,
                "type": "column",
                "valueField": "ValorBarra12",
                "clustered": true,
                "balloonText": "[[title]]: <b style='font-size: 100%'>[[value]]</b>"
            },
            {
                "fillAlphas": 1,
                "fillColors": "rgb(24, 103, 171)",
                "lineColor": "rgb(24, 103, 171)",
                "id": data.IdBarra21,
                "title": data.TituloBarra21,
                "type": "column",
                "valueField": "ValorBarra21",
                "clustered": true,
                "balloonText": "[[title]]: <b style='font-size: 100%'>[[value]]</b>"
            },
            {
                "fillAlphas": 1,
                "fillColors": "rgb(24, 103, 171, 0.5)",
                "lineColor": "rgb(24, 103, 171, 0.5)",
                "id": data.IdBarra22,
                "title": data.TituloBarra22,
                "type": "column",
                "valueField": "ValorBarra22",
                "clustered": true,
                "balloonText": "[[title]]: <b style='font-size: 100%'>[[value]]</b>"
            },
            {
                "id": data.IdLinha,
                "title": data.TituloLinha,
                "animationPlayed": true,
                "lineColor": "#FCD202",
                "type": "line",
                "lineThickness": 1,
                "bulletSize": 7,
                "valueField": "Valorlinha",
                "clustered": true,
                "balloonText": "[[title]]: <b style='font-size: 100%'>[[value]]</b>",
                "bullet": "round"
            } 
        ],
        "guides": [],
        "valueAxes": [
            {
                "id": "ValueAxis-1",
                "stackType": "regular"
            }
        ],
        "allLabels": [],
        "numberFormatter": {
            "precision": -1,
            "decimalSeparator": ",",
            "thousandsSeparator": "."
        },
        "balloon": {
            "borderThickness": 1,
            "shadowAlpha": 0
        },
        "export": {
            "enabled": true
        },
        "dataProvider": data.Values
    });

    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
}

var ErpPlotChartLineAndBar = function (el, data) {

    var chart = CorpComponents.AmCharts.CriarBaseGraficoXY(el, data.Valores, "Categoria")
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra", data.BalloonTextBarra, false, "Categoria", false);   
    CorpComponents.AmCharts.CriarLinhaAmarela(chart, "ValorLinha", data.BalloonTextLinha, "Categoria", false);

    if (data.Title != null)
        SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
};

var ErpPlotChartBarTwoBarStackedWithFormatedValues = function (el, data) {

    var chart = CorpComponents.AmCharts.CriarBaseGraficoXY(el, data.Values, "Categoria")
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra11", data.TituloBarra11, true, "Categoria", true);
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra12", data.TituloBarra12, true, "Categoria", true);
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra21", data.TituloBarra21, true, "Categoria", true);
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra22", data.TituloBarra22, true, "Categoria", true);
    if ((data.TituloLinha != null) && (data.TituloLinha != ""))
      CorpComponents.AmCharts.CriarLinhaAmarela(chart, "Valorlinha", data.TituloLinha, "Categoria", true);
   
    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
}

var ErpPlotChartTwoBar  = function (el, data) {

    var chart = CorpComponents.AmCharts.CriarBaseGraficoXY(el, data.Values, "Categoria")       
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra1", data.TitleBar1, false, "Categoria", false);
    CorpComponents.AmCharts.CriarColunaBarra(chart, "ValorBarra2", data.TitleBar2, false, "Categoria", false);
   
    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
}

var ErpPlotChartMultiLineNew = function (el, data, logarithmic) {

    var dataSet = [];
    for (var i = 0; i < data.XNames.length; i++) {
        var linha = { "Name": data.XNames[i] };

        for (var j = 0; j < data.Series.length; j++) {
            var name = "s" + j;
            var valor = data.Series[j].Values[i];
            if (logarithmic && valor == "0")
                valor = 0.004;
            linha[name] = valor;
        }
        dataSet.push(linha);
    }

    var chart = CorpComponents.AmCharts.CriarBaseGraficoXY(el, dataSet, "Name");
    CorpComponents.AmCharts.CriarLinha(chart, "s0", "Notas fiscais", "Name");
    CorpComponents.AmCharts.CriarLinha(chart, "s1", "Valor faturado", "Name");
    CorpComponents.AmCharts.CriarLinha(chart, "s2", "Ticket médio", "Name");
    
    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
};


var ErpPlotChartBarNew = function (el, data) {
    var dataSet = data.Values;

    var listeners = null;

    if (data.ExecuteClickGraphItem) {
        listeners = [{
            "event": "clickGraphItem",
            "method": function (event) {
                clickGraphItem(event);
            }
        }];
    }

    var chart = AmCharts.makeChart(el, {
        "type": "serial",
        "theme": "light",
        "dataDateFormat": "MM/YYYY",
        "precision": 2,
        "valueAxes": [{
            "id": "v1",
            "logarithmic": false,
            "title": data.ValueName,
            "position": "left",
            "autoGridCount": false,
            "labelFunction": function (value, formatted, axis) {
                // if it's the value axis label, just return preformatted one
                if (value == Number(formatted))
                    return formatted;

                // it's a cursor value, let's apply custom rounding to it
                var chart = axis.chart;
                return AmCharts.formatNumber(value, {
                    precision: 2,
                    decimalSeparator: chart.decimalSeparator,
                    thousandsSeparator: chart.thousandsSeparator
                });
            }
        }],
        "graphs": [{
            "id": "barra1",
            "valueAxis": "v1",
            "lineColor": "#FF6600",
            "fillColors": "#FF6600",
            "fillAlphas": 1,
            "type": "column",
            "valueField": "Value",
            "clustered": false,
            "columnWidth": 0.7,
            "balloonText": "[[Balloon]] [[Value]]%",
            "balloonFunction": function (item, graph) {
                var result = graph.balloonText;
                for (var key in item.dataContext) {
                    var formatted = "";
                    if (item.dataContext.hasOwnProperty(key)) {
                        if (!isNaN(item.dataContext[key])) {
                            formatted = AmCharts.formatNumber(item.dataContext[key], {
                                precision: chart.precision,
                                decimalSeparator: chart.decimalSeparator,
                                thousandsSeparator: chart.thousandsSeparator
                            }, 2);
                        }
                        else
                            formatted = item.dataContext[key];
                        result = result.replace("[[" + key + "]]", formatted);
                    }
                }
                return result;
            }
        }],
        "chartCursor": {
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha": 0,
            "valueLineAlpha": 0.2
        },
        "categoryField": "Name",
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
        "balloon": {
            "borderThickness": 1,
            "shadowAlpha": 0
        },
        "export": {
            "enabled": false
        },
        "exportConfig": {
            "menuBottom": "2px",
            "menuRight": "2px",
            "menuItems": [{
                "icon": $("#Wes2008ApplicationPath").val() + "/Content/assets/global/plugins/amcharts/images/export.png",
                "format": 'png'
            }],
            "menuItemOutput": { "fileName": "grafico" }
        },
        "dataProvider": data.Values,
        "listeners": listeners
    });

    if (data.Title != null)
        SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
};



var ErpPlotChartLineAndBar1 = function (el, data) {

    var dataSet = data.Valores;
    var configChart = {
        "type": "serial",
        "theme": "none",
        "decimalSeparator": ",",
        "percentPrecision": 0,
        "precision": 0,
        "thousandsSeparator": ".",
        "legend": {
            "valueWidth": 100,
            "useMarkerColorForValues": false,
            "showEntries": data.MostrarLegendaValores,
            "equalWidths": false,
            "valueAlign": "left",
        },
        "dataProvider": dataSet,
        "valueAxes": [{
            "id": "barraAxis",
            "axisAlpha": 0,
            "gridAlpha": 0,
            "position": "left",
            "title": data.TituloBarra
        }],
        "graphs": [{
            "alphaField": "alpha",
            "balloonText": (!data.BalloonTextBarra ? data.TituloBarra : data.BalloonTextBarra) + " [[value]]",
            "dashLengthField": "dashLength",
            "fillAlphas": 1,
            "title": data.TituloBarra,
            "type": "column",
            "valueField": "ValorBarra",
            "valueAxis": "barraAxis",
            "colorField": "CorBarra",
            "lineColorField": "CorBarra",
            "legendColor": data.CorLegendaBarra,
            "legendAlpha": 1
        }, {
            "balloonText": (!data.BalloonTextBarra ? data.TituloBarra : data.BalloonTextLinha) + " [[value]]",
            "bullet": "round",
            "bulletBorderAlpha": 1,
            "dashLengthField": "dashLength",
            "title": data.TituloLinha,
            "fillAlphas": 0,
            "lineColorField": "CorLinha",
            "valueField": "ValorLinha",
            "legendColor": data.CorLegendaLinha,
            "legendAlpha": 1
        }],
        "chartCursor": {
            "categoryBalloonDateFormat": "DD",
            "cursorAlpha": 0.1,
            "cursorColor": "#000000",
            "fullWidth": true,
            "valueBalloonsEnabled": true,
            "zoomable": false,
            "valueLineEnabled": true,
            "valueLineBalloonEnabled": true,
            "cursorAlpha": 0.2,
            "valueLineAlpha": 0.2
        },
        "categoryField": "Categoria",
        "categoryAxis": {
            "parseDates": false,
            "autoGridCount": false,
            "axisColor": "#555555",
            "gridAlpha": 0.1,
            "gridColor": "#FFFFFF",
            "gridCount": 50,
            "labelRotation": data.RotacaoCategoria
        }
    }

    if (data.Export)
        configChart.exportConfig = {
            "enabled": true,
            "menuBottom": "2px",
            "menuRight": "2px",
            "menuItems": [{
                "icon": $("#Wes2008ApplicationPath").val() + "/Content/assets/global/plugins/amcharts/images/export.png",
                "format": 'png'
            }],
            "menuItemOutput": { "fileName": "grafico" }
        }

    var chart = AmCharts.makeChart(el, configChart);
    if (data.Title != null)
        SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
};

var ErpPlotChartMultiLine = function (el, data) {

    var i = 0;
    var dataSet = [];

    while (i < data.Series.length) {
        var j = 0;
        var dataList = [];
        while (j < data.Series[i].Values.length) {
            dataList[j] = [j, data.Series[i].Values[j]];
            j++;
        };

        dataSet[i] = { label: data.Series[i].Name, data: dataList, color: data.Series[i].Color };
        i++;
    };

    // Monta o tickList
    i = 0;
    var tickList = [];
    while (i < data.XNames.length) {
        tickList[i] = [i, data.XNames[i]];
        i++;
    };

    var options = {
        series: {
            lines: { show: !data.IsBar, label: true, fill: data.IsStack },
            points: { radius: 3, fill: true, show: !data.IsBar },
            bars: { show: data.IsBar },
            stack: data.IsStack
        },
        xaxis: { ticks: tickList },
        yaxis: { axisLabel: data.ValueName, tickFormatter: function (v, axis) { return v.AsLabel(data.IsCurrency, data.Decimais); } },
        legend: { show: true },
        grid: { hoverable: true, borderWidth: 2 }
    };

    var previousPoint = null, previousLabel = null;

    $.fn.UseTooltip = function () {
        $(this).bind("plothover", function (event, pos, item) {
            if (item) {
                if ((previousLabel != item.series.label) || (previousPoint != item.dataIndex)) {
                    previousPoint = item.dataIndex;
                    previousLabel = item.series.label;
                    $("#tooltip").remove();

                    var y = item.datapoint[1];
                    if (data.IsBar)
                        y = y - item.datapoint[2];

                    var content = y.AsLabel(data.IsCurrency, data.Decimais);
                    var w = $(this).width();
                    var offSet = (item.pageX / w) * (-7 * content.length);
                    showTooltip(item.pageX + offSet, item.pageY - 40, content);
                }
            } else {
                $("#tooltip").remove();
                previousPoint = null;
            }
        });
    };

    $(document).ready(function () {
        $('.chart').each(function () {
            if (this == el) {
                DoChart(this, dataSet, options, data);
                $(this).UseTooltip();
            };
        });
    });

};


var DoChart = function (elChart, dataSet, options, data) {
    $(elChart).empty();
    $.plot(elChart, dataSet, options);
    SetChartTitle(elChart, data.Title, data.ImgClass, data.TitleClass);
    SetChartSummary(elChart, data.Summary);
};

function showTooltip(x, y, contents) {
    $('<div id="tooltip">' + contents + '</div>').css({
        position: 'absolute',
        display: 'none',
        top: y,
        left: x,
        border: '1px solid #333',
        padding: '4px',
        color: '#fff',
        'border-radius': '3px',
        'background-color': '#333',
        opacity: 0.80
    }).appendTo("body").fadeIn(200);
}

var SetChartTitle = function (elChart, title, imgClass, titleClass) {
    var caption = $(elChart).parent().parent().children().first().children().first();
    caption.empty();
    var txt = "";
    if (imgClass)
        txt = '<i class="' + imgClass + " " + titleClass + '"></i> ';
    txt = txt + '<span class="' + titleClass + '">' + title + '</span>';
    caption.append(txt);
};
var SetChartSummary = function (elChart, summary) {
    if ((summary != null) && (summary != "")) {
        var HTML = '<div class="chartSummary" style="margin: 20px 0 10px 30px"><div class="row">';

        for (var i = 0; i < summary.length; i++) {
            var elem = summary[i];
            HTML = HTML + '<div class="col-md-3 col-sm-3 col-xs-6 text-stat"><span';
            if ((elem.TextClass) && (elem.TextClass.length > 0)) {
                HTML = HTML + ' class="' + elem.TextClass + '"';
            };
            HTML = HTML + '>' + elem.Text + ':</span><h3>' + elem.Value + '</h3></div>';
        };

        var portletBody = $(elChart);
        portletBody.after(HTML);
    }
};

Number.prototype.AsMoney = function () { return FormatMoney(this); };
Number.prototype.AsFormat = function (decimais) { return FormatValor(this, decimais); };
Number.prototype.AsLabel = function (IsCurrency, decimais) { if (IsCurrency) return FormatMoney(this); return FormatValor(this, decimais); };

var FormatMoney = function (valor) {
    if (valor)
        return 'R$ ' + FormatValor(valor, 2);
    return 'R$ 0,00';
}

var FormatValor = function (valor, decimais) {
    var vlr = valor.toFixed(decimais);
    var parts = vlr.split('.');
    var intPart = parts[0].replace(/(\d)(?=(\d{3})+(?!\d))/g, "$1.");

    if (decimais == 0)
        return intPart;

    var fracPart = (parts.length > 1) ? parts[1] : '';
    while (fracPart.length < decimais)
        fracPart = fracPart + '0';
    return intPart + ',' + fracPart;
}

var InserirSubData = function (subdata) {
    var i = 0;
    var subsubData = []
    if (subdata != null) {
        for (i = 0; i < subdata.length; i++) {
            subsubData[i] = {
                "category": subdata[i].Title,
                "column-0": subdata[i].Value[0],
                "column-1": subdata[i].Value[1],
                subdata: InserirSubData(subdata[i].Subdata)
            }
        }
    }
    return subsubData
}

var DataSource = [];
var DataSourcePlanos;
var chartDataIndexes = [];
var chart;
var clusteredChart = function (el, data) {


    var Colunas = [];
    for (i = 0; i < data.Column.length; i++) {
        Colunas[i] = {
            "balloonText": data.Column[i].balloonText,
            "fillAlphas": 1,
            "id": "AmGraph-" + i,
            "title": data.Column[i].Title,
            "type": "column",
            "valueField": "column-" + i
        }
    }


    for (i = 0; i < data.DataSource.length; i++) {
        DataSource[i] = {
            "category": data.DataSource[i].Title,
            "column-0": data.DataSource[i].Value[0],
            "column-1": data.DataSource[i].Value[1],
            subdata: InserirSubData(data.DataSource[i].Subdata)
        }

    }

    //estrutura
    chart = AmCharts.makeChart(el,
        {
            "type": "serial",
            "categoryField": "category",
            "allLabels": [{
                "text": "",
                "x": 10,
                "y": 15,
                "size": 14,
                "bold": true,
                "url": "javascript: goBack();void(0);"
            }],
            "startDuration": data.Duration,
            "theme": "light",
            "categoryAxis": {},
            "trendLines": [],
            "graphs": Colunas,
            "guides": [],
            "valueAxes": [
                {
                    "id": "ValueAxis-1",
                    "title": data.LabelName,
                    labelFunction: function (value, valueText, valueAxis) { return value.AsLabel(data.IsCurrency, data.Decimais); }
                }
            ],
            "balloon": {},
            "legend": {
                "enabled": true,
                "useGraphSettings": true
            },
            "titles": [
                {
                    "id": "Title-1",
                    "size": 15,
                    "text": data.Title
                }
            ],
            "dataProvider": DataSource

        });

    // chart.balloonFunction = adjustBalloonText;

    //formata para currency
    if (data.IsCurrency) {
        chart.numberFormatter = {
            "precision": 2,
            "decimalSeparator": ",",
            "thousandsSeparator": "."
        }
    }
    else {
        chart.numberFormatter = {
            "thousandsSeparator": "."
        }
    }


    chart.addListener('clickGraphItem', function (evt) {
        if ((evt.item.dataContext.subdata) && (evt.item.dataContext.subdata.length > 0)) {
            chartDataIndexes.push({
                index: evt.index,
                title: evt.item.dataContext.subSetTitle,
                prev: evt.chart.titles[0].text
            });
            evt.chart.dataProvider = evt.item.dataContext.subdata;
            evt.chart.allLabels[0].text = "Voltar";
            evt.chart.validateData();
            chart.animateAgain();

        }
    });

    SetChartTitle(el, data.Title, data.ImgClass, data.TitleClass);
    chart.validateData();
};

function goBack() {
    var previousData = DataSource;
    var tmp = {
        prev: ""
    }

    // Remove latest
    chartDataIndexes.pop();

    // Get previous cached object
    for (var i = 0; i < chartDataIndexes.length; i++) {
        tmp = chartDataIndexes[i];
        previousData = previousData[tmp.index].subdata;
    }

    // Apply titles and stuff
    chart.allLabels[0].text = tmp.prev ? "Voltar" : "";
    //chart.titles[0].text = tmp.title || chartTitle;
    chart.dataProvider = previousData;
    chart.validateData();
    chart.animateAgain();
}

function testeee(arg) {
    alert(arg)

}
