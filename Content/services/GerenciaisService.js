import http from "./Http";

export default {
    getGerenciaisPivotGrid: function (data) {
        return http.post('./api/financeiro/gerenciais/pivotgrid', data)
    },
    getGerenciaisAnaliticoDataGrid: function (data) {
        return http.post('./api/financeiro/gerenciais/analiticoDataGrid', data)
    },
    getSituacaoEmpresaMestre: function() {
        return http.get("./api/financeiro/gerenciais/situacaoEmpresaMestre");
    },
    postPerfilGerenciais: function (data) {
        return http.post('./api/financeiro/gerenciais/postPerfilGerenciais', data)
    },
    deletePerfilGerenciais: function (handle) {
        return http.post('./api/financeiro/gerenciais/deletePerfilGerenciais/' + handle)
    },
    getPerfilGerenciais: function (handle) {
        return http.get('./api/financeiro/gerenciais/getPerfilGerenciais/' + handle)
    }
}