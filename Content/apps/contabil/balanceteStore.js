//#region FILTRO_STORE

const filtro = {
  namespaced: true,
  state: {
    nomePerfil: "",
    sistema: false,
    handlePerfilSelecionado: 0,
    saldoAnteriorAtual: false,
    debitosCreditos: false,
    saldoMes: false,
    moeda: false,
    abertura: false,
    fechamentoGerencial: false,
    considerarLalur: false,
    antesZeramento: false,
    saldoDiario: false,
    completarEstrutura: false,
    mostrarReduzido: false,
    mostrarApelido: false,
    formatacaoDC: false,
    formatacaoParenteses: false,
    valoresEmMilhares: false,
    saldosZerados: false,
    totalizarContasCompensacao: false,
    mascaraSaldosPorNaturezaConta: false,
    ignorarPosteriorDate: "",
    mascaraDeTotalizacao: "",
    periodoMeses: false,
    periodoTrimestres: false,
    periodoSemestres: false,
    periodoAnos: false
  },
  getters: {
    getNomePerfil(state) {
      return state.nomePerfil;
    },
    getMascaraDeTotalizacao(state) {
      return state.mascaraDeTotalizacao;
    },
    getHandlePerfilSelecionado(state) {
      return state.handlePerfilSelecionado;
    },
    isPerfilSistema(state) {
      return state.sistema;
    },
    isFieldChecked(state) {
      return nome  => {
        if (nome == "abertura")
          return state.abertura;
        else if (nome == "fechamentoGerencial")
          return state.fechamentoGerencial;
        else if (nome == "considerarLalur")
          return state.considerarLalur; 
        else if (nome == "antesZeramento")
          return state.antesZeramento;
        else if (nome == "completarEstrutura")
          return state.completarEstrutura;
        else if (nome == "mostrarReduzido")
          return state.mostrarReduzido; 
        else if (nome == "mostrarApelido")
          return state.mostrarApelido;
        else if (nome == "formatacaoDC")
          return state.formatacaoDC;
        else if (nome == "formatacaoParenteses")
          return state.formatacaoParenteses;
        else if (nome == "valoresEmMilhares")
          return state.valoresEmMilhares;
        else if (nome == "saldosZerados")
          return state.saldosZerados;
        else if (nome == "totalizarContasCompensacao")
          return state.totalizarContasCompensacao;
        else if (nome == "mascaraSaldosPorNaturezaConta")
          return state.mascaraSaldosPorNaturezaConta;   
        else if (nome == "ignorarPosteriorDate")
          return state.ignorarPosteriorDate;
        else if (nome == "saldoDiario")
          return state.saldoDiario;
        else if (nome == "periodoMeses")
          return state.periodoMeses;
        else if (nome == "periodoTrimestres")
          return state.periodoTrimestres;
        else if (nome == "periodoSemestres")
          return state.periodoSemestres;
        else if (nome == "periodoAnos")
          return state.periodoAnos;
      }
    },
    isPeriodoSelected(state) {
      return state.saldoDiario || state.periodoMeses || state.periodoTrimestres || state.periodoSemestres || state.periodoAnos;
    },
    isVisualFieldSelected(state) {
        return state.debitosCreditos || state.saldoMes;
    },
    isFormatacaoDC(state) {
        return state.formatacaoDC;
    },
    isValoresEmMilhares(state) {
        return state.valoresEmMilhares;
    },
    isPeriodoMeses(state) {
        return state.periodoMeses;
    },
    isPeriodoTrimestres(state) {
        return state.periodoTrimestres;
    },
    isPeriodoSemestres(state) {
        return state.periodoSemestres;
    },
    isPeriodoAnos(state) {
        return state.periodoAnos;
    },
    isFormatacaoParenteses(state) {
        return state.formatacaoParenteses;
    },
    isIgnorarPosteriorEnabled(state) {
      return state.antesZeramento;
    },
    getIgnorarPosteriorDate(state) {
      return moment(state.ignorarPosteriorDate);
    }
  },
  mutations: {
    setSistema(state, value) {
      state.sistema = value;
    }, 
    setNomePerfil(state, value) {
      state.nomePerfil = value;
    }, 
    setAntesZeramento(state) {
      state.antesZeramento = !state.antesZeramento;
      if (state.antesZeramento)
        state.ignorarPosteriorDate = moment(this.state.options.startDate, "DD/MM/YYYY").endOf('month')._d.format("dd/MM/yyyy");
    },
    setIgnorarPosteriorDate(state, payload) {
      state.ignorarPosteriorDate = payload.format("dd/MM/yyyy");
    },
    changeCamposFormatacao(state, payload) {
      if (payload.tipo === "texto")
        state[payload.nomeCampo] = payload.valor;

      if (payload.tipo === "toggle")
      {
        state[payload.nomeCampo] = !state[payload.nomeCampo];

        if (payload.nomeCampo === 'formatacaoDC' && state.formatacaoDC)
          state.formatacaoParenteses = false;

        if (payload.nomeCampo === 'formatacaoParenteses' && state.formatacaoParenteses)
          state.formatacaoDC = false;
      }
    },
    changeTipoBalancete(state, nome) {
      if (nome == 'abertura') {
        state.abertura = !state.abertura;

        if (state.abertura) {
          this.state.options.endDate = this.state.options.startDate;
          state.saldoAnteriorAtual = true;
          state.saldoDiario = false;
          state.periodoMeses = true;
          state.periodoTrimestres = false;
          state.periodoSemestres = false;
          state.periodoAnos = false;
          state.saldoDiario = false;
        }
      }
      if (nome == 'fechamentoGerencial')
        state.fechamentoGerencial = !state.fechamentoGerencial;
      if (nome == 'considerarLalur')
        state.considerarLalur = !state.considerarLalur;
      if (nome == 'antesZeramento')
        state.antesZeramento = !state.antesZeramento;
    },
    setHandlePerfilSelecionado(state, value) {
      state.handlePerfilSelecionado = Number(value);
    },
    setCampoVisual(state, nome) {
      if (nome == 'saldoAnteriorAtual') {
        state.saldoAnteriorAtual = !state.saldoAnteriorAtual;
        
        if (state.abertura)
          state.saldoAnteriorAtual = true;
      }
      else if (nome == 'debitosCreditos')
        state.debitosCreditos = !state.debitosCreditos;
      else if (nome == 'saldoMes')
        state.saldoMes = !state.saldoMes;
      else if (nome == 'moeda')
        state.moeda = !state.moeda;

      if (nome == 'saldoDiario') {
        state.saldoDiario = !state.saldoDiario;

        if (state.saldoDiario) {
          state.abertura = false;
          state.periodoMeses = false;
          state.periodoTrimestres = false;
          state.periodoSemestres = false;
          state.periodoAnos = false;
        }
      }
      else if (nome == 'periodoMeses') {
        state.periodoMeses = !state.periodoMeses;

        if (state.abertura)
          state.periodoMeses = true;

        if (state.periodoMeses){
          state.saldoDiario = false;
          state.periodoTrimestres = false;
          state.periodoSemestres = false;
          state.periodoAnos = false;
        }
      }  
      else if (nome == 'periodoTrimestres') {
        state.periodoTrimestres = !state.periodoTrimestres;

        if (state.abertura)
          state.periodoTrimestres = false;

        if (state.periodoTrimestres){
          state.saldoDiario = false;
          state.periodoMeses = false;
          state.periodoSemestres = false;
          state.periodoAnos = false;
        }
      }
      else if (nome == 'periodoSemestres') {
        state.periodoSemestres = !state.periodoSemestres;

        if (state.abertura)
          state.periodoSemestres = false;

        if (state.periodoSemestres){
          state.saldoDiario = false;
          state.periodoTrimestres = false;
          state.periodoMeses = false;
          state.periodoAnos = false;
        }
      }
      else if (nome == 'periodoAnos') {
        state.periodoAnos = !state.periodoAnos;

        if (state.abertura)
          state.periodoAnos = false;

        if (state.periodoAnos){
          state.saldoDiario = false;
          state.periodoTrimestres = false;
          state.periodoSemestres = false;
          state.periodoMeses = false;
        }
      }
    },
    loadPerfil(state, perfil){
      Object.assign(state, perfil);
    }
  }
}
//#endregion

//#region TREE_VIEW_STORE

function parseEmpresaFilialSelected(selected){
  var result = [];
  var empresas = _.filter(selected, function(p) { return p.split('-').length === 1 });
  var filiais = _.filter(selected, function(p) { return p.split('-').length > 1 });
      
  for(var filial in filiais){
      var f = filiais[filial];
      result.push(f);
      var empresafounded = _.filter(empresas, function(p) { return f.split('-')[0] === p });        
      if(empresafounded.length === 1){             
          var currentEmpresa = f.split('-')[0];
          var tmpR = _.find(result, function(p) { return p === currentEmpresa });
          if(tmpR === undefined){
              result.push(currentEmpresa);                    
          }
      }        
  }    
  return result;
}
function getChoice(choice) {
  if (choice === "CC") {
      return 0
  } else if (choice === "empresaFilial") {
      return 1;
  } else if (choice === "projetos") {
      return 2;
  } else if (choice === "contas") {
      return 3;
  }
}

function getCodigoCentroDeCusto(){
  return 0;
}

function getCodigoEmpresaFilial(){
  return 1;
}

function getCodigoProjetos(){
  return 2;
}

function getCodigoContas(){
  return 3;
}

function getEmpresaMestreFromSelected(element){
  return element.split('-')[0];
}

function isMultipliesEnterpriseSelecteds(state){        
  var colle = _.map(state.treeview_selecoes[getCodigoEmpresaFilial()].selected, getEmpresaMestreFromSelected)
  return _.uniq(colle).length > 1;     

}   

const treeview = {
  namespaced: true,
  state: { 
      regrasDeComparacaoDeEmpresaMestre: null,
      treeview_loaded: [
          { loaded : false },
          { loaded : false },
          { loaded : false },
          { loaded : false }
      ],    
      treeview_selecoes: [
          {
              id: "CC",
              tipo: "default",
              origem: 0,
              selected: [],
              data: []
          },
          {
              id: "empresaFilial",            
              tipo: "default",
              origem: 0,
              selected: [],
              data: []
          },
          {
              id: "projetos",
              tipo: "default",
              origem: 0,
              selected: [],
              data: []
          },
          {
              id: "contas",
              tipo: "default",
              origem: 0,
              selected: [],
              data: []
          }
      ]            
  },
  mutations: {        
      setEmpresasMestreRegras(state, payload){            
          state.regrasDeComparacaoDeEmpresaMestre = payload;
      },
      setFromPerfil(state, payload) {
        payload.map((selecao, index) => {
          for (var propriedade in selecao) {
            state.treeview_selecoes[index][propriedade] = selecao[propriedade];
          }
        });
      },
      setSelected(state, payload) {                                           
          if(getChoice(payload.choice) === getCodigoEmpresaFilial()){
              state.treeview_selecoes[getChoice(payload.choice)].selected = parseEmpresaFilialSelected(payload.selected);                
          } else {
              state.treeview_selecoes[getChoice(payload.choice)].selected = payload.selected;
          }                         
          if(isMultipliesEnterpriseSelecteds(state)){
              if(!state.regrasDeComparacaoDeEmpresaMestre.conta){
                  state.treeview_selecoes[getCodigoContas()].selected = [];
              }
              if(!state.regrasDeComparacaoDeEmpresaMestre.projeto){
                  state.treeview_selecoes[getCodigoProjetos()].selected = [];
              }
              if(!state.regrasDeComparacaoDeEmpresaMestre.centroDeCusto){
                  state.treeview_selecoes[getCodigoCentroDeCusto()].selected = [];
              }
          }

      },
      resetTreeView(state, payload){                        
          state.treeview_selecoes[getChoice(payload.choice)].selected = [];
      },
      setDefaultBranchAndCompany(state, payload){       
        var selection = Number(payload.branch) > 0 ? 
          String.format("{0}-{1}", payload.company, payload.branch) :
          payload.company;

        state.treeview_selecoes[getCodigoEmpresaFilial()].selected = [selection];
      },
      setOrigem(state, payload) {
          state.treeview_selecoes[getChoice(payload.choice)].origem = payload.origem;                        
      },
      setTipo(state, payload) {                        
          state.treeview_selecoes[getChoice(payload.choice)].tipo = payload.tipo;                                    
      },
      setData(state, payload) {                                    
          state.treeview_selecoes[getChoice(payload.choice)].data = payload.data;                                    
      },
      setLoad(state, payload) {            
          state.treeview_loaded[getChoice(payload.choice)].loaded = payload.loaded;
      }
  },
  getters: {        
      isContaMestreEnabled(state){            
          if(isMultipliesEnterpriseSelecteds(state)){
              return state.regrasDeComparacaoDeEmpresaMestre.conta;
          }
          return true;
      },                  
      isProjetoMestreEnabled(state){            
          if(isMultipliesEnterpriseSelecteds(state)){
              return state.regrasDeComparacaoDeEmpresaMestre.projeto;
          }
          return true;
      },
      isCCMestreEnabled(state){            
          if(isMultipliesEnterpriseSelecteds(state)){
              return state.regrasDeComparacaoDeEmpresaMestre.centroDeCusto;
          }
          return true;
      },
      isEmpresaSelected(state){            
          return state.treeview_selecoes[getCodigoEmpresaFilial()].selected.length > 0;
      },
      isAllTreeviewLoaded(state){            
          return (state.treeview_loaded[0].loaded && 
                  state.treeview_loaded[1].loaded && 
                  state.treeview_loaded[2].loaded && 
                  state.treeview_loaded[3].loaded);
      },
      isEmpresaTreeviewLoading(state){
          return !state.treeview_loaded[getCodigoEmpresaFilial()].loaded;
      },
      isContaTreeviewLoading(state){
          return !state.treeview_loaded[getCodigoContas()].loaded;
      },
      isCCTreeviewLoading(state){
          return !state.treeview_loaded[getCodigoCentroDeCusto()].loaded;
      },
      isProjetoTreeviewLoading(state){
          return !state.treeview_loaded[getCodigoProjetos()].loaded;
      },
      getContas(state){
          return state.treeview_selecoes[getCodigoContas()];
      },
      getProjetos(state){
          return state.treeview_selecoes[getCodigoProjetos()];
      },
      getCentroDeCustos(state){
          return state.treeview_selecoes[getCodigoCentroDeCusto()];
      },
      getEmpresaFilial(state){
          return state.treeview_selecoes[getCodigoEmpresaFilial()];
      },       
      getTotalSelectedContas(state){                    
          return state.treeview_selecoes[getCodigoContas()].selected.length;                        
      },
      getTotalSelectedProjetos(state){                    
          return state.treeview_selecoes[getCodigoProjetos()].selected.length;                        
      },
      getTotalSelectedCC(state){                    
          return state.treeview_selecoes[getCodigoCentroDeCusto()].selected.length;                        
      },
      getTotalSelectedEmpresaFilial(state){                    
          return state.treeview_selecoes[getCodigoEmpresaFilial()].selected.length;                        
      },        
      getTreeViewSelectStore(state){
          return state.treeview_selecoes;
      }        
  }
}

//#endregion

//#region PIVOT_GRID_STORE

const options = {
  namespaced: true,
  state : {
      startDate: "",
      endDate: ""
  },
  mutations: {
    setStartDate(state, payload) {
      var novaDataInicial = payload.format("dd/MM/yyyy");
      state.startDate = novaDataInicial;
      this.state.filtro.ignorarPosteriorDate = moment(novaDataInicial, "DD/MM/YYYY").endOf('month')._d.format("dd/MM/yyyy");
      if (this.state.filtro.abertura)
        state.endDate = novaDataInicial;
    },
    setEndDate(state, payload) {
      state.endDate = payload.format("dd/MM/yyyy");
    }
  }
}

const pivotgrid = {
  namespaced: true,
  state: {
      dataset: null,
      error: null,
      messagePanel: {
        type: "",
        message: "",
        title: ""
      }
  },
  mutations: {
    beginRequest(state) {

    },
    endRequestSuccess(state, payload) {
      //console.log(payload);
      state.dataset = payload;          
    },
    endRequestError(state, payload) {
      state.error = payload;
    },
    setMessagePanel(state, payload) {
      state.messagePanel = payload;
    },
    clearMessagePanel(state) {
      state.messagePanel = {type: "", message: "", title: ""};    
    }
  }
}

//#endregion

//#region PARAMETROS_STORE

const parametros = {
  namespaced: true,
  state: {
      dataset: {
        balanceteDiario: false
      }
  },
  getters:{
    isBalanceteDiario(state) {
      if (state.dataset)
        return state.dataset.balanceteDiario;
      else
        return false;
    }
  },
  mutations: {
      setParametros(state, payload) {
        state.dataset.balanceteDiario = payload.balanceteDiario;
      }
  }
}

//#endregion

import VuexPersist from 'vuex-persist';

const vuexLocalStorage = new VuexPersist({
  key: 'balancete-contabil', // The key to store the state on in the storage provider.
  reducer: (state) => ({ filtro: state.filtro, treeview: state.treeview, options: state.options }),
  storage: window.localStorage, // or window.sessionStorage or localForage
  // Function that passes the state and returns the state with only the objects you want to store.
  // reducer: state => state,
  // Function that passes a mutation and lets you decide if it should update the state in localStorage.
  // filter: mutation => (true)
})

const BalanceteStore = new window.Vuex.Store({
  modules: {
    parametros: parametros,
    filtro: filtro,
    treeview: treeview,
    pivotgrid: pivotgrid,
    options: options
  },
  plugins: [vuexLocalStorage.plugin]
});

export default BalanceteStore;
