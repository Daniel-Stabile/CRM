<template>
    <div class="filter-search-form note note-info note-bordered margin-bottom-20">
        <div class="row margin-bottom-20">
            <div class="col-md-9">
                <div class="col-md-9">
                    <div class="col-md-12">
                        <label class="filtro-label-avancado">Tipos</label>
                        <wes-Lookup
                            ref="lookupPerfil"
                            entityName="FN_GERENCIAISPERFIS"
                            resultFields="NOME"
                            whereClauseSessionKey="lookupPerfilGerenciaisWhere"
                            :placeholders="getPlaceHoldersPerfil()"
                            :enabled="isTreeViewLoaded()"
                            v-on:change="selecionarPerfil"
                            v-on:mounted="limparPerfilSelecionado"
                            v-on:clear="limparPerfilSelecionado">
                        </wes-Lookup>
                    </div>
                </div>
                <div @click="actionsClick" class="filtro-gerenciais-right-actions col-md-3" >
                    <label class="filtro-label-avancado">Período</label>
                    <transition name="slide-fade">
                        <span v-if="isDateError" class="badge badge-danger"> Data inicial deve ser menor que data final </span>
                    </transition>
                    <wes-date-range-button :gerarEnabled="isTreeViewLoaded()" startView= 0 buttonDescription="Gerar" v-on:error-input="onErrorDateRange" :startDate="getStartDateValue()" :endDate="getEndDateValue()" v-on:apply="applyFilter" key="t1">
                    </wes-date-range-button>
                </div>
            </div>
            <div class="col-md-3 filtro-gerenciais-actions collapsible" data-toggle="collapse" data-parent="false" data-target="#filtro-body">
                <div style="padding-top:20px">
				    <p style="font-size:14px; text-align: right;">Filtro avançado <i class="fa fa-chevron-down font-black" style="cursor:pointer;" title="Clique para expandir o menu de filtros."></i></p>
			    </div>
            </div>
        </div>
        <div id="filtro-body" class="row collapse" aria-expanded="false">
            <div class="col-md-3" style="min-height:300px">
                <ul class="nav nav-tabs tabs-left tabbable-line">
                    <li class="active">
                        <a href="#treeview_empresaFilial" data-toggle="tab">
                            <i class="fa fa-building"></i> Empresas <span v-if="(getTotalSelectedEmpresaFilial() > 0) && !isEmpresaTreeViewLoading()" class="badge badge-default"> {{getTotalSelectedEmpresaFilial()}} </span>
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
                           v-bind:class="{ 'not-active' : (isContaTreeViewLoading() || !isContaEmpresaMestreRegra()) }"
                           data-toggle="tab">
                            <i class="fa fa-bank"></i> Contas <span v-if="(getTotalSelectedContas() > 0) && !isContaTreeViewLoading()" class="badge badge-default"> {{getTotalSelectedContas()}} </span>
                            <transition name="slide-fade">
                                <span v-if="isContaTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_cc"
                           v-bind:class="{ 'not-active' : notActiveCCRules() }"
                           data-toggle="tab">
                            <i class="fa fa-money"></i> CC <span v-if="(getTotalSelectedCC() > 0) && !isCCTreeViewLoading()" class="badge badge-default"> {{getTotalSelectedCC()}} </span>
                            <transition name="slide-fade">
                                <span v-if="isCCTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_projetos"
                           v-bind:class="{ 'not-active' : (isProjetoTreeViewLoading() || !isProjetoEmpresaMestreRegra()) }"
                           data-toggle="tab">
                            <i class="fa fa-line-chart"></i> Projetos <span v-if="(getTotalSelectedProjetos() > 0) && !isProjetoTreeViewLoading()" class="badge badge-default"> {{getTotalSelectedProjetos()}} </span>
                            <transition name="slide-fade">
                                <span v-if="isProjetoTreeViewLoading()" class="fa fa-spinner fa-spin"></span>
                            </transition>
                        </a>
                    </li>
                    <li>
                        <a href="#treeview_avancado" data-toggle="tab">
                            <i class="fa fa-gears"></i> Tipos Gerenciais
                            <transition name="slide-fade">
                                <span v-if="isAbrangenciaMissing" class="badge badge-danger"> selecione </span>
                            </transition>

                        </a>
                    </li>
                    <li>
                        <a href="#treeview_filtro" data-toggle="tab">
                            <i class="fa fa-gear"></i> Filtro avançado
                            <transition name="slide-fade">
                                <span v-if="isAbrangenciaMissing" class="badge badge-danger"> selecione </span>
                            </transition>

                        </a>
                    </li>
                </ul>
            </div>
            <div class="col-md-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="treeview_empresaFilial">
                        <wes-treeview :key="`${chaveUnicaPerfilSelecionado}-1`" :store="getTreeViewEmpresaFilial()" treeview-id="empresaFilial" endpoint="empresasFiliaisPermitidasUsuario" marcar="false" v-on:item-selected="itemSelected($event, tabInfo.empresaFilial)" v-on:loaded="setTotalTreeViews" v-on:unloaded="setUnloadedTreeView"></wes-treeview>
                    </div>
                    <div class="tab-pane fade" id="treeview_contas">
                        <div class="row">
                            <div class="col-md-6">
                                <wes-treeview-select :key="`${chaveUnicaPerfilSelecionado}-2`" ref="treeviewSelectContas" :markAllByDefault="true" :store="getTreeViewContas()" v-on:menu-item-selected="menuItemSelected" treeview-id="contas" :definitions="contaDefinitions" v-on:lookup-item-selected="lookupItemSelected" v-on:item-selected="itemSelected($event, tabInfo.contas)" v-on:tree-view-loaded="setTotalTreeViews" v-on:tree-view-unloaded="setUnloadedTreeView"></wes-treeview-select>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_cc">
                        <transition name="slide-fade">
                            <div class="row" :key="`${chaveUnicaPerfilSelecionado}-5`">
                                <div class="col-md-12">
                                    <div>
                                        <label class="label-title">Exibir lançamentos sem Centros de Custos informados (NI)</label>
                                        <wes-switch :value="getExibirLancamentosSemCCInformado()" v-on:change="exibirLancamentosSemCcInformadoChanged"></wes-switch>
                                    </div>
                                </div>
                            </div>
                        </transition>
                        <div class="row">
                            <div class="col-md-6" style="padding-top: 10px">
                                <wes-treeview-select :key="`${chaveUnicaPerfilSelecionado}-3`" ref="treeviewSelectCC" :store="getTreeViewCentroDeCustos()" v-on:menu-item-selected="menuItemSelected" treeview-id="CC" :definitions="ccDefinitions" v-on:lookup-item-selected="lookupItemSelected" v-on:item-selected="itemSelected($event, tabInfo.centroDeCustos)" v-on:tree-view-loaded="setTotalTreeViews" v-on:tree-view-unloaded="setUnloadedTreeView"></wes-treeview-select>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_projetos">
                        <div class="row">
                            <div class="col-md-6">
                                <div id="treeview_projetos_custom"></div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="treeview_avancado" style="padding-top: 10px">
                        <div>
                            <a href="javascript:;"
                               class="btn"
                               v-bind:class="{ [colorSelected]: isTipoCalculoEnabled(1), [colorDeselected] : !isTipoCalculoEnabled(1) }"
                               v-on:click="selectAbrangencia(1)">
                                <i class="fa fa fa-refresh"></i> Clientes e Fornecedores
                            </a>
                            <a href="javascript:;" class="btn"
                               v-bind:class="{ [colorSelected]: isTipoCalculoEnabled(2), [colorDeselected] : !isTipoCalculoEnabled(2) }"
                               v-on:click="selectAbrangencia(2)">
                                <i class="fa fa fa-arrow-circle-up"></i> Cliente
                            </a>

                            <a href="javascript:;" class="btn"
                               v-bind:class="{ [colorSelected]: isTipoCalculoEnabled(3), [colorDeselected] : !isTipoCalculoEnabled(3) }"
                               v-on:click="selectAbrangencia(3)">
                                <i class="fa fa fa-arrow-circle-down"></i> Fornecedor
                            </a>

                            <a href="javascript:;" class="btn"
                               v-bind:class="{ [colorSelected]: isTipoCalculoEnabled(4), [colorDeselected] : !isTipoCalculoEnabled(4) }"
                               v-on:click="selectAbrangencia(4)">
                                <i class="fa fa-scissors"></i> Tesouraria
                            </a>
                        </div>
                        <hr />
                        <transition-group name="slide-fade">
                            <div v-if="isAbrangenciaEnabled()" key="abrangenciaFilter">
                                <gerenciais-filtro-abrangencia :isFilterNotSelected="isAbrangenciaMissing" v-on:filtro-selected="abrangenciaSelected" :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-abrangencia>
                            </div>
                            <div v-if="isCategoriaEnabled()" class="row" key="categoriaFilter">
                                <div class="col-md-12">
                                    <gerenciais-filtro-categoria-titulo :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-categoria-titulo>
                                </div>
                            </div>
                            <div v-if="isTituloEnabled()" class="row" key="tituloFilter">
                                <div vi class="col-md-12">
                                    <gerenciais-filtro-titulo :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-titulo>
                                </div>
                            </div>
                        </transition-group>
                        <transition name="slide-fade">
                            <div class="row" v-if="isEmAbertoEnabled()" :key="`${chaveUnicaPerfilSelecionado}-6`">
                                <div class="col-md-2">
                                    <div>
                                        <label class="label-title">Em aberto</label>
                                        <wes-switch :value="getEmAbertoValue()" v-on:change="documentoEmAbertoChanged"></wes-switch>
                                    </div>
                                </div>
                            </div>
                        </transition>
                        <transition name="slide-fade">
                            <div key="comandosPerfil">
                                <hr />
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>Nome do perfil</label>
                                            <input type="text" class="form-control" id="nomePerfil" :value="nomePerfil" @input="setNomePerfil">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label>&nbsp;</label>
                                            <div class="form-actions">
                                                <a class="btn btn-info" v-on:click.prevent="persistirPerfil()">
                                                    <i class="fa fa-save"></i> {{ isPerfilSistema() ? "Salvar cópia de perfil pré-definido" : "Salvar perfil" }}
                                                </a>
                                                <a class="btn btn-danger" v-if="perfilSelecionado() && !isPerfilSistema()" v-on:click.prevent="excluirPerfil()">
                                                    <i class="fa fa-times"></i> Excluir perfil
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </transition>
                    </div>
                    <div class="tab-pane fade" id="treeview_filtro">
                        <div class="col-md-9">
                            <gerenciais-filtro-abrangencia-avancado :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-abrangencia-avancado>
                            <hr />
                            <div v-for="(item, index) in lookupItems" :key="index">
                                <label class="filtro-label-avancado">{{ item.label }}</label>
                                <wes-lookup-multiple ref="lookup[item.ref]"
                                                    :entityName="item.entityName"
                                                    :resultFields="item.resultFields"
                                                    :placeholders="getPlaceHoldersCustom(item.placeholder)"
                                                    :enabled="isTreeViewLoaded()"
                                                    v-on:change="item.changeMethod"
                                                    v-on:clear="item.clearMethod"
                                                    v-on:mounted="item.clearMethod">
                                </wes-lookup-multiple>
                                <hr />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<style>
    .filtro-gerenciais-actions {
        cursor: pointer !important;
    }

    .filtro-gerenciais-right-actions {
        float: right;
    }
    .img-tab {
        background-repeat: no-repeat;
        background-position: right bottom;
        background-size: cover;
    }

    .noUi-target {
        height: 10px
    }

    .gerenciais-font {
        padding: 0;
        margin: 0;
        line-height: 13px;
        color: #9eacb4;
        font-size: 13px;
        font-weight: 400;
    }

    .noUi-horizontal .noUi-handle {
        width: 24px;
        height: 20px;
    }

    .noUi-handle:before, .noUi-handle:after {
        height: 10px;
        width: 1px;
        left: 8px;
        top: 5px;
    }

    .noUi-handle:after {
        left: 14px;
    }

    .portlet-gerenciais-title {
        border-bottom: 1px solid #eee;
        padding: 0;
        margin-bottom: 1px;
        min-height: 41px;
        -webkit-border-radius: 4px 4px 0 0;
        -moz-border-radius: 4px 4px 0 0;
        -ms-border-radius: 4px 4px 0 0;
        -o-border-radius: 4px 4px 0 0;
        border-radius: 4px 4px 0 0;
    }

    .not-active {
        pointer-events: none;
        cursor: default;
        text-decoration: none;
        color: black;
    }

    .portlet-treeview {
        min-height: 300px;
    }

    /* Enter and leave animations can use different */
    /* durations and timing functions.              */
    .slide-fade-enter-active {
        transition: all .3s ease;
    }

    .slide-fade-leave-active {
        transition: all .1s cubic-bezier(1.0, 0.5, 0.8, 1.0);
    }

    .slide-fade-enter, .slide-fade-leave-to
    /* .slide-fade-leave-active below version 2.1.8 */ {
        transform: translateX(10px);
        opacity: 0;
    }
</style>

<script>
    import { mapGetters } from 'vuex';
    import GerenciaisService from "../../services/GerenciaisService";

    const disabledMessage = "Aguarde...";

    export default {
        props: ["colorSelected", "colorDeselected"],
        computed: {
            ...mapGetters({ nomePerfil: 'filtro/getNomePerfil'})
        },
        data: function () {
            return {
                chaveUnicaPerfilSelecionado: 0,
                isEmpresaMissing: false,
                isAbrangenciaMissing: false,
                isDateError:false,
                tabInfo: {
                    empresaFilial: { selected: 0, total: 0 },
                    contas: { selected: 0, total: 0 },
                    centroDeCustos: { selected: 0, total: 0 },
                    projetos: { selected: 0, total: 0 }
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
                    }],
                lookupItems: [
                    {
                        label: "Pessoas",
                        ref: "Pessoas",
                        entityName: "GN_PESSOAS",
                        resultFields: "NOME",
                        placeholder: "Pessoas",
                        changeMethod: this.selecionarPessoas,
                        clearMethod: this.limparPessoas
                    },
                    {
                        label: "Tipos de documento",
                        ref: "TiposDocumento",
                        entityName: "FN_TIPOSDOCUMENTOS",
                        resultFields: "NOME",
                        placeholder: "tipos de documento",
                        changeMethod: this.selecionarTiposDocumento,
                        clearMethod: this.limparTiposDocumento
                    },
                    {
                        label: "Tipos de cobrança",
                        ref: "TiposCobranca",
                        entityName: "FN_TIPOSCOBRANCAS",
                        resultFields: "NOME",
                        placeholder: "tipos de cobrança",
                        changeMethod: this.selecionarTiposCobranca,
                        clearMethod: this.limparTiposCobranca
                    },
                    {
                        label: "Categorias de cliente",
                        ref: "CategoriasCliente",
                        entityName: "GN_CATEGORIASCLIENTE",
                        resultFields: "NOME",
                        placeholder: "categorias de cliente",
                        changeMethod: this.selecionarCategoriasCliente,
                        clearMethod: this.limparCategoriasCliente
                    },
                    {
                        label: "Categorias de fornecedor",
                        ref: "CategoriasFornecedor",
                        entityName: "GN_CATEGORIASFORNECEDORES",
                        resultFields: "NOME",
                        placeholder: "categorias de fornecedor",
                        changeMethod: this.selecionarCategoriasFornecedor,
                        clearMethod: this.limparCategoriasFornecedor
                    },
                    {
                        label: "Formas de pagamento",
                        ref: "FormasPagamento",
                        entityName: "FN_FORMASPAGAMENTO",
                        resultFields: "NOME",
                        placeholder: "formas de pagamento",
                        changeMethod: this.selecionarFormasPagamento,
                        clearMethod: this.limparFormasPagamento
                    }
                ]
            }
        },
        mounted: function () {
            const { $store } = this;
            $store.commit("treeview/setDefaultBranchAndCompany", { company: $("#CurrentCompany").val(), branch: $("#CurrentBranch").val() });
            GerenciaisService.getSituacaoEmpresaMestre().then(response => {
                $store.commit("treeview/setEmpresasMestreRegras", response.data);
            });
            $store.subscribe((mutation, state) => {
                const { treeviewSelectContas, treeviewSelectCC } = this.$refs;
                if (mutation.type === 'treeview/setSelected') {
                    if (!$store.getters["treeview/getTotalSelectedContas"]) treeviewSelectContas.clear();
                    if (!$store.getters["treeview/getTotalSelectedCC"]) treeviewSelectCC.clear();
                }
            });
        },
        methods: {
            setNomePerfil(event) {
                this.$store.commit("filtro/setNomePerfil", event.target.value);
            },
            selecionarLookupPerfil(perfil) {
                this.$refs.lookupPerfil.select(perfil);
                this.$store.commit('filtro/setHandlePerfilSelecionado', perfil.handle)
            },
            clearPerfil() {
                this.$refs.lookupPerfil.clear();
            },
            isPerfilSistema() {
                return this.$store.getters["filtro/isPerfilSistema"];
            },
            perfilSelecionado() {
                return this.$store.getters["filtro/getHandlePerfilSelecionado"] > 0;
            },
            excluirPerfil() {
                GerenciaisService.deletePerfilGerenciais(this.$store.getters["filtro/getHandlePerfilSelecionado"])
                    .then((response) => {
                    this.$store.commit("filtro/setNomePerfil", null);
                    this.clearPerfil();
                    toastr.success(response.data);
                });
            },
            persistirPerfil() {
                if (!this.nomePerfil) {
                    toastr.error("Para salvar uma configuração, informe o nome do perfil desejado.");
                    return;
                }

                if (!this.isApplyEnabled())
                    return;

                var gerenciaisFiltroDTO = {
                    filtro: this.$store.state.filtro,
                    treeview: this.$store.state.treeview.treeview_selecoes.map(
                    (selecao) => { return { origem: selecao.origem, tipo: selecao.tipo, selected: selecao.selected }}
                    )
                };

                GerenciaisService.postPerfilGerenciais(gerenciaisFiltroDTO).then((response) => {
                    if (response.data.handlePerfil !== this.$store.state.filtro.handlehandlePerfilSelecionado)
                        this.selecionarLookupPerfil({
                            handle: response.data.handlePerfil,
                            nome: gerenciaisFiltroDTO.filtro.nomePerfil
                        });

                    toastr.success(response.data.mensagemRetorno);
                });
            },
            selecionarPerfil(handlePerfil) {
                this.$store.commit('filtro/setHandlePerfilSelecionado', handlePerfil);

                GerenciaisService.getPerfilGerenciais(handlePerfil).then((response) => {
                    this.$store.commit('treeview/setFromPerfil', response.data.treeview);
                    this.$store.commit('filtro/loadPerfil', response.data.filtro);
                    this.chaveUnicaPerfilSelecionado++;
                });
            },
            limparPerfilSelecionado() {
                this.$store.commit('filtro/setHandlePerfilSelecionado', 0);
                this.$store.commit('filtro/setNomePerfil', "");
                this.$store.commit('filtro/setSistema', false);
            },
            getPlaceHoldersPerfil() {
                return { enabled: "Carregar configurações pré-definidas", disabled: disabledMessage };
            },
            getPlaceHoldersCustom(custom) {
                return { enabled: "Selecionar " + custom, disabled: disabledMessage };
            },
            getTitle(title) {
                return title;
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

            getTotalSelectedContas(choice) {
                return this.$store.getters["treeview/getTotalSelectedContas"];
            },
            getTotalSelectedProjetos(choice) {
                return this.$store.getters["treeview/getTotalSelectedProjetos"];
            },
            getTotalSelectedEmpresaFilial(choice) {
                return this.$store.getters["treeview/getTotalSelectedEmpresaFilial"];
            },
            getTotalSelectedCC(){
                return this.$store.getters["treeview/getTotalSelectedCC"];
            },
            getTreeViewSelectStore() {
                return this.$store.state.treeview;
            },
            actionsClick: function (e) {
                e.stopPropagation();
                return e.preventDefault(); //Para o widget de filtro não ficar expandindo/recolhendo a cada clique.
            },
            getStartDateValue() {
                if (!this.$store.state.options.startDate)
                    return null;
                return moment(this.$store.state.options.startDate, 'DD/MM/YYYY').toDate();
            },
            getEndDateValue() {
                if (!this.$store.state.options.endDate)
                    return null;
                return moment(this.$store.state.options.endDate, 'DD/MM/YYYY').toDate();
            },
            getEmAbertoValue() {
                return this.$store.state.filtro.documentoEmAberto;
            },
            applyFilter(args) {
                this.isDateError = false;
                if(this.isApplyEnabled()){
                    this.$store.commit("options/setStartDate", args.start);
                    this.$store.commit("options/setEndDate", args.end);

                    const _projetos = $('#ctl00_Main_PROJETOS_SimpleGrid :checkbox:checked').toArray().filter(proj => proj.value > 0).map((e)=> e.parentNode.parentNode.parentNode.attributes.handle.textContent);


                    var data = {
                        treeview: this.$store.state.treeview.treeview_selecoes.filter(x=>x.id != "projetos"),
                        filtro: this.$store.state.filtro,
                        startDate: args.start.toISOString().slice(0,10),
                        endDate: args.end.toISOString().slice(0,10),
                        projetos: _projetos
                    };


                    window.$("#filtro-body").collapse("hide");
                    this.$store.commit('pivotgrid/beginRequest');
                    GerenciaisService.getGerenciaisPivotGrid(data).then(response => {
                        if (response.data.length === 0)
                            window.$("#filtro-body").collapse("show");
                        this.$store.commit('pivotgrid/endRequestSuccess', response.data);
                    }, response => {
                        window.$("#filtro-body").collapse("show");
                        this.$store.commit('pivotgrid/endRequestError', response.data);
                    });
                }
            },
            isApplyEnabled() {
                var result = true;
                var rules = [this.checkFiltroAbrangencia(), this.checkFiltroEmpresa()];
                for(var i in rules) {
                    var current = rules[i];
                    if(!current.condition()) {
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
            checkFiltroAbrangencia() {
                var result = {
                    condition: this.isFilterAbrangenciaSelected,
                    showErrorMessage: this.showFilterNotSelectedMessage
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
            showFilterNotSelectedMessage() {
                toastr.error("É necessário escolher um tipo de abrangência(filtro, devolucoes...)")
                this.isAbrangenciaMissing = true;
                return "ok";
            },
            isEmpresaTreeViewLoading() {
                return this.$store.getters["treeview/isEmpresaTreeviewLoading"];
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
            isFilterAbrangenciaSelected() {
                return this.$store.getters["filtro/isAplicarEnabled"];
            },
            isAbrangenciaEnabled() {
                return this.$store.getters["filtro/isAbrangenciaEnabled"]
            },
            isEmAbertoEnabled() {
                return this.$store.getters["filtro/isEmAbertoEnabled"];
            },
            isTipoCalculoEnabled(tipoCalculo) {
                return this.$store.state.filtro.tipoCalculo === tipoCalculo;
            },
            selectAbrangencia(tipoCalculo) {
                this.$store.commit('filtro/setTipoCalculo', tipoCalculo);
            },
            itemSelected: function (args, tabInfo) {
                var payload = {
                    choice: args.id,
                    selected: args.selected
                };
                if(payload.choice === "empresaFilial"){
                    this.isEmpresaMissing = false;
                }
                this.$store.commit('treeview/setSelected', payload);
                tabInfo.selected = args.selected.length;
            },
            setUnloadedTreeView: function(payload){
                this.$store.commit('treeview/setLoad', payload);
            },
            setTotalTreeViews: function (payload) {
                this.$store.commit('treeview/setLoad', { choice: payload.choice, loaded: true });
                this.$store.commit('treeview/setData', payload);
            },
            isTreeViewLoaded : function() {
                return this.$store.getters["treeview/isAllTreeviewLoaded"];
            },
            isTituloEnabled() {
                return this.$store.getters["filtro/isFiltroTituloEnabled"];
            },
            isCategoriaEnabled() {
                return this.$store.getters["filtro/isFiltroCategoriaEnabled"];
            },
            analiticoSwitchChanged(event, state) {
                this.$store.commit('filtro/changeAnalitico');
            },
            documentoEmAbertoChanged(event, state) {
                this.$store.commit('filtro/changeDocumentoEmAberto');
            },
            exibirLancamentosSemCcInformadoChanged(event, state) {
                this.$store.commit('filtro/changeExibirLancamentosSemCcInformado');
            },
            exibirLancamentosSemProjetoInformadoChanged(event, state) {
                this.$store.commit('filtro/changeExibirLancamentosSemProjetoInformado');
            },
            getAnalitico() {
                return this.$store.state.filtro.analitico;
            },
            getDocumentoEmAberto() {
                return this.$store.state.filtro.documentoEmAberto;
            },
            getExibirLancamentosSemCCInformado() {
                return this.$store.state.filtro.exibirLancamentosSemCcInformado;
            },
            getExibirLancamentosSemProjetoInformado() {
                return this.$store.state.filtro.exibirLancamentosSemProjetoInformado;
            },
            lookupItemSelected(payload) {
                this.$store.commit('treeview/setOrigem', payload);
            },
            selecionarPessoas(payload) {
                this.$store.commit('filtro/setPessoaHandleSelecionados', payload);
            },
            limparPessoas() {
                this.$store.commit('filtro/setPessoaHandleSelecionados', []);
            },
            selecionarTiposDocumento(payload) {
                this.$store.commit('filtro/setTipoDocumentoHandleSelecionados', payload);
            },
            limparTiposDocumento() {
                this.$store.commit('filtro/setTipoDocumentoHandleSelecionados', []);
            },
            selecionarTiposCobranca(payload) {
                this.$store.commit('filtro/setTipoCobrancaHandleSelecionados', payload);
            },
            limparTiposCobranca() {
                this.$store.commit('filtro/setTipoCobrancaHandleSelecionados', []);
            },
            selecionarCategoriasCliente(payload) {
                this.$store.commit('filtro/setCategoriaClienteHandleSelecionados', payload);
            },
            limparCategoriasCliente() {
                this.$store.commit('filtro/setCategoriaClienteHandleSelecionados', []);
            },
            selecionarCategoriasFornecedor(payload) {
                this.$store.commit('filtro/setCategoriaFornecedorHandleSelecionados', payload);
            },
            limparCategoriasFornecedor() {
                this.$store.commit('filtro/setCategoriaFornecedorHandleSelecionados', []);
            },
            selecionarFormasPagamento(payload) {
                this.$store.commit('filtro/setFormaPagamentoHandleSelecionados', payload);
            },
            limparFormasPagamento() {
                this.$store.commit('filtro/setFormaPagamentoHandleSelecionados', []);
            },
            menuItemSelected(payload) {
                this.$store.commit('treeview/setTipo', payload);
            },
            abrangenciaSelected(payload) {
                this.isAbrangenciaMissing = false;
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
