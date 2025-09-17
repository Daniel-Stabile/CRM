<template>
  <div class="filter-search-form note margin-bottom-20">
    <div class="row">
    <div class="col-md-9">
        <div class="col-md-5">
          <div class="col-md-12">
            <span>Perfil balancete</span>
            <wes-Lookup 
              ref="lookupPerfil"
              entityName="CT_BALANCETEWEBTIPOS" 
              resultFields="NOME"
              whereClauseSessionKey="lookupPerfilBalanceteWhere"
              :placeholders="getPlaceHoldersPerfil()"
              :enabled="isTreeViewLoaded()"
              v-on:change="selecionarPerfil"
              v-on:mounted="limparPerfilSelecionado"
              v-on:clear="limparPerfilSelecionado">
            </wes-Lookup>
          </div>
        </div>
        <div class="filtro-gerenciais-right-actions col-md-7">
          <span>Período</span>
          <transition name="slide-fade">
            <span v-if="isDateError" class="badge badge-danger">
              Data inicial deve ser menor que data final
            </span>
          </transition>
          <!-- balanceteDiarioMinView -->
          <wes-date-range-button
            :onlyStart="showOnlyStart()"
            :startView="balanceteDiarioMinView"
            :key="balanceteDiarioMinView"
            :equalDates="true"
            :gerarEnabled="isTreeViewLoaded()"
            buttonDescription="Gerar"
            v-on:error-input="onErrorDateRange"
            :startDate="getStartDateValue()"
            :endDate="getEndDateValue()"
            v-on:apply="applyFilter"
            v-on:start-date-changed="setStartDateValue"
            v-on:end-date-changed="setEndDateValue"
          >
            <!--<template slot="comandoswes">
                          <button :disabled="!isTreeViewLoaded()" class="btn blue" type="button" @click="saveClick" key="enabledbuttondate">                
                                 <i class="fa fa-save"></i>
                            </button>

                        </template>-->
          </wes-date-range-button>
        </div>
      </div>
      <div
        class="col-md-offset-11 filtro-gerenciais-actions collapsible"
        data-toggle="collapse"
        data-parent="false"
        data-target="#filtro-body"
      >
        <div style="padding-top:6px">
          <p style="font-size:14px; text-align: right;">Filtro avançado</p>
          <i
            class="fa fa-chevron-down font-black"
            style="cursor:pointer; float: right;"
            title="Clique para expandir o menu de filtros."
          ></i>
        </div>
      </div>      
    </div>
    <div class="row">
      <div id="filtro-body" class="row collapse" aria-expanded="false">
      <br><br>
        <div class="col-md-3" style="min-height:300px">
          <ul class="nav nav-tabs tabs-left tabbable-line">
            <li class="active">
              <a href="#treeview_empresaFilial" data-toggle="tab">
                <i class="fa fa-building"></i> Empresas
                <span
                  v-if="
                    getTotalSelectedEmpresaFilial() > 0 &&
                      !isEmpresaTreeViewLoading()
                  "
                  class="badge badge-default"
                >
                  {{ getTotalSelectedEmpresaFilial() }}
                </span>
                <transition name="slide-fade">
                  <span
                    v-if="isEmpresaTreeViewLoading()"
                    class="fa fa-spinner fa-spin"
                  ></span>
                </transition>
                <transition name="slide-fade">
                  <span v-if="isEmpresaMissing" class="badge badge-danger">
                    selecione
                  </span>
                </transition>
              </a>
            </li>
            <li class="pulsate-regular">
              <a
                href="#treeview_contas"
                v-bind:class="{
                  'not-active':
                    isContaTreeViewLoading() || !isContaEmpresaMestreRegra(),
                }"
                data-toggle="tab"
                ><i class="fa fa-bank"></i> Contas
                <span
                  v-if="getTotalSelectedContas() > 0 && !isContaTreeViewLoading()"
                  class="badge badge-default"
                >
                  {{ getTotalSelectedContas() }}
                </span>
                <transition name="slide-fade">
                  <span
                    v-if="isContaTreeViewLoading()"
                    class="fa fa-spinner fa-spin"
                  ></span>
                  <span v-if="isContaMissing" class="badge badge-danger">
                    selecione
                  </span>
                </transition>
              </a>
            </li>
            <li>
              <a
                href="#treeview_cc"
                v-bind:class="{ 'not-active': notActiveCCRules() }"
                data-toggle="tab"
                ><i class="fa fa-money"></i> CC
                <span
                  v-if="getTotalSelectedCC() > 0 && !isCCTreeViewLoading()"
                  class="badge badge-default"
                >
                  {{ getTotalSelectedCC() }}
                </span>
                <transition name="slide-fade">
                  <span
                    v-if="isCCTreeViewLoading()"
                    class="fa fa-spinner fa-spin"
                  ></span>
                </transition>
              </a>
            </li>
            <li>
              <a
                href="#treeview_projetos"
                v-bind:class="{
                  'not-active':
                    isProjetoTreeViewLoading() || !isProjetoEmpresaMestreRegra(),
                }"
                data-toggle="tab"
                ><i class="fa fa-line-chart"></i> Projetos
                <span
                  v-if="
                    getTotalSelectedProjetos() > 0 && !isProjetoTreeViewLoading()
                  "
                  class="badge badge-default"
                >
                  {{ getTotalSelectedProjetos() }}
                </span>
                <transition name="slide-fade">
                  <span
                    v-if="isProjetoTreeViewLoading()"
                    class="fa fa-spinner fa-spin"
                  ></span>
                </transition>
              </a>
            </li>
            <li>
              <a href="#treeview_avancado" data-toggle="tab"
                ><i class="fa fa-gears"></i> Perfil balancete
                <transition name="slide-fade">
                  <span v-if="isFilterMissing" class="badge badge-danger">
                    selecione
                  </span>
                </transition>
              </a>
            </li>
          </ul>
        </div>
        <div class="col-md-9">
          <div class="tab-content" id="tab-content">
            <div class="tab-pane active" id="treeview_empresaFilial">
              <wes-treeview
                :key="`${chaveUnicaPerfilSelecionado}-1`"
                :store="getTreeViewEmpresaFilial()"
                ref="treeviewEmpresasFiliais"
                treeview-id="empresaFilial"
                button="circle"
                endpoint="empresasFiliaisPermitidasUsuario"
                marcar="false"
                singleSelectionFirstParent="true"
                v-on:item-selected="itemSelected($event, tabInfo.empresaFilial)"
                v-on:loaded="setTotalTreeViews"
                v-on:unloaded="setUnloadedTreeView"
              ></wes-treeview>
            </div>
            <div class="tab-pane fade" id="treeview_contas">
              <div class="row">
                <div class="col-md-6">
                  <wes-treeview-select
                    :key="`${chaveUnicaPerfilSelecionado}-2`"
                    ref="treeviewSelectContas"
                    :store="getTreeViewContas()"
                    v-on:menu-item-selected="menuItemSelected"
                    treeview-id="contas"
                    :definitions="contaDefinitions"
                    origem="balanceteContabil"
                    v-on:lookup-item-selected="lookupItemSelected"
                    v-on:item-selected="itemSelected($event, tabInfo.contas)"
                    v-on:tree-view-loaded="setTotalTreeViews"
                    v-on:tree-view-unloaded="setUnloadedTreeView"
                  ></wes-treeview-select>
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="treeview_cc">
              <div class="row">
                <div class="col-md-6">
                  <wes-treeview-select
                    :key="`${chaveUnicaPerfilSelecionado}-3`"
                    ref="treeviewSelectCC"
                    :store="getTreeViewCentroDeCustos()"
                    v-on:menu-item-selected="menuItemSelected"
                    treeview-id="CC"
                    :definitions="ccDefinitions"
                    v-on:lookup-item-selected="lookupItemSelected"
                    v-on:item-selected="itemSelected($event, tabInfo.centroDeCustos)"
                    v-on:tree-view-loaded="setTotalTreeViews"
                    v-on:tree-view-unloaded="setUnloadedTreeView"
                  ></wes-treeview-select>
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="treeview_projetos">
              <div class="row">
                <div class="col-md-6">
                  <wes-treeview-select
                    :key="`${chaveUnicaPerfilSelecionado}-4`"
                    ref="treeviewSelectProjetos"
                    :store="getTreeViewProjetos()"
                    v-on:menu-item-selected="menuItemSelected"
                    treeview-id="projetos"
                    :definitions="projetoDefinitions"
                    v-on:lookup-item-selected="lookupItemSelected"
                    v-on:item-selected="itemSelected($event, tabInfo.projetos)"
                    v-on:tree-view-loaded="setTotalTreeViews"
                    v-on:tree-view-unloaded="setUnloadedTreeView"
                  ></wes-treeview-select>
                </div>
              </div>
            </div>
            <div
              class="tab-pane fade"
              id="treeview_avancado"
              style="padding-top: 10px"
            >
              <!-- BEGIN Portlet PORTLET-->
              <contabil-balancete-filtro-avancado
                :color-selected="colorSelected"
                :color-deselected="colorDeselected"
                :defaultPosteriorDate="getStartDateValue()"
                v-on:clear-perfil="clearPerfil()"
                v-on:selecionar-perfil="selecionarLookupPerfil"
                v-on:persistir-perfil="persistirPerfil"
                button="primary"
              >
              </contabil-balancete-filtro-avancado>

              <!-- END Portlet PORTLET-->
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

.filter-search-form {
    background-color: #ffffff;
    border-color: #ffffff; 
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
  height: 10px;
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

.noUi-handle:before,
.noUi-handle:after {
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
  transition: all 0.3s ease;
}

.slide-fade-leave-active {
  transition: all 0.1s cubic-bezier(1, 0.5, 0.8, 1);
}

.slide-fade-enter, .slide-fade-leave-to
    /* .slide-fade-leave-active below version 2.1.8 */ {
  transform: translateX(10px);
  opacity: 0;
}
</style>

<script>
import { mapState } from "vuex";
import ContabilService from "../../../services/ContabilService";

export default {
  props: ["colorSelected", "colorDeselected"],
  data: function() {
    return {
      chaveUnicaPerfilSelecionado: 0,
      isEmpresaMissing: false,
      isFilterMissing: false,
      isContaMissing: false,
      isDateError: false,
      tabInfo: {
        empresaFilial: {
          selected: 0,
          total: 0,
        },
        contas: {
          selected: 0,
          total: 0,
        },
        centroDeCustos: {
          selected: 0,
          total: 0,
        },
        projetos: {
          selected: 0,
          total: 0,
        },
      },
      contaDefinitions: [        
        {
          caption: "Padrão",
          lookupEntityName: "ct_planoversoes",
          treeviewFilterField: "versao",
          treeviewEntityName: "ct_contas",
        },
        {
          caption: "Gerenciais",
          lookupEntityName: "ct_planosgerenciais",
          treeviewFilterField: "plano",
          treeviewEntityName: "ct_contasgerenciais",
        },
      ],
      ccDefinitions: [
        {
          caption: "Padrão",
          lookupEntityName: "",
          treeviewFilterField: "",
          treeviewEntityName: "ct_cc",
        },
        // Geração de balancete gerencial não estável. Descomentar após estabilização do back-end.
        // {
        //   caption: "Gerenciais",
        //   lookupEntityName: "ct_planosccgerenciais",
        //   treeviewFilterField: "tipo",
        //   treeviewEntityName: "ct_ccgerenciais",
        // },
      ],
      projetoDefinitions: [
        {
          caption: "Padrão",
          lookupEntityName: "",
          treeviewFilterField: "",
          treeviewEntityName: "gn_projetos",
        },
        // Geração de balancete gerencial não estável. Descomentar após estabilização do back-end.
        // {
        //   caption: "Gerenciais",
        //   lookupEntityName: "ct_planosprojetosgerenciais",
        //   treeviewFilterField: "tipo",
        //   treeviewEntityName: "ct_projetosgerenciais",
        // },
      ],
    };
  },
  computed: {
    ...mapState(["status"]),
    balanceteDiarioMinView: function() {
      if (
        this.$store.state.filtro.saldoDiario &&
        this.$store.getters["parametros/isBalanceteDiario"]
      )
        return 0;
      else return 1;
    },
  },
  mounted: function() {
    ContabilService.getParametrosContabil().then((response) =>
      this.$store.commit("parametros/setParametros", response.data)
    );

    ContabilService.getSituacaoEmpresaMestre().then((response) => {
      this.$store.commit("treeview/setEmpresasMestreRegras", response.data);
    });
    
    var self = this;
    this.$store.subscribe((mutation, state) => {
      if (mutation.type == "treeview/setSelected") {
        if (self.$store.getters["treeview/getTotalSelectedContas"] === 0) {
          self.$refs.treeviewSelectContas.clear();
        }
        if (self.$store.getters["treeview/getTotalSelectedProjetos"] === 0) {
          self.$refs.treeviewSelectProjetos.clear();
        }
        if (self.$store.getters["treeview/getTotalSelectedCC"] === 0) {
          self.$refs.treeviewSelectCC.clear();
        }
      }
    });
  },
  methods: {
    selecionarLookupPerfil(perfil) {
      this.$refs.lookupPerfil.select(perfil);
    },
    clearPerfil() {
      this.$refs.lookupPerfil.clear();
    },
    setStartDateValue(value) {
      this.$store.commit('options/setStartDate', value);
    },
    setEndDateValue(value) {
      this.$store.commit('options/setEndDate', value);
    },
    saveClick() {
      $("#treeview_config_button").click();
    },
    isContaEmpresaMestreRegra() {
      return this.$store.getters["treeview/isContaMestreEnabled"];
    },
    notActiveCCRules() {
      return this.isCCTreeViewLoading() || !this.isCCEmpresaMestreRegra();
    },
    isCCEmpresaMestreRegra() {
      return this.$store.getters["treeview/isCCMestreEnabled"];
    },
    isProjetoEmpresaMestreRegra() {
      return this.$store.getters["treeview/isProjetoMestreEnabled"];
    },
    getTreeViewContas() {
      return this.$store.getters["treeview/getContas"];
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
    getTotalSelectedCC() {
      return this.$store.getters["treeview/getTotalSelectedCC"];
    },
    showOnlyStart() {
      return this.$store.state.filtro.abertura;
    },
    getStartDateValue() {
      if (!this.$store.state.options.startDate) return null;
      return moment(this.$store.state.options.startDate, "DD/MM/YYYY").toDate();
    },
    getEndDateValue() {
      if (!this.$store.state.options.endDate) return null;
      return moment(this.$store.state.options.endDate, "DD/MM/YYYY").toDate();
    },
    getPlaceHoldersPerfil() {
      return { enabled: "Carregar configurações pré-definidas", disabled: "Aguarde..." };
    },
    limparPerfilSelecionado() {
      this.$store.commit('filtro/setHandlePerfilSelecionado', 0);
      this.$store.commit('filtro/setNomePerfil', "");
      this.$store.commit('filtro/setSistema', false);
    },
    selecionarPerfil(handlePerfil){
      this.$store.commit('filtro/setHandlePerfilSelecionado', handlePerfil);

      ContabilService.getPerfilBalancete(handlePerfil).then((response) => {
        this.$store.commit('treeview/setFromPerfil', response.data.treeview);
        this.$store.commit('filtro/loadPerfil', response.data.filtro);
        this.$store.commit('pivotgrid/clearMessagePanel');
        this.chaveUnicaPerfilSelecionado++;
      });
    },
    applyFilter(args) {
      this.isDateError = false;
      if (this.isApplyEnabled()) {
        var data = {
          treeview: this.$store.state.treeview.treeview_selecoes,
          filtro: this.$store.state.filtro,
          startDate: args.start.toISOString().slice(0, 10),
          endDate: args.end.toISOString().slice(0, 10),
        };      

        window.$("#filtro-body").collapse("hide");
        this.$store.commit("pivotgrid/beginRequest");
        
        ContabilService.getGerenciaisPivotGrid(data).then(
          (response) => {
            if (response.data.store.length == 0)
              window.$("#filtro-body").collapse("show");
            this.$store.commit("pivotgrid/endRequestSuccess", response.data);
          },
          (response) => {
            window.$("#filtro-body").collapse("show");
            this.$store.commit("pivotgrid/endRequestError", response.data);
          }
        );
      }
    },
    persistirPerfil(nomePerfil) {
      if (!nomePerfil) {
        toastr.error("Para salvar uma configuração, informe o nome do perfil desejado.");
        return;
      }

      if (!this.isApplyEnabled())
        return;
        
      var balanceteFiltroDTO = {
        filtro: this.$store.state.filtro,
        treeview: this.$store.state.treeview.treeview_selecoes.map(
          (selecao) => { return { origem: selecao.origem, tipo: selecao.tipo, selected: selecao.selected }}
        )
      };

      ContabilService.postPerfilBalancete(balanceteFiltroDTO).then((response) => {
        if (response.data.handlePerfil != this.$store.state.filtro.handlehandlePerfilSelecionado);
          this.$emit("selecionar-perfil", { 
            handle: response.data.handlePerfil,
            nome: balanceteFiltroDTO.filtro.nomePerfil 
          });

        toastr.success(response.data.mensagemRetorno);
      });
    },
    isApplyEnabled() {
      var result = true;
      var rules = [this.checkFiltroVisualizacao(), this.checkFiltroEmpresa(), this.checkFiltroContas(), this.checkFiltroPeriodo()];
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
        showErrorMessage: this.showEmpresaNotSelectedMessage,
      };
      return result;
    },
    checkFiltroVisualizacao() {
      var result = {
        condition: this.isVisualFieldSelected,
        showErrorMessage: this.showFilterNotSelectedMessage,
      };
      return result;
    },
    checkFiltroPeriodo() {
      var result = {
        condition: this.isPeriodoSelected,
        showErrorMessage: this.showPeriodoNotSelectedMessage,
      };
      return result;
    },
    checkFiltroContas() {
      var result = {
        condition: this.isContaSelected,
        showErrorMessage: this.showContaNotSelectedMessage,
      };
      return result;
    },
    showEmpresaNotSelectedMessage() {
      toastr.error(
        "É necessário selecionar uma empresa para aplicar o filtro."
      );
      this.isEmpresaMissing = true;
    },
    isEmpresaSelected() {
      var r = this.$store.getters["treeview/isEmpresaSelected"];
      return r;
    },
    isVisualFieldSelected() {
      return this.$store.getters["filtro/isVisualFieldSelected"];
    },
    isPeriodoSelected() {
      return this.$store.getters["filtro/isPeriodoSelected"];
    },
    isContaSelected() {
      return this.getTotalSelectedContas() > 0;
    },
    showFilterNotSelectedMessage() {
      toastr.error(
        "Selecione pelo menos um tipo de listagem mensal (saldo do mês ou debitos e créditos)"
      );
      this.isFilterMissing = true;
      return "ok";
    },
    showPeriodoNotSelectedMessage() {
      toastr.error(
        "Selecione a periodicidade (dias, meses, trimestres, semestres ou anos)"
      );
      this.isFilterMissing = true;
      return "ok";
    },
    showContaNotSelectedMessage() {
      toastr.error("Selecione pelo menos uma conta contábil.");
      this.isContaMissing = true;
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
    isFilterAbragenciaSelected() {
      return this.$store.getters["filtro/isAplicarEnabled"];
    },
    isAbragenciaEnabled() {
      return this.$store.getters["filtro/isAbragenciaEnabled"];
    },
    isEmAbertoEnabled() {
      return this.$store.getters["filtro/isEmAbertoEnabled"];
    },
    isTipoCalculoEnabled(tipoCalculo) {
      return this.$store.state.filtro.tipoCalculo == tipoCalculo;
    },
    selectAbragencia(tipoCalculo) {
      this.$store.commit("filtro/setTipoCalculo", tipoCalculo);
    },
    itemSelected: function(args, tabInfo) {
      var payload = {
        choice: args.id,
        selected: args.selected,
      };

      if (payload.choice === "empresaFilial") {
        this.isEmpresaMissing = false;
      }
      
      if (payload.choice === "contas")
        this.isContaMissing = false;

      this.$store.commit("treeview/setSelected", payload);
      tabInfo.selected = args.selected.length;
    },
    setUnloadedTreeView: function(payload) {
      this.$store.commit("treeview/setLoad", payload);
    },
    setTotalTreeViews: function(payload) {
      this.$store.commit("treeview/setLoad", {
        choice: payload.choice,
        loaded: true,
      });
      this.$store.commit("treeview/setData", payload);
    },
    isTreeViewLoaded: function() {
      return this.$store.getters["treeview/isAllTreeviewLoaded"];
    },
    isTituloEnabled() {
      return this.$store.getters["filtro/isFiltroTituloEnabled"];
    },
    isCategoriaEnabled() {
      return this.$store.getters["filtro/isFiltroCategoriaEnabled"];
    },
    analiticoSwitchChanged(event, state) {
      this.$store.commit("filtro/changeAnalitico");
    },
    documentoEmAbertoChanged(event, state) {
      this.$store.commit("filtro/changeDocumentoEmAberto");
    },
    getAnalitico() {
      return this.$store.state.filtro.analitico;
    },
    getDocumentoEmAberto() {
      return this.$store.state.filtro.documentoEmAberto;
    },
    lookupItemSelected(payload) {
      this.$store.commit("treeview/setOrigem", payload);
    },
    menuItemSelected(payload) {
      this.$store.commit("treeview/setTipo", payload);
    },
    abragenciaSelected(payload) {
      this.isFilterMissing = false;
    },
    empresaSelected(payload) {
      this.isEmpresaMissing = false;
    },
    onErrorDateRange(payload) {
      toastr.error("A data inicial deve ser maior que a data final.");
      this.isDateError = true;
    },
  },
};
//# sourceURL=settings.vue
</script>
