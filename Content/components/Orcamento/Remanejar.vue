<template>
  <div>
    <div class="col-md-12">
      <div style="float: right; margin: 10px -15px 10px  10px;">
        <a id="CMD_RATEIO" @click="ratear()" class="btn command-action custom-action green">
          <i class="fa fa-calculator btn-action"></i>
          Ratear valores
        </a>
        <a
          v-show="this.qtdOrigem == this.qtdDestino"
          id="CMD_RATEIO"
          @click="umPraUm()"
          class="btn command-action custom-action green-meadow"
        >
          <i class="fa fa-arrows-h btn-action"></i>
          Um pra Um
        </a>
        <a id="CMD_REMANEJAR" @click="remanejar()" class="btn command-action custom-action blue">
          <i class="fa fa-exchange btn-action"></i>
          Salvar remanejamento
        </a>
      </div>
    </div>
    <div class="col-md-6" style="border-right: 1px solid #dae2ea; margin-right: -1px;">
      <orcamento-remanejar-grid
        titulo="Origem"
        labelValorTotal="Total remanejado"
        :valorTotal="origemTotalRemanejado"
        :rows="obterOrigens()"
        :desabilitarOrcadoNegativo="true"
        :key="PegarChave()"
      />
    </div>
    <div class="col-md-6" style="border-left: 1px solid #dae2ea">
      <orcamento-remanejar-grid
        titulo="Destino"
        :labelValorTotal="destinoLabelTotalRemanejado"
        :classValorTotal="destinoClassTotalRemanejado"
        :valorTotal="destinoTotalRemanejado"
        :rows="obterDestinos()"
        :key="PegarChave()"
        :validarMaximo="false"
      />
    </div>
  </div>
</template>

<script>
import { delimiter, parse } from "path";
import { debug } from "util";
import { parseNumber } from "devextreme/localization";
export default {
  data() {
    return {
      qtdOrigem: 0,
      qtdDestino: 0,
      destinoClassTotalRemanejado: "",
      destinoLabelTotalRemanejado: ""
    };
  },
  computed: {
    remanejamentos: function() {
      return this.$store.state.orcamentoRemanejar.remanejamentos;
    },
    filtro: function() {
      return this.$store.state.orcamentoRemanejar.filtro;
    },
    origemTotalRemanejado: function() {
      return this.calcularTotalOrigem();
    },
    destinoTotalRemanejado: function() {
      var origemTotal = parseFloat(this.calcularTotalOrigem().toFixed(2));
      var destinoTotal = parseFloat(this.calcularTotalDestino().toFixed(2));
      if (origemTotal !== destinoTotal) {
        this.destinoClassTotalRemanejado = "badge badge-danger";
      } else {
        this.destinoClassTotalRemanejado = "badge badge-primary";
      }

      if (destinoTotal > origemTotal) {
        this.destinoLabelTotalRemanejado = "Ultrapassou";
      } else if (destinoTotal < origemTotal) {
        this.destinoLabelTotalRemanejado = "Falta remanejar";
      } else {
        this.destinoLabelTotalRemanejado = "Valores remanejados";
      }

      return Math.abs(origemTotal - destinoTotal);
    }
  },
  methods: {
    obterOrigens() {
      var total = this.remanejamentos.filter(x => x.Fields.TIPO === "O");
      this.qtdOrigem = total.length;
      return total;
    },
    obterDestinos() {
      var total = this.remanejamentos.filter(x => x.Fields.TIPO === "D");
      this.qtdDestino = total.length;
      return total;
    },
    calcularTotalOrigem() {
      return this.obterOrigens()
        .map(item => item.Fields.REMANEJAR)
        .reduce((prev, curr) => prev + curr, 0);
    },
    calcularTotalDestino() {
      return this.obterDestinos()
        .map(item => item.Fields.REMANEJAR)
        .reduce((prev, curr) => prev + curr, 0);
    },
    calculaResto(valorBase, valorRateado, quantidade) {
      return valorBase - valorRateado * quantidade;
    },
    ratear() {
      var totalOrigem = this.calcularTotalOrigem();
      var qtdCompetenciaDestino = this.obterDestinos().length;
      var novoValorRateado = (totalOrigem / qtdCompetenciaDestino).toFixed(2);

      var resto = this.calculaResto(
        totalOrigem,
        novoValorRateado,
        qtdCompetenciaDestino
      );
      var valorComResto = Number((Number(novoValorRateado) + resto).toFixed(2));

      this.obterDestinos().forEach((el, index) => {
        if (index == 0) el.Fields.REMANEJAR = parseFloat(valorComResto);
        else el.Fields.REMANEJAR = parseFloat(novoValorRateado);
      });
    },
    umPraUm() {
      var rm = this.$store.state.orcamentoRemanejar.remanejamentos;
      var index = 0;
      this.obterOrigens().forEach(el => {
        this.obterDestinos()[index].Fields.REMANEJAR = el.Fields.REMANEJAR;
        index++;
      });
    },
    ValidaRemanejamento() {
      var origem = FormatMoney(this.calcularTotalDestino())
        .replace("R$ ", "")
        .replace(".", "");
      var destino = FormatMoney(this.calcularTotalOrigem())
        .replace("R$ ", "")
        .replace(".", "");
      return origem === destino;
    },
    remanejar() {
      if (this.ValidaRemanejamento()) {
        App.blockUI({ target: "#ContentPanel", animate: true });
        this.$store.dispatch("orcamentoRemanejar/remanejar", {
          remanejamentos: this.remanejamentos,
          filtro: this.filtro
        });
      } else {
        toastr.error("Falta remanejar valores!", "Atenção", "");
      }
    },
    PegarChave() {
      if (localStorage.chaveRemanejamento)
        return parseInt(localStorage.chaveRemanejamento);

      localStorage.chaveRemanejamento = 1;
      return this.PegarChave();
    }
  }
};
</script>