<template>
  <div class="portlet light">
    <div class="row">
      <div class="col-md-8 col-md-offset-4">
        <label
          id="labelColeta"
          style="width: 100%;text-align: right;padding: 9px 0px;font-size: 13px;font-weight: 600"
        >{{obterMensagemColeta()}}</label>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <div
          id="msgcoleta"
          class="col-md-12"
          v-show="!this.dashInfo.existeColeta || this.dashInfo.existeColetaPendente"
          style="font-size: 40px; z-index: 999; text-align: center"
        >
          <label>{{obterMensagemSemColeta()}}</label>
        </div>
      </div>
    </div>

    <div class="row">
      <div v-bind:style="desabilitar()">
        <div id="tilesContent">
          <div class="col-md-6 col-lg-3" v-for="tile of this.dashInfo.taxTiles" :key="tile.name">
            <ui-tile
              id="tileICMS"
              :title="tile.name"
              color-title="gray"
              :description="tile.coverDescription"
              :value-field="tile.coverValue"
              :color-theme="obterCorFonteTile(tile.result)"
              icon-main="fa fa-balance-scale"
              color-icon-search="gray"
              align="right"
              is-money
              visibility-perc="hidden"
              :additional-desc-value="tile.data"
              :link="tile.linkDetalhes"
            />
          </div>
        </div>
        <div class="col-md-12">
          <tributos-ui-calendar
            icon="fa fa-calendar"
            :title="dashInfo.calendarTitle"
            :events="dashInfo.eventos"
            @bc-date-change="mesSelecionado = $event"
          />
        </div>
      </div>
    </div>
  </div>
</template>
<script>
//import datepicker from "~/content/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker";
import _ from "lodash";

$.fn.center = function(below) {
  this.css(
    "top",
    ($(window).height() - this.height()) / 2 +
      $(window).scrollTop() -
      (below ? 60 : 0) +
      "px "
  );
  if (!below)
    this.css(
      "left",
      ($(window).width() - this.width()) / 2 +
        $(window).scrollLeft() -
        20 +
        "px"
    );
  return this;
};

export default {
  props: ["dataCompetencia", "permiteColetar", "linkFaturado"],
  data: function() {
    return {
      dashInfo: this.$store.state.dashboardTributos,
      dataComp: this.dataCompetencia,
      btnColetarTxt: "",
      mesSelecionado: new Date().getMonth()
    };
  },
  watch: {
    mesSelecionado: _.debounce(function(newVal) {
      this.loadDashboard(this.mesSelecionado);
    }, 1000)
  },
  methods: {
    obterCorFonteTile(value) {
      if (value > 0) return "font-green-meadow";
      else if (value < 0) return "font-red";
      else return "font-purple-sharp";
    },
    desabilitar() {
      if (this.dashInfo.existeColeta) return "";
      //return "";
      return {
        pointerEvents: "none",
        opacity: "0.3"
      };
    },
    ColetaPendente() {
      console.log(this.dashInfo.existeColetaPendente);
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
      if (!this.dashInfo.existeColeta) {
        retorno = "Sem dados para exibir.";
        if (this.ColetaPendente())
          retorno += " Estamos coletando as informações, aguarde.";
      } else if (this.dashInfo.atualizando) {
        retorno = "Atualizando as informações, aguarde.";
      }
      return retorno;
    },
    existeColeta() {
      return this.dashInfo.existeColeta;
    },
    loadDashboard(mes) {
      if (!this.ColetaPendente()) {
        App.blockUI({
          target: "#ContentPanel",
          animate: true
        });

        // isso é para centralizar a mensagem (que nós controlamos) e o blockui (que não controlamos)
        $(".blockUI.blockMsg").center();
        $("#msgcoleta").center(true);

        this.dashInfo.existeColetaPendente = true;
        this.dashInfo.atualizando = true;

        var data = mes
          ? moment()
              .month(mes)
              .format("YYYY-MM-DD")
          : moment().format("YYYY-MM-DD");
        this.$store.dispatch("dashboardTributos/getDash", {
          date: data
        });
      }
    },
    competenciaChange: function(event) {
      this.dataComp = event.target.value;
      this.loadDashboard();
    }
  },
  mounted: function() {
    //$(".datepicker").on("select", this.competenciaChange);
    this.loadDashboard();
  }
};
</script>