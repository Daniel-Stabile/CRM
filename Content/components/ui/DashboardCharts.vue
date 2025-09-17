<template>
    <div class="portlet solid bordered grey-cararra">
        <div class="portlet-title">
            <div class="caption">
                <i class="fa fa-spin fa-cog"></i>
                Carregando...
            </div>
        </div>
        <div class="portlet-body">
            <div
                :id="idGrafico"
                class="chart"
                style="width: 100%; background-color: #FFFFFF;"
                v-bind:style="{height: heightChart}"></div>
        </div>
    </div>  
</template>

<script>
    export default {        
        props: {
            idGrafico: {
                default: "chartDashboard"
            },
            heightChart: {
                default: "400px"
            }
        }
    }
</script>
