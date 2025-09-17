<template>
  <div>
    <div class="col-md-12" style="padding-left: 0px">
      <h4>
        <span class="text-left">
          <strong>{{titulo}}</strong>
        </span>
        <label class="control-label name column-nowrap bold" style="float: right">
          <div :class="classValorTotal">
            <span clas="bold" style="font-size: 12px;">
              {{ labelValorTotal }}
              <b>{{ valorTotalFormatado }}</b>
            </span>
          </div>
        </label>
      </h4>
    </div>
    <div id="sample_editable_1_wrapper" class="dataTables_wrapper no-footer">
      <div class="table-scrollable">
        <table
          class="table table-striped table-hover table-bordered dataTable no-footer"
          id="sample_editable_1"
          role="grid"
        >
          <thead>
            <tr role="row">
              <th class="text-center" style="min-width: 70px;">Competência</th>
              <th class="text-center" style="min-width: 150px;">Remanejar</th>
              <th class="text-center" style="min-width: 150px;">Saldo</th>
              <th class="text-center" style="min-width: 150px;">Orçado</th>
              <th class="text-center" style="min-width: 150px;">Realizado</th>
              <th class="text-center" style="min-width: 150px;">Comprometido</th>
            </tr>
          </thead>
          <tbody>
            <tr role="row" class="odd" v-for="row in rows" :key="row._id">
              <td class="text-center">
                <label>{{row.Fields.COMPETENCIA}}</label>
              </td>
              <td>
                <div class="input-group col-centered form">
                  <wes-input-currency
                    :isDisabled="desabilitarOrcadoNegativo && row.Fields.ORCADO <= 0"
                    v-model="row.Fields.REMANEJAR"
                    :minValue="0"
                    :maxValue="validarMaximo ? row.Fields.ORCADO : null"
                  />
                </div>
              </td>
              <td class="text-right">
                <label>{{formatMoney(row.Fields.SALDO)}}</label>
              </td>
              <td class="text-right">
                <label>{{formatMoney(row.Fields.ORCADO)}}</label>
              </td>
              <td class="text-right">
                <label>{{formatMoney(row.Fields.REALIZADO)}}</label>
              </td>
              <td class="text-right">
                <label>{{formatMoney(row.Fields.COMPROMETIDO)}}</label>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  props: {
    desabilitarOrcadoNegativo: {
      default: false
    },
    classValorTotal: {
      default: "badge badge-primary"
    },
    rows: {},
    ocultaSaldo: {
      type: Boolean
    },
    titulo: {
      default: "Título"
    },
    labelValorTotal: {
      default: "Valor"
    },
    valorTotal: {
      default: 0
    },
    validarMaximo: {
      type: Boolean,
      default: true
    }
  },
  computed: {
    valorTotalFormatado: function() {
      return FormatMoney(this.valorTotal);
    }
  },
  methods: {
    formatMoney(value) {
      return FormatMoney(value);
    }
  }
};
</script>
