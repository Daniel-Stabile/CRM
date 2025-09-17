<template>
    <div class="btn blue">
        <i class="fa fa-calendar"></i>&nbsp;
        <span></span>
        <b class="fa fa-angle-down"></b>
    </div>
</template>
<script>
    import moment from 'moment';
    export default {
        props: ["start", "end"],
        computed: {
            startDate: function () {
                return (this.start) ? moment(this.start) : moment();
            },
            endDate: function () {  
                return (this.end) ? moment(this.end) : moment();
            }
        },
        methods: {
            loadDateRange: function (start, end)
            {
                $(this.$el).find('span').html(start.locale('pt-br').format('MMMM D, YYYY') + ' - ' + end.locale('pt-br').format('MMMM D, YYYY'));
            }
        },
        mounted: function () {            
            $(this.$el).daterangepicker({
                startDate: this.startDate,
                endDate: this.endDate,
                locale: 'br',
                opens: 'left',
                drops: 'left',
                ranges: {
                    'Hoje': [moment(), moment()],
                    'Ontem': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    'Últimos 7 dias': [moment().subtract(6, 'days'), moment()],
                    'Últimos 30 dias': [moment().subtract(29, 'days'), moment()],
                    'Este mês': [moment().startOf('month'), moment().endOf('month')],
                    'Últimos mês': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                locale: {
                    applyLabel: 'Aplicar',
                    cancelLabel: 'Cancelar',
                    customRangeLabel: 'Customizado',
                }
            }, this.loadDateRange);

            let vm = this;
            $(this.$el).on('apply.daterangepicker', function (ev, picker) {
                vm.$emit("apply", { event: ev, picker: picker, start: picker.startDate.toDate(), end: picker.endDate.toDate() });
            });

            this.loadDateRange(this.startDate, this.endDate);
        }
    }
</script>