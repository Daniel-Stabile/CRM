//#region FILTRO_STORE
const filtro = {
    namespaced: true,
    state: {
        origemRealizado: 0,
        tipoOrcamento: 0,
        dataRealizadoFinanceiro: 0,
        formulaSaldo: 0,
        percentuais: 0,
        consideraComprometido: false,
        versaoOrcamento: 0
    },
    getters: {
        getJson: state => {
            return state;
        }
    },
    mutations: {   
        selectOrigemRealizado(state, payload) {
            if(payload === 0){
                state.consideraComprometido = true;
            }

            if (payload !== state.origemRealizado) {
                state.tipoOrcamento = 0;
                state.origemRealizado = payload;
            }            
        },
        selectTipoOrcamento(state, payload) {
            state.tipoOrcamento = payload;
        },
        selectDataRealizadoFinanceiro(state, payload) {
            state.dataRealizadoFinanceiro = payload;
        },
        selectFormulaSaldo(state, payload) {
            state.formulaSaldo = payload;
        },
        selectPercentuais(state, payload) {
            state.percentuais = payload;
        },
        selectConsideraComprometido(state) {
            state.consideraComprometido = !state.consideraComprometido;
        },
        setVersaoOrcamento(state, payload) {
            state.versaoOrcamento = payload;
        }
    },
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
    } else if (choice === "acoesProjetos") {
        return 4;
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

function getCodigoAcoesProjetos(){
    return 4;
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
            { loaded : false },
            { loaded : true }
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
            },
            {
                id: "acoesProjetos",
                tipo: "default",
                origem: 0,
                selected: [],
                data: {
                    "count": 0,
                    "items": []
                }
            }
        ]            
    },
    mutations: {        
        setEmpresasMestreRegras(state, payload){            
            state.regrasDeComparacaoDeEmpresaMestre = payload;
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
                    state.treeview_loaded[3].loaded &&
                    state.treeview_loaded[4].loaded);
        },
        isEmpresaTreeviewLoading(state){
            return !state.treeview_loaded[getCodigoEmpresaFilial()].loaded;
        },
        isAcoesProjetosTreeViewLoading(state){
            return !state.treeview_loaded[getCodigoAcoesProjetos()].loaded;
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
        getTotalSelectedAcoesProjetos(state){                    
            return state.treeview_selecoes[getCodigoAcoesProjetos()].selected.length;                        
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
        maxDate: "",
        minDate: "",
        startDate: "",
        endDate: "",
    },
    mutations: {
        setMaxDate(state, payload) {
            state.maxDate = payload.format("dd/MM/yyyy");
        },
        setMinDate(state, payload) {
            state.minDate = payload.format("dd/MM/yyyy");
        },
        setStartDate(state, payload) {
            state.startDate = payload.format("dd/MM/yyyy");
        },
        setEndDate(state, payload){
            state.endDate = payload.format("dd/MM/yyyy");
        }
    }
}

const pivotgrid = {
    namespaced: true,
    state: {
        dataset: null,
        error: null
    },
    mutations: {
        beginRequest(state) {

        },
        endRequestSuccess(state, payload) {
            state.dataset = payload;
        },
        endRequestError(state, payload) {
            state.error = payload;
        }
    }
}

const analiticoModule = {
    state:{
        analiticoDataSource: Object
    },
    mutations:{
        SET_DATA(state, params){
            state.analiticoDataSource = params;
        }
    },
    methods:{
        prepareData: (data) =>{
            return {                
                getData: this.getData(data),
                getColumns: this.getColumns(data)
            };
        },
        getData: (data) => {
            return data.Data;    
        },
        getColumns: (data) => {
            var result = [];
            
            if(data.Data.length <= 0)
                return result;

            var keys = Object.keys(data.Data[0]);    
        
            var urlToRedirect = data.Link;

            if(keys.length > 0)
                keys.forEach(key =>  {   
                    if (urlToRedirect !== "" || urlToRedirect !== undefined)
                        result.push({
                            data: key,
                            title: data.Headers[key],
                            render: (data, type, row, meta) => '<a href="' + urlToRedirect + '">data</a>'
                        });
                    else
                        result.push({
                            data: key,
                            title: data.Headers[key]
                        });
                });    
        
           return result;     
        }
    },
    actions:{       
       getDataAnaliticos({commit}, params){ 
           var url = "api/orcamento/obterAnalitico";
           Vue.http.post(url, params)
               .then(result => commit('SET_DATA', this.prepareData(result)))
               .catch(error => console.log(error));                  
       }
    }
}

//#endregion

const vuexLocalStorage = new window.VuexPersist({
    key: 'orcamento-consulta',
    reducer: (state) => ({ filtro: state.filtro, treeview: state.treeview, options: state.options }),
    storage: window.localStorage
});

const store = new window.Vuex.Store({
    modules: {
        filtro: filtro,
        treeview: treeview,
        pivotgrid: pivotgrid,
        options: options,
        analitico: analiticoModule        
    },
    plugins: [vuexLocalStorage.plugin]
});

var app = new window.Vue({
    el: '#app',
    store
});
