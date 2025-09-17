<template>
  <div class="dashboard-stat2 bordered">
    <div class="display">
      <div class="number">
        <small v-bind:style="{color: colorTitle}">{{title}}</small>
        <div>
          <div>
            <h3 v-bind:style="{color: colorValueField}" style="font-size: 25px;">
              <span>{{getValueField()}}</span>
            </h3>
          </div>
          <div v-bind:style="{color: colorPerc(), visibility: visibilityPerc }">
            <i :class="iconPerc()"></i>
            <span style="font-weight: 600; margin-left: 2px;">{{Math.round(Math.abs(percentage),2)}}%</span>
            <span style="font-size: 10px; color: gray; font-weight: 600;"> (em relação ao mês anterior)</span>
          </div>
        </div>
      </div>
      <div style="display: table; float: right;">
        <div style="display: table-row;">
          <div class="icon">
            <i :class="iconMain" v-bind:style="{color: colorIconMain}"></i>
          </div>
        </div>
        <a class="btn btn-circle btn-icon-only btn-default" v-on:click="AbrirDetalhes()" style="height: 27px; padding: 2px 6px 2px; width: 27px; margin-top: 17px;">
            <i class="fa fa-search" v-bind:style="{color: colorIconSearch}"></i>
        </a>
      </div>
    </div>
  </div>
</template>
<script>
module.exports = {
  methods: {
    AbrirDetalhes(){
      Benner.ModalPage.show(
        {
          url: this.link,
          displayTitle: false,
          displayFooter: false,
          buttonLabel:'Fechar',
          size:'large',
          height: parseInt($(window).height() * 0.7),
          triggeredByCommand: false
        });
    },
    getValueField() {
      return this.isMoney ? FormatMoney(this.valueField) : this.valueField;
    },
    colorPerc() {
      if (this.percentage >= 0) return "green";
      else return "rgb(206, 18, 18)";
    },
    iconPerc() {
      if (this.percentage >= 0) return "fa fa-level-up";
      else return "fa fa-level-down";
    }
  },
  props: {
    link:{
      type: String,
      required: false
    },
    title: {
      type: String,
      required: true
    },
    valueField: {
      type: Number,
      required: true
    },
    percentage: {
      type: Number,
      required: false
    },
    colorTitle: {
      type: String,
      required: false
    },
    colorValueField: {
      type: String,
      required: false
    },
    iconMain: {
      type: String,
      required: false
    },
    colorIconMain: {
      type: String,
      required: false
    },
    colorIconSearch: {
      type: String,
      required: false
    },
    visibilityPerc: {
      type: String,
      required: false,
      default: ""
    },
    isMoney: {
      type: Boolean,
      required: false,
      default: false
    }
  }
};
</script>