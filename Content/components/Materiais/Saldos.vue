<template>
  <div class="portlet light">
    <div class="portlet-title">
      <div class="caption">
        <span class="caption-subject font-green-sharp bold uppercase">
          Saldos
        </span>
      </div>
    </div>
    <div class="portlet-body">
      <DxPivotGrid
        id="saldos"
        :allow-sorting-by-summary="true"
        :allow-sorting="true"
        :allow-filtering="true"
        :row-header-layout="rowHeaderLayout"
        :show-borders="true"
        :data-source="dataSource"
        :show-column-grand-totals="false"
        :texts="texts"
        :on-cell-prepared="onCellPrepared"
        :hide-empty-summary-cells="hideEmptySummaryCells"
      >
        <DxFieldChooser :height="500" :texts="texts" :title="displayTitle" />
        <DxExport :enabled="true" />
        <DxFieldPanel
          :show-column-fields="showColumnFields"
          :show-data-fields="showDataFields"
          :show-filter-fields="showFilterFields"
          :show-row-fields="showRowFields"
          :allow-field-dragging="true"
          :visible="true"
        />
      </DxPivotGrid>
    </div>
  </div>
</template>
<script>
  import DxPivotGrid, {
    DxExport,
    DxFieldChooser,
    DxFieldPanel,
  } from "devextreme-vue/pivot-grid";
  import PivotGridDataSource from "devextreme/ui/pivot_grid/data_source";

  export default {
    components: {
      DxPivotGrid,
      DxFieldChooser,
      DxFieldPanel,
      DxExport,
    },
    data() {
      return {
        hideEmptySummaryCells: true,
        showColumnFields: true,
        showDataFields: false,
        showFilterFields: false,
        showRowFields: true,
        rowHeaderLayout: "tree",
        allowCrossGroupCalculation: true,
        showColumnGrandTotals: true,
        displayTitle: "Seleção de campos",
        texts: {
          grandTotal: "Total",
          exportToExcel: "Exportar para excel",
          showFieldChooser: "Mostrar o selecionador de campos do grid",
          allFields: "Todos os campos",
          columnFields: "Campos de coluna",
          rowFields: "Campos de linha ",
          dataFields: "Campos calculados",
          filterFields: "Campos de filtro",
          noData: "Sem saldos de estoque",
          sortColumnBySummary: "Ordenar por {0} essa coluna",
          sortRowBySummary: "Ordenar por {0} essa linha",
          removeAllSorting: "Remover todas as ordenações",
        },
        dataSource: new PivotGridDataSource({
          fields: [
            {
              caption: "Filial",
              width: 120,
              dataField: "Filial",
              area: "row",
            },
            {
              caption: "Produto",
              dataField: "Produto",
              width: 150,
              area: "row",
            },
            {
              caption: "Variação",
              dataField: "Variacao",
              width: 150,
              area: "row",
            },
            {
              caption: "Almoxarifado",
              dataField: "Almoxarifado",
              width: 150,
              area: "row",
            },
            {
              caption: "Lote",
              dataField: "Lote",
              width: 150,
              area: "row",
            },
            {
              caption: "Situação",
              dataField: "Tipo",
              dataType: "string",
              area: "column",
              sortingMethod: function (a, b) {
                if (a.value === "Disponível") return -1;

                if (b.value === "Disponível") return 1;

                if (a.value === "Trâns. filial")
                  return b.value === "Trâns. almox." ? -1 : 1;

                if (b.value === "Trâns. filial")
                  return a.value === "Trâns. almox." ? 1 : -1;

                return a.value.localeCompare(b.value);
              },
            },
            {
              dataField: "Estoque",
              dataType: "number",
              format: { type: "fixedPoint", precision: 4 },
              summaryType: "sum",
              area: "data",
            },
          ],
          store: this.$store.state.dadosSaldos.dados,
        }),
      };
    },
    methods: {
      onCellPrepared: function (e) {
        e.cellElement.addClass("textAlign");
      },
      OnShowColumnFieldsChanged(e) {
        this.showColumnFields = e.value;
      },
      OnShowDataFieldsChanged(e) {
        this.showDataFields = e.value;
      },
      OnShowFilterFieldsChanged(e) {
        this.showFilterFields = e.value;
      },
      OnShowRowFieldsChanged(e) {
        this.showRowFields = e.value;
      },
    },
  };
</script>
<style scoped>
  #saldos {
    max-height: 570px;
  }

  .caption {
    font-size: 18px;
    font-weight: 500;
  }
</style>
