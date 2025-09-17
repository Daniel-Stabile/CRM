<template>
     <div>
        <div>
            <transition-group name="slide-fade">
                <div class="md-checkbox" id="chkSalvarPerfil" key="checkSave" style="color: #337ab7;">
                    <input type="checkbox" id="chkSalvar" class="md-check" onclick="ExibirCampoNomePerfil(this.checked)">
                    <label for="chkSalvar">
                        <span class="inc"></span>
                        <span class="check" style="border-color: #337ab7;"></span>
                        <span class="box" style="border-color: #337ab7;"></span> Salvar filtros como perfil para consultas futuras.
                    </label>
                </div> 

                <div class="form-group form-md-line-input has-info" key="saveFields" style="margin-top: 20px;">
                    <div class="input-group input-group-sm ">
                        <div class="input-group-control">
                            <input type="text" class="form-control input-sm" placeholder="Ex: Perfil balancete completo" style="border-bottom: 1px solid #337ab7;">
                            <label for="form_control_1" style="color: #337ab7;">Nome do perfil</label>
                        </div>
                        <span class="input-group-btn btn-right">
                            <button class="btn blue btn-outline outline" type="button">Salvar</button>
                        </span>
                    </div>
                </div>

                <div key="loadFields">
                <hr>
                    <label style="color: #337ab7;">Selecionar perfil</label>
                    <div class="input-group select2-bootstrap-prepend" > 
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button" data-select2-open="selPerfis">
                                <span class="glyphicon glyphicon-list"></span>
                            </button>
                        </span>
                        <select id="selPerfis" class="form-control select2 select2-hidden-accessible" name="perfis" tabindex="-1" aria-hidden="true" style="width:100%">
                            <option value="0" selected="">-- Consulta customizada --</option>
                        </select>
                        <span class="select2 select2-container select2-container--bootstrap select2-container--below" dir="ltr" style="width: 100%;">
                            <span class="selection">
                                <span class="select2-selection select2-selection--single" role="combobox" aria-haspopup="true" aria-expanded="false" tabindex="-1" aria-labelledby="select2-selPerfis-container">
                                    <span class="select2-selection__rendered" id="select2-selPerfis-container" title="-- Consulta customizada --">-- Consulta customizada --</span>
                                    <span class="select2-selection__arrow" role="presentation">
                                        <b role="presentation"/>
                                    </span>
                                </span>
                            </span>
                            <span class="dropdown-wrapper" aria-hidden="true"/>
                        </span>
                        <span class="input-group-btn btn-right">
                            <button class="btn blue btn-outline outline" type="button">Carregar</button>
                        </span>
                    </div>
                </div>
            </transition-group>
                      
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