import http from "./Http";

export default {
  getTileData: function(payload) {
    return http.post("api/tributos/dashboard/tile", payload);
  },
  getDash: function(payload) {
    return http.post("api/tributos/dashboard/obterDashboard", payload);
  }
};
