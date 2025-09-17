import http from "./Http";

export default {
    getParametrosContabil: function () {
        return http.get('api/contabil/balancete/parametros')
    },
    getGerenciaisPivotGrid: function (data, endpoint) {
        return http.post('api/contabil/balancete/pivotgrid', data)
    },
    getSituacaoEmpresaMestre: function() {
        return http.get("api/financeiro/gerenciais/situacaoEmpresaMestre");
    },
    postPerfilBalancete: function (data) {
        return http.post('api/contabil/balancete/postPerfilBalancete', data)
    },
    deletePerfilBalancete: function (handle) {
        return http.post('api/contabil/balancete/deletePerfilBalancete/' + handle)
    },
    getPerfilBalancete: function (handle) {
        return http.get('api/contabil/balancete/getPerfilBalancete/' + handle)
    }
}