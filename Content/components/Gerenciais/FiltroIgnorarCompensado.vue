<template>
  <div>
    <transition name="slide-fade">
      <a
        v-if="isIgnorarCompensadoEnabled()"
        key="ignorarCompensado"
        href="javascript:;"
        class="btn"
        v-bind:class="getClass('ignorarCompensado')"
        v-on:click="filterSelected('ignorarCompensado')"
      >
        <i class="fa fa-money"></i> Ignorar compensado
      </a>
    </transition>
  </div>
</template>
<script>
export default {
  props: ["button", "colorSelected", "colorDeselected"],
  methods: {
    isIgnorarCompensadoEnabled() {
      return this.$store.getters["filtro/isIgnorarCompensadoEnabled"];
    },
    isButtonCircle() {
      return this.button == "circle";
    },
    isButtonSelected(value) {
      if (value == "ignorarCompensado") {
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