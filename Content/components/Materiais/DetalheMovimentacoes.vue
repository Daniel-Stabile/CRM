<template>
  <div>
    <div class="master-detail-caption"></div>
    <DxDataGrid
      :data-source="dataSource"
      :show-borders="true"
      :column-auto-width="true"
    >
      <DxSorting
        ascending-text="Ordem crescente"
        descending-text="Ordem descrescente"
        clear-text="Limpar ordenação"
      />
      <DxColumn caption="Lote estocagem" data-field="LoteEstocagem" />
      <DxColumn
        caption="Data da movimentação"
        data-field="DataMovimentacao"
        data-type="date"
      />
      <DxColumn
        caption="Data de vencimento"
        data-field="DataVencimento"
        data-type="date"
      />
      <DxColumn caption="Quantidade" data-field="Quantidade" />
    </DxDataGrid>
  </div>
</template>
<script>
  import { DxDataGrid, DxColumn, DxSorting } from "devextreme-vue/data-grid";

  import ArrayStore from "devextreme/data/array_store";
  import DataSource from "devextreme/data/data_source";

  export default {
    components: { DxDataGrid, DxColumn, DxSorting },
    props: {
      templateData: {
        type: Object,
        default: () => {},
      },
    },
    data() {
      return {
        dataSource: this.getLotes(this.templateData.Handle),
      };
    },
    methods: {
      getLotes(key) {
        return new DataSource({
          store: new ArrayStore({
            data: this.$store.state.dadosMovimentacoes.lotes,
          }),
          filter: ["MovimentacaoHandle", "=", key],
        });
      },
    },
  };
</script>
<style>
  .master-detail-caption {
    padding: 0 0 5px 10px;
    font-size: 14px;
    font-weight: bold;
  }
</style>
