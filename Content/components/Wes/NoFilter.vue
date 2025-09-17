<template>
    <div>                
        <div align="center">
            <div class="col-md-3 col-md-offset-5">
                <img style="max-width:100%;max-height:100%" :src="imageRelativeUri" />
            </div>                
        </div>                     
        <div class="col-md-12">
            <div align="center">
                <h2>Não há filtros <u><i>{{filter}}</i></u> disponiveis :(</h2>
            </div>
        </div>        
    </div>    
</template>
<script>
    export default {
        props:["imageRelativeUri", "filter"]
    }
</script>
