<template>
  <div>
    <orcamento-consultar-filtro 
      :versao-orcamento="versaoOrcamento" 
      :plano="plano" 
      color-selected="blue" 
      color-deselected="white"
      :data-inicio="dataInicio"
      :data-fim="dataFim" />
    <div>
      <orcamento-consultar-pivot-grid />
    </div>
  </div>
</template>
<script>
import OrcamentoService from "../../services/OrcamentoService";
import { debug } from 'util';

export default {
  props: ["versaoOrcamento", "plano", "dataInicio", "dataFim"]  
};
</script>
