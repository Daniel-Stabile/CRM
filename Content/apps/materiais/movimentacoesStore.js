import Http from "../../js/Http";

const dadosMovimentacoes = {
  namespaced: true,
  state: {
    dados: [],
    lotes: [],
    controlaLote: false,
  },
  mutations: {
    setDadosMovimentacoes(state, payload) {
      var dados = JSON.parse(payload);

      state.dados = dados.Movimentacoes;
      state.lotes = dados.Lotes;
      state.controlaLote = dados.ControlaLote;
    },
  },
};

const MovimentacoesStore = new window.Vuex.Store({
  modules: {
    dadosMovimentacoes: dadosMovimentacoes,
  },
  actions: {
    loadMovimentacoesStore: ({ commit }, payload) => {
      Http.post("api/materiais/consultas/movimentacoesEstoque", payload)
        .then((resultado) => {
          commit("dadosMovimentacoes/setDadosMovimentacoes", resultado.body);
          movimentacoesDataGrid = new window.Vue({
            el: "#movimentacoesGrid",
            store: Benner.Corporativo.Materiais.MovimentacoesStore,
          });
        })
        .catch((erro) => {
          console.log(erro);
        });
    },
  },
});

export default MovimentacoesStore;
