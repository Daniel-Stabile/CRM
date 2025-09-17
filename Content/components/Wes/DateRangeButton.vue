<template>
    <div class="input-group input-large date-picker input-daterange close-button">
        <input type="text" ref="startInput" class="form-control" name="start" @input="processarValorInserido" @blur="emitChange">        
        <span v-show="!onlyStart" ref="between" class="input-group-addon"> até </span>
        <input v-show="!onlyStart" type="text" ref="endInput" class="form-control" name="end" @input="processarValorInserido" @blur="emitChange">
        <span class="input-group-btn">
            <transition-group name="slide">
                <button v-if="gerarEnabled" class="btn blue" type="button" @click="apply" key="enabledbuttondate">                
                    {{buttonDescription}}
                </button>
                <button v-if="!gerarEnabled" class="btn blue disabled" type="button" key="disabledbuttondate">                
                    Carregando
                </button>
            </transition-group>
            
        </span>
    </div>
</template>
<script>
    export default {        
        props: {
            startDate : {
                default: ""
            },
            endDate: {
                default: ""
            },
            maxDate: {
                default: ""
            },
            minDate: {
                default: ""
            },
            buttonDescription: {
                default: "Aplicar"
            },
            gerarEnabled : {
                default: false
            },
            startView : {
                default: -1 // 0 - dia, 1 - mês, 2 - ano
            },
            onlyStart: {
                default: false
            },
            equalDates: {
                default: false
            }
        },
        data: function () {
            return {
                start: null,
                end: null,
                startText: "",
                endText: "",
                dayOptions : {
                    format: "dd/MM/yyyy",
                    datepickerFormat: "dd/mm/yyyy",
                    startView: "days",
                    startViewIndex: 0
                },
                monthOptions : {
                    format: "MM/yyyy",
                    datepickerFormat: "mm/yyyy",
                    startView: "months",
                    startViewIndex: 1
                },
                yearOptions : {
                    format: "yyyy",
                    datepickerFormat: "yyyy",
                    startView: "years",
                    startViewIndex: 2
                },
                defaultOptions: {
                    format: "dd/MM/yyyy",
                    datepickerFormat: "dd/mm/yyyy",
                    startView: "months",
                    startViewIndex: 1
                }
            }
        },
        computed: {
            dateOptions() {
                if (this.startView == 0) return this.dayOptions;
                else if (this.startView == 1) return this.monthOptions;
                else if (this.startView == 2) return this.yearOptions;
                else return this.defaultOptions;
            }
        },
        methods: {  
            emitChange(e) {
                if (this.dateOptions.startView == "months")
                    this.$emit(e.target.name + "-date-changed", e.target.name == "start" ?
                    moment($(e.target).datepicker("getDate")).startOf('month')._d : 
                    moment($(e.target).datepicker("getDate")).endOf('month')._d );

                if (this.dateOptions.startView == "days")
                    this.$emit(e.target.name + "-date-changed", moment($(e.target).datepicker("getDate"))._d);
            },
            processarValorInserido(e) {
                var valorInserido = e.target.value;
                var formatoSemBarras = this.dateOptions.format.replace(/\//g, "").toUpperCase();
                
                if (valorInserido.length == formatoSemBarras.length)
                {
                    var data = moment(valorInserido, formatoSemBarras);

                    if (data.isValid())
                        window.$(e.target).datepicker('update', data._d);
                }
            },                   
            apply: function () {
                if(!this.equalDates && this.start.toString() === this.end.toString()){                    
                    this.$emit('error-input', 1);
                } else if(this.start > this.end){                    
                    this.$emit('error-input', 2);
                } else {
                    this.$emit("apply", { start: this.start, end: this.end });
                }                
            },
            init: function() {
                this.startText = this.start.format(this.dateOptions.format);
                this.$refs.startInput.value = this.startText;
                this.endText = this.end.format(this.dateOptions.format);
                this.$refs.endInput.value = this.endText;

                let vm = this;

                let datepicker = window.$(this.$el).datepicker({
                    language: 'pt-BR',
                    orientation: "left",
                    format: vm.dateOptions.datepickerFormat,
                    startView: vm.dateOptions.startView,
                    minViewMode: vm.dateOptions.startView,
                    autoClose: true,
                    startDate: this.minDate,
                    endDate: this.maxDate
                }).on('changeDate', function (arg) {   
                    if (arg.target.name === "start"){
                        vm.start = arg.date;                                                     
                        window.$(vm.$refs.startInput).datepicker('hide');                                      
                        if (!vm.onlyStart)
                            window.$(vm.$refs.endInput).datepicker("show");
                    }                                                        
                        
                    if (arg.target.name === "end"){
                        var currentDate = arg.date;
                        if (vm.dateOptions.startViewIndex > 0)
                            currentDate = new Date(arg.date.getFullYear(), arg.date.getMonth() + 1, 0);
                        window.$(vm.$refs.endInput).datepicker('update', currentDate);
                        vm.end = currentDate;                                                                
                        window.$(vm.$refs.endInput).datepicker('hide');                             
                    }   
                    
                    if (vm.start && vm.end) {
                        vm.$emit("change", { event: arg, start: vm.start, end: vm.end });
                    }                
                });
            }
        },
        watch: {
            start(val) {
                this.$emit("start-date-changed", val);
            },
            end: function(val){
                this.endText = val.format(this.dateOptions.format);
                this.$emit("end-date-changed", val);             
            },
            startView: function(val){
                console.log("watch: ",val);
                this.start = new Date(this.start.getFullYear(), this.start.getMonth(), 1);;
                this.end = new Date(this.end.getFullYear(), this.end.getMonth() + 1, 0);
                    console.log("watch2: ", this.start, this.end);

                this.init();
            },
            startDate(val) {
                this.start = val;
                window.$(this.$refs.startInput).datepicker('update', val);
            },
            endDate(val) {
                this.end = val;
                window.$(this.$refs.endInput).datepicker('update', val);
            }
        },
        mounted: function () {
            if (!this.start && this.startDate) {
                this.start = this.startDate;                                
            } else {
                this.start = moment(new Date()).toDate().addDays(-1);
            }
            
            if (!this.end && this.endDate) {
                this.end = this.endDate;                
            } else {
                this.end = moment(new Date()).toDate();
            }
            
            this.init();
        }
    }
</script>