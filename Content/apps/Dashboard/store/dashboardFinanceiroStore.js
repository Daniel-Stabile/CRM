import Vue from 'vue';

const store = {
    namespaced: true,
    state: {
        existeColeta: false,
        existeColetaPendente: false,
        dataColeta: Date.now(),
        dataColetaPendente: Date.now(),
        chartPgtosXRecbtos: [],
        chartAgingCRE: [],
        chartAgingCPA: [],
        infoConciliacao: []
    },
    mutations: {
        GET_DASH(state, payload) {
            state.existeColeta = payload.existeColeta;
            state.existeColetaPendente = payload.existeColetaPendente;
            state.dataColeta = payload.dataColeta;
            state.dataColetaPendente = payload.dataColetaPendente;
            state.chartPgtosXRecbtos = payload.chartPgtosXRecbtos;
            state.chartAgingCRE = payload.chartAgingCRE;
            state.chartAgingCPA = payload.chartAgingCPA;
            state.infoConciliacao = payload.infoConciliacao;
        },
        SEM_COLETA(state) {
            state.existeColeta = true;
            state.existeColetaPendente = false;
            state.chartPgtosXRecbtos = [];
            state.chartAgingCRE = [];
            state.chartAgingCPA = [];
            state.infoConciliacao = [];
        }
    },
    methods: {
        AtualizaDashboardFinanceiro(){
            
        }
    },
    actions: {
        async getDash({commit}, payload) {
          var url = 'api/financeiro/obterDashboard/';
          
          App.blockUI({ target: "#ContentPanel", animate: true });
          await Vue.http.get(url + payload.dataCompetencia)
                .then(r =>{
                  if(r.body != "")
                    commit('GET_DASH', r.body);
                  else
                    commit('SEM_COLETA');
                    AtualizaChartConciliacao(r.body.chartConciliacao);
                    AtualizaChartPgtosXRecbtos(r.body.chartPgtosXRecbtos);
                    AtualizaChartAgingCRE(r.body.chartAgingCRE);
                    AtualizaChartAgingCPA(r.body.chartAgingCPA);
                }).catch(e=>{
                  console.log(e);
                });
          App.unblockUI("#ContentPanel");
        },
        async novaColeta({commit}, payload) {
          var url = 'api/financeiro/novaColeta/';
          await Vue.http.get(url + payload.dataCompetencia)
                .then(r =>{          
                  location.href = "inicio.aspx?competencia="+payload.dataCompetencia;
                }).catch(e=>{
                  console.log(e);
                });
          App.unblockUI("#ContentPanel");
        },
        async exportarConciliacao({commit}, payload) {
          var url = 'api/financeiro/exportarInfoConciliacaoBancaria/';
          await Vue.http.get(url + payload.dataCompetencia)
                .then(r =>{          
                  location.href = "inicio.aspx?competencia="+payload.dataCompetencia;
                }).catch(e=>{
                  console.log(e);
                });
          App.unblockUI("#ContentPanel");
        }
      }
}

const DashboardFinanceiro = new window.Vuex.Store({
    modules: {
      dashboardFinanceiro: store
    }
})
function AtualizaChartPgtosXRecbtos(data) {
  $('#pgtosXRecbtos').each(function () {
      ErpPlotChartBarTwoBarStackedWithFormatedValues(this, data);
  });
}
function AtualizaChartAgingCRE(data) {
  $('#agingCRE').each(function () {
      ErpPlotChartTwoBar(this, data);
  });
}
function AtualizaChartAgingCPA(data) {
  $('#agingCPA').each(function () {
      ErpPlotChartTwoBar(this, data);
  });
}
function AtualizaChartConciliacao(data) {
  $('#conciliacao').each(function () {
      ErpPlotChartPizza(this, data);
  });
}
export default DashboardFinanceiro;