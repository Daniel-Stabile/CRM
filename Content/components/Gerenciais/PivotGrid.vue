<template>
    <div class="portlet light">
        <div class="portlet-title">
            <div class="caption">
                <span class="caption-subject font-green-sharp bold uppercase">Gerenciais</span>
            </div>
        </div>
        <div class="portlet-body">
            <gerenciais-filtro color-selected="blue" color-deselected="white"></gerenciais-filtro>
            <wes-message v-bind="messagePanel"></wes-message>
            <div v-if="(data && data.length > 0)">
                Mostrar:&nbsp;&nbsp;
                <label class="mt-checkbox" v-for="item in this.camposAgrupados" :key="item.index">
                    {{ item.caption + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"  }}
                    <input type="checkbox" @click="checkClick(item)" v-model="item.visible">
                    <span></span>
                </label>
            </div>
            <div id="pivotgrid"></div>
            <br />
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
    import GerenciaisService from "../../services/GerenciaisService";
    
    export default {
        data: function () {
            return {
                messagePanel: {
                    type: "",
                    message: "",
                    title: ""
                },
                data: null,
                dataAnalitico: null,
                dataAnaliticoLancamentos: null,
                dataAnaliticoCcs: null,
                parametrosUltimaGeracao: null,
                tituloContaAnalitico: null,
                fields: this.getDefaultFields(),
                pivotGrid: null,
                analiticoGrid: null,
                nivelAtual: -1
            };
        },
        mounted: function () {
            let vm = this;
            this.$store.subscribe((mutation, state) => {                        
                if (mutation.type == 'pivotgrid/beginRequest') {
                    vm.beginRequest();
                }
                else if (mutation.type == 'pivotgrid/endRequestSuccess') {
                    vm.loadData(state.pivotgrid.dataset);
                    vm.dataAnaliticoLancamentos = state.pivotgrid.dataSetAnaliticoLancamentos;
                    vm.dataAnaliticoCcs = state.pivotgrid.dataSetAnaliticoCcs;
                    vm.parametrosUltimaGeracao = state.pivotgrid.parametrosUltimaGeracao;
                }
                else if (mutation.type == 'pivotgrid/endRequestError') {
                    vm.endRequestError(state.pivotgrid.error);
                }
            });
        },
        computed: {
            camposAgrupados: function () { 
                return this.fields.filter(item=>item.groupIndex >= 0) 
            }
        },
        methods: {
            renderAnalitico() {
                var colunas = [
                    {
                        dataField: "tituloConta",
                        caption: "Conta",
                        dataType: "string",
                        groupIndex: 0
                    },
                    {
                        dataField: "doc",
                        dataType: "string"
                    },
                    {
                        dataField: "data",
                        dataType: "date",
                        format: "shortDate"
                    },
                    {
                        dataField: "rateado",
                        dataType: "number",
                        format: {
                            type: "currency",
                            precision: 2,
                            currency: "BRL"
                        },
                    },
                    {
                        dataField: "nominal",
                        dataType: "number",
                        format: {
                            type: "currency",
                            precision: 2,
                            currency: "BRL"
                        },
                    },
                    {
                        dataField: "pessoa",
                        dataType: "string"
                    },
                    {
                        dataField: "dataAdto",
                        dataType: "date",
                        format: "shortDate"
                    },
                    {
                        dataField: "filial",
                        dataType: "string"
                    }];

                if (this.dataAnalitico.includes(dado => dado.vencimento != null))
                    colunas.push({
                        dataField: "vencimento",
                        dataType: "date",
                        format: "shortDate"
                    },);

                this.analiticoGrid = null;
                this.analiticoGrid = $("#dataGridAnalitico").dxDataGrid({
                    dataSource: this.dataAnalitico,
                    columnAutoWidth: true,
                    allowColumnReordering: true,
                    allowColumnResizing : true,
                    showBorders: true,
                    searchPanel: { 
                        visible: true,
                        placeholder: "Pesquisar",
                        width: 500
                    },
                    paging: {
                        pageSize: 10
                    },
                    sorting: {
                        ascendingText: "Ordenar crescentemente",
                        descendingText: "Ordenar descrescentemente",
                        clearText: "Limpar ordenação"
                    },
                    pager: {
                        showPageSizeSelector: true,
                        allowedPageSizes: [5, 10, 20, 50, 100, 200],
                        showInfo: true,
                        infoText: "Página {0} de {1} ({2} itens)"
                    },
                    columnChooser: {
                        height: 300,
                        width: 250,
                        enabled: true,
                        title: "Customizar colunas",
                        mode: "select"
                    },
                    export: {
                        enabled: true,
                        fileName: "GerenciaisAnalitico",
                        texts: {
                            exportAll: "Exportar dados para excel"
                        }
                    },
                    summary: {
                        totalItems: [{
                            column: "rateado",
                            summaryType: "sum",
                            valueFormat: {
                                type: "currency",
                                precision: 2,
                                currency: "BRL"
                            },
                            displayFormat: "Rateado - Total: {0}"
                        }]
                    },
                    noDataText: "Nenhum resultado encontrado.",
                    columns: colunas
                }).dxDataGrid("instance");
            },
            loadAnalitico(linha) {
                this.blockUi();
                var request = this.prepararRequestAnalitico(linha);

                GerenciaisService.getGerenciaisAnaliticoDataGrid(request).then((response) => {
                    window.App.unblockUI(this.$el);
                    this.dataAnalitico = response.data;
                    Benner.ModalPage.show({ 
                        id: "analiticoModal",
                        size: "fullpage", 
                        displayTitle: true, 
                        title: "Gerenciais - Analítico - Conta: " + this.tituloContaAnalitico,
                        buttonLabel: "Retornar",
                        customBody: "<div id='dataGridAnalitico'></div>",
                    },
                    this.renderAnalitico);
                });
            },
            getChaveContaNaLinhaPivot(linha){
                return _.filter(linha.cell.rowPath).join("|");
            },
            getPeriodoNaLinhaPivot(linha){
                return moment([linha.cell.columnPath[0], linha.cell.columnPath[1] -1, 1]);
            },
            linhaValidaAnalitico(linha) {
                if (linha.area != "data" || linha.cell.columnType != "D" || linha.cell.rowType != "D")
                    return false;

                var chaveContaLinha = this.getChaveContaNaLinhaPivot(linha);
                var periodoLinha = this.getPeriodoNaLinhaPivot(linha);
                var chaveArray = chaveContaLinha.split("|");

                if (!periodoLinha.isValid())
                    return false;

                return this.dataAnaliticoLancamentos.find(data => data.chave == chaveContaLinha) ||
                    this.dataAnaliticoCcs.filter(data => chaveArray.every(c => data.chave.split("|").includes(c)));
            },
            prepararRequestAnalitico(linha) {
                var chaveConta = this.getChaveContaNaLinhaPivot(linha);
                var chaveArray = chaveConta.split("|");
                var periodoConta = this.getPeriodoNaLinhaPivot(linha);
                var valorTotalPeriodoConta = linha.cell.value;

                var requestAnalitico = {
                    handlesAnaliticoLancamentos: "",
                    handlesAnaliticoCcs: "",
                    tipo: "",
                    rateio: 0,
                    periodoConta: periodoConta._d,
                    valorTotalPeriodo: valorTotalPeriodoConta,
                    parametros: this.parametrosUltimaGeracao
                };
                
                var analiticoLancamentos = this.dataAnaliticoLancamentos.find(data => data.chave == chaveConta);
                var analiticoCcs = this.dataAnaliticoCcs.filter(data => chaveArray.every(c => data.chave.split("|").includes(c)));

                if (analiticoLancamentos)
                {
                    requestAnalitico.handlesAnaliticoLancamentos = analiticoLancamentos.handles;

                    if (analiticoLancamentos.tipo)
                        requestAnalitico.tipo = analiticoLancamentos.tipo;

                    requestAnalitico.rateio = analiticoLancamentos.rateio;

                    this.tituloContaAnalitico = analiticoLancamentos.conta;
                }

                if (analiticoCcs.length > 0)
                {
                    requestAnalitico.handlesAnaliticoCcs = analiticoCcs.map(cc => cc.handles).join(',');

                    if (analiticoCcs[0].tipo)
                        requestAnalitico.tipo = analiticoCcs[0].tipo;

                    requestAnalitico.rateio = analiticoCcs[0].rateio;

                    this.tituloContaAnalitico = analiticoCcs[0].conta;

                    var centrosDeCustoDistintos = analiticoCcs.filter(cc => cc.centroCusto);
                    
                    if (centrosDeCustoDistintos.length > 0)
                        this.tituloContaAnalitico += " - CC: " + centrosDeCustoDistintos[0].centroCusto;

                    var projetosDistintos = analiticoCcs.filter(cc => cc.projeto);
                    if (projetosDistintos.length > 0)
                        this.tituloContaAnalitico += " - Projeto: " + projetosDistintos[0].projeto;
                }

                requestAnalitico.tituloConta = this.tituloContaAnalitico;

                return requestAnalitico;
            },
            criarBotoesNivelConta() {
                $('.dx-pivotgrid-toolbar').append(
                    '<span style="margin-left:15px; padding:6px;">Nível:</span>'+
                    '<a id="botaoExpandConta" title="Expandir nível" class="btn btn-icon-only btn-circle" style="color:#444;"><i class="fa fa-plus-circle fa-lg"></i></a>'+
                    '<a id="botaoCollapseConta"title="Recolher nível" class="btn btn-icon-only btn-circle" style="color:#444; margin-left:0px; margin-right:10px;"><i class="fa fa-minus-circle fa-lg"></i></a>');
                $('.dx-pivotgrid-toolbar').css("float", "left");
                $('#botaoExpandConta').on('click', this.expandConta);
                $('#botaoCollapseConta').on('click', this.collapseConta);
            },
            expandConta() {
                if (this.nivelAtual == this.camposAgrupados.length-1)
                    return;

                var campoAExpandir = this.camposAgrupados[this.nivelAtual].dataField;
                $("#pivotgrid").dxPivotGrid("instance").getDataSource().expandAll(campoAExpandir);
                this.nivelAtual++;
            },
            collapseConta() {
                if (this.nivelAtual == 0)
                    return;

                this.nivelAtual--;
                var campoARetrair = this.camposAgrupados[this.nivelAtual].dataField;
                $("#pivotgrid").dxPivotGrid("instance").getDataSource().collapseAll(campoARetrair);
            },
            getDefaultFields(){
                return [
                    {
                        caption: "Conta",
                        groupName: 'Conta',
                        area: 'row',
                        expanded: true
                    }, {
                        caption: "Centro de custo",
                        groupName: 'CentroCusto',
                        area: 'row',
                        expanded: true
                    }, {
                        caption: "Projeto",
                        groupName: 'Projeto',
                        area: 'row',
                        expanded: true
                    }, {
                        caption: "Empresa",
                        dataField: "empresa",
                        area: "filter"
                    }, {
                        caption: "Filial",
                        dataField: "filial",
                        area: "filter",
                    }, {
                        caption: "Ano",
                        area: "column",
                        dataField: "data",
                        dataType: "date",
                        groupInterval: "year",
                        expanded: true
                    }, {
                        caption: "Trimestre",
                        area: "filter",
                        dataField: "data",
                        dataType: "date",
                        groupInterval: "quarter",
                        expanded: true
                    }, {
                        caption: "Mês",
                        area: "column",
                        dataField: "data",
                        dataType: "date",
                        groupInterval: "month",
                        expanded: true
                    }, {
                        caption: "Dia",
                        area: "column",
                        dataField: "data",                        
                        dataType: "date",
                        format: "shortDate",
                        groupInterval: "days",
                        expanded: false
                    }, {
                        caption: "Total",
                        dataField: "valor",
                        dataType: "number",
                        format: {
                            type: "currency",
                            precision: 2,
                            currency: "BRL"
                        },
                        summaryType: "sum",
                        area: "data"
                    }];
            },
            blockUi() {
                window.App.blockUI({
                    target: this.$el,
                    message: '<h3>Buscando dados...</h3>',
                });
            },
            beginRequest: function () {
                this.messagePanel.message = "";
                this.blockUi();
            },
            endRequestError: function (error) {
                window.App.unblockUI(this.$el);
                this.messagePanel.type = "danger";
                this.messagePanel.message = error;
                this.renderPivot();
            },
            loadData: function (data) {
                this.fields = this.getDefaultFields();
                window.App.unblockUI(this.$el);
                this.messagePanel.message = "";
                this.data = data;

                if (data != null && data.length > 0) {                    
                    this.groupData('conta', 'Conta', 'niveisConta');
                    this.groupData('centroCusto', 'Centro de custo', 'niveisCentroCusto');
                    this.groupData('projeto', 'Projeto', 'niveisProjeto');
                }

                this.nivelAtual = this.camposAgrupados.length-1;
                this.renderPivot();
                this.criarBotoesNivelConta();
            },
            groupData: function (campo, caption, agrupador) {                
                let maxLength = 0;
                let self = this;
                let isEmpty = true;
                this.data.forEach(function (vo) {
                    if (vo[agrupador]) {
                        let estrutura = vo[agrupador].split("|");
                        if (estrutura.length > maxLength)
                            maxLength = estrutura.length;

                        for (var i = 0; i <= estrutura.length; i++) {
                            let name = campo + i;
                            if (i == estrutura.length)
                                vo[name] = vo[campo];
                            else
                                vo[name] = estrutura[i];
                        }
                    }
                    if (isEmpty && vo[campo])
                        isEmpty = false;

                    delete vo[campo];
                    delete vo[agrupador];
                });

                if (isEmpty) {
                    _.remove(this.fields, function (f) {
                        return _.startsWith(f.dataField, campo);
                    })
                    return;
                }

                let groupIndex = 0;
                for (var i = 0; i <= maxLength; i++) {                    
                    let field = {
                        dataField: campo + i,
                        estructureIndex: i,
                        groupIndex: groupIndex,
                        groupName: _.upperFirst(campo),
                        visible: true,
                    }

                    if (i == 0) {
                        field.caption = caption;
                        field.expanded = true;
                    }
                    else
                        field.caption = i;

                    if (!_.find(this.fields, (f) => f.dataField === field.dataField)) {
                        this.fields.push(field);
                    }
                    groupIndex++;
                }
            },
            checkClick: function (field) {
                this.pivotGrid.getDataSource().field(field.dataField, { visible: !field.visible });
                this.pivotGrid.getDataSource().reload();
            },
            renderPivot: function () {
                var vm = this;
                this.pivotGrid = null;
                this.pivotGrid = $("#pivotgrid").dxPivotGrid({
                    allowSortingBySummary: true,
                    height: 500,
                    allowExpandAll: true,
                    allowFiltering: true,
                    showBorders: false,
                    showColumnGrandTotals: true,
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
                        showColumnFields: true,
                        showDataFields: true,
                        showFilterFields: true,
                        showRowFields: true,
                        visible: true,
                        texts: {
                            rowFieldArea: "Arraste os campos de linha aqui",
                            filterFieldArea: "Arraste os campos de filtro aqui",
                            dataFieldArea: "Arraste os campos de valor aqui",
                            columnFieldArea: "Arraste os campos de coluna aqui"                            
                        }
                    },
                    texts: {
                        noData: "Nenhum dado encontrado",
                        collapseAll: "Recolher",
                        expandAll: "Expandir",
                        sortRowBySummary: "Ordenar por {0}",
                        removeAllSorting: "Limpar ordenação",
                        sortColumnBySummary: "Ordenar por {0}",
                        showFieldChooser: "Escolher campo",
                        exportToExcel: "Exportar excel"
                    },
                    "export": {
                        enabled: true,
                        fileName: "Gerenciais",
                    },
                    dataSource: {
                        fields: this.fields,
                        store: this.data
                    },
                    onCellPrepared: function (e) {
                        if (!e.cell || !e.cell.text)
                            return;
                        
                        if (vm.linhaValidaAnalitico(e)) {
                            e.cellElement.addClass("linkAnalitico");
                            e.cellElement.attr("title", "Dados analíticos disponíveis. Clique para visualizá-los.");
                        }

                        let text = e.cell.text.replace(/[^0-9-]+/g, "");
                        if (e.area == 'data' && Number(text) < 0)
                            e.cellElement.addClass('font-red');
                        if (e.area == 'data' && Number(text) >= 0)
                            e.cellElement.addClass('font-blue');
                    },
                    onCellClick: function(e) {  
                        if (e.cellElement.hasClass("linkAnalitico"))
                            vm.loadAnalitico(e);
                    }
                }).dxPivotGrid("instance");
            }
        }
    };
</script>