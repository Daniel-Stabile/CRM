<template>
    <div>
        <a href="javascript:;"
           class="btn"
           v-bind:class="getClass('dataBaixaAdto')"
           v-on:click="filterSelected('dataBaixaAdto')">
            <i class="fa fa-calendar-plus-o"></i> Usar data baixa adto.
        </a>
        <a href="javascript:;"
           class="btn"
           v-bind:class="getClass('tesourariaPorVencimento')"
           v-on:click="filterSelected('tesourariaPorVencimento')">
            <i class="fa fa-calendar-times-o"></i> Baixas de Tesouraria por vencimento
        </a>
        <a href="javascript:;"
           class="btn"
           v-bind:class="getClass('exibirTesouraria')"
           v-on:click="filterSelected('exibirTesouraria')">
            <i class="fa fa-money"></i> Lançamento tesouraria
        </a>
        <transition-group name="slide-fade">
            <a v-if="isSaldoCompensadoEnabled()"
               key="saldoCompensado1"
               href="javascript:;"
               class="btn"
               v-bind:class="getClass('exibirSaldoCompensado')"
               v-on:click="filterSelected('exibirSaldoCompensado')">
                <i class="fa fa-money"></i> Saldo Compensado
            </a>
            <a v-if="isIgnorarCompensadoEnabled()"
               key="ignorarCompensado"
               href="javascript:;"
               class="btn"
               v-bind:class="getClass('ignorarCompensado')"
               v-on:click="filterSelected('ignorarCompensado')">
                <i class="fa fa-money"></i> Ignorar compensado
            </a>
        </transition-group>
    </div>
</template>
<script>
export default {
  props: ["button", "colorSelected", "colorDeselected"],
  methods: {
    isSaldoCompensadoEnabled() {
      return this.$store.getters["filtro/isSaldoCompensadoEnabled"];
    },
    isIgnorarCompensadoEnabled() {
      return this.$store.getters["filtro/isIgnorarCompensadoEnabled"];
    },
    isButtonCircle() {
      return this.button == "circle";
    },
    isButtonSelected(value) {
      if (value == "dataBaixaAdto") {
        return this.$store.state.filtro.baixa.dataBaixaAdto;
      } else if (value == "tesourariaPorVencimento") {
        return this.$store.state.filtro.baixa.tesourariaPorVencimento;
      } else if (value == "exibirTesouraria") {
          return this.$store.state.filtro.baixa.exibirTesouraria;
      } else if (value == "exibirSaldoCompensado") {
        return this.$store.state.filtro.baixa.exibirSaldoCompensado;
      } else if (value == "ignorarCompensado") {
        return this.$store.state.filtro.baixa.ignorarCompensado;
      }
    },
    filterSelected: function(value) {
      this.$store.commit("filtro/changeAbragencia", value);
    },
    getClass(nome) {
      return {
        [this.colorSelected]: this.isButtonSelected(nome),
        [this.colorDeselected]: !this.isButtonSelected(nome),
        "btn-circle": this.isButtonCircle()
      };
    }
  }
};
</script>