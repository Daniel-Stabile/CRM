<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PerPreVendedorMesAnterior.ascx.cs" Inherits="Pages_K_CRM_PESSOAS_e_uc_PerPreVendedorMesAnterior" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<style>
    #chartdivMes {
        width: 100%;
        height: 265px;
        margin: auto;
    }
</style>

<!-- Resources -->
<script src="../content/assets/amcharts/amcharts.js"></script>
<script src="../content/assets/amcharts/gauge.js"></script>
<script src="../content/assets/amcharts/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="../content/assets/amcharts/plugins/export/export.css" type="text/css" media="all" />
<script src="../content/assets/amcharts/themes/light.js"></script>
<script>
    var strMes = '<%= GetValues() %>';
    var jsonMes = JSON.parse(strMes);
   
    
    var gaugeChart = AmCharts.makeChart("chartdivMes", {
        "type": "gauge",
        "theme": "light",
        "axes": [{
            "axisAlpha": 0,
            "tickAlpha": 0,
            "labelsEnabled": false,
            "startValue": 0,
            "endValue": 100,
            "startAngle": 0,
            "endAngle": 270,
            "bands": [{
                "color": "#eee",
                "startValue": 0,
                "endValue": 100,
                "radius": "100%",
                "innerRadius": "85%",
                "balloonText": jsonMes[0]["Prc"] + "%"
            }, {
                "color": "#84b761",
                "startValue": 0,
                "endValue": jsonMes[0]["Prc"] > 100 ? 100 : jsonMes[0]["Prc"],
                "radius": "100%",
                "innerRadius": "85%",
                "balloonText": jsonMes[0]["Prc"] + "%"
            }, {
                "color": "#eee",
                "startValue": 0,
                "endValue": 100,
                "radius": "80%",
                "innerRadius": "65%",
                "balloonText": jsonMes[1]["Prc"] + "%"
            }, {
                "color": "#fdd400",
                "startValue": 0,
                "endValue": jsonMes[1]["Prc"] > 100 ? 100 : jsonMes[1]["Prc"],
                "radius": "80%",
                "innerRadius": "65%",
                "balloonText": jsonMes[1]["Prc"] + "%"
            }, {
                "color": "#eee",
                "startValue": 0,
                "endValue": 100,
                "radius": "60%",
                "innerRadius": "45%",
                "balloonText": jsonMes[2]["Prc"] + "%"
            }, {
                "color": "#cc4748",
                "startValue": 0,
                "endValue": jsonMes[2]["Prc"] > 100 ? 100 : jsonMes[2]["Prc"],
                "radius": "60%",
                "innerRadius": "45%",
                "balloonText": jsonMes[2]["Prc"] + "%"
            }, {
                "color": "#eee",
                "startValue": 0,
                "endValue": 100,
                "radius": "40%",
                "innerRadius": "25%",
                "balloonText": jsonMes[3]["Prc"] + "%"
            }, {
                "color": "#67b7dc",
                "startValue": 0,
                "endValue": jsonMes[3]["Prc"] > 100 ? 100 : jsonMes[3]["Prc"],
                "radius": "40%",
                "innerRadius": "25%",
                "balloonText": jsonMes[3]["Prc"] + "%"
            }]
        }],
        "allLabels": [{
            "text": jsonMes[0]["Nome"],
            "x": "49%",
            "y": "5%",
            "size": 12,
            "bold": true,
            "color": "#84b761",
            "align": "right"
        }, {
            "text": jsonMes[1]["Nome"],
            "x": "49%",
            "y": "15%",
            "size": 12,
            "bold": true,
            "color": "#fdd400",
            "align": "right"
        }, {
            "text": jsonMes[2]["Nome"],
            "x": "49%",
            "y": "24%",
            "size": 12,
            "bold": true,
            "color": "#cc4748",
            "align": "right"
        }, {
            "text": jsonMes[3]["Nome"],
            "x": "49%",
            "y": "33%",
            "size": 12,
            "bold": true,
            "color": "#67b7dc",
            "align": "right"
        }],
        "export": {
            "enabled": true
        }
    });
</script>
<div class="row">
    <div class="col-lg-12">
	    <div class="portlet light bordered">
            <div class="portlet-title">
				<div class="caption">
					<span class="caption-subject bold font-green uppercase">KPI - Mês Anterior</span>
					<!--<span class="caption-helper"></span>-->
				</div>
				<div class="actions">
                    <%--<a id="teste" runat="server" class="btn blue pull-left">Novo</a>--%>
					<%--<!--<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="#" data-original-title="" title="Tela Cheia"></a>--%>
				</div>
			</div>
	        <div class="portlet body form" id="portletTimeline">
                <div class="widget-body row">
                    <div class="col-md-12 top nobg no-border fluid" style="padding:10px 15px;margin-bottom:10px">
                        <%--<a id="novaTarefa" runat="server" class="btn green btn-new command-action predef-action editable"><i class="fa fa-plus btn-action"></i> Novo</a>--%>
                        <%--<a href="<%= ResolveClientUrl("~/commands/K_CRM_TAREFAUSUARIO.FORM/New") %>" class="btn green listCommands"> Novo</a>--%>
                    </div>
		            <div class="col-md-12 ">
                        <div id="chartdivMes"></div>
		            </div>
                 </div>
	        </div>
	    </div>
    </div>
</div>