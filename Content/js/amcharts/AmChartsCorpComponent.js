import * as am4core from "@amcharts/amcharts4/core";
import * as am4charts from "@amcharts/amcharts4/charts";
import am4themes_animated from "@amcharts/amcharts4/themes/animated";
import am4themes_material from "@amcharts/amcharts4/themes/material";

function jsonPathToValue(jsonData, path) {
    if (!(jsonData instanceof Object) || typeof (path) === "undefined") {
        throw InvalidArgumentException("jsonData:" + jsonData + ", path:" + path);
    }
    path = path.replace(/\[(\w+)\]/g, '.$1'); // convert indexes to properties
    path = path.replace(/^\./, ''); // strip a leading dot
    var pathArray = path.split('.');
    for (var i = 0, n = pathArray.length; i < n; ++i) {
        var key = pathArray[i];
        if (key in jsonData) {
            if (jsonData[key] !== null) {
                jsonData = jsonData[key];
            } else {
                return null;
            }
        } else {
            return key;
        }
    }
    return jsonData;
};


var AmChartsCorpComponent = function () {

    return {
        init: function() {
            console.log("oi");
            return "oi";
        },
        teste: function(a)
        {
            console.log(a);
            return a;
        },

        CriarBaseGraficoXY: function(el, valores, categoria, mostrarLegenda = true, coresCustomizadas = []) {
            // Themes 
            am4core.useTheme(am4themes_material);
            am4core.useTheme(am4themes_animated);
            // Create chart instance
            var chart = am4core.create(el, am4charts.XYChart);
            chart.fontSize = 12;
            // Add data
            chart.data = valores;
            // Export
            chart.exporting.menu = new am4core.ExportMenu();
            // Create axes
            var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = categoria;
            categoryAxis.renderer.grid.template.location = 0;
            categoryAxis.renderer.minGridDistance = 20;
            categoryAxis.renderer.cellStartLocation = 0.1;
            categoryAxis.renderer.cellEndLocation = 0.9;
            
            if (coresCustomizadas.length > 0)
            {
                var listaCores = []
                coresCustomizadas.forEach(element => {
                    listaCores.push(am4core.color(element));
                });

                chart.colors.list = listaCores;
            }
           
            var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
            valueAxis.min = 0;
            //chart.cursor = new am4charts.XYCursor();
    
            valueAxis.events.on("startchanged", valueAxisZoomed);
            valueAxis.events.on("endchanged", valueAxisZoomed);
            function valueAxisZoomed(ev) {
                let start = ev.target.minZoomed;
                let end = ev.target.maxZoomed;
            }
    
            if(mostrarLegenda)
                chart.legend = new am4charts.Legend();
    
            return chart
        },

        
        CriarColunaBarra: function(chart, field, name, stacked, categoria, cifraoCurrency) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = categoria;
            series.name = name;
            if (cifraoCurrency)
            {
                chart.numberFormatter.numberFormat = {
                    "style": "currency",
                    "currency": "BRL"
                }
                chart.numberFormatter.intlLocales = "pt-BR";
                series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            }
            else    
                series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            series.tooltip.label.fontSize = 12;
            series.stacked = stacked;
            series.columns.template.width = am4core.percent(95);
        },

        CriarColunaBarraEvento: function(chart, field, name, stacked, categoria, cifraoCurrency, idEvento) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueY = field;
            series.dataFields.categoryX = categoria;
            series.name = name;
            if (cifraoCurrency) {
                chart.numberFormatter.numberFormat = {
                    "style": "currency",
                    "currency": "BRL"
                }
                chart.numberFormatter.intlLocales = "pt-BR";
                series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";
            }
            else
                series.columns.template.tooltipText = "{name}: [bold]{valueY}[/]";            
            series.tooltip.label.fontSize = 12;
            series.stacked = stacked;
            series.columns.template.events.on("hit", function (ev) {
                eval(jsonPathToValue(ev.target.dataItem._dataContext, idEvento).replace(/(\r\n|\n|\r)/gm, ""));
            }, this);
            series.columns.template.width = am4core.percent(95);
        },        

        CriarColunaBarraInvertida: function(chart, field, name, stacked, categoria, cifraoCurrency, CategoriaTooltip) {
            var series = chart.series.push(new am4charts.ColumnSeries());
            series.dataFields.valueX = field;
            series.dataFields.categoryY = categoria.substring(0, 10);
            series.stacked = stacked;
            series.name = name;

            
            if (stacked) {
                var labelBullet = series.bullets.push(new am4charts.LabelBullet());
                labelBullet.locationX = 0.5;
                labelBullet.label.text = "{valueX}";
                labelBullet.interactionsEnabled = true;
                labelBullet.label.fill = am4core.color("#fff");
            }
            else {
                let valueLabel = series.bullets.push(new am4charts.LabelBullet());
                valueLabel.label.text = "{valueX}";
                valueLabel.label.horizontalCenter = "Left";
                valueLabel.label.dx = 10;
                valueLabel.label.truncate = false;
            }
            

            if (cifraoCurrency)
            {
                chart.numberFormatter.numberFormat = {
                    "style": "currency",
                    "currency": "BRL"
                }
                chart.numberFormatter.intlLocales = "pt-BR";
                series.columns.template.tooltipText = "{name}: [bold]{valueX}[/]";
            }
            else if (CategoriaTooltip)
            {
                chart.numberFormatter.numberFormat = {
                    "style": "currency",
                    "currency": "BRL"
                }
                chart.numberFormatter.intlLocales = "pt-BR";
                series.columns.template.tooltipText = "{categoryY}: [bold]{valueX}[/]";
            }
            else    
                series.columns.template.tooltipText = "{name}: [bold]{valueX}[/]";  

            
                       
            series.tooltip.label.fontSize = 12;
            series.tooltip.pointerOrientation = "vertical";
            series.columns.template.width = am4core.percent(95);
        },  
        
        
        CriarBaseGraficoXYInvertido: function(el, valores, categoria, mostrarLegenda = true) {
            // Themes 
            am4core.useTheme(am4themes_material);
            am4core.useTheme(am4themes_animated);
            // Create chart instance
            var chart = am4core.create(el, am4charts.XYChart);
            chart.fontSize = 12;
            // Add data
            chart.data = valores;
            // Export
            chart.exporting.menu = new am4core.ExportMenu();
            // Create axes
            var categoryAxis = chart.yAxes.push(new am4charts.CategoryAxis());
            categoryAxis.dataFields.category = categoria;
            categoryAxis.renderer.grid.template.location = 0;
            categoryAxis.renderer.minGridDistance = 20;
            categoryAxis.renderer.cellStartLocation = 0.1;
            categoryAxis.renderer.cellEndLocation = 0.9;

            let label = categoryAxis.renderer.labels.template;
            label.truncate = true;
            label.maxWidth = 150;
            label.tooltipText = "{category}";                                 
    
            var valueAxis = chart.xAxes.push(new am4charts.ValueAxis());
            valueAxis.min = 0;
            //chart.cursor = new am4charts.XYCursor();
    
            valueAxis.events.on("startchanged", valueAxisZoomed);
            valueAxis.events.on("endchanged", valueAxisZoomed);
            function valueAxisZoomed(ev) {
                let start = ev.target.minZoomed;
                let end = ev.target.maxZoomed;
            }
    
            if (mostrarLegenda) {
                chart.legend = new am4charts.Legend();
            }
    
            return chart
        },        
        
        CriarLinha: function(chart, field, nome, categoria) {
            var lineSeries = chart.series.push(new am4charts.LineSeries());
            lineSeries.name = nome;
            lineSeries.dataFields.valueY = field;
            lineSeries.dataFields.categoryX = categoria;
            lineSeries.strokeWidth = 3;
            lineSeries.tooltip.label.textAlign = "middle";
            lineSeries.fillOpacity = 0.3;
            lineSeries.tensionX = 0.77;
            chart.numberFormatter.numberFormat = {
                "style": "currency",
                "currency": "BRL"
            }
            chart.numberFormatter.intlLocales = "pt-BR";
            var bullet = lineSeries.bullets.push(new am4charts.Bullet());
            bullet.tooltipText = "{name}: [bold]{valueY}[/]";
            lineSeries.tooltip.label.fontSize = 12;
            var circle = bullet.createChild(am4core.Circle);
            circle.radius = 4;
            circle.strokeWidth = 3;
        },
        
        CriarLinhaAmarela: function(chart, field, nome, categoria, cifraoCurrency) {
            var lineSeries = chart.series.push(new am4charts.LineSeries());
            lineSeries.name = nome;
            lineSeries.dataFields.valueY = field;
            lineSeries.dataFields.categoryX = categoria;
            lineSeries.stroke = am4core.color("#fdd400");
            lineSeries.strokeWidth = 3;
            lineSeries.tensionX = 0.77;
            lineSeries.tooltip.label.textAlign = "middle";
            lineSeries.tooltip.label.fontSize = 12;
    
            var bullet = lineSeries.bullets.push(new am4charts.Bullet());
            bullet.fill = am4core.color("#fdd400");
            if (cifraoCurrency)
            {
                chart.numberFormatter.numberFormat = {
                    "style": "currency",
                    "currency": "BRL"
                }
                chart.numberFormatter.intlLocales = "pt-BR";
                bullet.tooltipText = "{name}: R$ [bold]{valueY}[/]";
            }
            else    
                bullet.tooltipText = "{name}: [bold]{valueY}[/]";
            var circle = bullet.createChild(am4core.Circle);
            circle.radius = 4;
            circle.fill = am4core.color("#fdd400");
            circle.strokeWidth = 3;
        },
        
        CriarBaseGraficoPizza: function(el, data, categoria) {
            am4core.useTheme(am4themes_material);
            am4core.useTheme(am4themes_animated);
            // Themes end
            
            // Create chart instance
            var chart = am4core.create(el, am4charts.PieChart);
            chart.fontSize = 12;
            // Add data
            chart.data = data;
            
            // Add and configure Series
            var pieSeries = chart.series.push(new am4charts.PieSeries());
            pieSeries.dataFields.value = "Value";
            pieSeries.dataFields.category = categoria;
            pieSeries.slices.template.stroke = am4core.color("#fff");
            pieSeries.slices.template.strokeOpacity = 1;

            chart.hiddenState.properties.radius = am4core.percent(0);

            pieSeries.alignLabels = false;
            pieSeries.labels.template.bent = true;
            pieSeries.labels.template.radius = 3;
            pieSeries.labels.template.padding(0,0,0,0);            
            
            // This creates initial animation
            pieSeries.hiddenState.properties.opacity = 1;
            pieSeries.hiddenState.properties.endAngle = -90;
            pieSeries.hiddenState.properties.startAngle = -90;
            

            
            // Create hover state
            var hoverState = pieSeries.slices.template.states.getKey("hover"); // normally we have to create the hover state, in this case it already exists

            // Slightly shift the shadow and make it more prominent on hover
            var hoverShadow = hoverState.filters.push(new am4core.DropShadowFilter);
            hoverShadow.opacity = 0.7;
            hoverShadow.blur = 5;

            // Add a legend
            chart.legend = new am4charts.Legend();            


        }
    };
}();

export default AmChartsCorpComponent;