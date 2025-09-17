<template>
    <div>
        <div>
            <transition-group name="slide-fade">
                <a v-if="isBaixaDisabled()" href="javascript:;" class="btn" key="acresTeso"
                    v-bind:class="{ [colorSelected]: isFieldChecked('acrescimosDimTesouraria'), [colorDeselected]: !isFieldChecked('acrescimosDimTesouraria'), 'btn-circle': isButtonCircle() }"
                    v-on:click="filterSelected('acrescimosDimTesouraria')">
                <i class="fa fa-clock-o"></i> Acresc. Dim. tesouraria
                </a>
                <a  v-if="isBaixaDisabled()" href="javascript:;" class="btn" key="acresDimTeso"
                    v-bind:class="{ [colorSelected]: isFieldChecked('acrescimosDimBaixaDireta'), [colorDeselected]: !isFieldChecked('acrescimosDimBaixaDireta'), 'btn-circle': isButtonCircle() }"
                    v-on:click="filterSelected('acrescimosDimBaixaDireta')">
                    <i class="fa fa-clock-o"></i> Acresc. Dim. baixa direta
                </a>
                <a  v-if="isBaixaDisabled()" href="javascript:;" class="btn" key="suspen"
                    v-bind:class="{ [colorSelected]: isFieldChecked('suspensos'), [colorDeselected]: !isFieldChecked('suspensos'), 'btn-circle': isButtonCircle() }"
                    v-on:click="filterSelected('suspensos')">
                    <i class="fa fa-clock-o"></i> Suspenso
                </a>
                <a v-if="isPriorizadoEnabled() && isBaixaDisabled()" href="javascript:;" class="btn" key="apriori"
                    v-bind:class="{ [colorSelected]: isFieldChecked('priorizados'), [colorDeselected]: !isFieldChecked('priorizados'), 'btn-circle': isButtonCircle() }"
                    v-on:click="filterSelected('priorizados')">
                    <i class="fa fa-clock-o"></i> Priorizados
                </a>
            </transition-group>
            
            <a href="javascript:;" class="btn"
               v-bind:class="{ [colorSelected]: isFieldChecked('alocacaoFinanceira'), [colorDeselected]: !isFieldChecked('alocacaoFinanceira'),
                       'btn-circle': isButtonCircle()}"
               v-on:click="filterSelected('alocacaoFinanceira')">
                <i class="fa fa-clock-o"></i> Alocação Financeira
            </a>            
        </div>
        <hr />
        <div class="row margin-top-15">         
            <div class="col-md-2">
                <a href="javascript:;" class="btn"
                    v-bind:class="{ [colorSelected]: isFieldChecked('chkPrevisoesFirmeza'), [colorDeselected]: !isFieldChecked('chkPrevisoesFirmeza'),
                            'btn-circle': isButtonCircle()}"
                    v-on:click="filterSelected('chkPrevisoesFirmeza')">
                        <i class="fa fa-dollar"></i> Previsões
                </a>     
            </div>
            <div v-if="isFieldChecked('chkPrevisoesFirmeza') && isClientesFornecedoresOrCliente()">      
                <div class="col-md-3" style="margin-left: 10px">
                    <wes-range-slider id="previsaoValue" :value="getPrevisaoValue()" v-on:change="onChangePrevisaoFirmeza"></wes-range-slider>
                </div>
                <div class="col-md-3">
                    <span class="gerenciais-font">% firmeza: </span><span>{{previsao}}</span>
                </div>  
            </div> 
        </div>

        <hr />
    </div>
</template>
<script>
    export default {
        props: ["button", "colorSelected", "colorDeselected"],
        data: function () {
            return {
                previsao: 0,
                errorFirmeza: false,
            }
        },
        methods: {
            isBaixaDisabled(){
                return this.$store.getters["filtro/isBaixaDisabled"];
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
            }
        }
    }
</script>