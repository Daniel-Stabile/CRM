import http from "./Http";

export default {
    getTreeViewData: function (entityName) {
        return http.get('api/treeview/' + entityName);
    },
    getTreeViewCargaInicial: function (data) {
        return http.post('api/mtreeview/cargainicial', data);
    },
    getTreeViewCargaDependencia: function (data) {
        return http.post('api/mtreeview/cargadependencia', data);
    },
    getTreeViewLink: function (data) {
        return http.post('api/mtreeview/link', data);
    },
    filterTreeView: function(data) {
        return http.post('api/mtreeview/search', data);
    }
}