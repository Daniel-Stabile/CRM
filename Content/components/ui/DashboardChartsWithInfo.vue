<template>
    <div class="portlet solid bordered white">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-bar-chart-o null"></i>            
                <span class="null">{{title}}</span>                           
            </div>
            <div class="tools">
                <i @click="exportar()" class="fa fa-download" style="cursor: pointer"></i> 
            </div>
        </div>
        <div class="row">
            <div class="portlet-body">
                <div class="col-lg-7 col-xs-6 col-sm-6">
                    <ui-dashboard-charts-no-title :id="idGrafico" :heightChart="heightChart" />
                </div>
                <div class="col-lg-5 col-xs-6 col-sm-6">
                    <div class="col-lg-12" v-for="(item, index) in obterInfos()" :key="index">
                        <br />
                        <span style="font-size: 25px; font-weight: bold; text-align: left;">{{ item.Valor }}</span>
                        <br />
                        <span style="font-size: 12px; text-align: left;">{{item.Nome}}</span>
                        <br /> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
    export default {
        props: {
            title: {
                default: ""
            },
            idGrafico: {
                default: "chartDashboard"
            },
            heightChart: {
                default: "26vh"
            },
            infos:{
                default: []
            }
        },
        methods: {
            obterInfos(){
                return this.infos;
            },
            exportar(){
                this.$emit("exportar");
            }
        }
    }
</script>
