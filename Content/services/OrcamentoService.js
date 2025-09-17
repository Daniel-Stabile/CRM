import http from "./Http";

export default {
    getOrcamentoConsultaPivotGrid: function (data) {
        return http.post('./api/orcamento/consultar/pivotgrid', data)
    },
    getOrcamentoConsultaPlano: function (origem, handleOrcamento) {
        return http.get("./api/financeiro/gerenciais/codigoPlano/" + origem + "/" + handleOrcamento)
    },
    getSituacaoEmpresaMestre: function() {
        return http.get("./api/financeiro/gerenciais/situacaoEmpresaMestre");
        //return http.get("./api/orcamento/consultar/situacaoEmpresaMestre");
    },
    getAcaoProjetoEhVisivel: function(){
        return http.get("./api/orcamento/consultar/acaoProjetoEhVisivel");
    }
}