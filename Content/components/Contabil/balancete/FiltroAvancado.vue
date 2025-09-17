<template>
    <div>
        <transition-group name="slide-fade" tag="div">
            <a href="javascript:;"
               key="periodoDias"
               class="btn"
               v-if="isDiarioVisible()"
               v-bind:class="getClass('saldoDiario')"
               v-on:click="setCamposVisual('saldoDiario')">
                <i class="fa fa-calendar"></i> Dias
            </a>
            <a href="javascript:;"
               key="periodoMeses"
               class="btn"
               v-bind:class="getClass('periodoMeses')"
               v-on:click="setCamposVisual('periodoMeses')">
                <i class="fa fa-calendar"></i> Meses
            </a>
            <a href="javascript:;"
               key="visuaperiodoTrimestreslTwo"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('periodoTrimestres')"
               v-on:click="setCamposVisual('periodoTrimestres')">
                <i class="fa fa-calendar"></i> Trimestres
            </a>
            <a href="javascript:;"
               key="periodoSemestres"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('periodoSemestres')"
               v-on:click="setCamposVisual('periodoSemestres')">
                <i class="fa fa-calendar"></i> Semestres
            </a>
            <a href="javascript:;"
               key="periodoAnos"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('periodoAnos')"
               v-on:click="setCamposVisual('periodoAnos')">
                <i class="fa fa-calendar"></i> Anos
            </a>
        </transition-group>
    <hr />
        <transition-group name="slide-fade" tag="div">
            <a href="javascript:;"
               key="visualOne"
               class="btn"
               v-bind:class="getClass('saldoAnteriorAtual')"
               v-on:click="setCamposVisual('saldoAnteriorAtual')">
                <i class="fa fa-money"></i> Saldo anterior e saldo atual
            </a>
            <a href="javascript:;"
               key="visualTwo"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('debitosCreditos')"
               v-on:click="setCamposVisual('debitosCreditos')">
                <i class="fa fa-money"></i> Débitos e créditos
            </a>
            <a href="javascript:;"
               key="visualThree"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('saldoMes')"
               v-on:click="setCamposVisual('saldoMes')">
                <i class="fa fa-money"></i> Saldo do mês
            </a>
            <!-- 
            Campo atual de seleção de moeda alternativa não se comporta da mesma forma que Runner. 
            Trecho sendo comentado para ser reincluido após posterior revisão.
            <a href="javascript:;"
               key="visualFour"
               class="btn" style="margin-left:3px"
               v-bind:class="getClass('moeda')"
               v-on:click="setCamposVisual('moeda')">
                <i class="fa fa-money"></i>                
                <span>Moeda ({{ getDescricaoMoeda() }})</span>
            </a>
            -->
        </transition-group>
        <hr />
        <transition-group name="slide-fade">
            <div  key="tipoSubFilter" >
                <contabil-balancete-filtro-tipo button="primary" :colorSelected="colorSelected" :colorDeselected="colorDeselected" :defaultPosteriorDate="defaultPosteriorDate"></contabil-balancete-filtro-tipo>
                <hr />
            </div>
            <div  key="formatacaoSubFilter">
                <contabil-balancete-filtro-formatacao button="primary" :colorSelected="colorSelected" :colorDeselected="colorDeselected" v-on:clear-perfil="emitClearPerfil()" v-on:selecionar-perfil="emitSelecionarPerfil" v-on:persistir-perfil="emitPersistirPerfil"></contabil-balancete-filtro-formatacao>
            </div>
        </transition-group>
    </div>
</template>

<script>
    export default {
        props: ["button", "colorSelected", "colorDeselected", "defaultPosteriorDate"],
        data: function () {
            return {
                previsao: 0,
                errorFirmeza: false,
            }
        },
        methods: { 
            emitPersistirPerfil(nomePerfil) {
                this.$emit("persistir-perfil", nomePerfil);
            },
            emitSelecionarPerfil(perfil) {
                this.$emit("selecionar-perfil", perfil);
            },
            emitClearPerfil() {
                this.$emit("clear-perfil");
            },
            isButtonSelected(value) {
                if (value == "saldoAnteriorAtual") {
                    return this.$store.state.filtro.saldoAnteriorAtual;
                } else if (value == "debitosCreditos") {
                    return this.$store.state.filtro.debitosCreditos;
                } else if (value == "saldoMes") {
                    return this.$store.state.filtro.saldoMes;
                } else if (value == "moeda") {
                    return this.$store.state.filtro.moeda;
                } else if (value == "saldoDiario") {
                    return this.$store.state.filtro.saldoDiario;
                } else if (value == "periodoMeses") {
                    return this.$store.state.filtro.periodoMeses;
                } else if (value == "periodoTrimestres") {
                    return this.$store.state.filtro.periodoTrimestres;
                } else if (value == "periodoSemestres") {
                    return this.$store.state.filtro.periodoSemestres;
                } else if (value == "periodoAnos") {
                    return this.$store.state.filtro.periodoAnos;
                }
            },
            filterSelected: function(value) {
                this.$store.commit("filtro/changeCamposFiltroAvancado", value);
            },
            isButtonCircle() {
                return this.button == "circle";
            },
            // Campo atual de seleção de moeda alternativa não se comporta da mesma forma que Runner. 
            // Trecho sendo comentado para ser reincluido após posterior revisão.
            // getDescricaoMoeda() {
            //     //return this.$store.getters["treeview/getTotalSelectedContas"];
            //     return "USD";
            // },
            getClass(nome) {
                return {
                    [this.colorSelected]: this.isButtonSelected(nome),
                    [this.colorDeselected]: !this.isButtonSelected(nome),
                    "btn-circle": this.isButtonCircle()
                };
            },    
            isSaldoAnteriorAtual() {
                return this.$store.state.filtro.saldoAnteriorAtual;
            },
            isPeriodoMeses() {
                return this.$store.state.filtro.periodoMeses;
            },
            isPeriodoTrimestres() {
                return this.$store.state.filtro.periodoTrimestres;
            },
            isPeriodoSemestres() {
                return this.$store.state.filtro.periodoSemestres;
            },
            isPeriodoAnos() {
                return this.$store.state.filtro.periodoAnos;
            },
            isBaixaDisabled(){
                return this.$store.getters["filtro/isBaixaDisabled"];
            },
            setCamposVisual(nome)
            {
                this.$store.commit('filtro/setCampoVisual', nome);
            },

            getColorSelected() {                
                if (this.colorSelected == null || this.colorSelected == "") {
                    this.colorSelected = "green-dark";
                }
                return 'green-dark';
            },
            getChkPrevisoesFirmeza(){
                return this.$store.state.filtro.titulo.chkPrevisoesFirmeza;
            },
            getPrevisaoValue(){
                return this.$store.state.filtro.titulo.previsaoFirmeza;
            },
            isButtonCircle: function () {
                return this.button == "circle";
            },
            isPriorizadoEnabled() {
                return this.$store.getters["filtro/isTituloPriorizadoEnabled"];
            },
            isFieldChecked: function (value) {
                return this.$store.state.filtro.titulo[value];
            },
            filterSelected: function (value) {
                this.$store.commit('filtro/changeTitulo', value);
            },
            onChangePrevisaoFirmeza: function (args) { 
                this.previsao = Math.round(args.value[0]);
                if (this.previsao >= 0 && this.previsao <= 100) {
                    this.$store.commit('filtro/setPrevisaoFirmeza', this.previsao);
                    this.errorFirmeza = false;
                } else {
                    this.previsao = 0;
                    this.errorFirmeza = true;
                }
            },
            isTituloEnabled() {
                return this.$store.state.filtro.abragencia.titulo;
            },
            isClientesFornecedoresOrCliente(){
                return this.$store.getters["filtro/isClientesFornecedoresOrCliente"];
            },
            isDiarioVisible() {
            return this.$store.getters["parametros/isBalanceteDiario"];
            }
        }
    }
</script>