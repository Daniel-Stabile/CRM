<%@ Page Title="Visão Geral" Language="C#" CodeFile="~/Erp/VisaoGeral.aspx.cs" Inherits="ErpVisaoGeralPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Src="~/uc/Tile.ascx" TagPrefix="wes" TagName="Tile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <h3 class="page-title">Visão geral <small></small>
    </h3>
    <div class="row">
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <wes:Tile runat="server" Description="A receber hoje" Color="green" ID="TileReceberHoje" />
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <wes:Tile runat="server" Description="A pagar hoje" Color="red" ID="TilePagarHoje" />
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <wes:Tile runat="server" Description="Todos recebimentos em atraso" Color="green" ID="TileRecebimentosAtraso" />
        </div>
        <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
            <wes:Tile runat="server" Description="Todos pagamentos em atraso" Color="red" ID="TilePagamentosAtraso" />
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 col-sm-6">
            <div class="portlet solid bordered grey-cararra">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-chart"></i> Fluxo de caixa diário
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="fluxoCaixaDiario" class="chart"></div>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-sm-6">
            <div class="portlet solid bordered grey-cararra">
                <div class="portlet-title">
                    <div class="caption">
                        <i class="fa fa-chart"></i> Gráfico de vendas
                    </div>
                </div>
                <div class="portlet-body">
                    <div id="vendasUltimos12Meses" class="chart"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            AmCharts.makeChart("fluxoCaixaDiario",
            {
                "type": "serial",
                "categoryField": "dia",
                "startDuration": 1,
                "categoryAxis": {
                    "gridPosition": "start"
                },
                "graphs": [
                    {
                        "balloonText": "[[title]] do dia [[dia]] R$[[value]]",
                        "fillAlphas": 1,
                        "title": "Recebimentos",
                        "type": "column",
                        "valueField": "recebimentos",
                        "fillColors": "#32c5d2",
                        "lineColor": "#32c5d2",
                    },
                    {
                        "balloonText": "[[title]] do dia [[dia]] R$[[value]]",
                        "fillAlphas": 1,
                        "title": "Pagamentos",
                        "type": "column",
                        "valueField": "pagamentos",
                        "fillColors": "#e7505a",
                        "lineColor": "#e7505a",
                    },
                    {
                        "balloonText": "[[title]] do dia [[dia]] R$[[value]]",
                        "bullet": "round",
                        "title": "Saldo",
                        "valueField": "saldo",
                        "fillColors": "#2C3E50",
                        "lineColor": "#2C3E50",
                    }
                ],
                "valueAxes": [
                    {
                        "stackType": "regular",
                    }
                ],
                "legend": {
                    "enabled": true,
                    "useGraphSettings": true
                },
                "dataProvider": [
                    {
                        "dia": 10,
                        "recebimentos": 8,
                        "pagamentos": -5,
                        "saldo": 20
                    },
                    {
                        "dia": 11,
                        "recebimentos": 10,
                        "pagamentos": -2,
                        "saldo": 30
                    },
                    {
                        "dia": 12,
                        "recebimentos": 15,
                        "pagamentos": -1,
                        "saldo": 10
                    }
                ]
            });

            AmCharts.makeChart("vendasUltimos12Meses",
            {
                "dataLoader": {
                    "url": $("#Wes2008ApplicationPath").val() + "api/Financeiro/VendasUltimos12Meses",
                    "format": "json"
                },
                "type": "serial",
                "categoryField": "mesano",
                "startDuration": 1,
                "categoryAxis": {
                    "gridPosition": "start",
                },
                "graphs": [
                    {
                        "balloonText": "Faturamento no mês [[mesano]] R$ [[value]]",
                        "fillAlphas": 1,
                        "id": "AmGraph-1",
                        "title": "graph 1",
                        "type": "column",
                        "valueField": "faturamento",
                        "fillColors": "#32c5d2",
                        "lineColor": "#32c5d2",
                    }
                ],
            });
        });
    </script>
</asp:Content>
