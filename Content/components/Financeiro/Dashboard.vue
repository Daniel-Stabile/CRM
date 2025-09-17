<template>
  <div class="portlet light">
    <div class="row">
      <ui-dashboard-header
        titulo="Dashboard"
        subtitulo="financeiro"
        :dataComp="dataComp"
        :permiteColetar="permiteColetar"
        :desabilitaColeta="utils.ColetaPendente(dashInfo.existeColetaPendente, dashInfo.dataColetaPendente)"
        :mensagemColeta="utils.obterMensagemColeta(dashInfo)"
        v-on:coletarClick="coletar()"
        v-on:competenciaChanged="competenciaChanged" />
    </div>
      <div style="font-size: 40px; position: absolute; top: 50%; width: 80%; left: 12%; z-index: 999; text-align: center;">
        <label>{{utils.obterMensagemSemColeta(dashInfo,permiteColetar)}}</label>
      </div>
    <div v-bind:style="utils.desabilitarPaginaDash(dashInfo.existeColeta)">
      <div class="row">
        <div class="col-lg-4 col-xs12 col-sm-12" id="divConciliacaoBancaria">
          <ui-dashboard-charts-with-info             
            v-on:exportar="exportarConciliacao()"
            :infos="dashInfo.infoConciliacao" 
            title="Conciliação bancária" 
            idGrafico="conciliacao"  
            heightChart="26vh"  />
        </div>
        <div class="col-lg-8 col-xs-12 col-sm-12" id="divPgtosXRcbtos">
          <ui-dashboard-charts idGrafico="pgtosXRecbtos" heightChart="28vh" />
        </div>
      </div>
      <div class="row">
        <div class="col-lg-6 col-xs-12 col-sm-12" id="divAgingCRE">
          <ui-dashboard-charts idGrafico="agingCRE" heightChart="28vh" />
        </div>
        <div class="col-lg-6 col-xs-12 col-sm-12" id="divAgingCPA">
          <ui-dashboard-charts idGrafico="agingCPA" heightChart="28vh" />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import utilsDash from '../../apps/Dashboard/Utils.js'
  export default {
    props: {
      dataCompetencia : {
        default: ""
      },
      permiteColetar: {
        type: Boolean,
        default: false
      }
    },
    data: function() {
      return {
        dataComp: this.dataCompetencia,
        dashInfo: this.$store.state.dashboardFinanceiro,
        utils: utilsDash
      };
    },
    methods: {
      loadDashboard() {
        this.$store.dispatch("dashboardFinanceiro/getDash", {
          dataCompetencia: this.dataComp.replace("/", "-")
        });
      },
      coletar() {
        if (!this.utils.ColetaPendente(this.dashInfo.existeColetaPendente, this.dashInfo.dataColetaPendente)) {
          App.blockUI({ target: "#ContentPanel", animate: true });
          this.$store.dispatch("dashboardFinanceiro/novaColeta", {
            dataCompetencia: this.dataComp.replace("/", "-")
          });
        }
      },
      exportarConciliacao() {
        App.blockUI({ target: "#ContentPanel", animate: true });
        this.$store.dispatch("dashboardFinanceiro/exportarConciliacao", {
            dataCompetencia: this.dataComp.replace("/", "-")
        });
      },
      competenciaChanged(args) {
        this.dataComp = args.data;
        this.loadDashboard();
      }
    },
    mounted: function() {
      this.loadDashboard();
    }
  };


</script>