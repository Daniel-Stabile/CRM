<%@ Page Title="Saldos de conta" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Contabil.Consultas.ConsultaSaldos, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <script src="<%= ResolveUrl("~/Content/js/BennerGrid.js")%>"></script>   
    <script src="<%= ResolveUrl("~/Content/js/jquery.table2excel.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/RazaoConta.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/BennerXlsx.full.min.js")%>"></script>
    
    <div class="row" id="divFiltros">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="row">
                <erp:ErpFilterForm runat="server"
                    ID="FILTRO"
                    EntityViewName="PORTAL_INT_SALDOS_CONTAS.FORM"
                    Title="Consulta saldos"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"                                        
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="False"
                    UserDefinedCommandsVisible="true"
                    ShowTitle="true"
                    UserDefinedCriteriaWhereClause=""
                    ChromeState="Fixed"
                    OnCommandExecute="FILTRO_CommandExecuted"
                    PageWidgetHandle="1" />
            </div>
        </div>
    </div>
    <div class="row" id="divResultados">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="portlet light">
                <div class="portlet-title">
                    <div class="caption collapsible">
                        <i class="fa fa-table font-green-sharp"></i>
                        <span class="caption-subject font-green-sharp bold uppercase">DEMONSTRATIVO SALDOS DA CONTA</span>
                        <span class="caption-helper" id="contaDescricao"></span>
                    </div>
                    <div class="actions">
                        <a class="btn btn-circle btn-icon-only btn-default fullscreen" title="Exibir tela inteira" data-original-title="Exibir tela cheia"></a>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <a href="#" onclick="ExibirFiltros(true)" class="btn default btn-save command-action predef-action editable" title="Voltar para formulário de filtro."><i class="fa fa-arrow-left"></i>  Voltar para filtros</a>
                            <a href="#" onclick="ExportarAnalitico()" class="btn green" title="Exportar razão analítico conta."><i class="fa fa-download"></i>  Exportar razão analitíco</a>
                        </div>
                    </div>
                    <div class="row margin-top-10">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <div class="tabbable-custom ">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#tabUm" data-toggle="tab" aria-expanded="true">Meses </a>
                                    </li>
                                    <li>
                                        <a href="#tabDois" data-toggle="tab" aria-expanded="false">Gráfico</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tabUm">
                                        <div class="row">
                                            <div class="col-md-12 col-lg-12 col-sm-12">
                                                <wes:SimpleGrid runat="server"
                                                    ID="CONSULTA"
                                                    EntityViewName="PORTAL_INT_SALDOS_CONTAS.GRID"
                                                    UserDefinedDisableRowSelection="True"
                                                    UserDefinedCommandsVisible="True"
                                                    UserDefinedCriteriaWhereClause="A.USUARIO = @USUARIO"
                                                    UserDefinedSelectColumnVisible="False"
                                                    HideDeveloperCommands="True"
                                                    CompanyFilterMode="None"
                                                    DisplayRowCommand="False"
                                                    FilterVisible="False"
                                                    SystemFilterOnly="True"
                                                    UserDefinedPageSize="20"                                                    
                                                    Mode="None"
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"
                                                    ShowTitle="False"
                                                    ChromeState="Normal" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tabDois">
                                        <div id="grafico" style="min-height: 350px"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div id="container"></div>
    <script type="text/javascript">

        Sys.Application.add_init(appl_init);
        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_initializeRequest(BeginHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function BeginHandler(sender, args) {
            var req = document.getElementById('__EVENTTARGET');

        // Passa a usar o exportador da tecnologia para SimpleGrid
        //    if (req.value == 'ctl00$Main$CONSULTA') {
        //        var tcaption = document.createElement('thead');
        //        var tr = document.createElement('tr');
        //        var th = document.createElement('th');

        //        th.innerText = $('#contaDescricao').text()
        //        th.colSpan = 5;
        //        th.style = 'text-align:center';
        //        $(tr).append(th);
        //        $(tr).appendTo(tcaption);
        //        $(tcaption).addClass('hide');
        //        $('#ctl00_Main_CONSULTA_SimpleGrid').prepend($(tcaption));
        //        args.set_cancel(true);

        //        ExportarPlanilha('#ctl00_Main_CONSULTA_SimpleGrid', 'SDCONTA{0}-{1}.xls'.replace('{0}', $('#contaDescricao').text()).replace('{1}', Math.floor(Math.random() * 9999)), 'nome planilha')
        //        $(tcaption).remove();
        //    }
            
        }

        function EndHandler() {
            $('tbody tr').click(function (e) {                
                MontarObjetoEnvioPost(this);
            });
            ExibirFiltros(false);
            MontarGrafico();
        }


        function ExportarAnalitico() {
            var retornoExport = RazaoContaAnalitico();
        };

        //Métodos a serem executados no evento load da página.
        $(function () {
            ExibirFiltros(true);

            //Trazer conteudo do modal e adicionar ao corpo da página
            $("#container").load(Benner.Page.getApplicationPath() + 'ConsultasContabil/RazaoConta', function () {
                $(this).clone().appendTo("body").remove();
            });
        })

        //Exibe ou esconde o portlet de filtros a premissa é que escondendo o filtro mostraremos os resultados(grid) e vice-versa
        function ExibirFiltros(exibe) {
            var temErros = ($('#ctl00_Main_FILTRO_MsgUser').css('display') == 'block') || ($('.alert-danger').length > 0);
            var filtros = $('#portlet_FILTRO');
            var resultados = $('#divResultados');

            if (temErros && filtros.css('display') == 'none') {
                ExibirMensagem($('#ctl00_Main_FILTRO_MsgUser').text(), TiposMensagem.Erro, $('#ctl00_Main_FILTRO_FormContainer'));
                exibe = true;
            }

            if (exibe) {
                filtros.show();
                resultados.hide();
            }
            else {
			
				$(document).ready(function() {
					var jsonValue = $('#ctl00_Main_FILTRO_PageControl_GERAL_GERAL_ctl05_ESTRUTURACONTACONTABIL_VALUE').val();
					if (jsonValue) {
						var data = JSON.parse(jsonValue);
						var selectedItems = data.SelectedItems;

						if (selectedItems && selectedItems.length > 0) {
							var textValue = selectedItems[0].text;
							$('#contaDescricao').text('(' + textValue + ')').css('font-weight', 'bold');
        						
						}
					}
				});				
				
                toastr.remove();
                filtros.hide();
                resultados.show();
            }
        }

        //Montar e executar o request, conforme a linha informada no parâmetro.
        var objEnvioPost = {};
        var meses = { "JANEIRO": "01", "FEVEREIRO": "02", "MARÇO": "03", "ABRIL": "04", "MAIO": "05", "JUNHO": "06", "JULHO": "07", "AGOSTO": "08", "SETEMBRO": "09", "OUTUBRO": "10", "NOVEMBRO": "11", "DEZEMBRO": "12" };
        function MontarObjetoEnvioPost(tr) {
			
            var comp = tr.cells[0].innerText.split('/');

            objEnvioPost.ContaContabil = $('[data-field="ESTRUTURACONTACONTABIL"]').val();
            objEnvioPost.ContaContabilTexto = $('[data-field="ESTRUTURACONTACONTABIL"]').text();
            objEnvioPost.CentroCusto = $('[data-field="ESTRUTURACENTROCUSTO"]').val();
            objEnvioPost.Projeto = $('[data-field="ESTRUTURAPROJETO"]').val();
            objEnvioPost.Filial = $('[data-field="FILIAL"]').val();
            objEnvioPost.Competencia = comp[1] + '-' + meses[comp[0].toUpperCase()] + '-01';
            objEnvioPost.SaldoAtual = ToDecimal(tr.cells[4].innerText);
            
            setTimeout(function () {                
                ObterRazao(objEnvioPost);

            }, 300);
        }

    //Desenha o gráfico conforme os dados da tabela HTML.
    function MontarGrafico() {

        var dadosGrafico = [], valores = [];
        var _tbl = $('#ctl00_Main_CONSULTA_SimpleGrid tbody tr');
        if (_tbl.length < 2) {
            $('[href="#tabDois"]').parent().hide();
            $('[href="#tabUm"]').trigger('click');
        }
        else {
            $('[href="#tabDois"]').parent().show();
            $.each(_tbl, function (i, tr) {
                var lnAtual = {};
                lnAtual.SALDO = ToDecimal(tr.cells[3].innerText);
                lnAtual.DEBITOS = ToDecimal(tr.cells[1].innerText);
                lnAtual.CREDITOS = ToDecimal(tr.cells[2].innerText);

                //Pega o valor da coluna Mês do Grid que contém o nome completo do mês, no gráfico vamos mostrar apenas 3 posições + ano
                var comp = tr.cells[0].innerText.toUpperCase();
                lnAtual.COMPETENCIA = comp.substr(0, 3) + comp.substr(comp.length - 5, 5);

                dadosGrafico.push(lnAtual);
                valores.push(lnAtual.SALDO, lnAtual.DEBITOS, lnAtual.CREDITOS);


            })

            var maiorDeTodos = Math.max.apply(null, valores);
            var menorDeTodos = Math.min.apply(null, valores);

            if (dadosGrafico.length != 0) {

                var chart = AmCharts.makeChart("grafico", {
                    "type": "serial",
                    "theme": "light",
                    "decimalSeparator": ",",
                    "precision": 2,
                    "thousandsSeparator": ".",
                    "path": Benner.Page.getApplicationPath() + "content/assets/plugins/amcharts/",
                    "language": "pt",
                    "legend": {
                        "useGraphSettings": true
                    },
                    "dataProvider": dadosGrafico,
                    "valueAxes": [{
                        "integersOnly": true,
                        "maximum": maiorDeTodos,
                        "minimum": menorDeTodos,
                        "reversed": false,
                        "axisAlpha": 0,
                        "dashLength": 5,
                        "gridCount": dadosGrafico.length,
                        "position": "left",
                        "title": "Evolução dos saldos"
                    }],
                    "startDuration": 0.5,
                    "graphs": [{
                        "balloonText": "Saldo em [[category]]: <b>[[value]]</b>",
                        "bullet": "round",
                        "bulletSize": 4,
                        "bulletAlpha": 0.7,
                        "bulletBorderAlpha": 0.7,
                        "bulletBorderColor": "#000000",
                        "bulletColor": "#000000",
                        "type": "line",
                        "fillColors": "#878780",
                        "lineColor": "#878780",
                        "fillAlphas": 0.8,
                        "lineAlpha":0,
                        "title": "Saldo",
                        "valueField": "SALDO",
                        "legendValueText": " ",
                    }, {
                        "balloonText": "Débitos em [[category]]: <b>[[value]]</b>",
                        "title": "Débitos",
                        "valueField": "DEBITOS",
                        "legendValueText": " ",
                        "type": "column",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.8,
                        "lineColor": "#3598dc",
                        "fillColors": "#3598dc",
                    }, {
                        "balloonText": "Créditos em [[category]]: <b>[[value]]</b>",
                        "title": "Créditos",
                        "valueField": "CREDITOS",
                        "legendValueText": " ",
                        "type": "column",
                        "fillAlphas": 0.8,
                        "lineAlpha": 0.8,
                        "lineColor": "#e7505a",
                        "fillColors": "#e7505a"
                    }],
                    "chartCursor": {
                        "cursorAlpha": 0,
                        "zoomable": false
                    },
                    "categoryField": "COMPETENCIA",
                    "export": { "enabled": true },
                    "categoryAxis": {
                        "gridPosition": "start",
                        "axisAlpha": 0,
                        "fillAlpha": 0.05,
                        "fillColor": "#000000",
                        "gridAlpha": 0,
                        "position": "top"
                    },
                });
            }


        }
    }
</script>
</asp:Content>
