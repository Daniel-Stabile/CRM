<template>
    <div>
      <div class="col-md-4">
        <h1 class="page-title">{{titulo}} <small>{{subtitulo}}</small></h1>
      </div>
      <div class="col-md-4">
        <label id="lblMsgmColeta" style="width: 100%;text-align: right;padding: 9px 0px;font-size: 13px;font-weight: 600">
            {{mensagemColeta}}
        </label>
      </div>
      <div class="col-md-2">
        <a id="btnColetar"
          v-show="permiteColetar"
          class="btn btn-block btn-primary"
          :disabled="desabilitaColeta"
          @click="coletarClick()">
            Coletar
        </a>
      </div>
      <div class="col-md-2">
        <div class="form-group">
          <div class="input-group" id="inptCompetencia">
            <input 
              v-model="dataComp"
              autocomplete="off"
              class="aga-date datepicker form-control"
              data-name="Competencia"
              type="text"
              data-type="date"
              data-clear-btn="true"
              maxlength="7"
              placeholder="mm/aaaa"
              data-date-format="mm/yyyy"
              data-date-min-view-mode="months"
              data-date-start-view="year"
              v-on:change="competenciaChange($event)">
            <span class="input-group-btn">
              <button class="btn btn-default btn-sm" type="button">
                <i class="fa fa-calendar"></i>
              </button>
            </span>
          </div>
        </div>
      </div>
    </div>
</template>
<script>
    export default {
        props: {
            titulo:{
              default: "Título"
            },
            subtitulo:{
              default: "subtítulo"
            },
            mensagemColeta : {
              default: ""
            },
            permiteColetar: {
              type: Boolean,
              default: false
            },
            desabilitaColeta: {
              default: false
            },
            dataComp:{
              default: ""
            }
        },
        methods: { 
          coletarClick() {
              this.$emit("coletarClick");
          },
          competenciaChange: function(evt) {
            var data = evt.target.value;
            if(data != this.dataComp)
              this.$emit('competenciaChanged', { data: data });
          } 
        },
        mounted: function() {
            $(".datepicker").on("select", this.competenciaChange);
        }
    }
</script>