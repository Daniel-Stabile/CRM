<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Corporativo.Wes.WebApp.DashBoardConciliacaoFinanceiraControl,Benner.Corporativo.Wes.WebApp" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<script>

    var AtualizaInfoConciliacaoBancaria = function (year, month) {

        var el = $("#InfoConciliacaoBancaria");
        // Bloquear interface
        App.blockUI({ target: el, boxed: false, message: "Carregando..." });

        var u = $("#Wes2008ApplicationPath").val() + "api/Financeiro/GetInfoConciliacaoBancaria";

        $.ajax({
            context: el,
            dataType: "json",
            url: u,
            data: { ano: year, mes: month }
        }).done(function (data) {
            document.getElementById("QtdeContasConciliadas").innerHTML = data.QtdeContasConciliadas;
            document.getElementById("QtdeContasSemMovimentacao").innerHTML = data.QtdeContasSemMovimentacao;

            // Liberar interface
            App.unblockUI(el);
        });
    };

    var ExportarInfoConciliacaoBancaria = function () {
        var chart = document.getElementById("chartConciliacaoBancaria");
        var source = chart.getAttribute("source").split("-");
        var index = source[1].split(",");

        var u = $("#Wes2008ApplicationPath").val() + "api/Financeiro/ExportarInfoConciliacaoBancaria?ano=" + index[1] + "&mes=" + index[2];
        var el = $("#InfoConciliacaoBancaria");

        toastr.info("Exportar detalhes de conciliação bancária para excel.", "Exportar excel");

        $.ajax({
            context: el,
            dataType: "json",
            type: "POST",
            url: u
        }).done(function (data) {
            Benner.AsyncProcesses.initAjax();
        });
    }
</script>
<div class="portlet solid bordered white">
    <div class="portlet-title">
        <div class="caption">
            <i class="fa fa-bar-chart-o null"></i>            
            <span class="null">Conciliação bancária</span>                           
        </div>
        <div class="tools">
            <i class="fa fa-download" style="cursor: pointer" onclick="ExportarInfoConciliacaoBancaria();"></i> 
        </div>
    </div>
    <div class="row">
        <div class="portlet-body">
            <div class="col-lg-7 col-xs-6 col-sm-6">
                <erp:ErpDashboardChartNoTitle id="chartConciliacaoBancaria" runat="server" source="financeiro-0" height="26vh" />
            </div>
            <div class="col-lg-5 col-xs-6 col-sm-6" id="InfoConciliacaoBancaria">
                <span style="font-size: 25px; font-weight: bold; text-align: left;" id="QtdeContasConciliadas">0/0</span>
                <br />
                <span style="font-size: 12px; text-align: left;">Contas</span>
                <br />
                <span style="font-size: 12px; text-align: left;">Conciliadas</span>
                <br />
                <br />
                <span style="font-size: 25px; font-weight: bold; text-align: left;" id="QtdeContasSemMovimentacao">0/0</span>
                <br />
                <span style="font-size: 12px; text-align: left;">Contas</span>
                <br />
                <span style="font-size: 12px; text-align: left;">sem movimentação</span>
            </div>
        </div>
    </div>
</div>


