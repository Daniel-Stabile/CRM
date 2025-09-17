<template>
    <div class="row">
        <label class="filtro-label-avancado">Abrangência</label>
        <div class="btn-group margin-top-10">
            <!-- Loop para criar os botões -->
            <a v-for="(button, index) in buttons"
               :key="index"
               href="javascript:;"
               style="margin:3px;"
               class="btn btn-xs"
               :class="getClass(button.key)"
               @click="filterSelected(button.key)">
                {{ button.label }}
            </a>
        </div>
    </div>
</template>
<script>
    export default {
        props: ["button", "colorDeselected", "colorSelected"],
        data() {
            return {
                buttons: [
                    { key: "fiscal", label: "Fiscal" },
                    { key: "financeiro", label: "Financeiro" },
                    { key: "ordemVenda", label: "Ordem de Venda" },
                    { key: "emprestimo", label: "Empréstimo" },
                    { key: "emprestimoPessoal", label: "Empréstimo Pessoal" },
                    { key: "contratosCorrigidos", label: "Contratos Corrigidos" },
                    { key: "estoque", label: "Estoque" },
                    { key: "ordemCompra", label: "Ordem de Compra" },
                    { key: "contratos", label: "Contratos" },
                    { key: "aplicacao", label: "Aplicação" },
                    { key: "contratoCompra", label: "Contratos de Compra" }
                ]
            };
        },
        methods: {
            isButtonCircle() {
                return this.button === "circle";
            },
            filterSelected(value) {
                this.$emit("filtro-selected", true);
                this.$store.commit("filtro/changeAbrangenciaAvancado", value);
            },
            getClass(nome) {
                return {
                    [this.colorSelected]: this.isButtonSelected(nome),
                    [this.colorDeselected]: !this.isButtonSelected(nome),
                    "btn-circle": this.isButtonCircle()
                };
            },
            isButtonSelected(value) {
                // Aqui você pode acessar o estado do botão conforme necessário
                return this.$store.state.filtro.filtroAvancado.abrangencia[value];
            }
        }
    };
</script>
