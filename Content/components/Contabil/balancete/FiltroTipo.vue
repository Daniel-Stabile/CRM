<template>
  <div>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('antesZeramento')"
      v-on:click="selectAntesZeramento('antesZeramento')"
    >
      <i class="fa fa-filter"></i> Antes do zeramento
    </a>  
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('abertura')"
      v-on:click="filterSelected('abertura')"
    >
      <i class="fa fa-filter"></i> Abertura
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('fechamentoGerencial')"
      v-on:click="filterSelected('fechamentoGerencial')"
    >
      <i class="fa fa-filter"></i> Fechamentos gerenciais
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('considerarLalur')"
      v-on:click="filterSelected('considerarLalur')"
    >
      <i class="fa fa-filter"></i> Considerar apuração do LALUR
    </a>  
      <transition-group name="slide-fade" class="date-picker">
        <p key="ignorarPosteriorKey"
           v-show="isIgnorarPosteriorEnabled()">
          <br>
          <a
            name="ignoreDate"
            class="btn"
            v-bind:class="{ [colorSelected]: true, [colorDeselected]: false, 'btn-circle': isButtonCircle() }"
            ref="posteriorInput"
          >
            <i class="fa fa-calendar"></i> Ignorar posteriores a {{posteriorText}}
          </a>
        </p>
      </transition-group>

  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import { mapState } from 'vuex';

export default {
  props: ["button", "colorSelected", "colorDeselected", "defaultPosteriorDate"],
  computed: {
    ...mapGetters({isFieldChecked: 'filtro/isFieldChecked'}),
    posteriorText() {
      return this.posteriorDate.format("MM/yyyy");
    }
  },
  data: function() {
    return {
      posteriorDate: this.defaultPosteriorDate
    }
  },
  mounted: function() {    
    this.posteriorDate = this.defaultPosteriorDate; 
    this.initDatePicker();
  },
  methods: {
    updateIgnorarPosteriorDate(valor) {
      if (!this.isButtonSelected('antesZeramento')) return;
      this.posteriorDate = valor;
      window.$(this.$refs.posteriorInput).datepicker('update', this.posteriorDate);
    },
    initDatePicker() {
      if (!this.isButtonSelected('antesZeramento')) return;

      let vm = this;
      
      let datepicker = window.$(this.$refs.posteriorInput).datepicker({
          language: 'pt-BR',
          orientation: "left",
          format: 'dd/mm/yyyy',
          startView: "months",
          minViewMode: "months",
          autoClose: true,
          startDate: "",
          endDate: "",
          defaultViewDate: vm.defaultPosteriorDate
      }).on('changeDate', function (arg) {
        if (arg.target.name === "ignoreDate")
            window.$(vm.$refs.posteriorInput).datepicker('hide');    
        
        vm.posteriorDate = moment(arg.date).endOf('month')._d;
        vm.$store.commit("filtro/setIgnorarPosteriorDate", vm.posteriorDate);
      });
    },
    isIgnorarPosteriorEnabled() {
      return this.$store.getters["filtro/isIgnorarPosteriorEnabled"];
    },
    isButtonCircle() {
      return this.button == "circle";
    },
    isButtonSelected(nome) {
      return this.isFieldChecked(nome);
    },
    filterSelected: function(value) {
      this.$store.commit("filtro/changeTipoBalancete", value);
    },
    selectAntesZeramento: function(value) {
      this.$store.commit("filtro/setAntesZeramento", value);
      this.initDatePicker();
      this.updateIgnorarPosteriorDate(this.defaultPosteriorDate);
    },
    getClass(nome) {
      return {
        [this.colorSelected]: this.isButtonSelected(nome),
        [this.colorDeselected]: !this.isButtonSelected(nome),
        "btn-circle": this.isButtonCircle()
      };
    }
  },
  watch: {
    defaultPosteriorDate(val) {
      this.updateIgnorarPosteriorDate(val);
    },
  }
};
</script>