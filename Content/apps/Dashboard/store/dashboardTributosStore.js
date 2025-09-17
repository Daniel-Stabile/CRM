import DashboardService from "../../../services/DashboardTributosService";

const store = {
  namespaced: true,
  state: {
    existeColeta: false,
    dataColeta: Date.now(),
    existeColetaPendente: false,
    atualizando: false,
    dataColetaPendente: Date.now(),
    eventos: [],
    calendarTitle: "Carregando...",
    taxTiles: [
      {
        name: "ICMS",
        coverDescription: "Saldo zerado",
        coverValue: 0.0,
        result: 0
      },
      {
        name: "PIS",
        coverDescription: "Saldo zerado",
        coverValue: 0.0,
        result: 0
      },
      {
        name: "COFINS",
        coverDescription: "Saldo zerado",
        coverValue: 0.0,
        result: 0
      },
      {
        name: "IPI",
        coverDescription: "Saldo zerado",
        coverValue: 0.0,
        result: 0
      }
    ]
  },
  mutations: {
    SEM_COLETA_TRIBUTOS(state) {
      state.existeColeta = false;
      state.existeColetaPendente = false;
      state.atualizando = false;
      state.calendarTitle = "Obrigações legais - sem dados para exibir";
      state.eventos = [];
    },
    GET_DASH_TRIBUTOS(state, payload) {
      state.existeColeta = true;
      state.existeColetaPendente = false;
      state.atualizando = false;
      state.dataColeta = payload.dataColeta;
      state.dataColetaPendente = payload.dataColetaPendente;
      state.taxTiles = payload.taxTiles;
      state.eventos = payload.eventos;
      state.calendarTitle = "Obrigações legais";
    }
  },
  actions: {
    getDash: ({ commit }, payload) => {
      DashboardService.getDash(payload)
        .then(response => {
          console.log(response);
          App.unblockUI("#ContentPanel");

          if (response.body != "") commit("GET_DASH_TRIBUTOS", response.data);
          else commit("SEM_COLETA_TRIBUTOS");
        })
        .catch(e => {
          console.log(e);
        });
    }
  }
};
const DashboardTributos = new window.Vuex.Store({
  modules: {
    dashboardTributos: store
  }
});

export default DashboardTributos;
