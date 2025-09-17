<template>
  <div class="portlet light">
    <div class="portlet-title">
      <div class="caption">
        <span class="caption-subject font-green-sharp bold uppercase">
          Movimentações
        </span>
      </div>
    </div>
    <div class="portlet-body">
      <DxDataGrid
        id="movimentacoes"
        :ref="dataGridRefName"
        :show-borders="true"
        :data-source="dataSource"
        :column-min-width="100"
        key-expr="Handle"
        :on-cell-prepared="onCellPrepared"
        no-data-text="Sem movimentações"
      >
        <DxSorting
          ascending-text="Ordem crescente"
          descending-text="Ordem descrescente"
          clear-text="Limpar ordenação"
        />
        <DxExport :enabled="true" :texts="texts" />
        <DxFilterRow :visible="showFilterRow" reset-operation-text="Resetar">
          <DxOperationDescriptions
            between="Entre"
            contains="Contém"
            ends-with="Termina com"
            equal="É igual a"
            greater-than="Maior que"
            greater-than-or-equal="Maior que ou igual a"
            less-than="Menor que"
            less-than-or-equal="Menor que ou igual a"
            not-contains="Não contém"
            not-equal="Não é igual a"
            starts-with="Começa com"
          />
        </DxFilterRow>
        <DxHeaderFilter :visible="showHeaderFilter" :texts="texts" />
        <DxSearchPanel :visible="true" :width="240" placeholder="Procurar..." />
        <DxColumn :width="70" data-field="Status" caption="Status" />
        <DxColumn
          :width="125"
          caption="Data/Hora"
          data-field="DataHora"
          data-type="datetime"
          format="dd/MM/yyyy HH:mm"
          :allow-filtering="false"
          :allow-header-filtering="true"
        />
        <DxColumn caption="Almox. destino" data-field="AlmoxDestino" />
        <DxColumn
          :width="100"
          caption="Tipo mov."
          data-field="TipoMovimentacao"
        />
        <DxColumn
          :width="100"
          caption="Quantidade"
          data-field="Quantidade"
          :format="decimalFormat"
        />
        <DxColumn
          data-field="SaldoAnterior"
          caption="Saldo anterior"
          :format="decimalFormat"
        />
        <DxColumn
          data-field="SaldoAtual"
          caption="Saldo atual"
          :format="decimalFormat"
        />
        <DxColumn data-field="Documento" caption="Documento" />
        <DxColumn data-field="CentroCusto" caption="Centro de custo" />
        <DxColumn :width="80" data-field="Projeto" caption="Projeto" />
        <DxColumn data-field="AlmoxOrigem" caption="Almox. origem" />
        <DxColumn :width="80" data-field="Ordem" caption="Ordem" />
        <DxColumn
          data-field="ValorUnitario"
          caption="Valor unitário"
          :format="moedaFormat"
          :precision="4"
        />
        <DxColumn
          data-field="ValorTotal"
          caption="Valor total"
          :format="moedaFormat"
        >
          <DxHeaderFilter :data-source="valorTotalHeaderFilter" />
        </DxColumn>
        <DxColumn caption="Pessoa" data-field="Pessoa" />
        <DxMasterDetail
          :enabled="true"
          template="masterDetailTemplate"
          v-if="controlaLote"
        />
        <template
          #masterDetailTemplate="{ data: Movimentacao }"
          v-if="controlaLote"
        >
          <DetailTemplate :template-data="Movimentacao" />
        </template>
      </DxDataGrid>
    </div>
  </div>
</template>
<script>
  import {
    DxSorting,
    DxDataGrid,
    DxColumn,
    DxHeaderFilter,
    DxSearchPanel,
    DxFilterRow,
    DxOperationDescriptions,
    DxMasterDetail,
    DxExport,
  } from "devextreme-vue/data-grid";

  import DetailTemplate from "./DetalheMovimentacoes.vue";
  import { loadMessages } from "devextreme/localization";

  export default {
    components: {
      DxDataGrid,
      DxSorting,
      DxColumn,
      DxMasterDetail,
      DxHeaderFilter,
      DxSearchPanel,
      DxFilterRow,
      DxOperationDescriptions,
      DxExport,
      DetailTemplate,
    },
    created() {
      loadMessages({
        en: {
          "dxList-selectAll": "Selecionar todos",
          "dxCollectionWidget-noDataText": "Sem dados para exibir ",
        },
      });
    },
    data() {
      return {
        controlaLote: this.$store.state.dadosMovimentacoes.controlaLote,
        texts: {
          exportAll: "Exportar para excel",
          listSelectAll: "Selecionar todos",
          emptyValue: "(Em branco)",
          cancel: "Cancelar",
        },
        moedaFormat: {
          currency: "BRL",
          type: "currency",
          precision: 4,
        },
        decimalFormat: {
          type: "fixedPoint",
          precision: 4,
        },
        showFilterRow: true,
        showHeaderFilter: true,
        valorTotalHeaderFilter: [
          {
            text: "Até R$10000",
            value: ["ValorTotal", "<", 10000],
          },
          {
            text: "R$10000 - R$25000",
            value: [
              ["ValorTotal", ">=", 10000],
              ["ValorTotal", "<", 25000],
            ],
          },
          {
            text: "R$25000 - R$50000",
            value: [
              ["ValorTotal", ">=", 25000],
              ["ValorTotal", "<", 50000],
            ],
          },
          {
            text: "R$50000 - R$100000",
            value: [
              ["ValorTotal", ">=", 50000],
              ["ValorTotal", "<", 100000],
            ],
          },
          {
            text: "Acima de R$100000",
            value: ["ValorTotal", ">=", 100000],
          },
        ],
        dataGridRefName: "dataGrid",
        dataSource: this.$store.state.dadosMovimentacoes.dados,
      };
    },
    methods: {
      clearFilter() {
        this.$refs[this.dataGridRefName].instance.clearFilter();
      },
      onCellPrepared: function (e) {
        e.cellElement.addClass("textAlign");
        if (e.rowType == "data" && e.column.caption == "Status") {
          let icone = e.data.Status == "Cancelada" ? "times" : "check";
          let cor = e.data.Status == "Cancelada" ? "red" : "green";

          e.cellElement.html(
            "<center><i class='fa fa-" +
              icone +
              "' style = 'color:" +
              cor +
              "'></i></center>"
          );
        }
      },
    },
  };
</script>
<style>
  .caption {
    font-size: 18px;
    font-weight: 500;
  }
</style>
