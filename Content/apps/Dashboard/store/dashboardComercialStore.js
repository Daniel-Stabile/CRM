import Vue from 'vue';
function coletaMock(){
  var obj = new Object();
  obj["XNames"]= ["04/2018","05/2018","06/2018","07/2018","08/2018","09/2018",
                  "10/2018","11/2018","12/2018","01/2019","02/2019","03/2019"];
  var series1 = new Object();
  series1["Name"] = "Notas fiscais"
  series1["Color"] = "#2ab4c0";
  series1["Values"]= ["10","11","14","10","11","15",
                      "10","11","14","10","11","15"];
  series1["IsCurrency"]= "false";

  var series2 = new Object();
  series2["Name"] = "Valor faturado"
  series2["Color"] = "#5C9BD1";
  series2["Values"]= ["17000","28000","30000","25000","23000","26000",
                      "18500","21000","19680","27000","23000","25000"];
  series2["IsCurrency"]= "true";

  var series3 = new Object();
  series3["Name"] = "Ticket médio"
  series3["Color"] = "#5C9BD1";
  series3["Values"]= ["150","120","100","150","120","100",
                      "150","120","100","150","120","100"];
  series2["IsCurrency"]= "true";

  obj["Series"] = [series1,series2,series3];
  obj["RotacaoCategoria"] = 0;
  obj["AssumeCurrencyBySerie"] = true;
  obj["ChartType"] = "multiline";
  obj["Title"] = "Últimos 12 meses";
  obj["LabelName"] = "Mês";
  obj["ValueName"] = "";
  obj["IsCurrency"] = false;
  obj["Decimais"] = 0;
  obj["ImgClass"] = "fa fa-bar-chart-o";
  obj["TitleClass"] = "";
  obj["Precision"] = 2;
  obj["DecimalSeparator"] = ",";
  obj["ThousandsSeparator"] = ".";
  obj["Export"] = true;
  obj["Param"] = 0;
  obj["EntityPermissionNeeded"] = "";
  obj["Summary"] = "";
  return obj;
}
const store = {
    namespaced: true,
    state: {
      existeColeta: false,
      dataColeta: Date.now(),
      existeColetaPendente: false,
      dataColetaPendente: Date.now(),
      valueFieldNotasFiscais: 0,
      percetageNotasFiscais: 0,
      valueFieldFaturado: 0,
      percetageFaturado: 0,
      valueFieldTicket: 0,
      percetageTicket: 0,
      valueFieldFaltaFaturar: 0,
      linkDetalhesFaturado: "",
      linkDetalhesFaltaFaturar: "",
      ultimasColetas: []
    },
    mutations: {
      SEM_COLETA(state){
        state.existeColeta = false;
        state.existeColetaPendente = false;
        state.valueFieldNotasFiscais = 0;
        state.percetageNotasFiscais = 0;
        state.valueFieldFaturado =0;
        state.percetageFaturado = 0;
        state.valueFieldTicket = 0;
        state.percetageTicket = 0;
        state.valueFieldFaltaFaturar = 0;
        state.linkDetalhesFaturado = "";
        state.linkDetalhesFaltaFaturar = "";
        state.ultimasColetas = [];
      },
      GET_DASH(state, payload) {
          state.existeColeta = payload.existeColeta;
          state.existeColetaPendente = payload.existeColetaPendente;
          state.dataColeta = payload.dataColeta;
          state.dataColetaPendente = payload.dataColetaPendente;
          state.valueFieldNotasFiscais = payload.qtdNotasFiscais;
          state.percetageNotasFiscais = payload.percNotas;
          state.valueFieldFaturado = payload.valorFaturado;
          state.percetageFaturado = payload.percFaturado;
          state.valueFieldTicket = payload.valorTicketMedio;
          state.percetageTicket = payload.percTicketMedio;
          state.valueFieldFaltaFaturar = payload.valorFaltaFaturar;
          state.linkDetalhesFaturado = payload.linkDetalhesFaturado;
          state.linkDetalhesFaltaFaturar = payload.linkDetalhesFaltaFaturar;
          state.ultimasColetas = payload.ultimasColetas;
      }
    },
    actions: {
      getDash: ({commit}, payload) => {
        var url = 'api/comercial/obterDashboard/';
        Vue.http.get(url + payload.dataCompetencia)
        .then(r =>{
          if(r.body != "")
            commit('GET_DASH', r.body);
          else
            commit('SEM_COLETA');
          
          if(r.body.ultimasColetas == undefined)
            AtualizaDashBoardCharts(coletaMock());
          else
            AtualizaDashBoardCharts(r.body.ultimasColetas);

        }).catch(e=>{
          console.log(e);
        })
      },
      async novaColeta({commit}, payload) {
        var url = 'api/comercial/novaColeta/';
        await Vue.http.get(url + payload.dataCompetencia)
              .then(r =>{          
                location.href = "inicio.aspx?competencia="+payload.dataCompetencia;
              }).catch(e=>{
                console.log(e);
              })
      }
    }
}
const DashboardComercial = new window.Vuex.Store({
    modules: {
      dashboardComercial: store
    }
})

export default DashboardComercial;
