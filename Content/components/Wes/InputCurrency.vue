<template>
  <div>
    <input
      type="text"
      v-model="displayValue"
      @blur="isInputActive = false; isInputFormated = true"
      @change="changeHandler"
      :disabled="isDisabled"
      @focus="isInputActive = true; isInputFormated = false"
      class="form-control auto-numeric"
    />
  </div>
</template>
<script>
export default {
  props: ["value", "isDisabled", "minValue", "maxValue"],
  data: function() {
    return {
      isInputActive: false,
      isInputFormated: false,
      maximum: this.maxValue,
      minimum: this.minValue
    };
  },
  computed: {
    displayValue: {
      get: function() {
        if (this.isInputActive) {
            if (!this.isInputFormated) {
              this.isInputFormated = true;
              return this.value == 0 ? "" : FormatMoney(this.value).replace("R$ ", "").replace(".", "");
            }
          return this.value.toString();
        } else {
          return FormatMoney(this.value);
        }
      },
      set: function(modifiedValue) {
        if (this.isInputFormated) {
          var newValue = parseFloat(DesformatarValor(modifiedValue));
          if (isNaN(newValue)) newValue = 0;
          this.$emit("input", newValue);
        }
      }
    }
  },
  methods: {
    changeHandler() {
      if (this.maximum != null && this.maximum != undefined && this.value > this.maximum) 
        this.$emit("input", this.maximum);
      
      if (this.minimum != null && this.minimum != undefined && this.value < this.minimum) 
        this.$emit("input", this.minimum);
    }
  }
};

function DesformatarValor(valor) {
  var retorno = valor;
  return retorno.replace(",", ".").replace(/[^\d\.]/g, "");
}
</script>
