import Vue from "vue";
const store = {
  namespaced: true,
  state: {
    remanejamentos: [],
    filtro: {}
  },
  actions: {
    async remanejar({ commit }, remanejamentos) {
      await Vue.http
        .post("api/orcamento/remanejar/", remanejamentos)
        .then(r => {
          App.unblockUI("#ContentPanel");
          $('a[href="#tab_15_2"]').click();
          Benner.Page.DESTINO.refresh();
          Benner.Page.ORIGEM.refresh();
        })
        .catch((e) => {
          App.unblockUI("#ContentPanel");
          ExibirMensagem(e.body.Message, TiposMensagem.Erro, $('.tabbable-line'));
        });
    }
  }
};

const OrcamentoRemanejar = new window.Vuex.Store({
  modules: {
    orcamentoRemanejar: store
  }
});
export default OrcamentoRemanejar;
