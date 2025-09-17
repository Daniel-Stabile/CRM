<template>
    <div class="portlet light">
        <div class="portlet-body">
            <wes-message v-bind="getMessagePanel()"></wes-message>

            <slot name="filtro"></slot>

            <div v-if="(this.showCheckBox && this.data && this.data.length > 0)">
                Mostrar:&nbsp;&nbsp;
                <label class="mt-checkbox" v-for="(item, index) in this.fields.filter(item=>item.groupIndex >= 0 && item.groupName !== 'Date')" :key="index">
                    {{ item.caption + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" }}
                    <input type="checkbox" @click="checkClick(item)" v-model="item.visible">
                    <span></span>
                </label>
            </div>
            <div id="pivotgrid"></div>
        </div>
    </div>
</template>
<script>
    var DevExpress = require("devextreme/bundles/modules/core");
    var dx = (DevExpress.ui = require("devextreme/bundles/modules/ui"));
    require("devextreme/integration/jquery");
    require("devextreme-intl");
    const localization = require('devextreme/localization');
    localization.locale("pt-BR");
    DevExpress.config({ defaultCurrency: 'BRL' })
    require("devextreme/ui/pivot_grid");
    require("devextreme/viz/chart");
    import { mapGetters } from 'vuex';
    
    export default {
        props: ['title'],
        data () {
            return {
                data: null,
                fields: [],
                pivotGrid: null,
                fieldPanelVisible: true,
                fieldPanelShowColumnFields: true,
                fieldPanelShowDataFields: true,
                fieldPanelShowFilterFields: true,
                showCheckBox: true
            };
        },
        computed: {
            ...mapGetters({isFieldChecked: 'filtro/isFieldChecked'})
        },
        mounted: function () {
            let vm = this;
            this.$store.subscribe((mutation, state) => {                        
                if (mutation.type == 'pivotgrid/beginRequest') {
                    vm.beginRequest();
                }
                else if (mutation.type == 'pivotgrid/endRequestSuccess') {
                    vm.loadData(state.pivotgrid.dataset);
                }
                else if (mutation.type == 'pivotgrid/endRequestError') {
                    vm.endRequestError(state.pivotgrid.error);
                }
            });
            //this.renderPivot();
            // ====================================== TESTE ==================================================
        },
        methods: { 
            getDefaultFields: function() {
                return [{"groupName":"ContaContabil","area":"row"},{"caption":"Contas","dataField":"conta1","visible":true,"groupName":"ContaContabil","groupIndex":0},{"caption":"2","dataField":"conta2","visible":false,"groupName":"ContaContabil","groupIndex":1},{"caption":"3","dataField":"conta3","visible":false,"groupName":"ContaContabil","groupIndex":2},{"caption":"4","dataField":"conta4","visible":false,"groupName":"ContaContabil","groupIndex":3},{"caption":"5","dataField":"conta5","visible":false,"groupName":"ContaContabil","groupIndex":4},{"dataField":"date","dataType":"date","area":"column","groupName":"Date"},{"groupName":"Date","caption":"Ano","groupInterval":"year","groupIndex":"0"},{"groupName":"Date","caption":"Mês","groupInterval":"month","groupIndex":"1"},{"dataField":"saldoAnterior","summaryType":"sum","caption":"Saldo anterior","format":{"type":"currency","precision":2,"currency":"BRL"},"area":"data","calculateSummaryValue":"function(e) { if (e.field('column') == null) { return e.value(); } else { return null; } }"},{"dataField":"debito","caption":"Débitos","area":"data","dataType":"number","format":{"type":"currency","precision":2,"currency":"BRL"},"summaryType":"sum","disableContext":true},{"dataField":"credito","caption":"Créditos","area":"data","dataType":"number","format":{"type":"currency","precision":2,"currency":"BRL"},"summaryType":"sum","disableContext":true},{"dataField":"saldoAtual","summaryType":"sum","caption":"Saldo anterior","format":{"type":"currency","precision":2,"currency":"BRL"},"area":"data","calculateSummaryValue":"function(e) { if (e.field('column') == null) { return e.value(); } else { return null; } }"}]
            } ,
            beginRequest: function () {
                this.clearMessagePanel();
                window.App.blockUI({
                    target: this.$el,
                    message: '<h3>Buscando dados...</h3>',
                });
            },
            getMessagePanel() {
                return this.$store.state.pivotgrid.messagePanel;    
            },
            setMessagePanel(mensagem) {
                this.$store.commit('pivotgrid/setMessagePanel', mensagem);    
            },
            clearMessagePanel() {
                this.$store.commit('pivotgrid/clearMessagePanel');    
            },
            endRequestError: function (error) {
                window.App.unblockUI(this.$el);
                this.setMessagePanel({type: "danger", message: error, title: ""});
                this.renderPivot();
            },
            loadData: function (dataset) {
                window.App.unblockUI(this.$el);
                
                if (dataset.avisosGeracao)
                    this.setMessagePanel({type: "info", message: dataset.avisosGeracao, title: "Advertência"});
                else
                    this.clearMessagePanel();

                // DEBUG
                //this.fields = this.getDefaultFields();                
                //this.data = dataset;

                // PROD
                this.fields = dataset.fields;
                this.data = dataset.store;
                sessionStorage.setItem('nivelConta', dataset.nivelEstrutura);

                /* MANTER COMENTADO PORQUE ESSA GAMBI É FEITA NO BACKEND, DE FORMA MAIS BELA
                if (data != null && data.length > 0) {                    
                    this.groupData('conta', 'Conta', 'niveisConta');
                    this.groupData('centroCusto', 'Centro de custo', 'niveisCentroCusto');
                    this.groupData('projeto', 'Projeto', 'niveisProjeto');
                }*/

                this.renderPivot();

                jQuery('.dx-pivotgrid-toolbar').append(
                       //Botão imprimir comentado, pois não funciona direito, precisa pensar noutra forma de fazer.
                       //'<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                       //     '<button type="button" title="Imprimir" style="border:none; background:none; font-size: 1.5em;" onclick="PrintPivotGrid2()"><i class="fa fa-print"></i></button>'+
                       //'</div>'+
                       // espaçamento - inicio
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       // espaçamento - fim
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                            '<span>Nível:  </span>'+
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Expandir nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="ExpandConta()"><i class="fa fa-plus-circle"></i></button>'+
                            '</div>'+    
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Recolher nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="CollapseConta()"><i class="fa fa-minus-circle"></i></button>'+
                            '</div>'+    
                       '</div>'
                       // espaçamento - inicio
                       /*'<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       // espaçamento - fim
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                            '<span>CC:  </span>'+
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Expandir nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="ExpandCC()"><i class="fa fa-plus-circle"></i></button>'+
                            '</div>'+    
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Recolher nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="CollapseCC()"><i class="fa fa-minus-circle"></i></button>'+
                            '</div>'+    
                       '</div>'+
                       // espaçamento - inicio
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon"></div>'+
                       // espaçamento - fim
                       '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                            '<span>Projeto:  </span>'+
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Expandir nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="ExpandProjeto()"><i class="fa fa-plus-circle"></i></button>'+
                            '</div>'+    
                            '<div class="dx-pivotgrid-export-button dx-button dx-button-normal dx-widget dx-button-has-icon">'+
                                '<button type="button" title="Recolher nível" style="font-size:20px;background-color: #f8f8f8;border:none;" onclick="CollapseProjeto()"><i class="fa fa-minus-circle"></i></button>'+
                            '</div>'+    
                       '</div>'*/);
            },
            checkClick: function (field) {
                //console.log("checkclick");
                this.pivotGrid.getDataSource().field(field.dataField, { visible: !field.visible });
                this.pivotGrid.getDataSource().reload();
            },
            renderPivot: function () { 
                // campos e valores comentados abaixo são pra teste.
                /*this.fields = [
                    {
                        "groupName": "ContaContabil",
                        "area": "row"
                    },
                    {
                        "caption": "Contas",
                        "visible": true,
                        "dataField": "conta1",
                        "groupName": "ContaContabil",
                        "groupIndex": 0
                    },
                    {
                        "caption": "2",
                        "visible": false,
                        "dataField": "conta2",
                        "groupName": "ContaContabil",
                        "groupIndex": 1
                    },
                    {
                        "caption": "3",
                        "visible": false,
                        "dataField": "conta3",
                        "groupName": "ContaContabil",
                        "groupIndex": 2
                    },
                    {
                        "caption": "4",
                        "visible": false,
                        "dataField": "conta4",
                        "groupName": "ContaContabil",
                        "groupIndex": 3
                    },
                    {
                        "caption": "5",
                        "visible": false,
                        "dataField": "conta5",
                        "groupName": "ContaContabil",
                        "groupIndex": 4
                    },
                    {
                        "dataField": "date",
                        "dataType": "date",
                        "area": "column",
                        "groupName": "Date"
                    },
                    {
                        "groupName": "Date",
                        "caption": "Ano",
                        "groupInterval": "year",
                        "groupIndex": 0
                    },
                    {
                        "groupName": "Date",
                        "caption": "Mês",
                        "groupInterval": "month",
                        "groupIndex": 1
                    },
                    {
                        "dataField": "saldoAnterior",
                        "summaryType": "sum",
                        "caption": "Saldo anterior",
                        "format": {
                        "type": "currency",
                        "precision": 2,
                        "currency": "BRL"
                        },
                        "area": "data",
                        "calculateSummaryValue": "function(e) { if (e.field('column') == null) { return e.value(); } else { return null; } }"
                    },
                    {
                        "dataField": "debito",
                        "caption": "Débitos",
                        "area": "data",
                        "dataType": "number",
                        "format": {
                        "type": "currency",
                        "precision": 2,
                        "currency": "BRL"
                        },
                        "summaryType": "sum",
                        "disableContext": true
                    },
                    {
                        "dataField": "credito",
                        "caption": "Créditos",
                        "area": "data",
                        "dataType": "number",
                        "format": {
                        "type": "currency",
                        "precision": 2,
                        "currency": "BRL"
                        },
                        "summaryType": "sum",
                        "disableContext": true
                    },
                    {
                        "dataField": "saldoPeriodo",
                        "summaryType": "sum",
                        "caption": "Saldo do período",
                        "format": {
                        "type": "currency",
                        "precision": 2,
                        "currency": "BRL"
                        },
                        "area": "data",
                        "calculateSummaryValue": "function(e) { if (e.field('column') != null) { return e.value(); } else { return null; } }"
                    },
                    {
                        "dataField": "saldoAtual",
                        "summaryType": "sum",
                        "caption": "Saldo anterior",
                        "format": {
                        "type": "currency",
                        "precision": 2,
                        "currency": "BRL"
                        },
                        "area": "data",
                        "calculateSummaryValue": "function(e) { if (e.field('column') == null) { return e.value(); } else { return null; } }"
                    }
                    ];    */
                /*console.log(this.fields);*/
                /*var sales = [{
                    "id": 10248,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.02 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Debitos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 2740,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-02-06")
                }, {
                    "id": 10259,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.02 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Debitos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 2740,
                    "saldoAnterior": 0,
                    "saldoAtual": 0,
                    "date": new Date("2019-01-06")
                }, {
                    "id": 10254,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.01 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Créditos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 2000,
                    "saldoAnterior": 6000,
                    "saldoAtual": 1240,
                    "date": new Date("2019-02-06")
                }, {
                    "id": 10254,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.01 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Créditos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 2000,
                    "saldoAnterior": 0,
                    "saldoAtual": 0,
                    "date": new Date("2019-02-06")
                }, {
                    "id": 10256,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Créditos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 2000,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-02-06")
                }, {
                    "id": 10249,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.03 - CONTA CONTABIL",
                    "cc": "01.01 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Debitos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 740,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-01-06")
                }, {
                    "id": 10250,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.02 - CONTA CONTABIL",
                    "conta3": "01.02.04 - CONTA CONTABIL",
                    "cc": "01.02 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Créditos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 740,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-01-06")
                }, {
                    "id": 10251,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.02 - CONTA CONTABIL",
                    "conta3": "01.02.04 - CONTA CONTABIL",
                    "cc": "01.02 - CENTRO CUSTO",
                    "projeto": "02.02 - PROJETO",
                    "tipo": "Créditos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 740,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-01-06")
                }, {
                    "id": 10252,
                    "conta1": "01 - CONTA CONTABIL",
                    "conta2": "01.01 - CONTA CONTABIL",
                    "conta3": "01.01.02 - CONTA CONTABIL",
                    "cc": "01.02 - CENTRO CUSTO",
                    "projeto": "02.03 - PROJETO",
                    "tipo": "Debitos",
                    "debito": 500,
                    "credito": 200,
                    "valor": 740,
                    "saldoAnterior": 500,
                    "saldoAtual": 1240,
                    "date": new Date("2019-03-06")
                }];*/

                this.pivotGrid = null;
                this.pivotGrid = $("#pivotgrid").dxPivotGrid({
                    allowSortingBySummary: true,
                    allowExpandAll: true,
                    height: 500,
                    allowFiltering: true,
                    showBorders: false,
                    showColumnGrandTotals: false,
                    showRowGrandTotals: false,
                    showRowTotals: false,
                    showTotalsPrior: false,
                    showColumnTotals: false,
                    wordWrapEnabled: false,
                    rowHeaderLayout: "tree",                    
                    fieldChooser: {
                        allowSearch: true
                    },
                    scrolling: {
                        mode: "virtual"
                    },
                    fieldPanel: {
                        allowFieldDragging: true,
                        showColumnFields: this.fieldPanelShowColumnFields,
                        showDataFields: this.fieldPanelShowDataFields,
                        showFilterFields: this.fieldPanelShowFilterFields,
                        showRowFields: true,
                        visible: this.fieldPanelVisible,
                        texts: {
                            rowFieldArea: "Arraste os campos de linha aqui",
                            filterFieldArea: "Arraste os campos de filtro aqui",
                            dataFieldArea: "Arraste os campos de valor aqui",
                            columnFieldArea: "Arraste os campos de coluna aqui"                            
                        }
                    },
                    texts: {
                        noData: "Nenhum dado encontrado",
                        collapseAll: "Recolher todos - deste nível",
                        expandAll: "Expandir todos - deste nível",
                        sortRowBySummary: "Ordenar por {0}",
                        removeAllSorting: "Limpar ordenação",
                        sortColumnBySummary: "Ordenar por {0}",
                        showFieldChooser: "Escolher campo",
                        exportToExcel: "Exportar excel",
                        grandTotal: "Totais"
                    },
                    "export": {
                        enabled: true,
                        fileName: "BalanceteContabil",
                    },
                    onCellPrepared: function (e) 
                    {                       
                        if (!e.cell || !e.cell.text)
                            return;
                        
                        if (e.area == 'data') {
                            var ehValorNegativo = Number(e.cell.text.replace(/[^0-9-]+/g, "")) < 0;
                            var nomeColuna = $("#pivotgrid").dxPivotGrid("instance").getDataSource().getAreaFields("data", true)[e.cell.dataIndex].dataField;
                            e.cellElement.addClass(ehValorNegativo || nomeColuna == "credito" ? 'font-red' : 'font-blue');
                            e.cellElement.empty();
                            // chama o método que está na página(aspx)
                            e.cellElement.append($("<span />").text(FormatarValorCelula(
                                e.cell.text.toString(), 
                                ehValorNegativo ? "C" : "D",
                                nomeColuna)));
                        }                  
                    },
                    dataSource: {
                        retrieveFields: false,
                        fields: this.fields,
                        store: this.data
                    }
                }).dxPivotGrid("instance");
            },
            obterAgrupadorConformePeriodoSelecionado() {
                if (this.isFieldChecked("saldoDiario"))
                    return this.agrupadorDiario;
                if (this.$store.getters["filtro/isPeriodoMeses"])
                    return this.agrupadorPorMeses;
                if (this.$store.getters["filtro/isPeriodoTrimestres"])
                    return this.agrupadorPorTrimestre;
                if (this.$store.getters["filtro/isPeriodoSemestres"])
                    return this.agrupadorPorSemestre;
                if (this.$store.getters["filtro/isPeriodoAnos"])
                    return this.agrupadorPorAno;
            },
            agrupadorDiario(data) {
               return moment(data.date).format("DD/MM/YYYY"); 
            },
            agrupadorPorMeses(data) {
                return moment(data.date).format("MMM/YYYY");
            },
            agrupadorPorTrimestre(data) {
                return String.format("Trimestre {0}", moment(data.date).format("Q/YYYY"));
            },
            agrupadorPorSemestre(data) {
                var mes = moment(data.date).month();
                var semestre = (mes > 5 ? 2 : 1);
                return String.format("Semestre {0}/{1}", semestre, moment(data.date).format("YYYY"));
            },
            agrupadorPorAno(data) {
                return moment(data.date).format("YYYY");
            }
        },
        watch: {
            fields(value) {
                var indexCampoData = value.findIndex(campo => campo.dataField == "date");

                if (indexCampoData > -1)
                {
                    this.fields[indexCampoData].selector = this.obterAgrupadorConformePeriodoSelecionado();
                    this.fields[indexCampoData].sortingMethod = function (a, b) {
                        if (a.text == b.text) 
                            return 0;

                        if (a.index > b.index) 
                            return 1;
                        else
                            return -1;
                    };
                }
            }
        }
    };
</script>