<template>
  <div>  
    <DxDataGrid
      id="gridSuperior"
      :ref="gridSuperiorRefKey"
      :data-source="propostas.produtos"
      :column-auto-width="false"
      :show-borders="true"
      :row-alternation-enabled="true"      
      @file-saving="onFileSavingGridSuperior"      
    >    
      <DxExport
          :enabled="true"
      />
      <DxColumnFixing :enabled="true" />
      <DxColumn :fixed="true" :visible="true" caption="Itens cotados" alignment="center">
        <DxColumn
          :width="25"
          :allow-sorting="false"
          :visible="false"
          data-field="informacaoFinanceira"
          caption=""
          alignment="center"
        />
        <DxColumn
          :width="105"          
          data-field="codigoReferencia"
          caption="Cód referência"          
        />
        <DxColumn :width="210" data-field="descricao" caption="Produto" />
        <DxColumn :width="70" data-field="variacao" caption="Variação" />
        <DxColumn
          :width="85"
          alignment="right"
          data-field="valorUnitarioSolicitado"
          caption="Vlr unit req"
        />
        <DxColumn :width="50" alignment="right" data-field="quantidade" caption="Qtd" />
        <DxColumn
          :width="45"
          data-field="unidade"
          caption="UN"
          alignment="center"
        />
      </DxColumn>
      <DxColumn alignment="center" :caption="buscaNomeFornecedor(0)">
        <DxColumn
          :width="65"
          alignment="right"
          caption="R$ Unit."
          data-field="FornA_valorUnitario"
          format="fixedPoint"
        />
        <DxColumn
          :width="80"
          alignment="right"
          caption="R$ Total"
          data-field="FornA_valorTotal"
          format="fixedPoint"
        />
        <DxColumn
          :width="55"
          alignment="right"
          caption="%"
          data-field="FornA_percentualUnitarioEmRelacaoValorTotal"
          format="fixedPoint"
        />
      </DxColumn>
      <DxColumn alignment="center" :caption="buscaNomeFornecedor(1)">
        <DxColumn
          :width="65"
          alignment="right"
          caption="R$ Unit."
          data-field="FornB_valorUnitario"
          format="fixedPoint"
        />
        <DxColumn
          :width="80"
          alignment="right"
          caption="R$ Total"
          data-field="FornB_valorTotal"
          format="fixedPoint"
        />
        <DxColumn
          :width="55"
          alignment="right"
          caption="%"
          data-field="FornB_percentualUnitarioEmRelacaoValorTotal"
          format="fixedPoint"
        />
      </DxColumn>
      <DxColumn alignment="center" :visible="exibeColuna()" :caption="buscaNomeFornecedor(2)">
        <DxColumn
          :width="65"
          alignment="right"
          caption="R$ Unit."
          data-field="FornC_valorUnitario"
          format="fixedPoint"
        />
        <DxColumn
          :width="80"
          alignment="right"
          caption="R$ Total"
          data-field="FornC_valorTotal"
          format="fixedPoint"
        />
        <DxColumn
          :width="55"
          alignment="right"
          caption="%"
          data-field="FornC_percentualUnitarioEmRelacaoValorTotal"
          format="fixedPoint"
        />
      </DxColumn>
    </DxDataGrid>
    <div id="gridInferior">
    <DxDataGrid
      id="gridInferior"
      :ref="gridInferiorRefKey"
      :data-source="propostas.totalizadores"
      :column-auto-width="false"
      :allow-column-reordering="false"
      :show-borders="true"
      :row-alternation-enabled="true"
      @file-saving="onFileSavingGridInferior"
    >
      <DxColumn
        :width="565"
        :allow-sorting="false"
        :fixed="true"
        alignment="right" 
        caption=""
        data-field="colunaTitulo"
      />
      <DxColumn
        :width="200"
        :allow-sorting="false"
        :caption="buscaNomeFornecedor(0)"
        alignment="right"        
        data-field="colunaFornecedorA"
      />
      <DxColumn
        :width="200"
        :allow-sorting="false"
        :caption="buscaNomeFornecedor(1)"
        alignment="right"        
        data-field="colunaFornecedorB"
      />
      <DxColumn
        :width="200"
        :allow-sorting="false"
        :caption="buscaNomeFornecedor(2)"
        :visible="exibeColuna()"
        alignment="right"        
        data-field="colunaFornecedorC"
      />
    </DxDataGrid>
    </div>
  </div>
</template>

<script>
import { DxDataGrid, DxColumn, DxColumnFixing, DxExport } from 'devextreme-vue/data-grid';
import { DxButton } from 'devextreme-vue/button';
import ExcelJS from 'exceljs';
import saveAs from 'file-saver';
import { mapState } from 'vuex';
const localization = require('devextreme/localization');
localization.locale("pt-BR");
const gridSuperiorRefKey = 'gridSuperior';
const gridInferiorRefKey = 'gridInferior';

export default {
  components: {
    DxDataGrid,
    DxColumn,
    DxColumnFixing,
    DxButton,
    DxExport
  },
  data(){
    return {
      tempWorkbook: null,
      gridSuperiorRefKey,
      gridInferiorRefKey,
      gridSuperiorInstance: function() {
        return this.$refs[gridSuperiorRefKey].instance;
      },
      gridInferiorInstance: function() {
        return this.$refs[gridInferiorRefKey].instance;
      }
    }
  },
  computed: {
    ...mapState({propostas: state => state.propostas}),          
  },      
  methods: {
    buscaNomeFornecedor(index) {
      if (this.propostas.fornecedores[index] != null) return this.propostas.fornecedores[index].nome;
      else return "";
    },
    exibeColuna(){
      return this.propostas.fornecedores.length > 2;
    },    
    onFileSavingGridSuperior(e){
      this.tempWorkbook = new ExcelJS.Workbook();

      this.tempWorkbook.xlsx.load(e.data.arrayBuffer()).then(() => { 
        this.tempWorkbook.xlsx.writeBuffer().then((buffer) => {
          $("#gridInferior").children().first().dxDataGrid("instance").exportToExcel(false);
        });
      });

      e.cancel = true;
    },
    onFileSavingGridInferior(e){  
      const workBookGridInferior = new ExcelJS.Workbook();
      var self = this;

      workBookGridInferior.xlsx.load(e.data.arrayBuffer()).then(() => {
        workBookGridInferior.worksheets[0].eachRow(function(row, rowNumber) {
          if(rowNumber == 1){
            const linhaTituloFornecedores = ['','','','','','',row.values[2],'','',row.values[3],'','',row.values[4]];
            self.tempWorkbook.worksheets[0].addRow(linhaTituloFornecedores).commit();
          } else {
            const linhaValorTotalizadores = [row.values[1],'','','','','','',row.values[2],'','',row.values[3],'','',row.values[4]];
            self.tempWorkbook.worksheets[0].addRow(linhaValorTotalizadores).commit();
          }          
        });
                
        self.tempWorkbook.xlsx.writeBuffer().then((buffer) => {    
          saveAs(new Blob([buffer], { type: 'application/octet-stream' }), 'ComparacaoPropostas.xlsx');
        });
      });

      e.cancel = true;
    }
  }
};
</script>