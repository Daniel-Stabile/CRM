<template>
  <div>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('fluxo')"
      v-on:click="filterSelected('fluxo')"
    >
      <i class="fa fa-money"></i> Fluxo
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('prorrogado')"
      v-on:click="filterSelected('prorrogado')"
    >
      <i class="fa fa-money"></i> Prorrogado
    </a>
    <transition-group name="slide-fade">
      <a
        v-if="isSaldoCompensadoEnabled()"
        key="saldoCompensadoEnabled"
        href="javascript:;"
        class="btn"
        v-bind:class="getClass('exibirSaldoCompensado')"
        v-on:click="filterSelected('exibirSaldoCompensado')"
      >
        <i class="fa fa-money"></i> Saldo Compensado
      </a>
      <a
        v-if="isIgnorarCompensadoEnabled()"
        key="ignorarCompensadoEnabled"
        href="javascript:;"
        class="btn"
        v-bind:class="getClass('ignorarCompensado')"
        v-on:click="filterSelected('ignorarCompensado')"
      >
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
      if (value == "fluxo") {
        return this.$store.state.filtro.vencimento.fluxo;
      } else if (value == "prorrogado") {
        return this.$store.state.filtro.vencimento.prorrogado;
      } else if (value == "exibirSaldoCompensado") {
        return this.$store.state.filtro.baixa.exibirSaldoCompensado;
      } else if (value == "ignorarCompensado") {
        return this.$store.state.filtro.baixa.ignorarCompensado;
      }
    },
    filterSelected: function(value) {
      var isToConfirm = true;
      if (isToConfirm) {
        this.$store.commit("filtro/changeAbragencia", value);
      }
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