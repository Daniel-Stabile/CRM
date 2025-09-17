<template>
    <div>
        <wes-message v-bind="messagePanel"></wes-message>
        <div v-show="data !== null">
            <div id="pivotgrid"></div>
            <div id="pivotgrid-popup"></div>
            <ui-table-modal tituloModal="Analítico">
                <div slot="body">
                    <ui-data-table :dataObject="this.dataObjectTable"></ui-data-table>
                </div>
            </ui-table-modal>
        </div>
    </div>
</template>

<script>
    import { debug } from "util";
    import { mapState } from "vuex";
    var DevExpress = require("devextreme/bundles/modules/core");
    var dx = (DevExpress.ui = require("devextreme/bundles/modules/ui"));
    var pivotPopup = null;
    var drillDownDataSource = {};
    require("devextreme/integration/jquery");
    require("devextreme-intl");
    const localization = require("devextreme/localization");
    localization.locale("pt-BR");
    DevExpress.config({
        defaultCurrency: "BRL"
    });
    require("devextreme/ui/pivot_grid");
    require("devextreme/ui/pivot_grid/data_source");
    require("devextreme/ui/data_grid");
    require("devextreme/ui/popup");
    var groups = null;
    var rowFilters = null;
    export default {
        props: ["dataObject"],
        data: function () {
            return {
                data: null,
                dataObjectTable: {},
                messagePanel: {
                    type: "",
                    message: "",
                    title: ""
                },
                rowCount: 0,
                stateLocal: this.$store,
                pivot: null
            };
        },
        mounted: function () {            
            let vm = this;
            this.$store.subscribe((mutation, state) => {
                this.stateLocal = this.$store;
                if (mutation.type == "pivotgrid/beginRequest") {
                    vm.beginRequest();
                } else if (mutation.type == "pivotgrid/endRequestSuccess") {
                    vm.loadData(state.pivotgrid.dataset);
                } else if (mutation.type == "pivotgrid/endRequestError") {
                    vm.endRequestError(state.pivotgrid.error);
                }
            });
        },
        computed: mapState(["analiticoDataSource"]),
        watch: {
            analiticoDataSource(newValue, oldValue) {
                this.dataObjectTable = newValue;
            }
        },
        methods: {
            beginRequest: function () {
                this.rowCount = 0;
                this.messagePanel.message = "";
                window.App.blockUI({
                    target: this.$el,
                    message: "<h3>Buscando dados...</h3>"
                });
            },
            endRequestError: function (error) {
                window.App.unblockUI(this.$el);
                this.messagePanel.type = "danger";
                this.messagePanel.message = error;
            },
            loadData: function (data) {
                this.data = JSON.parse(data);
                window.App.unblockUI(this.$el);
                if (this.data.dataSource.store != null) {
                    let contaMaxLength = this.groupData(
                        "conta",
                        "Conta",
                        "contaNiveisSuperiores"
                    );
                    let centroCustoMaxLength = this.groupData(
                        "centroCusto",
                        "Centro de custo",
                        "centroCustoNiveisSuperiores"
                    );
                    let projetoMaxLength = this.groupData(
                        "projeto",
                        "Projeto",
                        "projetoNiveisSuperiores"
                    );
                    this.preencherDadosNulos(
                        contaMaxLength,
                        centroCustoMaxLength,
                        projetoMaxLength
                    );
                    this.renderPivot();
                }
            },
            renderPivot: function () {
                var funcChamaModal = this.chamaModal;
                var self = this;   
                this.pivotGrid = null;
                this.pivotGrid = $("#pivotgrid")
                    .dxPivotGrid({
                        onCellClick: function (e) {                            
                            if (e.area !== "data") return;
                            if (self.validarCelulaClicada(e)) return;
                            var dados = self.CriarObjetoData(e);
                            if (dados.Conta == "" || dados.Conta == undefined) {
                                toastr.error(
                                    "Falta informar uma conta gerencial.",
                                    "Atenção",
                                    ""
                                );
                                return;
                            }
                            window.App.blockUI({
                                target: this.$el,
                                message: "<h3>Buscando dados...</h3>"
                            });
                            var url =
                                Benner.Page.getApplicationPath() + "api/orcamento/obterAnalitico";
                            $.ajax({
                                type: "POST",
                                url: url,
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify(dados),
                                success: function (_data) {
                                    self.dataObjectTable = {
                                        Data: self.getData(_data),
                                        Headers: self.getColumns(_data)
                                    };
                                    window.App.unblockUI(this.$el);
                                    funcChamaModal();
                                },
                                error: function (_data) { }
                            });
                        },
                        onContentReady: function (e) {
                            var fields = e.component.getDataSource().fields()                            
                            var url =
                                Benner.Page.getApplicationPath() + "api/orcamento/consultar/pivotgridLayout";
                            $.ajax({
                                type: "POST",                            
                                url: url,
                                dataType: "json",
                                contentType: "application/json; charset=utf-8",
                                data: JSON.stringify({
                                    fields: fields.map(field => ({ area: field.area, dataField: field.dataField, areaIndex: field.areaIndex }))
                                }),
                                success: function (_data) {
                                    self.dataObjectTable = {
                                        Data: self.getData(_data),
                                        Headers: self.getColumns(_data)
                                    };
                                    window.App.unblockUI(this.$el);
                                    funcChamaModal();
                                },
                                error: function (_data) { }
                            });
                        },
                        onCellPrepared: function (e) {
                            if (e.area == "data") {

                                const dataSource = e.component.getDataSource();
                                const columns = dataSource.getAreaFields("data")
                                const { dataField } = columns[e.cell.dataIndex];

                                if (!["saldoMes", "liberado","percentuais"].includes(dataField))
                                    return;

                                if (groups == null || rowFilters != dataSource.getAreaFields("row") || rowFilters == null) {
                                    rowFilters = dataSource.getAreaFields("row");
                                    groups = groupBy(self.data.dataSource.store, rowFilters);
                                }
                                    

                                const group = groups.find(g => g.keys.join("-") == e.cell.rowPath.join("-"));
                                if (!group) return;

                                const date = new Date(e.cell.columnPath[0]).getTime();

                                let filtrado = e.cell.columnType == "GT" ? group.datas : group.datas.filter(d => new Date(d.competencia).getTime() == date);

                                const sumPerKey = (key, abs = true) => {
                                    let value = filtrado.reduce((acc, data) => parseFloat(data[key]) + acc, 0)
                                    if (abs)
                                        return Math.abs(value);

                                    return value;
                                };

                                let color = "#037fff";

                                const orcado = sumPerKey("orcado");

                                if (dataField == "saldoMes") {

                                    const realizado = sumPerKey("realizado");
                                    const reservado = sumPerKey("reservado");

                                    if (((realizado + reservado) > orcado))
                                        color = "#ff2200";
                                }

                                else if (dataField == "liberado") {

                                    let saldo = sumPerKey("liberado", false);

                                    if (saldo < 0 || (orcado == 0 && saldo > 0)) {
                                        saldo *= -1;
                                    }

                                    if (saldo < 0) {
                                        color = "#ff2200";
                                    }

                                }
                                else if (dataField == "percentuais") {
                                    let realizado = sumPerKey("realizado");
                                    let orcado = sumPerKey("orcado");
                                    let reservado = sumPerKey("reservado");
                                    let percentuais = sumPerKey("percentuais");
                                    let comprometido = sumPerKey("comprometido");
                                    let fitroPercentuais = sumPerKey("fitroPercentuais");
                                    let somaCusto =  (realizado + reservado + comprometido);   
 
                                    if (orcado !== 0 && !Number.isNaN(orcado)&& somaCusto !== 0){ 
                                    let percentual = ((somaCusto/orcado)*100);
 
                                    if(fitroPercentuais > 0){
                                        percentual = percentual - 100;
                                    }

                                    e.cell.value = percentual;
                                    e.cell.text = percentual;
                                    e.cellElement[0].innerText = percentual.toFixed(2);
                                    }
                                    else{
                                        e.cellElement[0].innerText = "";
                                    } 

                                }

                                e.cellElement.css("color", color);

                            }
                        },
                        showColumnGrandTotals: true,
                        showRowGrandTotals: false,
                        showRowTotals: true,
                        showColumnTotals: false
                    })
                    .dxPivotGrid(this.data)
                    .dxPivotGrid("instance");
                this.pivot = this.pivotGrid;
            },
            chamaModal: function () {
                $("#modalExemplo").modal({ backdrop: "static", keyboard: false });
            },
            ehAnalitico(e) {
                return e.rowFields[e.cell.rowPath.length - 1].ehAnalitico;
            },
            expandCell: function (e) {
                var dataSource = this.pivotGrid.getDataSource();
                return dataSource.expandHeaderItem("row", [
                    e.cell.rowPath[e.cell.rowPath.length - 1]
                ]);
            },
            validarCelulaClicada: function (e) {
                var textoLinhaClicada = e.cell.rowPath[e.cell.rowPath.length - 1];
                var data = e.component.getDataSource()._data.rows;
                if (!this.ehAnalitico(e)) {
                    toastr.error("Item selecionado não é analítico!", "Atenção", "");
                    return true;
                }
                if (
                    e.cell.value == 0 ||
                    e.cell.value == null ||
                    e.cell.value == "undefined"
                ) {
                    toastr.error("Sem dados para consulta!", "Atenção", "");
                    return true;
                }
                if (e.cell.rowPath[e.cell.rowPath.length - 1] == "Nível inexistente") {
                    toastr.error(
                        "Nível inexistente, não é possível obter o analítico!",
                        "Atenção",
                        ""
                    );
                    return true;
                }
                if (this.obterTipoConsultaAnalitica(e) !== 1) {
                    toastr.error(
                        "Analítico apenas para coluna do realizado!",
                        "Atenção",
                        ""
                    );
                    return true;
                }
            },
            CriarObjetoData: function (e) {
                var ccc = this.obterContaECentroDeCusto(e);
                var sLocal = this.stateLocal.state;
                sLocal.filtro["TipoConsulta"] = this.obterTipoConsultaAnalitica(e);
                return {
                    Filtro: sLocal.filtro,
                    Datas: sLocal.options,
                    Dia: e.cell.columnPath[0].getDate(),
                    Mes: e.cell.columnPath[0].getMonth() + 1,
                    Ano: e.cell.columnPath[0].getFullYear(),
                    Conta: ccc.Conta,
                    CC: ccc.CC,
                    Filiais: this.obterFiliaisOnClickCell(
                        sLocal.treeview.treeview_selecoes[1].selected
                    )
                };
            },
            obterFiliaisOnClickCell: filiais => {
                var results = [];
                filiais.forEach(filial => {
                    var handleFilial = filial.split("-")[1];
                    if (handleFilial !== null && handleFilial !== undefined)
                        results.push(handleFilial);
                });
                return results;
            },
            obterContaECentroDeCusto: function (e) {
                var centroCusto = "";
                var conta = "";
                var count = 0;
                for (let index = e.rowFields.length - 1; index >= 0; index--) {
                    let field = e.rowFields[index];
                    if (
                        e.cell.rowPath[index] !== "Nível inexistente" &&
                        e.cell.rowPath[index] !== undefined
                    ) {
                        if (field.ehCC && centroCusto === "") {
                            centroCusto = e.cell.rowPath[index];
                        } else if (field.ehConta && conta === "") {
                            conta = e.cell.rowPath[index];
                        }
                    }
                }
                return { Conta: conta, CC: centroCusto };
            },
            obterTipoConsultaAnalitica: function (e) {
                var tipoColuna = e.dataFields[this.obterIndexColuna(e)].dataField;
                return tipoColuna === "realizado"
                    ? 1
                    : tipoColuna === "comprometido"
                        ? 2
                        : tipoColuna === "bloqueado"
                            ? 3
                            : tipoColuna === "alcadaBloqueio"
                                ? 4
                                : tipoColuna === "alcadaLiberacao"
                                    ? 5
                                    : 6;
            },
            obterIndexColuna: function (e) {
                let index = e.columnIndex;
                while (index > e.dataFields.length - 1) {
                    index = index - e.dataFields.length;
                }
                return Math.floor(index);
            },
            preencherDadosNulos: function (
                contaMaxLength,
                centroCustoMaxLength,
                projetoMaxLength
            ) {
                this.data.dataSource.store.forEach(function (data) {
                    const texto = "Nível inexistente";
                    let keys = ["conta", "centroCusto", "projeto"];
                    let indexes = {
                        conta: contaMaxLength,
                        centroCusto: centroCustoMaxLength,
                        projeto: projetoMaxLength
                    };

                    keys.forEach(key => {
                        let maxIndex = Number(-1);
                        let props = Object.keys(data).filter(prop => prop.includes(key));

                        if (props !== undefined && props.length > 0)
                            maxIndex = props.length - 1;

                        if (!isNaN(Number(maxIndex))) {
                            for (
                                let index = Number(maxIndex) + 1;
                                index <= indexes[key];
                                index++
                            ) {
                                data[key + index] = texto;
                            }
                        }
                    });
                });
            },
            groupData: function (campo, caption, agrupador) {
                let maxLength = 0;
                let countAux = 0;
                let self = this;
                let isEmpty = true;
                this.data.dataSource.store.forEach(function (vo) {
                    if (!vo[agrupador]) {
                        vo[agrupador] = vo[campo];
                    }
                    
                    if (vo[agrupador]) {
                        let estrutura = vo[agrupador].split("|");
                        if (estrutura.length > maxLength) maxLength = estrutura.length;

                        for (var i = 0; i <= estrutura.length; i++) {
                            let name = campo + i;
                            if (i == estrutura.length) vo[name] = vo[campo];
                            else vo[name] = estrutura[i];
                        }
                    }
                    if (isEmpty && vo[campo]) isEmpty = false;

                    delete vo[campo];
                    delete vo[agrupador];
                });

                if (isEmpty) {
                    _.remove(this.data.dataSource.fields, function (f) {
                        return _.startsWith(f.dataField, campo);
                    });
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
                        ehAnalitico: false,
                        ehCC: false,
                        ehConta: false,
                        ehProjeto: false
                    };

                    if (i == 0) {
                        field.caption = caption;
                        field.expanded = true;
                    } else field.caption = i;

                    field.ehCC = campo === "centroCusto";

                    field.ehConta = campo === "conta";

                    field.ehProjeto = campo === "projeto";

                    field.ehAnalitico = i == maxLength;

                    if (
                        !_.find(
                            this.data.dataSource.fields,
                            f => f.dataField === field.dataField
                        )
                    ) {
                        this.data.dataSource.fields.push(field);
                    }
                    groupIndex++;
                }
                this.rowCount += groupIndex;

                return maxLength;
            },
            getData: data => {
                var valoresMonetarios = ["Nominal", "Rateado", "Valor"];
                data = JSON.parse(data.replaceAll(/'/, '"'));
                data.Data.forEach(row => {
                    valoresMonetarios.forEach(tipo => {
                        if (row[tipo] !== undefined)
                            row[tipo] = row[tipo].toLocaleString("pt-BR", {
                                style: "currency",
                                currency: "BRL"
                            });
                    });
                });
                return data.Data;
            },
            getColumns: data => {
                if (!data)
                    return;

                data = JSON.parse(data.split(/'/).join('"'));
                var result = [];

                if (data.Data.length <= 0) return result;

                var keys = Object.keys(data.Data[0]).filter(x => x != "Link");

                var urlToRedirect = data.Data.Link;

                if (keys.length > 0)
                    keys.forEach(key => {
                        result.push({
                            data: key,
                            title: data.Headers[key]
                        });
                    });

                return result;
            }
        }
    };

    function CellPrepared(e, self) {
        
        if (!e.cell || !e.cell.text) return;

        let text = e.cell.text.replace(/[^0-9-]+/g, "");
        if (e.area == "data" && Number(text) < 0) e.cellElement.addClass("font-red");
        if (e.area == "data" && Number(text) >= 0)
            e.cellElement.addClass("font-blue");
    }

    function converterParaArray(input) {

        const output = [];

        function converter(obj, keys) {
            const { data, ...resto } = obj;
            const datas = data ? [...data] : [];

            if (keys.length > 0) {
                const parent = output.find(item => item.keys.join('-') == keys.join('-'));
                if (parent) {
                    parent.datas.push(...datas);
                }
            }

            output.push({ keys, index: output.length, datas, lastNivel: datas.length > 0 });

            for (const key in resto) {
                converter(resto[key], [...keys, key]);
            }
        }

        converter(input, []);

        return output.map(o => {
            if (o.datas.length == 0) {
                let key = o.keys.join("-");
                let datasToInsert = output.filter(o2 => o2.keys.join("-").startsWith(key) && o2.lastNivel).reduce((acc, o2) => [...acc, ...o2.datas], [])
                return ({
                    ...o,
                    datas: datasToInsert
                })
            }
            return o
        })



    }

    function agruparObjetosPorChaves(objetos, chaves) {
        const resultado = {};

        objetos.forEach(objeto => {
            let grupoAtual = resultado;

            chaves.forEach(chave => {
                const valor = objeto[chave];

                if (!grupoAtual[valor]) {
                    grupoAtual[valor] = {};
                }

                grupoAtual = grupoAtual[valor];
            });

            if (!grupoAtual.data) {
                grupoAtual.data = [];
            }

            grupoAtual.data.push(objeto);
        });

        return resultado;
    }


    const groupBy = (store, fields) => {

        let chavestotais = fields.map(f => f.dataField)

        const res1 = (agruparObjetosPorChaves(store, chavestotais))
        return (converterParaArray(res1))

    }

</script>

<style>
    .dx-pivotgrid .dx-pivotgrid-collapsed,
    .dx-pivotgrid .dx-pivotgrid-expanded {
        cursor: cell;
    }

    .dx-pivotgrid {
        cursor: pointer;
    }
</style>

