<template>
    <div class="portlet-body" style="height: auto;">
        <div class="">
            
            <contabil-balancete-pivot-grid          
                title="Balancete">
                    
                <template slot="filtro">
                    <contabil-balancete-filtro color-selected="blue" color-deselected="white">
                       
                    </contabil-balancete-filtro>
                </template>

            </contabil-balancete-pivot-grid>

        </div>
    </div>
</template>
<script>
export default {
    
};
</script>