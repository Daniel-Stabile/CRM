import Http from "../../js/Http";

const dadosSaldos = {
  namespaced: true,
  state: {
    dados: [],
  },
  mutations: {
    setDadosSaldos(state, payload) {
      state.dados = JSON.parse(payload);
    },
  },
};

const SaldosStore = new window.Vuex.Store({
  modules: {
    dadosSaldos: dadosSaldos,
  },
  actions: {
    loadSaldosStore: ({ commit }, payload) => {
      Http.post("api/materiais/consultas/saldosEstoque", payload)
        .then((resultado) => {
          commit("dadosSaldos/setDadosSaldos", resultado.body);

          saldosPivotGrid = new window.Vue({
            el: "#saldosGrid",
            store: Benner.Corporativo.Materiais.SaldosStore,
          });
        })
        .catch((erro) => {
          console.log(erro);
        });
    },
  },
});

export default SaldosStore;
