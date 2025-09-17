<template>
    <div class="row">
        <div :class="classparcelas" style="padding-left: 0px;">
            <div class="col-md-6">
                <wes-input-number
                        inputClass="text-center"
                        inputId="n-parcelas"
                        inputLabel="Número de parcelas"
                        v-on:updated="updateRowsLength($event)">
                </wes-input-number>
            </div>
            <div class="col-md-6">
                <wes-input-date
                        :inputValue="date"
                        inputClass="text-center"
                        inputId="n-firstDate"
                        inputLabel="Data do primeiro vencimento"
                        ref="firstDate"
                        v-on:updated="updateFirstDate($event)">
                </wes-input-date>
            </div>
        </div>
        <div :class="classparcelas">
            <div class="col-md-12 text-right">
                <label class="control-label name column-nowrap">
                    <div class="label-form">
                        <div class="label-title">
                            Saldo restante R$
                            <span class="saldo-restante">0,00</span>
                        </div>
                    </div>
                </label>
            </div>
            <div class="dataTables_wrapper no-footer " id="sample_editable_1_wrapper">
                <div class="table-scrollable">
                    <table class="table table-striped table-hover table-bordered dataTable no-footer" id="sample_editable_1" role="grid">
                        <thead>
                            <tr role="row">
                                <th class="text-center" style="width: 100px;">Parcelas </th>
                                <th class="text-center" style="width: 100px;">Vencimento </th>
                                <th class="text-center" style="width: 100px;">Valor </th>
                            </tr>
                        </thead>
                        <tbody>

                            <tr :key="row._id" class="odd" role="row" v-for="row in rows">
                                <td class="text-center">
                                    <span>{{row.id}}/{{rowLength}}</span>
                                </td>
                                <td>
                                    <wes-input-date
                                            :id="row.id"
                                            :inputValue="row.date"
                                            inputClass="text-center"
                                            inputLabel=""
                                            ref="installmentsDate"
                                            v-on:updated="updateInstallmentsDate($event, row._id)">
                                    </wes-input-date>
                                </td>
                                <td>
                                    <div class="input-group col-centered form">
                                        <input 
                                                class="form-control currency"
                                                v-model="row._valor"
                                                v-money="money"
                                                v-on:updated="updateValue()"
                                                @keyup="updateValue()"
                                        />
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-md-12 text-right">
                <label class="control-label name column-nowrap">
                    <div class="label-form">
                        <div class="label-title">
                            Saldo restante R$
                            <span class="saldo-restante" id="saldo-restante">0,00</span>
                        </div>
                    </div>
                </label>
            </div>
        </div>
    </div>
</template>
<script>
    import {VMoney} from 'v-money';
    import currency from 'currency.js';
    import InputNumber from '../Wes/InputNumber.vue';
    import InputDate from '../Wes/InputDate.vue';
    import Parcela from './Parcela.js';

    export default {
        props: {
            classparcelas: {
                type: String,
                required: false,
                default: 'col-md-6'
            }
        },
        components: {
            'input-number': InputNumber,
            'input-date': InputDate
        },
        data() {
            return {
                rowLength: 1,
                rows: [],
                date: '',
                dateRaw: '',
                initialMaturityDate: '',
                total: 0,
                totalInRows: 0,
                leftOver: 0,
                money: {
                    decimal: ',',
                    thousands: '.',
                    prefix: '',
                    suffix: '',
                    precision: 2,
                    masked: false
                }
            }
        },
        directives: {money: VMoney},
        methods: {
            updateRowsLength(args) {
                this.rowLength = args.value;
                this.$emit('updated');
            },
            buildRows() {
                const rows = this.rows;
                while (this.rowLength < rows.length) {
                    rows.pop();
                }
                while (this.rowLength > rows.length) {
                    let dateRef = new Date(this.dateRaw);
                    let date = this.addMonthsToDate(rows.length, dateRef);
                    let dateFormated = this.formatDate(date);
                    rows.push(new Parcela(rows.length + 1, dateFormated));
                    this.validateDateByInitialMaturityDate(dateFormated);
                }
            },
            updateFirstDate(args) {
                this.date = args.value;
                this.dateRaw = args.raw;
                this.$emit('updated', { value: this.rows });
            },
            updateInstallmentsDate(args, rowIndex) {
                this.validateDateByInitialMaturityDate(args.value);
                this.rows[rowIndex - 1]._date = args.value;
                this.$emit('updated', { value: this.rows });
            },
            updateValue() {
                this.totalInRows = 0;
                console.log(this.rows);
                this.rows.forEach(row => {
                    const valor = row.valor.indexOf(',') > -1 ?
                        currency(row.valor, 
                            {
                                separator: '.',
                                decimal: ','
                            }).value : parseFloat(row.valor);
                    this.totalInRows += valor;
                    console.log(row.valor);
                });
                this.leftOver = this.total - this.totalInRows;
                
                $('.saldo-restante').text(currency(this.leftOver, 
                    {
                        separator: '.',
                        decimal: ','
                    }).format());
                
                this.$emit('updated', { value: this.rows });
            },
            addMonthsToDate(months, date) {
                let newDate = new Date(date);
                newDate.setMonth(date.getMonth() + months);
                return newDate;
            },
            validateDateByInitialMaturityDate(dateInputed) {
                if (this.initialMaturityDate !== '') {
                    dateInputed = dateInputed.split('/');
                    dateInputed = new Date(dateInputed[2], dateInputed[1], dateInputed[0]);
                    let initialMaturityDate = this.initialMaturityDate.split('/');
                    initialMaturityDate = new Date(initialMaturityDate[2], initialMaturityDate[1], initialMaturityDate[0]);

                    if (initialMaturityDate >= dateInputed)
                        toastr.info("Usuário sem permissão para incluir vencimentos inferiores a " + this.initialMaturityDate + "!", "Atenção", "");
                }
            },
            formatDate(date) {
                const day = date.getDate().toString(),
                    dayF = (day.length === 1) ? '0' + day : day,
                    month = (date.getMonth() + 1).toString(), //+1 pois no getMonth Janeiro começa com zero.
                    monthF = (month.length === 1) ? '0' + month : month,
                    yearF = date.getFullYear();
                return dayF + "/" + monthF + "/" + yearF;
            },
            setAverageCurrencyEachInstallments() {
                if (this.total !== '') {
                    let valorParcela = this.total / this.rowLength;
                    let valorSomarizado = 0;
                    for (let i = 0; i < this.rows.length; i++) {
                        let valorParcelaArredondada;
                        if (i === this.rows.length - 1) //arredonda na ultima parcela
                            valorParcelaArredondada = (this.total - valorSomarizado).toFixed(2);
                        else
                            valorParcelaArredondada = valorParcela.toFixed(2);

                        valorSomarizado += parseFloat(valorParcelaArredondada);
                        this.rows[i]._valor = valorParcelaArredondada;
                    }
                }
            },
            updateRowLengthOrValue() {
                this.buildRows();
                this.setAverageCurrencyEachInstallments();
                this.updateValue();
                this.$emit('updated', { value: this.rows });
            }
        },
        watch: {
            rowLength() {
                this.updateRowLengthOrValue();
            },
            date() {
                for (let i = 0; i < this.rows.length; i++) {
                    let newDate = this.addMonthsToDate(i, this.dateRaw);
                    this.rows[i]._date = this.formatDate(newDate);
                }
            },
            total() {
                this.updateRowLengthOrValue();
            }
        },
        created() {
            this.dateRaw = new Date();
            this.date = this.formatDate(this.dateRaw);

            this.buildRows();
        }
    }

</script>
<style scoped>
    .col-centered {
        margin: 0 auto;
        float: none;
    }

    .currency {
        text-align: right;
    }
</style>

