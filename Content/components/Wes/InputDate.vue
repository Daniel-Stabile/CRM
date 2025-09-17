<template>
    <div v-bind:class="[ inputLabel ? 'form-group' : '']">
        <label class="control-label name column-nowrap" v-if="inputLabel">
            <div class="label-form">
                <div class="label-title">
                    {{inputLabel}}
                </div>
            </div>
        </label>
        <div>
            <div class="input-group">
                <input type="text" maxlength="10" ref="input" class="form-control placeholder-no-fix wes-input-date-picker" :id="inputId" :class="inputClass" v-model="date" placeholder="dd/mm/aaaa" pattern="([0-9]{2})[\\\/\.\-]([0-9]{2})[\\\/\.\-]([0-9]{4})" data-date-format="dd/mm/yyyy" data-type="date">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span>
            </div>
        </div>
    </div>
</template>

<script>
    import datepicker from '~/content/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker';

    export default {
        props: ['inputId', 'inputClass', 'inputLabel', 'inputValue'],
        data() {
            return {
                date: this.inputValue,
                datepicker: null,
                dateRaw: ''
            }
        },
        methods: {
            valueChanged() {
                this.$emit('updated', { value: this.date, raw: this.dateRaw });
            },
            datepickerValueChanged(evt) {
                this.date = evt.date.format("dd/MM/yyyy");
                this.dateRaw = (this.datepicker.datepicker('getUTCDate')).addDays(1);
                this.valueChanged();
            }
        },
        watch: {
            inputValue() {
                this.date = this.inputValue;
            }
        },
        mounted() {
            $.fn.datepicker.dates['pt-BR'] = {
                days: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado", "Domingo"],
                daysShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom"],
                daysMin: ["Do", "Se", "Te", "Qu", "Qu", "Se", "Sa", "Do"],
                months: ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"],
                monthsShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
                today: "Hoje",
                clear: "Limpar"
            };

            let dateControl = $('.wes-input-date-picker');
            this.datepicker = $(this.$refs.input).datepicker({
                todayBtn: "linked",
                language: "pt-BR",
                orientation: "auto left",
                autoclose: true
            })
                .off('focus')
                .click(function () {
                    $(this).datepicker('show');
                });

            dateControl.next().children('button').on('click', function (e) {
                e.preventDefault();
                var datePicker = $(this).parent().parent().find('.wes-input-date-picker');
                datePicker.datepicker('show');
                datePicker.focus();
            });

            dateControl.on('keypress', function (e) {
                if (e.key === 'h' || e.key === 'H' || e.charCode === 104 || e.keyCode === 72) {
                    $(this).datepicker('setDate', new Date());
                    $(this).change();
                    return;
                }
            });

            this.datepicker.on(
                'changeDate', this.datepickerValueChanged);

        }
    }

</script>

<style>
</style>