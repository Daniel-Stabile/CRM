<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GraficoVertical.aspx.cs" Inherits="Views_CrmPerformance_GraficoVertical" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <div id="appCrmPerformanceMeta" class="row">
        <div id="chartdiv" style="height:400px"></div>
    </div>
</body>
<script type="text/javascript">
    var app = new Vue({
        el: '#appCrmPerformanceMeta',
        data: {
            DataValue: [],
            Mensagem: "",
            Loading:false
        },
        methods: {
            InicializaGrafico: function () {
                var scope = this;

                var chart = AmCharts.makeChart("chartdiv", {
                    "type": "serial",
	                "language": "pt",
	                "theme": "light",
                    "export": {
                    	"enabled": true
                     },
                    "legend": {
                        "horizontalGap": 10,
                        "maxColumns": 1,
                        "position": "right",
                        "useGraphSettings": true,
                        "markerSize": 10
                    },
                    "categoryField": "Data",
                    "categoryAxis": {
                        "gridPosition": "start",
                        "axisAlpha": 0,
                        "gridAlpha": 0,
                        "position": "left",
                        "labelRotation": 15
                    },
                    "dataProvider": scope.DataValue,
                    "valueAxes": [{
                        "stackType": "regular",
                        "axisAlpha": 0.3,
                        "gridAlpha": 0
                    }],
                    "graphs": [
                        {
		            	    "labelText": "",
		            	    "balloonText": "Meta : [[value]]",
		            	    "id": "AmGraph-1",
		            	    "title": "Meta",
		            	    "alphaField": "fill_alpha_field",
		            	    "valueField": "Meta",
		            	    "urlField": "Link",
		            	    "type": "column",
		            	    "bullet": "round",
		            	    "bulletBorderAlpha": 1,
		            	    "bulletColor": "#FFFFFF",
		            	    "bulletSize": 5,
		            	    "useLineColorForBulletBorder": true,
		            	    "lineColor": "#e1ede9",
		            	    "fillColors": "#e1ede9",
		            	    "fillAlphas": 1,
		            	    "clustered": false,
		            	    "columnWidth": 0.5
                        },
                        {
                            "labelText": "",
			                "balloonText": "Perfomance Atingida : [[value]]",
			                "id": "AmGraph-2",
			                "title": "Perfomance Atingida",
			                "alphaField": "fill_alpha_field",
			                "valueField": "Valor",
		            	    "urlField": "Link",
			                "type": "column",
			                "fillAlphas": 1,
			                "bullet": "round",
			                "bulletBorderAlpha": 1,
			                "bulletColor": "#FFFFFF",
			                "bulletSize": 5,
			                "useLineColorForBulletBorder": true,
			                "lineColor": "#2ECC71",
			                "fillColors": "#2ECC71",
			                "columnWidth": 0.45,
			                "newStack": true,
			                "clustered": false
                    }],
	                "chartCursor": {
	                	"cursorAlpha": 0,
	                	"zoomable": false
	                }
                });
            
            }
        },
        watch: {
            
        },
        mounted: function () {
            var scope = this;
            var jsonTestePlanilha = <%= JsonMetas.ToString()%>;
            var json;
            var mensagem = "";

            if (jsonTestePlanilha != "Json")
                json = <%= JsonMetas%>;
            else
                json = {}
            
            mensagem = "<%= mensagem%>";
            
            console.log("Gráfico");
            console.log(json);

            scope.DataValue = json;

            scope.InicializaGrafico();

            console.log(scope);
        }
    });
</script>
</html>
