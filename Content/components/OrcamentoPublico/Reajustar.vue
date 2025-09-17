<template>
    <div class="orcpub-reajuste">
        <table v-if="TIPO == 'PPA'">
            <thead>
                <tr>
                    <th style="width: 28%">Projetos > Ações orçamentárias</th>
                    <th style="width: 18%" v-for="year in years" :key="year.name">{{ year.title }}</th>
                </tr>
            </thead>
            <Fragment v-for="projeto in data.output" :key="projeto.PROJETO">
                <tr>
                    <td>
                        <div class="value">
                            {{ projeto.PROJETO }}
                            <div class="td-count">{{ projeto.CHILDRENS.length }}</div>
                        </div>
                    </td>
                    <td v-for="year in years" :key="year.name" title="Soma de valores">
                        <div
                            style="display: flex; white-space: nowrap; align-items: center; gap: 4px; justify-content: space-between; padding: 0 12px;">
                            {{ formatMoney(calculateSum(projeto, year.name)) }}
                            <i class="fa fa-hashtag" style="font-size: 12px; color: #bbbbbb"></i>
                        </div>
                    </td>
                </tr>
                <tr v-for="(acao, index) in projeto.CHILDRENS" :key="acao.ACOESPROJETOS">
                    <td>

                        <div class="value"
                            style="margin-left: 8px; gap: 4px; justify-content: flex-start;position:relative">

                            <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 64 64" fill="none">
                                <path
                                    d="M58 34L38 14H34V24H24C17.83 24 14 20.17 14 14H8V28C8 37.87 14.13 44 24 44H34V54H38L58 34Z"
                                    fill="#95938E" />
                            </svg>
                            {{ acao.ACOESPROJETOS }}
                        </div>
                    </td>
                    <td v-for="classificacao in acao.CLASSIFICACOES" :key="classificacao">
                        <div v-if="data.values[classificacao].isEditing">
                            <input type="text" @blur="toggleEditMode(classificacao)" ref='inputRef'
                                :value="data.values[classificacao].VALORSTRING" @input="e => onInput(classificacao, e)" />
                        </div>

                        <div :class="data.values[classificacao].canEdit ? 'value' : 'value null'" v-else
                            @click="toggleEditMode(classificacao)">{{
                                formatMoney(data.values[classificacao].VALOR)
                            }}
                            <div :title="'Valor Anterior: ' + formatMoney(data.values[classificacao].VALORANTERIOR)"
                                style="background-color: #A9D8E877;color: #003C6E" class="percentage"
                                v-if="data.values[classificacao].VALOR > data.values[classificacao].VALORANTERIOR && data.values[classificacao].VALORANTERIOR != 0">
                                {{ getPercentage(data.values[classificacao]) }}
                                <i class="fa fa-caret-up" style="font-size: 12px; color: currentColor"></i>
                            </div>
                            <div :title="'Valor Anterior: ' + formatMoney(data.values[classificacao].VALORANTERIOR)"
                                style="background-color: #F8CECC77; color: #660000;" class="percentage"
                                v-if="data.values[classificacao].VALOR < data.values[classificacao].VALORANTERIOR && data.values[classificacao].VALORANTERIOR != 0">
                                {{ getPercentage(data.values[classificacao]) }}
                                <i class="fa fa-caret-down" style="font-size: 12px; color: currentColor"></i>
                            </div>
                            <div title="Novo registro" style="background-color: #33aa3333;" class="percentage"
                                v-if="data.values[classificacao].VALOR != data.values[classificacao].VALORANTERIOR && data.values[classificacao].VALORANTERIOR == 0">
                                <i class="fa fa-plus" style="font-size: 12px; color: #33aa33"></i>
                            </div>

                        </div>

                    </td>
                </tr>
            </Fragment>
        </table>



    </div>
</template>
  
<script>


function transformInputToOutput(input, years, reajuste) {
    const output = [];

    // Função auxiliar para encontrar um projeto existente no output
    function findProject(projeto) {
        return output.find((item) => item.PROJETO === projeto);
    }

    // Função auxiliar para encontrar uma ação em um projeto
    function findAcao(projeto, acao) {
        const project = findProject(projeto);
        if (!project) return null;
        return project.CHILDRENS.find((item) => item.ACOESPROJETOS === acao);
    }


    // Itera pelos elementos do input
    input.forEach((item) => {
        const projeto = item.PROJETO;
        const acao = item.ACOESPROJETOS;

        let project = findProject(projeto);
        if (!project) {
            project = { PROJETO: projeto, CHILDRENS: [] };
            output.push(project);
        }

        let acaoItem = findAcao(projeto, acao);
        if (!acaoItem) {
            acaoItem = { ACOESPROJETOS: acao, HANDLEACAO: item.HANDLEACAO, CHILDRENS: [] };
            project.CHILDRENS.push(acaoItem);
        }

        acaoItem.CHILDRENS.push({ HANDLE: item.HANDLE, ANO: item.ANO, VALOR: item.VALOR });
    });

    let id = 0;
    let values = {};

    output.forEach((p) => {
        p.CHILDRENS.forEach(a => {



            a.CLASSIFICACOES = years.map(y => {
                let find = a.CHILDRENS.find(c => new Date(c.ANO).getFullYear() == y.year)
                id++;
                if (find) {
                    let VALORANTERIOR = parseFloat(find.VALOR);
                    let VALOR = y.allowReadjust ? parseFloat((VALORANTERIOR * reajuste).toFixed(2)) : VALORANTERIOR;
                    values[id] = {
                        ...find,
                        VALOR,
                        VALORANTERIOR,
                        VALORSTRING: VALOR.toFixed(2).replace(".", ","),
                        id,
                        headerKey: y.name,
                        isEditing: false,
                        canEdit: !y.readOnly
                    }
                }
                else {
                    values[id] = {
                        id,
                        ANO: y.year + "-01-01T00:00:00",
                        VALOR: 0,
                        VALORSTRING: "0,00",
                        headerKey: y.name,
                        VALORANTERIOR: 0,
                        isEditing: false,
                        canEdit: false
                    }
                }
                return id;
            })

            return a;
        })
        return p;
    })



    return { values, output };
}

export default {
    name: "orcamento-publico-reajustar",

    data: () => {
        return {
            TIPO: "PPA",
            data: {},
            headers: [{
                title: "Açoes orçamentárias",
                name: "ACOESPROJETO",
                groupBy: true,
                visible: true,
                span: 2,
            }],
            years: [
            ],
        };
    },
    components: {
        Fragment: {
            functional: true,
            render: (h, ctx) => ctx.children
        }
    },
    methods: {
        onInput(classificacao, e) {

            let value = e.target.value;
            let preCleanedValue = value.replace(/[^0-9,]/g, '');
            let [cleanedNumber, cleanedDecimal] = preCleanedValue.split(",");
            let cleanedValue = cleanedNumber + (preCleanedValue.includes(",") ? "," : "") + (cleanedDecimal ? ((cleanedDecimal).substring(0, 2)) : "")


            let valueFloat = parseFloat(cleanedValue.replace(",", "."))

            e.target.value = cleanedValue;

            this.data.values[classificacao].VALORSTRING = cleanedValue;
            this.data.values[classificacao].VALOR = parseFloat(cleanedValue.replace(",", "."));

        },
        getPercentage: ({ VALORANTERIOR, VALOR }) => {

            if (VALORANTERIOR == 0)
                return "100%";

            const percentage = parseFloat(VALOR / VALORANTERIOR * 100) - 100;
            return percentage.toFixed(1) + "%"

        },

        toggleEditMode(id) {

            if (!this.data.values[id].canEdit)
                return;

            this.data.values[id].isEditing = !this.data.values[id].isEditing;
            if (this.data.values[id].isEditing)
                this.$nextTick(() => {
                    if (this.$refs.inputRef && this.$refs.inputRef.length > 0)
                        this.$refs.inputRef[0].focus();
                });

        },
        calculateSum(projeto, headerKey) {

            return projeto.CHILDRENS.reduce((acc, acao) => {
                return acc + acao.CLASSIFICACOES.filter(c => this.data.values[c].headerKey == headerKey).reduce((acc, c) => acc + this.data.values[c].VALOR, 0)
            }, 0)
        },
        formatMoney(value) {
            if (!parseFloat(value))
                return "R$ 0,00"

            let [number, decimal] = (parseFloat(value).toFixed(2)).toString().split(".");
            let numberFormatted = number.replace(/\B(?=(\d{3})+(?!\d))/g, '.')
            return "R$ " + numberFormatted + "," + decimal
        },
        render(data, reajuste = 0, anoInicial, anoFinal) {


            if (anoInicial == anoFinal) {
                this.years = [{
                    title: "Valor Anterior",
                    name: "VALORANTERIOR",
                    year: anoInicial,
                    readOnly: true,
                    allowReadjust: false
                },
                {
                    title: "Valor",
                    year: anoInicial,
                    name: "VALOR",
                    readOnly: false,
                    allowReadjust: true
                }
                ]
            } else {
                this.years = [...new Array(anoFinal - anoInicial + 1)].map((_, i) => ({
                    title: (anoInicial + i).toString(),
                    year: anoInicial + i,
                    name: (anoInicial + i).toString(),
                    readOnly: false,
                    allowReadjust: true
                }))
            }

            this.data = transformInputToOutput(data, this.years, reajuste)




        },
        getData() {
            return Object.values(this.data.values).filter(item => item.VALOR != item.VALORANTERIOR)
        }
    },
    created() {
    },
};
</script>

<style>
.orcpub-reajuste table {
    width: 100%;
    border-collapse: collapse;
}

.orcpub-reajuste tr:hover td {
    background-color: #EFEFEF;
    transition: background 200ms;
}

.orcpub-reajuste th {
    border-left: 1px solid #eeeeee;
    border-right: 1px solid #eeeeee;
    background-color: #037fff33;
    color: #037fff;
    padding: 0px 12px;
    height: 36px !important;

}

.orcpub-reajuste td {
    border: 1px solid #eeeeee;
    background-color: #ffffff;
    height: 38px;
}

.orcpub-reajuste td.td-hidden {
    border: 1px solid #eeeeee;
    background-color: #eeeeee;
}

.orcpub-reajuste .value svg {
    z-index: 2;
}

.orcpub-reajuste .value .arrow {
    position: absolute;
    width: 3px;
    background-color: #95938E22;
    left: 14px;
    top: -1px;
    z-index: 1;
}

.orcpub-reajuste td.td-editable:hover {
    font-weight: 600;
}

.orcpub-reajuste .value {
    padding: 0px 12px;
    display: flex;
    gap: 3px;
    height: 36px !important;
    white-space: nowrap;
    align-items: center;
    justify-content: space-between;
}

.orcpub-reajuste .th-value {
    height: 36px;
    padding: 0px 12px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 18px;
    gap: 8px;
}

.orcpub-reajuste .value.null {
    background: repeating-linear-gradient(-45deg,
            #ffffff,
            #ffffff 5px,
            #efefef 5px,
            #efefef 10px);
}

.orcpub-reajuste input {

    padding: 0 8px;
    outline: none;
    height: 38px;
    flex: 1;
    width: 100%;
    border-width: 1px;
    border-style: solid;
    border-color: #dddddd;
    border-radius: 6px !important;
    box-shadow: 0px 0px 16px 0px #00000055;
}

.orcpub-reajuste .td-count {
    width: 20px;
    height: 20px;
    border-radius: 12px !important;
    font-size: 12px;
    font-weight: 600;
    background-color: #efefef;
    display: flex;
    align-items: center;
    justify-content: center;
}


.orcpub-reajuste .percentage {
    padding: 2px 6px;
    border-radius: 6px !important;
    font-size: 12px;
    font-weight: 600;
}
</style>