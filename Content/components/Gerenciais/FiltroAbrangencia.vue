<template>
    <div>
        <hr />
        <div>
            <transition-group name="slide-fade">
                <div key="mustHaveKeySubAbrangencia"
                     v-bind:class="{'note' : isFilterNotSelected, 'note-danger': isFilterNotSelected}">
                    <a v-if="isFiltroTipoPagarOuReceber()"
                       href="javascript:;"
                       class="btn"
                       key="pagaReceber1"
                       v-bind:class="getClass('titulo')"
                       v-on:click="filterSelected('titulo')">
                        <i class="fa fa-pencil"></i> Título
                    </a>
                    <a v-if="isFiltroTipoPagarOuReceber()"
                       href="javascript:;"
                       class="btn"
                       key="pagaReceber2"
                       v-bind:class="getClass('devolucoes')"
                       v-on:click="filterSelected('devolucoes')">
                        <i class="fa fa-truck"></i> Devoluções
                    </a>
                    <a v-if="isFiltroTipoPagarOuReceber()"
                       href="javascript:;"
                       class="btn"
                       key="pagaReceber3"
                       v-bind:class="getClass('adiantamentos')"
                       v-on:click="filterSelected('adiantamentos')">
                        <i class="fa fa-calendar-check-o"></i> Adiantamentos
                    </a>
                    <a v-if="isTesourariaEnabled()"
                       href="javascript:;"
                       class="btn"
                       key="pagaReceber4"
                       v-bind:class="getClass('tesourariaAVista')"
                       v-on:click="filterSelected('tesourariaAVista')">
                        <i class="fa fa-scissors"></i> Tesouraria à vista
                    </a>
                </div>
            </transition-group>
        </div>
        <hr />
    </div>
</template>
<script>
export default {
  props: ["button", "colorDeselected", "colorSelected", "isFilterNotSelected"],
  methods: {
    isButtonCircle() {
      return this.button == "circle";
    },
    isTesourariaEnabled() {
      return this.$store.getters["filtro/isTesourariaAVistaEnabled"];
    },
    isFiltroTipoPagarOuReceber() {
      return this.$store.getters["filtro/isFiltroTipoPagarOuReceber"];
    },
    isButtonSelected(value) {
      if (value === "tesourariaAVista") {
        return this.$store.state.filtro.abrangencia.tesourariaAVista;
      } else if (value === "titulo") {
        return this.$store.state.filtro.abrangencia.titulo;
      } else if (value === "analitico") {
        return this.$store.state.filtro.abrangencia.analitico;
      } else if (value === "devolucoes") {
        return this.$store.state.filtro.abrangencia.devolucoes;
      } else if (value === "adiantamentos") {
        return this.$store.state.filtro.abrangencia.adiantamentos;
      }
    },
    filterSelected: function(value) {
      this.$emit("filtro-selected", true);
      this.$store.commit("filtro/changeAbrangencia", value);
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