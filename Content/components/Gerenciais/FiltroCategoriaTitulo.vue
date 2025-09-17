<template>
    <div>
        <transition-group name="slide-fade" tag="div">
            <a href="javascript:;"
               v-if="isToShow(4)" key="secondDiv"
               class="btn"
               v-bind:class="{ [colorSelected]: isTipoChecked(4), [colorDeselected]: !isTipoChecked(4), 'btn-circle': isButtonCircle()  }"
               v-on:click="filterSelected(4)">
                <i class="fa fa-plus"></i> Emissão
            </a>
            <a href="javascript:;" class="btn"
               v-if="isToShow(3)" key="reali"
               v-bind:class="{ [colorSelected]: isTipoChecked(3), [colorDeselected]: !isTipoChecked(3), 'btn-circle': isButtonCircle() }"
               v-on:click="filterSelected(3)">
                <i class="fa fa-check"></i> Realização
            </a>
            <a href="javascript:;" class="btn"
               v-if="isToShow(2)" key="mainDiv"
               v-bind:class="{ [colorSelected]: isTipoChecked(2), [colorDeselected]: !isTipoChecked(2), 'btn-circle': isButtonCircle() }"
               v-on:click="filterSelected(2)">
                <i class="fa fa-clock-o"></i> Vencimento
            </a>
            <a href="javascript:;" class="btn"
               key="baixa" v-if="isToShow(1)"
               v-bind:class="{ [colorSelected]: isTipoChecked(1), [colorDeselected]: !isTipoChecked(1), 'btn-circle': isButtonCircle() }"
               v-on:click="filterSelected(1)">
                <i class="fa fa-arrow-circle-down"></i> Baixa
            </a>
        </transition-group>
        <hr />
        <div class="row">
            <transition-group name="slide-fade">
                <div v-if="isToShowBaixaDetails()" key="baixaSubFilter" class="col-md-12">
                    <gerenciais-filtro-baixa-tipo :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-baixa-tipo>
                    <hr />
                </div>
                <div v-if="isVencimentoSelected()" key="vencimentoSubFilter" class="col-md-12">
                    <gerenciais-filtro-vencimento-tipo :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-vencimento-tipo>
                    <hr />
                </div>
                <div v-if="isIgnorarCompensadoEnabled() && !isToShowBaixaDetails() && !isVencimentoSelected()" key="ignorarCompensadoEnabled" class="col-md-12">
                    <gerenciais-filtro-ignorar-compensado :colorSelected="colorSelected" :colorDeselected="colorDeselected"></gerenciais-filtro-ignorar-compensado>
                    <hr />
                </div>
            </transition-group>
        </div>
    </div>
</template>
<script>
    export default {
        props: ["button", "colorSelected", "colorDeselected"],
        data: function () {
            return {
                tipoFiltro: Object.freeze([
                    {
                        Codigo: 1,
                        Valor: "Baixa",
                        Icon: "fa fa-arrow-circle-down"
                    },
                    {
                        Codigo: 2,
                        Valor: "Vencimento",
                        Icon: "fa fa-clock-o"
                    },
                    {
                        Codigo: 3,
                        Valor: "Realização",
                        Icon: "fa fa-check"
                    },
                    {
                        Codigo: 4,
                        Valor: "Emissão",
                        Icon: "fa fa-plus"
                    }
                ])
            }
        },
        methods: {
            isToShow(code) {
                if (code == 1) {
                    return this.$store.getters["filtro/isToShowBaixa"];
                } else if (code == 2) {
                    return this.$store.getters["filtro/isToShowVencimento"]
                } else if (code == 3) {
                    return this.$store.getters["filtro/isToShowRealizacao"]
                } else if (code == 4) {
                    return this.$store.getters["filtro/isToShowEmissao"]
                } else {
                    return false;
                }
            },
            isToShowBaixaDetails() {
                return this.$store.getters["filtro/isToShowBaixaDetails"]
            },
            isIgnorarCompensadoEnabled() {
                return this.$store.getters["filtro/isIgnorarCompensadoEnabled"]
            },
            isVencimentoSelected() {
                return this.$store.state.filtro.tipoDocumento == 2;
            },
            isButtonCircle() {
                return this.button == 'circle';
            },
            getTipoValorSelecionado() {
                return this.getTipoFiltro(this.$store.state.filtro.tipoDocumento).Valor;
            },
            getTipoIconSelecionado() {
                return this.getTipoFiltro(this.$store.state.filtro.tipoDocumento).Icon;
            },
            filterSelected: function (value) {
                this.$store.commit('filtro/setTipoDocumento', value);
            },
            getTipoFiltro(code) {
                for (var v in this.tipoFiltro) {
                    if (this.tipoFiltro[v].Codigo == code) {
                        return this.tipoFiltro[v];
                    }
                }
            },
            isTipoChecked(code) {
                return this.$store.state.filtro.tipoDocumento == code;
            },
            isFilterEnabled: function (type) {
                if (type == 'tesourariaAVista') {
                    return this.$store.state.filtro.abragencia.tesourariaAVista;
                } else if (type == "titulo") {
                    return this.$store.state.filtro.abragencia.titulo;
                } else if (type == 'noFilter') {
                    return !this.$store.state.filtro.abragencia.titulo
                        && !this.$store.state.filtro.abragencia.tesourariaAVista
                } else if (type == 'devolucoes') {
                    return this.$store.state.filtro.abragencia.devolucoes;
                } else if (type == "adiantamentos") {
                    return this.$store.state.filtro.abragencia.adiantamentos;
                }
            }


        }
    }
</script>