//#region DEFAULT_VALUES
function setDefaultValues(state) {
    this.setDefaultAbrangencia(state);
    this.setDefaultAbrangenciaAvancado(state);
    this.setDefaultTitulo(state);
    this.setDefaultBaixa(state);
    this.setDefaultVencimento(state);
}

function setDefaultBaixa(state) {
    state.baixa.dataBaixaAdto = false;
    state.baixa.tesourariaPorVencimento = false;
    state.baixa.exibirTesouraria = false;
    setDefaultDevolucaoAdiantamento(state);
}

function setDefaultDevolucaoAdiantamento(state){
    state.baixa.exibirSaldoCompensado = false;
    state.baixa.ignorarCompensado = false;
}

function setDefaultVencimento(state) {
    state.vencimento.fluxo = false;
    state.vencimento.prorrogado = false;
    setDefaultDevolucaoAdiantamento(state);
}

function setDefaultTitulo(state) {
    state.titulo.acrescimosDimBaixaDireta = false;
    state.titulo.acrescimosDimTesouraria = false;
    state.titulo.suspensos = false;
    state.titulo.alocacaoFinanceira = false;
    state.titulo.baixaAdto = false;
    state.titulo.emAberto = false;
    state.titulo.priorizados = false;
    state.titulo.chkPrevisoesFirmeza = false;
    state.titulo.previsaoFirmeza = 0    
}

function setDefaultAbrangencia(state) {
    state.abrangencia.tesourariaAVista = false;
    state.abrangencia.titulo = false;
    state.abrangencia.adiantamentos = false;
    state.abrangencia.devolucoes = false;
}

function setDefaultAbrangenciaAvancado(state) {
    state.filtroAvancado.abrangencia.fiscal = false;
    state.filtroAvancado.abrangencia.financeiro = true
    state.filtroAvancado.abrangencia.ordemVenda = false;
    state.filtroAvancado.abrangencia.emprestimo = false;
    state.filtroAvancado.abrangencia.emprestimoPessoal = false;
    state.filtroAvancado.abrangencia.contratosCorrigidos = false;
    state.filtroAvancado.abrangencia.estoque = false;
    state.filtroAvancado.abrangencia.ordemCompra = false;
    state.filtroAvancado.abrangencia.contratos = false;
    state.filtroAvancado.abrangencia.aplicacao = false;
    state.filtroAvancado.abrangencia.contratoCompra = false;
}

function getDefaultTipoCalculo(){
    return getFornecedoreClienteTipoCalculo();
}

function getTipoDocumentoDefault(){
    return getTipoDocumentoEmissao();
}
//#endregion

//#region FILTER_RULES
function isSetDefaultTipoDocumentoAndChildrens(state){
    return !(state.abrangencia.tesourariaAVista ||
            state.abrangencia.titulo ||
            state.abrangencia.adiantamentos ||
            state.abrangencia.devolucoes);
}

function RuleFirstDegreeFilterFields(state){
    if(isSetDefaultTipoDocumentoAndChildrens(state)){
        setDefaultBaixa(state);
        setDefaultVencimento(state);         
    }
}

function TesourariaAVistaRuleFiltroTipo(state){
    if( !(state.abrangencia.titulo ||
            state.abrangencia.adiantamentos ||
            state.abrangencia.devolucoes)) {
                if(state.tipoDocumento === getTipoDocumentoBaixa()
                || state.tipoDocumento === getTipoDocumentoRealizacao()){
                    state.tipoDocumento = getTipoDocumentoEmissao();
                    setDefaultBaixa(state);
                    setDefaultVencimento(state);
            }
    }    
}

function isToDisableSaldoCompensado(state){
    return !(state.abrangencia.devolucoes || state.abrangencia.adiantamentos);
}

//#endregion

//#region ENUMS
function isTipoBaixa(payload){
    return payload === 1;
}
function isTipoVencimento(payload){
    return payload === 2;
}

function getFornecedoreClienteTipoCalculo(){
    return 1;
}
function getClienteTipoCalculo(){
    return 2;
}
function getFornecedorTipoCalculo(){
    return 3;
} 
function getTesourariaTipoCalculo(){
    return 4;
}




function getTipoDocumentoBaixa(){
    return 1;
}

function getTipoDocumentoVencimento(){
    return 2;
}

function getTipoDocumentoRealizacao() {
    return 3;
}

function getTipoDocumentoEmissao(){
    return 4;
}

//#endregion

//#region FILTRO_STORE
const filtro = {
    namespaced: true,
    state: {
        nomePerfil: "",
        sistema: false,
        handlePerfilSelecionado: 0,
        tipoCalculo: getDefaultTipoCalculo(),
        tipoDocumento: getTipoDocumentoDefault(),
        analitico: false,        
        documentoEmAberto: false,
        exibirLancamentosSemCcInformado: false,
        exibirLancamentosSemProjetoInformado: false,
        abrangencia: {
            tesourariaAVista: false,
            titulo: true,
            analitico: false,
            adiantamentos: false,
            devolucoes: false
        },
        filtroAvancado: {
            pessoas: [],
            tiposDocumento: [],
            tiposCobranca: [],
            abrangencia: {
                fiscal: false,
                financeiro: false,
                ordemVenda: false,
                emprestimo: false,
                emprestimoPessoal: false,
                contratosCorrigidos: false,
                estoque: false,
                ordemCompra: false,
                contratos: false,
                aplicacao: false,
                contratoCompra: false
            },
            categoriasCliente: [],
            categoriasFornecedor: [],
            formasPagamento: []
        },
        titulo: {
            acrescimosDimTesouraria: false,
            suspensos: false,
            acrescimosDimBaixaDireta: false,
            alocacaoFinanceira: false,
            baixaAdto: false,
            chkPrevisoesFirmeza: false,
            previsaoFirmeza: 0,
            emAberto: false,
            priorizados: false
        },
        baixa: {
            dataBaixaAdto: false,
            tesourariaPorVencimento: false,
            exibirTesouraria: false,
            exibirSaldoCompensado: false,
            ignorarCompensado: false
        },
        vencimento: {
            fluxo: false,
            prorrogado: false
        }

    },
    getters: {
        getNomePerfil(state) {
            return state.nomePerfil;
        },
        getHandlePerfilSelecionado(state) {
            return state.handlePerfilSelecionado;
        },
        isPerfilSistema(state) {
            return state.sistema;
        },
        isBaixaDisabled: state => {
            return state.tipoDocumento !== getTipoDocumentoBaixa();
        },
        isEmAbertoEnabled: state => {            
            var result = (!state.abrangencia.tesourariaAVista)
                && (state.abrangencia.adiantamentos
                    || state.abrangencia.titulo
                    || state.abrangencia.devolucoes)
                    && state.tipoDocumento !== getTipoDocumentoBaixa();
            if (!result) {
                state.documentoEmAberto = false;
            }
            return result;
        },
        isTipoCalculoEnabled : state => {
            return state.tipoCalculo === state.tipoCalculo;
        },
        isFiltroTituloEnabled: state => {
            return state.abrangencia.titulo;
        },
        isFiltroCategoriaEnabled: state => {
            return (state.abrangencia.titulo ||
                state.abrangencia.tesourariaAVista ||
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos ||
                state.tipoCalculo === getTesourariaTipoCalculo());
        },
        isTesourariaAVistaEnabled: state => {
            return state.tipoCalculo === getFornecedoreClienteTipoCalculo();
        },
        isFiltroTipoPagarOuReceber: state => {
            return state.tipoCalculo !== getTesourariaTipoCalculo();
        },
        isToShowVencimento: state => {
            return state.abrangencia.tesourariaAVista ||
                state.tipoCalculo === getTesourariaTipoCalculo() ||
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos ||
                state.abrangencia.titulo;
        },
        isToShowBaixa: state => {
            return state.abrangencia.titulo ||
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos;
        },
        isToShowRealizacao: state => {
            return state.abrangencia.titulo ||
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos;
        },
        isToShowEmissao: state => {
            return state.abrangencia.tesourariaAVista ||
                state.tipoCalculo === getTesourariaTipoCalculo() ||
                state.abrangencia.titulo ||
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos;
        },
        isAbrangenciaEnabled: state => {
            return state.tipoCalculo !== getTesourariaTipoCalculo();
        },
        isTituloPriorizadoEnabled: state => {
            return state.tipoCalculo === getFornecedorTipoCalculo() || state.tipoCalculo === getFornecedoreClienteTipoCalculo();
        },
        isSaldoCompensadoEnabled: state => {
            return state.abrangencia.adiantamentos
                || state.abrangencia.devolucoes;
        },
        isIgnorarCompensadoEnabled: state => {
            return state.abrangencia.adiantamentos
                || state.abrangencia.devolucoes;
        },
        isToShowBaixaDetails: state => {
            return (state.tipoDocumento === getTipoDocumentoBaixa()) && (
                state.abrangencia.devolucoes ||
                state.abrangencia.adiantamentos ||
                state.abrangencia.titulo);
        },
        isAplicarEnabled: state => {            
            var r = true;
            if(state.tipoCalculo !== getTesourariaTipoCalculo()){
                r =( state.abrangencia.tesourariaAVista 
                    || state.abrangencia.titulo 
                    || state.abrangencia.devolucoes 
                    || state.abrangencia.adiantamentos);
            } 
            return r;            
        },
        getJson: state => {
            return state;
        },
        isClientesFornecedoresOrCliente: state => {
            return state.tipoCalculo === getFornecedoreClienteTipoCalculo() || state.tipoCalculo === getClienteTipoCalculo();
        }
    },
    mutations: {   
        setSistema(state, value) {
            state.sistema = value;
        },
        setNomePerfil(state, value) {
            state.nomePerfil = value;
        },
        setHandlePerfilSelecionado(state, value) {
            state.handlePerfilSelecionado = Number(value);
        },
        loadPerfil(state, perfil){
            Object.assign(state, perfil);
        },  
        setTipoCalculo(state, payload) {
            if (payload !== state.tipoCalculo) {
                setDefaultValues(state);
                state.abrangencia.titulo = false;
                state.abrangencia.devolucoes = false;
                state.abrangencia.adiantamentos = false;

                state.tipoCalculo = payload;
            }            
        },
        setPessoaHandleSelecionados(state, value) {
            state.filtroAvancado.pessoas = value;
        },
        setTipoDocumentoHandleSelecionados(state, value) {
            state.filtroAvancado.tiposDocumento = value;
        },
        setTipoCobrancaHandleSelecionados(state, value) {
            state.filtroAvancado.tiposCobranca = value;
        },
        setCategoriaClienteHandleSelecionados(state, value) {
            state.filtroAvancado.categoriasCliente = value;
        },
        setCategoriaFornecedorHandleSelecionados(state, value) {
            state.filtroAvancado.categoriasFornecedor = value;
        },
        setFormaPagamentoHandleSelecionados(state, value) {
            state.filtroAvancado.formasPagamento = value;
        },
        changeDocumentoEmAberto(state) {
            state.documentoEmAberto = !state.documentoEmAberto;
        },
        changeExibirLancamentosSemCcInformado(state) {
            state.exibirLancamentosSemCcInformado = !state.exibirLancamentosSemCcInformado;
        },
        changeExibirLancamentosSemProjetoInformado(state) {
            state.exibirLancamentosSemProjetoInformado = !state.exibirLancamentosSemProjetoInformado;
        },
        setTipoDocumento(state, payload) {
            if(isTipoBaixa(state.tipoDocumento)) {
                setDefaultBaixa(state);
            } else if (isTipoVencimento(state.tipoDocumento)) {
                setDefaultVencimento(state);
                state.vencimento.fluxo = true;
            }
            state.tipoDocumento = payload;
        },
        changeAnalitico(state) {
            state.analitico = !state.analitico;
        },
        changeAbrangencia(state, filter) {
            if (filter === "tesourariaAVista") {
                state.abrangencia.tesourariaAVista = !state.abrangencia.tesourariaAVista;
                if (state.abrangencia.tesourariaAVista) {
                    state.titulo.emAberto = false;
                }
                RuleFirstDegreeFilterFields(state);
                TesourariaAVistaRuleFiltroTipo(state);
            } else if (filter === "titulo") {
                if (state.abrangencia.titulo) {
                    setDefaultTitulo(state);
                }
                state.abrangencia.titulo = !state.abrangencia.titulo;

                if (state.abrangencia.devolucoes)
                    state.abrangencia.titulo = true;

                RuleFirstDegreeFilterFields(state);
                TesourariaAVistaRuleFiltroTipo(state);
            } else if (filter === "analitico") {
                state.abrangencia.analitico = !state.abrangencia.analitico;
            } else if (filter === "devolucoes") {
                state.abrangencia.devolucoes = !state.abrangencia.devolucoes;
                if (isToDisableSaldoCompensado(state)) {
                    setDefaultDevolucaoAdiantamento(state);
                }
                RuleFirstDegreeFilterFields(state);
                TesourariaAVistaRuleFiltroTipo(state);

                if (state.abrangencia.devolucoes)
                    state.abrangencia.titulo = true;
            } else if (filter === "adiantamentos") {
                state.abrangencia.adiantamentos = !state.abrangencia.adiantamentos;
                if (isToDisableSaldoCompensado(state)) {
                    setDefaultDevolucaoAdiantamento(state);
                }
                RuleFirstDegreeFilterFields(state);
                TesourariaAVistaRuleFiltroTipo(state);
            } else if (filter === "dataBaixaAdto") {
                state.baixa.dataBaixaAdto = !state.baixa.dataBaixaAdto;
            } else if (filter === "tesourariaPorVencimento") {
                state.baixa.tesourariaPorVencimento = !state.baixa.tesourariaPorVencimento;
            } else if (filter === "exibirTesouraria") {
                state.baixa.exibirTesouraria = !state.baixa.exibirTesouraria;
            } else if (filter === "exibirSaldoCompensado") {
                state.baixa.exibirSaldoCompensado = !state.baixa.exibirSaldoCompensado;
                if (state.baixa.ignorarCompensado) {
                    state.baixa.ignorarCompensado = false;
                }
            } else if (filter === "fluxo") {                
                state.vencimento.fluxo = !state.vencimento.fluxo;                
                if(state.vencimento.prorrogado && state.vencimento.fluxo){
                    state.vencimento.prorrogado = false;
                }                
            } else if (filter === "prorrogado") {
                state.vencimento.prorrogado = !state.vencimento.prorrogado;                
                if(state.vencimento.prorrogado && state.vencimento.fluxo){
                    state.vencimento.fluxo = false;
                }                
            } else if (filter === "ignorarCompensado") {
                state.baixa.ignorarCompensado = !state.baixa.ignorarCompensado;
                if (state.baixa.exibirSaldoCompensado) {
                    state.baixa.exibirSaldoCompensado = false;
                }
            }
        },
        changeAbrangenciaAvancado(state, filter) {
            if (filter === "fiscal") {
                state.filtroAvancado.abrangencia.fiscal = !state.filtroAvancado.abrangencia.fiscal;
            } else if (filter === "financeiro") {
                state.filtroAvancado.abrangencia.financeiro = !state.filtroAvancado.abrangencia.financeiro;
            } else if (filter === "ordemVenda") {
                state.filtroAvancado.abrangencia.ordemVenda = !state.filtroAvancado.abrangencia.ordemVenda;
            } else if (filter === "emprestimo") {
                state.filtroAvancado.abrangencia.emprestimo = !state.filtroAvancado.abrangencia.emprestimo;
            } else if (filter === "emprestimoPessoal") {
                state.filtroAvancado.abrangencia.emprestimoPessoal = !state.filtroAvancado.abrangencia.emprestimoPessoal;
            } else if (filter === "contratosCorrigidos") {
                state.filtroAvancado.abrangencia.contratosCorrigidos = !state.filtroAvancado.abrangencia.contratosCorrigidos;
            } else if (filter === "estoque") {
                state.filtroAvancado.abrangencia.estoque = !state.filtroAvancado.abrangencia.estoque;
            } else if (filter === "ordemCompra") {
                state.filtroAvancado.abrangencia.ordemCompra = !state.filtroAvancado.abrangencia.ordemCompra;
            } else if (filter === "contratos") {
                state.filtroAvancado.abrangencia.contratos = !state.filtroAvancado.abrangencia.contratos;
            } else if (filter === "aplicacao") {
                state.filtroAvancado.abrangencia.aplicacao = !state.filtroAvancado.abrangencia.aplicacao;
            } else if (filter === "contratoCompra") {
                state.filtroAvancado.abrangencia.contratoCompra = !state.filtroAvancado.abrangencia.contratoCompra;
            }
        },
        setChkPrevisoesFirmeza(state, payload){
            state.titulo.chkPrevisoesFirmeza = payload;
        },        
        setPrevisaoFirmeza(state, payload) {
            state.titulo.previsaoFirmeza = parseInt(payload, 10);            
        },
        changeTitulo(state, field) {
            if (field === "acrescimosDimTesouraria") {
                state.titulo.acrescimosDimTesouraria = !state.titulo.acrescimosDimTesouraria;
            } else if (field === "suspensos") {
                state.titulo.suspensos = !state.titulo.suspensos;
            } else if (field === "acrescimosDimBaixaDireta") {
                state.titulo.acrescimosDimBaixaDireta = !state.titulo.acrescimosDimBaixaDireta;
            } else if (field === "alocacaoFinanceira") {
                state.titulo.alocacaoFinanceira = !state.titulo.alocacaoFinanceira;
            } else if (field === "baixaAdto") {
                state.titulo.baixaAdto = !state.titulo.baixaAdto;
            } else if (field === "emAberto") {
                state.titulo.emAberto = !state.titulo.emAberto;
            } else if (field === "priorizados") {
                state.titulo.priorizados = !state.titulo.priorizados;
            } else if (field === "chkPrevisoesFirmeza") {
                state.titulo.chkPrevisoesFirmeza = !state.titulo.chkPrevisoesFirmeza;
            }
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
    } else if (choice === "contas") {
        return 2;
    }
}

function getCodigoCentroDeCusto(){
    return 0;
}

function getCodigoEmpresaFilial(){
    return 1;
}

function getCodigoContas(){
    return 2;
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
                id: "contas",
                tipo: "default",
                origem: 0,
                selected: [],
                data: []
            }
        ]            
    },
    mutations: {
        setDefaultBranchAndCompany(state, payload){       
            var selection = Number(payload.branch) > 0 ? 
                String.format("{0}-{1}", payload.company, payload.branch) :
                payload.company;
    
            state.treeview_selecoes[getCodigoEmpresaFilial()].selected = [selection];
        },   
        setFromPerfil(state, payload) {
            payload.map((selecao, index) => {
                for (var propriedade in selecao) {
                    state.treeview_selecoes[index][propriedade] = selecao[propriedade];
                }
            });
        },   
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
                    state.treeview_loaded[2].loaded);
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
        getContas(state){
            return state.treeview_selecoes[getCodigoContas()];
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
        endDate: "",
    },
    mutations: {
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
        dataSetAnaliticoLancamentos: null,
        dataSetAnaliticoCcs: null,
        parametrosUltimaGeracao: null,
        error: null
    },
    mutations: {
        beginRequest(state) {

        },
        endRequestSuccess(state, payload) {
            state.dataset = payload.dataSet;
            state.dataSetAnaliticoLancamentos = payload.dataSetAnaliticoLancamentos;
            state.dataSetAnaliticoCcs = payload.dataSetAnaliticoCcs;
            state.parametrosUltimaGeracao = payload.parametros;
        },
        endRequestError(state, payload) {
            state.error = payload;
        }
    }
}

//#endregion

const vuexLocalStorage = new window.VuexPersist({
    key: 'financeiro-gerenciais',
    reducer: (state) => ({ filtro: state.filtro, treeview: state.treeview, options: state.options }),
    storage: window.localStorage
});

const store = new window.Vuex.Store({
    modules: {
        filtro: filtro,
        treeview: treeview,
        pivotgrid: pivotgrid,
        options: options
    },
    plugins: [vuexLocalStorage.plugin]
});

var app = new window.Vue({
    el: '#app',
    store
});