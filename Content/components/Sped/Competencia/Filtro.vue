<template>
     <div class="portlet light">
        <div class="portlet-title">
            <div class="caption collapsible" onclick="Benner.Widget.changeServerChromeState('ctl00_Main_FORMULARIO');" style="cursor: pointer;">
                <span class="caption-subject font-green-sharp bold uppercase">Competências</span>
            </div>
            <div class="tools">
                <a href="javascript:;" class="collapse" onclick="Benner.Widget.changeServerChromeState('ctl00_Main_FORMULARIO');" data-original-title="" title=""></a>
            </div>
        </div>
        <div class="portlet-body form">
            <div class="widget-body" data-widget-id="FORMULARIO">
                <div id="ctl00_Main_FORMULARIO_UpdatePanel">                   
                    <div id="ctl00_Main_FORMULARIO_PageControl" class="form-editor-view">
                        <div class="tab-content allow-focus borderless">
                            <div class="tab-pane active" id="FORMULARIO_GERAL">
                                <div id="ctl00_Main_FORMULARIO_PageControl_GERAL_GERAL" class="form-body form-horizontal legend-left-caption">
                    
                                    <div class="form-group">
                                        <label class="control-label col-md-2 col-sm-2">
                                            <div class="label-form">
                                                <div class="label-title">Ano</div>
                                            </div>
                                        </label>
                                        <div class="input-group col-md-2 col-sm-2 value">
                                            <wes-select @item-selected="anoChanged($event)" endpoint="ED_COMPETENCIAS" result-fields="ANO"></wes-select>
                                            
                                        </div>
                                        <!-- /input-group -->
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>        
    </div>
</template>
<script>
export default {
    methods: {
        anoChanged(e) {
            console.log(e);
            this.$emit("ano", e);
        }
    }
}
</script>
 