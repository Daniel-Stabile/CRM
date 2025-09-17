<template>
  <div class="portlet light">
    <div class="row">
      <div class="col-md-8">
        <label
          id="labelColeta"
          style="width: 100%;text-align: right;padding: 9px 0px;font-size: 13px;font-weight: 600"
        >{{obterMensagemColeta()}}</label>
      </div>
      <div class="col-md-2">
        <a v-show="PermitirColetar()"
           id="btnColetar"
          class="btn btn-block btn-primary"           
          :disabled="ColetaPendente()"
          v-on:click="novaColeta()"          
        >Coletar</a>
      </div>
      <div class="col-md-2">
        <div class="form-group">
          <div class="input-group">
            <input
              v-model="dataComp"
              autocomplete="off"
              class="aga-date datepicker form-control"
              data-name="Competencia"
              type="text"
              data-type="date"
              data-clear-btn="true"
              maxlength="7"
              placeholder="mm/aaaa"
              data-date-format="mm/yyyy"
              data-date-min-view-mode="months"
              data-date-start-view="year"
              id="inputCompetencia"
              v-on:change="competenciaChange($event)"
            >
            <span class="input-group-btn">
              <button class="btn btn-default btn-sm" type="button">
                <i class="fa fa-calendar"></i>
              </button>
            </span>
          </div>
        </div>
      </div>
    </div>
    <div class="row">
      <div v-show="!this.dashInfo.existeColeta"
        style="font-size: 40px; position: absolute; top: 50%; width: 80%; left: 12%; z-index: 999; text-align: center;"
      >
        <label>{{obterMensagemSemColeta()}}</label>
      </div>
      <div v-bind:style="desabilitar()">
        <div class="col-md-6 col-lg-3">
          <ui-tile-dashboard-comercial
            id="NotasFiscais"
            title="Notas fiscais"
            color-title="gray"
            :value-field="dashInfo.valueFieldNotasFiscais"
            :percentage="dashInfo.percetageNotasFiscais"
            color-value-field=" #2ab4c0 !important"
            icon-main="fa fa-database"
            color-icon-main="#2ab4c0"
            color-icon-search="gray"
            :link="dashInfo.linkDetalhesFaturado"/>
        </div>
        <div class="col-md-6 col-lg-3">
          <ui-tile-dashboard-comercial
            id="ValorFaturado"
            title="Valor faturado"
            color-title="gray"
            :value-field="dashInfo.valueFieldFaturado"
            :percentage="dashInfo.percetageFaturado"
            color-value-field=" #5C9BD1 !important"
            icon-main="fa fa-bank"
            color-icon-main="#5C9BD1"
            color-icon-search="gray"
            is-money
            :link="dashInfo.linkDetalhesFaturado"/>
        </div>
        <div class="col-md-6 col-lg-3">
          <ui-tile-dashboard-comercial
            id="TicketMedio"
            title="Ticket médio"
            color-title="gray"
            :value-field="dashInfo.valueFieldTicket"
            :percentage="dashInfo.percetageTicket"
            color-value-field=" #8877a9 !important"
            icon-main="fa fa-money"
            color-icon-main="#8877a9"
            color-icon-search="gray"
            is-money
            :link="dashInfo.linkDetalhesFaturado"/>
        </div>
        <div class="col-md-6 col-lg-3" id="appFaltaFaturar">
          <ui-tile-dashboard-comercial
            id="FaltaFaturar"
            title="Falta faturar"
            color-title="gray"
            ref="faltaFaturar"
            :value-field="dashInfo.valueFieldFaltaFaturar"
            color-value-field="rgb(214, 77, 77)"
            icon-main="fa fa-calculator"
            color-icon-main="rgb(214, 77, 77)"
            color-icon-search="gray"
            is-money
            visibility-perc="hidden"
            :link="dashInfo.linkDetalhesFaltaFaturar"/>
        </div>
        <div class="col-md-12">
          <div class="portlet solid bordered grey-cararra">
            <div class="portlet-title">
              <div class="caption">
                <i class="fa fa-spin fa-cog"></i>
                Carregando...
              </div>
            </div>
            <div class="portlet-body">
              <div
                id="grafico1"
                class="chart"
                style="width: 100%; height: 400px; background-color: #FFFFFF;"
              ></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
import datepicker from "~/content/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker";

export default {
  props: ["dataCompetencia", "permiteColetar", "linkFaturado"], 
  data: function() {
    return {
      dashInfo: this.$store.state.dashboardComercial,
      dataComp: this.dataCompetencia,
      btnColetarTxt: ""
    };
  },
  methods: {
    PermitirColetar(){
      return this.permiteColetar === 'True';
    },
    desabilitar() {
      if (this.dashInfo.existeColeta) return "";
      return {
        pointerEvents: "none",
        opacity: "0.3"
      };
    },
    ColetaPendente() {
      if (this.dashInfo.existeColetaPendente) {
        var dataColetaPendente = new Date(
          this.dashInfo.dataColetaPendente
        ).getTime();
        var dataLimite = new Date().setMinutes(new Date().getMinutes() - 20);
        return dataColetaPendente >= dataLimite;
      } else return false;
    },
    obterMensagemColeta() {
      var retorno = "";
      if (this.dashInfo.existeColeta) {
        retorno =
          "Útilma coleta realizada: " +
          moment(String(this.dashInfo.dataColeta)).format(
            "DD/MM/YYYY HH:mm:ss"
          );
        if (this.ColetaPendente())
          retorno += ". Estamos coletando as informações, aguarde.";
      }
      return retorno;
    },
    obterMensagemSemColeta() {
      var retorno = "";
      debugger
      if (!this.dashInfo.existeColeta) {
        retorno = "Sem coleta para exibir.";
        if (this.ColetaPendente())
          retorno += " Estamos coletando as informações, aguarde.";
        else if(this.PermitirColetar()){
          retorno += " Efetue nova coleta.";
        }
      }
      return retorno;
    },
    existeColeta() {
      return this.dashInfo.existeColeta;
    },
    loadDashboard() {
      this.$store.dispatch("dashboardComercial/getDash", {
        dataCompetencia: this.dataComp.replace("/", "-")
      });
    },
    novaColeta() {
      if (!this.ColetaPendente()) {
        App.blockUI({ target: "#ContentPanel", animate: true });
        this.$store.dispatch("dashboardComercial/novaColeta", {
          dataCompetencia: this.dataComp.replace("/", "-")
        });
      }
    },
    competenciaChange: function(event) {
      this.dataComp = event.target.value;
      this.loadDashboard();
    }
  },
  mounted: function() {
    this.loadDashboard();
    $(".datepicker").on("select", this.competenciaChange);
  }
};
</script>