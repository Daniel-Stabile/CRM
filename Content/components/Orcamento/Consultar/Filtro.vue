<template>
    <div class="filter-search-form note note-info note-bordered margin-bottom-20">
        <div class="row filtro-gerenciais-actions collapsible" data-toggle="collapse" data-parent="false"
            data-target="#filtro-body">
            <div class="col-md-offset-11">
                <div style="padding-top:6px">
                    <i class="fa fa-chevron-down font-white"></i>
                </div>
            </div>
            <div class="col-md-9">
                <div @click="actionsClick" class="filtro-gerenciais-right-actions">
                    <transition name="slide-fade">
                        <span v-if="isDateError" class="badge badge-danger"> Data inicial deve ser menor que data final
                        </span>
                    </transition>
                    <wes-date-range-button :gerarEnabled="isTreeViewLoaded()" buttonDescription="Gerar"
                        v-on:error-input="onErrorDateRange" :startDate="getStartDateValue()" :endDate="getEndDateValue()"
                        :minDate="getMinDate()" v-on:apply="applyFilter" key="t1" />
                </div>
            </div>
        </div>
        <div id="filtro-body" class="row collapse in">
            <div class="col-md-3" style="min-height:300px">
                <ul class="nav nav-tabs tabs-left tabbable-line">
                    <li class="active">
                        <a href="#treeview_empresaFilial" data-toggle="tab">
                            <i class="fa fa-building"></i> Empresa e Filiais <span
                                v-if="(getTotalSelectedEmpresaFilial() > 0) && !isEmpresaTreeViewLoading()"
                                class="badge badge-default"> {{ getTotalSelectedEmpresaFilial() }} </span>
                            <transition name="slide-fade">
                                <span v-if="isEmpresaTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                            <transition name="slide-fade">
                                <span v-if="isEmpresaMissing" class="badge badge-danger"> selecione </span>
                            </transition>
                        </a>
                    </li>
                    <li class="pulsate-regular">
                        <a href="#treeview_contas"
                            v-bind:class="{ 'not-active': (isContaTreeViewLoading() || !isContaEmpresaMestreRegra()) }"
                            data-toggle="tab"><i class="fa fa-bank"></i> Contas <span
                                v-if="(getTotalSelectedContas() > 0) && !isContaTreeViewLoading()"
                                class="badge badge-default"> {{ getTotalSelectedContas() }} </span>
                            <transition name="slide-fade">
                                <span v-if="isContaTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_cc" v-bind:class="{ 'not-active': notActiveCCRules() }" data-toggle="tab"><i
                                class="fa fa-money"></i> CC <span
                                v-if="(getTotalSelectedCC() > 0) && !isCCTreeViewLoading()" class="badge badge-default">
                                {{ getTotalSelectedCC() }} </span>
                            <transition name="slide-fade">
                                <span v-if="isCCTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_projetos"
                            v-bind:class="{ 'not-active': (isProjetoTreeViewLoading() || !isProjetoEmpresaMestreRegra()) }"
                            data-toggle="tab"><i class="fa fa-line-chart"></i> Projetos <span
                                v-if="(getTotalSelectedProjetos() > 0) && !isProjetoTreeViewLoading()"
                                class="badge badge-default"> {{ getTotalSelectedProjetos() }} </span>
                            <transition name="slide-fade">
                                <span v-if="isProjetoTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_acoesProjetos" data-toggle="tab" v-if="isAcoesProjetosVisible()">
                            <i class="fa fa-building"></i> Ações Projeto <span
                                v-if="(getTotalSelectedAcoesProjetos() > 0) && !isAcoesProjetosTreeViewLoading()"
                                class="badge badge-default"> {{ getTotalSelectedAcoesProjetos() }} </span>
                            <transition name="slide-fade">
                                <span v-if="isAcoesProjetosTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                            <transition name="slide-fade">
                                <span v-if="isAcoesProjetosMissing" class="badge badge-danger"> selecione </span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_avancado" data-toggle="tab"><i class="fa fa-gears"></i> Avançado
                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="treeview_empresaFilial">
                        <wes-treeview :store="getTreeViewEmpresaFilial()" treeview-id="empresaFilial" button="circle"
                            endpoint="empresafilialselecionada"
                            v-on:item-selected="itemSelected($event, tabInfo.empresaFilial)" v-on:loaded="setTotalTreeViews"
                            v-on:unloaded="setUnloadedTreeView" :markAllByDefault="true" />
                    </div>
                    <div class="tab-pane fade" id="treeview_contas">
                        <div class="row">
                            <div class="col-md-6">
                                <wes-treeview-select ref="treeviewSelectContas" :store="getTreeViewContas()"
                                    v-on:menu-item-selected="menuItemSelected" treeview-id="contas"
                                    :definitions="contaDefinitions"
                                    v-on:item-selected="itemSelected($event, tabInfo.contas)"
                                    v-on:tree-view-loaded="setTotalTreeViews"
                                    v-on:tree-view-unloaded="setUnloadedTreeView" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_cc">
                        <div class="row">
                            <div class="col-md-6">
                                <wes-treeview-select ref="treeviewSelectCC" :store="getTreeViewCentroDeCustos()"
                                    v-on:menu-item-selected="menuItemSelected" treeview-id="CC" :definitions="ccDefinitions"
                                    v-on:item-selected="itemSelected($event, tabInfo.centroDeCustos)"
                                    v-on:tree-view-loaded="setTotalTreeViews"
                                    v-on:tree-view-unloaded="setUnloadedTreeView" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_projetos">
                        <div class="row">
                            <div class="col-md-6">
                                <wes-treeview-select ref="treeviewSelectProjetos" :store="getTreeViewProjetos()"
                                    v-on:menu-item-selected="menuItemSelected" treeview-id="projetos"
                                    :definitions="projetoDefinitions"
                                    v-on:item-selected="itemSelected($event, tabInfo.projetos)"
                                    v-on:tree-view-loaded="setTotalTreeViews"
                                    v-on:tree-view-unloaded="setUnloadedTreeView" />
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_acoesProjetos">
                        <wes-treeview ref="treeviewSelectAcoesProjetos" v-if="isAcoesProjetosVisible()" :store="getTreeViewAcoesProjetos()" treeview-id="acoesProjetos" button="circle"
                            endpoint="acoesprojetos" v-on:item-selected="itemSelected($event, tabInfo.acoesProjetos)"
                            v-on:loaded="setTotalTreeViews" v-on:unloaded="setUnloadedTreeView" :markAllByDefault="isAcoesProjetosVisible()" />
                    </div>
                    <div class="tab-pane fade" id="treeview_avancado" style="padding-top: 10px">
                        <label class="filtro-label-avancado">Origem do realizado</label>
                        <div>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isOrigemRealizadoEnabled(0), [colorDeselected]: !isOrigemRealizadoEnabled(0) }"
                                v-on:click="selectOrigemRealizado(0)">
                                <i class="fa fa-money"></i> Financeiro
                            </a>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isOrigemRealizadoEnabled(1), [colorDeselected]: !isOrigemRealizadoEnabled(1) }"
                                v-on:click="selectOrigemRealizado(1)">
                                <i class="fa fa-calculator"></i> Contabil
                            </a>
                        </div>
                        <br />
                        <transition name="slide-fade">
                            <div v-if="isOrigemRealizadoEnabled(0)">
                                <a href="javascript:;" class="btn btn-circle btn-xs"
                                    v-bind:class="{ [colorSelected]: isTipoOrcamentoEnabled(0), [colorDeselected]: !isTipoOrcamentoEnabled(0) }"
                                    v-on:click="selectTipoOrcamentoEnabled(0)">
                                    <i class="fa fa-bank"></i> Visão econômica
                                </a>
                                <a href="javascript:;" class="btn btn-circle btn-xs"
                                    v-bind:class="{ [colorSelected]: isTipoOrcamentoEnabled(1), [colorDeselected]: !isTipoOrcamentoEnabled(1) }"
                                    v-on:click="selectTipoOrcamentoEnabled(1)">
                                    <i class="fa fa-money"></i> Visão financeira
                                </a>
                                <hr />
                                <label class="filtro-label-avancado">Data do realizado financeiro</label>
                                <div>
                                    <a href="javascript:;" class="btn btn-circle btn-xs"
                                        v-bind:class="{ [colorSelected]: isDataRealizadoFinanceiro(0), [colorDeselected]: !isDataRealizadoFinanceiro(0) }"
                                        v-on:click="selectDataRealizadoFinanceiro(0)">
                                        <i class="fa fa-calendar-minus-o"></i> Vencimento
                                    </a>
                                    <a href="javascript:;" class="btn btn-circle btn-xs"
                                        v-bind:class="{ [colorSelected]: isDataRealizadoFinanceiro(1), [colorDeselected]: !isDataRealizadoFinanceiro(1) }"
                                        v-on:click="selectDataRealizadoFinanceiro(1)">
                                        <i class="fa fa-calendar-check-o"></i> Pagamento (todos)
                                    </a>
                                    <a href="javascript:;" class="btn btn-circle btn-xs"
                                        v-bind:class="{ [colorSelected]: isDataRealizadoFinanceiro(2), [colorDeselected]: !isDataRealizadoFinanceiro(2) }"
                                        v-on:click="selectDataRealizadoFinanceiro(2)">
                                        <i class="fa fa-calendar"></i> Pagamento (tesouraria)
                                    </a>
                                </div>
                                <hr />
                            </div>
                        </transition>
                        <label class="filtro-label-avancado">Percentuais</label>
                        <div>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isPercentuaisEnabled(0), [colorDeselected]: !isPercentuaisEnabled(0) }"
                                v-on:click="selectPercentuais(0)">
                                <i class="fa fa-percent"></i> (Realizado/Orçado)
                            </a>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isPercentuaisEnabled(1), [colorDeselected]: !isPercentuaisEnabled(1) }"
                                v-on:click="selectPercentuais(1)">
                                <i class="fa fa-percent"></i> (Realizado/Orçado)-100
                            </a>
                        </div>
                        <hr />
                        <label class="filtro-label-avancado">Fórmula saldo</label>
                        <div>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isFormulaSaldoEnabled(0), [colorDeselected]: !isFormulaSaldoEnabled(0) }"
                                v-on:click="selectFormulaSaldo(0)">
                                <i class="fa fa fa-calculator"></i> Orçado - Realizado
                            </a>
                            <a href="javascript:;" class="btn btn-circle btn-xs"
                                v-bind:class="{ [colorSelected]: isFormulaSaldoEnabled(1), [colorDeselected]: !isFormulaSaldoEnabled(1) }"
                                v-on:click="selectFormulaSaldo(1)">
                                <i class="fa fa fa-calculator"></i> Realizado - Orçado
                            </a>
                        </div>
                        <hr />
                        <transition name="slide-fade">
                            <div v-if="isOrigemRealizadoEnabled(1)">
                                <label class="filtro-label-avancado">Considerar Comprometido</label>
                                <div>
                                    <wes-switch :value="isConsideraComprometido()"
                                        v-on:change="consideraComprometidoChanged"></wes-switch>
                                </div>
                            </div>
                        </transition>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import OrcamentoService from "../../../services/OrcamentoService";
import { debug, debuglog } from 'util';

export default {
    props: ["colorSelected", "colorDeselected", "plano", "versaoOrcamento", "dataInicio", "dataFim"],
    data: function () {
        return {
            endPointContas: "ct_contasgerenciais/plano/" + this.plano,
            isEmpresaMissing: false,
            isDateError: false,
            isAcoesProjetoVisible: null,
            tabInfo: {
                empresaFilial: {
                    selected: 0,
                    total: 0
                },
                contas: {
                    selected: 0,
                    total: 0
                },
                centroDeCustos: {
                    selected: 0,
                    total: 0
                },
                projetos: {
                    selected: 0,
                    total: 0
                }
            },
            contaDefinitions: [
                {
                    caption: "Financeiras",
                    lookupEntityName: "fn_planoversoes",
                    treeviewFilterField: "versao",
                    treeviewEntityName: "fn_contas"
                }, {
                    caption: "Gerencias",
                    lookupEntityName: "ct_planosgerenciais",
                    treeviewFilterField: "plano",
                    treeviewEntityName: "ct_contasgerenciais"
                }],
            ccDefinitions: [
                {
                    caption: "Padrão",
                    lookupEntityName: "",
                    treeviewFilterField: "",
                    treeviewEntityName: "ct_cc"
                }, {
                    caption: "Gerencias",
                    lookupEntityName: "ct_planosccgerenciais",
                    treeviewFilterField: "tipo",
                    treeviewEntityName: "ct_ccgerenciais"
                }],
            projetoDefinitions: [
                {
                    caption: "Padrão",
                    lookupEntityName: "",
                    treeviewFilterField: "",
                    treeviewEntityName: "gn_projetos"
                }, {
                    caption: "Gerencias",
                    lookupEntityName: "ct_planosprojetosgerenciais",
                    treeviewFilterField: "tipo",
                    treeviewEntityName: "ct_projetosgerenciais"
                }]
        }
    },

    created: function () {
        OrcamentoService.getOrcamentoConsultaPlano("contas", this.versaoOrcamento).then(response => {
            this.$store.commit("treeview/setOrigem", { choice: "contas", origem: response.data });
        });
        OrcamentoService.getOrcamentoConsultaPlano("CC", this.versaoOrcamento).then(response => {
            this.$store.commit("treeview/setOrigem", { choice: "CC", origem: response.data });
        });
        OrcamentoService.getOrcamentoConsultaPlano("projetos", this.versaoOrcamento).then(response => {
            this.$store.commit("treeview/setOrigem", { choice: "projetos", origem: response.data });
        });
    },

    mounted: function () {
        OrcamentoService.getSituacaoEmpresaMestre()
            .then(response => {
                this.$store.commit("treeview/setEmpresasMestreRegras", response.data);
            });

        this.$store.commit('filtro/setVersaoOrcamento', this.versaoOrcamento);
        this.$store.commit('treeview/resetTreeView', {choice: "acoesProjetos"});
        var self = this;
        this.$store.subscribe((mutation, state) => {
            if (mutation.type == 'treeview/setSelected') {
                if (self.$store.getters["treeview/getTotalSelectedContas"] === 0) {
                    self.$refs.treeviewSelectContas.clear();
                }
                if (self.$store.getters["treeview/getTotalSelectedProjetos"] === 0) {
                    self.$refs.treeviewSelectProjetos.clear();
                }
                if (self.$store.getters["treeview/getTotalSelectedCC"] === 0) {
                    self.$refs.treeviewSelectCC.clear();
                }
                if(self.$refs.treeviewSelectAcoesProjetos !== undefined)
                    self.$refs.treeviewSelectAcoesProjetos.clear();
            }
        });
    },
    methods: {
        isOrigemRealizadoEnabled(origemRealizado) {
            return this.$store.state.filtro.origemRealizado == origemRealizado;
        },
        selectOrigemRealizado(origemRealizado) {
            this.$store.commit('filtro/selectOrigemRealizado', origemRealizado);
        },
        isTipoOrcamentoEnabled(tipoOrcamento) {
            return this.$store.state.filtro.tipoOrcamento == tipoOrcamento;
        },
        selectTipoOrcamentoEnabled(tipoOrcamento) {
            this.$store.commit('filtro/selectTipoOrcamento', tipoOrcamento);
        },
        isDataRealizadoFinanceiro(dataRealizadoFinanceiro) {
            return this.$store.state.filtro.dataRealizadoFinanceiro == dataRealizadoFinanceiro;
        },
        selectDataRealizadoFinanceiro(dataRealizadoFinanceiro) {
            this.$store.commit('filtro/selectDataRealizadoFinanceiro', dataRealizadoFinanceiro);
        },
        isPercentuaisEnabled(percentuais) {
            return this.$store.state.filtro.percentuais == percentuais;
        },
        selectPercentuais(percentuais) {
            this.$store.commit('filtro/selectPercentuais', percentuais);
        },
        isFormulaSaldoEnabled(formulaSaldo) {
            return this.$store.state.filtro.formulaSaldo == formulaSaldo;
        },
        selectFormulaSaldo(formulaSaldo) {
            this.$store.commit('filtro/selectFormulaSaldo', formulaSaldo);
        },
        isConsideraComprometido(consideraComprometido) {
            return this.$store.state.filtro.consideraComprometido;
        },
        consideraComprometidoChanged(event, state) {
            this.$store.commit('filtro/selectConsideraComprometido');
        },
        isContaEmpresaMestreRegra() {
            return this.$store.getters["treeview/isContaMestreEnabled"];
        },
        notActiveCCRules() {
            return (this.isCCTreeViewLoading() || !this.isCCEmpresaMestreRegra());
        },
        isCCEmpresaMestreRegra() {
            return this.$store.getters["treeview/isCCMestreEnabled"];
        },
        isProjetoEmpresaMestreRegra() {
            return this.$store.getters["treeview/isProjetoMestreEnabled"];
        },
        getTreeViewContas() {
            return this.$store.getters["treeview/getContas"]
        },
        getTreeViewProjetos() {
            return this.$store.getters["treeview/getProjetos"];
        },
        getTreeViewCentroDeCustos() {
            return this.$store.getters["treeview/getCentroDeCustos"];
        },
        getTreeViewEmpresaFilial() {
            return this.$store.getters["treeview/getEmpresaFilial"];
        },
        getTreeViewAcoesProjetos() {
            return this.$store.getters["treeview/getAcoesProjetos"];
        },
        getTotalSelectedContas(choice) {
            return this.$store.getters["treeview/getTotalSelectedContas"];
        },
        getTotalSelectedProjetos(choice) {
            return this.$store.getters["treeview/getTotalSelectedProjetos"];
        },
        getTotalSelectedEmpresaFilial(choice) {
            return this.$store.getters["treeview/getTotalSelectedEmpresaFilial"];
        },
        getTotalSelectedAcoesProjetos(choice) {
            return this.$store.getters["treeview/getTotalSelectedAcoesProjetos"];
        },
        getTotalSelectedCC() {
            return this.$store.getters["treeview/getTotalSelectedCC"];
        },
        getTreeViewSelectStore() {
            return this.$store.state.treeview;
        },
        actionsClick: function () {
            //event.stopPropagation();
        },
        getStartDateValue() {
            if (!this.$store.state.options.maxDate || this.getMaxDate().toString() !== moment(this.$store.state.options.maxDate, 'DD/MM/YYYY').toDate().toString()) {
                this.$store.commit("options/setMaxDate", this.getMaxDate())

                if (!this.$store.state.options.startDate) {
                    if (this.dataInicio === undefined || !this.dataInicio)
                        return null;
                    else {
                        var retorno = moment(this.dataInicio, 'DD/MM/YYYY').toDate();
                        this.$store.commit("options/setStartDate", retorno)
                        return retorno;
                    }
                }
            }
            return moment(this.$store.state.options.startDate, 'DD/MM/YYYY').toDate();
        },
        getEndDateValue() {
            if (!this.$store.state.options.minDate || this.getMinDate().toString() !== moment(this.$store.state.options.minDate, 'DD/MM/YYYY').toDate().toString()) {
                this.$store.commit("options/setMinDate", this.getMinDate())

                if (!this.$store.state.options.endDate) {
                    if (this.dataFim === undefined || !this.dataFim)
                        return null;
                    else {
                        var retorno = moment(this.dataFim, 'DD/MM/YYYY').toDate();
                        this.$store.commit("options/setEndDate", retorno)
                        return retorno;
                    }
                }
            }
            return moment(this.$store.state.options.endDate, 'DD/MM/YYYY').toDate();
        },
        getMaxDate() {
            if (this.dataFim === undefined || !this.dataFim)
                return null;
            return moment(this.dataFim, 'DD/MM/YYYY').toDate();
        },
        getMinDate() {
            if (this.dataInicio === undefined || !this.dataInicio)
                return null;
            return moment(this.dataInicio, 'DD/MM/YYYY').toDate();
        },
        getEmAbertoValue() {
            return this.$store.state.filtro.documentoEmAberto;
        },
        applyFilter(args) {
            this.isDateError = false;
            if (this.isApplyEnabled()) {
                this.$store.commit("options/setStartDate", args.start);
                this.$store.commit("options/setEndDate", args.end);
                var data = {
                    treeview: this.adjustTreeViewFilter(this.$store.state.treeview.treeview_selecoes),
                    filtro: this.$store.state.filtro,
                    startDate: args.start,
                    endDate: args.end
                };

                window.$("#filtro-body").collapse("hide");
                this.$store.commit('pivotgrid/beginRequest');
                OrcamentoService.getOrcamentoConsultaPivotGrid(data).then(response => {
                    if (response.data.length == 0)
                        window.$("#filtro-body").collapse("show");
                    this.$store.commit('pivotgrid/endRequestSuccess', response.data);
                }, response => {
                    window.$("#filtro-body").collapse("show");
                    this.$store.commit('pivotgrid/endRequestError', response.data);
                });
                //event.stopPropagation();
            }
        },
        adjustTreeViewFilter(tree_view){
            var tree_readonly = tree_view;
            tree_readonly.forEach((tree, idx) => {
                if(tree.data.count == undefined){
                    tree_view[idx].data = {
                        count: 0,
                        items: []
                    }
                }
            })
            return tree_view;
        },
        isApplyEnabled() {
            var result = true;
            var rules = [this.checkFiltroEmpresa()];
            for (var i in rules) {
                var current = rules[i];
                if (!current.condition()) {
                    current.showErrorMessage();
                    result = false;
                    break;
                }
            }
            return result;
        },
        checkFiltroEmpresa() {
            var result = {
                condition: this.isEmpresaSelected,
                showErrorMessage: this.showEmpresaNotSelectedMessage
            }
            return result;
        },
        showEmpresaNotSelectedMessage() {
            toastr.error("É necessário selecionar uma empresa para aplicar o filtro.");
            this.isEmpresaMissing = true;
        },
        isEmpresaSelected() {
            var r = this.$store.getters["treeview/isEmpresaSelected"];
            return r;
        },
        isEmpresaTreeViewLoading() {
            return this.$store.getters["treeview/isEmpresaTreeviewLoading"];
        },
        isAcoesProjetosTreeViewLoading() {
            return this.$store.getters["treeview/isAcoesProjetosTreeViewLoading"];
        },
        isAcoesProjetosVisible(){
            if(this.isAcoesProjetoVisible == null || this.isAcoesProjetoVisible == undefined){
                OrcamentoService.getAcaoProjetoEhVisivel().then(response => { 
                    this.isAcoesProjetoVisible = response.data;
                    return response.data;                            
                });
                return false;
            }
            return this.isAcoesProjetoVisible;
        },
        isContaTreeViewLoading() {
            return this.$store.getters["treeview/isContaTreeviewLoading"];
        },
        isCCTreeViewLoading() {
            return this.$store.getters["treeview/isCCTreeviewLoading"];
        },
        isProjetoTreeViewLoading() {
            return this.$store.getters["treeview/isProjetoTreeviewLoading"];
        },
        itemSelected: function (args, tabInfo) {
            var payload = {
                choice: args.id,
                selected: args.selected
            };
            if (payload.choice === "empresaFilial") {
                this.isEmpresaMissing = false;
            }
            this.$store.commit('treeview/setSelected', payload);
            tabInfo.selected = args.selected.length;
        },
        setUnloadedTreeView: function (payload) {
            this.$store.commit('treeview/setLoad', payload);
        },
        setTotalTreeViews: function (payload) {
            this.$store.commit('treeview/setLoad', { choice: payload.choice, loaded: true });
            this.$store.commit('treeview/setData', payload);
        },
        isTreeViewLoaded: function () {
            return this.$store.getters["treeview/isAllTreeviewLoaded"];
        },
        lookupItemSelected(payload) {
            this.$store.commit('treeview/setOrigem', payload);
        },
        menuItemSelected(payload) {
            this.$store.commit('treeview/setTipo', payload);
        },
        empresaSelected(payload) {
            this.isEmpresaMissing = false;
        },
        onErrorDateRange(payload) {
            toastr.error("A data inicial deve ser maior que a data final.");
            this.isDateError = true;
        }
    }
}
//# sourceURL=settings.vue
</script>
