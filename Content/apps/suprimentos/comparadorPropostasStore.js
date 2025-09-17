import VuexPersist from 'vuex-persist';

const vuexLocalStorage = new VuexPersist({
    key: 'comparador-propostas',    
    storage: window.localStorage,
})

const ComparadorPropostasStore = new window.Vuex.Store({
    state: {
        propostas: {
            informacoesFinanceiras: [],
            produtos: [],
            fornecedores: [],
            totalizadores: []
        }
    },
    mutations: {
        setDadosComparadorProposta(state, payload) {
            Object.assign(state, payload);
        }
    },   
    plugins: [vuexLocalStorage.plugin]
});

export default ComparadorPropostasStore;