<template>
        <div 
          class="chart" 
          :id="idGrafico" 
          controllersufix
          height="26vh" 
          width="" 
          style="height: 26vh; overflow: hidden; text-align: left;"
          v-bind:style="{height: heightChart}"></div>

</template>
<script>
    export default {     
        props: {
            idGrafico: {
                default: "chartDashboard"
            },
            heightChart: {
                default: "26vh"
            }
        }
        
    }
</script>

