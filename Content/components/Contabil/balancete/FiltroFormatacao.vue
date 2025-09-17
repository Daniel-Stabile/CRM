<template>
  <div>
    <!--<a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('completarEstrutura')"
      v-on:click="toggleCampo('completarEstrutura')"
    >
      <i class="fa fa-align-left"></i> Completar estruturas com zero
    </a>-->
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('mostrarReduzido')"
      v-on:click="toggleCampo('mostrarReduzido')"
    >
      <i class="fa fa-minus-square"></i> Mostrar reduzido
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('mostrarApelido')"
      v-on:click="toggleCampo('mostrarApelido')"
    >
      <i class="fa fa-tags"></i> Mostrar apelido
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('formatacaoDC')"
      v-on:click="toggleCampo('formatacaoDC')"
    >
      <i class="fa fa-tags"></i> Formatar valores com: D/C
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('formatacaoParenteses')"
      v-on:click="toggleCampo('formatacaoParenteses')"
    >
      <i class="fa fa-tags"></i> Formatar negativos com: ()
    </a>
    
    <hr />
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('valoresEmMilhares')"
      v-on:click="toggleCampo('valoresEmMilhares')"
    >
      <i class="fa fa-tags"></i> Valores em milhares
    </a>
    <a
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('saldosZerados')"
      v-on:click="toggleCampo('saldosZerados')"
    >
      <i class="fa fa-tags"></i> Saldos zerados
    </a>
    <!-- TODO: Propriedades "Totalizar contas de compensação",
                            "Máscara de saldo por natureza da conta" 
                            e "Máscara de totalização" 
               Descomentar o HTML abaixo e remover este comentário quando implementação estiver concluída.
      href="javascript:;"
      class="btn"
      v-bind:class="getClass('totalizarContasCompensacao')"
      v-on:click="toggleCampo('totalizarContasCompensacao')"
    >
      <i class="fa fa-tags"></i> Totalizar contas de compensação
    </a>    
    <hr />
    <div class="row">
      <div class="col-md-6">
        <a
          href="javascript:;"
          class="btn"
          v-bind:class="getClass('mascaraSaldosPorNaturezaConta')"
          v-on:click="toggleCampo('mascaraSaldosPorNaturezaConta')"
        >
          <i class="fa fa-tags"></i> Máscara de saldos por natureza da conta
        </a>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label>Máscara de totalização</label>
          <input type="text" class="form-control" id="mascaraDeTotalizacao" :value="mascaraDeTotalizacao" @input="changeCampo"> 
        </div>
      </div>
    </div>     -->
    <hr />
    <div class="row">
      <div class="col-md-6">
        <div class="form-group">
          <label>Nome do perfil</label>
          <input type="text" class="form-control" id="nomePerfil" :value="nomePerfil" @input="changeCampo"> 
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          <label>&nbsp;</label>
          <div class="form-actions">
            <a class="btn btn-info" v-on:click.prevent="emitPersistirPerfil()">
              <i class="fa fa-save"></i> {{ isPerfilSistema() ? "Salvar cópia de perfil pré-definido" : "Salvar perfil" }}
            </a> 
            <a class="btn btn-danger" v-if="perfilSelecionado() && !isPerfilSistema()" v-on:click.prevent="excluirPerfil()">
              <i class="fa fa-times"></i> Excluir perfil
            </a>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import { mapGetters } from 'vuex';
  import ContabilService from "../../../services/ContabilService";

  export default {
    props: ["button", "colorSelected", "colorDeselected"],
    computed: {
      ...mapGetters({
        isFieldChecked: 'filtro/isFieldChecked',
        mascaraDeTotalizacao: 'filtro/getMascaraDeTotalizacao',
        nomePerfil: 'filtro/getNomePerfil',
      })
    },
    methods: {
      isPerfilSistema() {
        return this.$store.getters["filtro/isPerfilSistema"];
      },
      perfilSelecionado() {
        return this.$store.getters["filtro/getHandlePerfilSelecionado"] > 0;
      },
      excluirPerfil() {
        ContabilService.deletePerfilBalancete(this.$store.getters["filtro/getHandlePerfilSelecionado"])
          .then((response) => {
          this.$store.commit("filtro/setNomePerfil", null);
          this.$emit("clear-perfil");
          toastr.success(response.data);
        });
      },
      emitPersistirPerfil() {
        this.$emit("persistir-perfil", this.nomePerfil);
      },
      isButtonCircle() {
        return this.button == "circle";
      },
      isButtonSelected(nome) {
        return this.isFieldChecked(nome);
      },
      changeCampo(event) {
        var payload = {
          tipo: "texto",
          nomeCampo: event.target.id,
          valor: event.target.value
        };
        this.$store.commit("filtro/changeCamposFormatacao", payload);
      },
      toggleCampo: function(nome) {
        var payload = { 
          tipo: "toggle", 
          nomeCampo: nome 
        };
        this.$store.commit("filtro/changeCamposFormatacao", payload);
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