<template>
  <div class="dashboard-stat2 bordered collapsible" id="tileId">
    <div class="display">
      <a
        v-if="expandable"
        class="btn-icon-only btn-default btn-expand"
        style="height: 27px;text-align: center;padding: 2px 6px;width: 27px;"
        @click="TileClick()"
      >
        <i
          :id="'btExpand_'+title"
          class="fa fa-chevron-down rotate"
          style="color: gray;cursor: pointer;"
        ></i>
      </a>
      <div
        class="number middle-bar children"
        :class="align == 'right' ? 'right-align' : '' "
        style="display: table; width: 100%"
      >
        <small v-bind:style="{color: colorTitle}">{{title}}</small>

        <div class>
          <a
            v-if="expandable"
            :id="'collapse'+title"
            class="accordion-toggle collapsed"
            data-toggle="collapse"
            data-parent="#accordion1"
            :href="'#collapse_'+title"
          ></a>
          <div
            :id="'collapse_'+title"
            class="panel-collapse collapse"
            :class="expanded ? 'in' : ''"
          >
            <transition name="fade">
              <div v-if="showFullData" class="childrens">
                <div v-for="descValue of additionalDescValue" :key="descValue.description">
                  <small v-bind:style="{color: colorDescription}">{{descValue.description}}</small>
                  <h3
                    v-bind:style="{color: colorValueField}"
                    :class="colorTheme"
                    style="font-size: 25px;"
                  >
                    <span>{{getValueField(descValue.value)}}</span>
                  </h3>
                </div>
              </div>
            </transition>
          </div>
        </div>

        <div v-if="description">
          <small v-bind:style="{color: colorDescription}">{{description}}</small>
        </div>
        <div>
          <div>
            <h3
              v-bind:style="{color: colorValueField}"
              :class="colorTheme"
              style="font-size: 25px;"
            >
              <span>{{getValueField(valueField)}}</span>
            </h3>
          </div>
          <div v-if="!visibilityPerc" v-bind:style="{color: colorPerc() }">
            <i :class="iconPerc()"></i>
            <span
              style="font-weight: 600; margin-left: 2px;"
            >{{Math.round(Math.abs(percentage),2)}}%</span>
            <span
              style="font-size: 10px; color: gray; font-weight: 600;"
            >(em relação ao mês anterior)</span>
          </div>
        </div>
      </div>

      <div class="right-bar">
        <div v-if="iconMain">
          <div class="icon">
            <i :class="[iconMain, colorTheme]" v-bind:style="{color: colorIconMain}"></i>
          </div>
        </div>
        <a
          v-if="link"
          class="btn btn-circle btn-icon-only btn-default bottom-align"
          v-on:click="AbrirDetalhes()"
          style="height: 27px; padding: 2px 6px 2px; width: 27px; margin-top: 17px;"
        >
          <i class="fa fa-search" v-bind:style="{color: colorIconSearch}"></i>
        </a>
      </div>
    </div>
  </div>
</template>
<script>
import _ from "lodash";
export default {
  methods: {
    TileClick() {
      if (this.expandable && !this.expanding) {
        this.showFullData = !this.showFullData;
        this.expanding = true;

        $("#btExpand_" + this.title).toggleClass("rotating");

        $("#collapse" + this.title).click();

        setTimeout(
          function() {
            this.expanding = false;
          }.bind(this),
          1000
        );
      }
    },
    AbrirDetalhes() {
      Benner.ModalPage.show({
        url: this.link,
        displayTitle: false,
        displayFooter: false,
        buttonLabel: "Fechar",
        size: "large",
        height: parseInt($(window).height() * 0.7),
        triggeredByCommand: false
      });
    },
    getValueField(value) {
      return this.isMoney ? FormatMoney(value) : value;
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
  data: function() {
    return {
      showFullData: true,
      isCollapsed: true, // usar com icone de expansao
      expanding: false
    };
  },
  created() {
    this.showFullData = this.expanded;
    //this.showFullData = _.debounce(this.filtrar, 500);
  },
  props: {
    link: {
      type: String,
      required: false
    },
    title: {
      type: String,
      required: true
    },
    description: {
      type: String,
      required: false
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
    colorDescription: {
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
    colorTheme: {
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
    },
    align: {
      type: String,
      required: false,
      default: "left"
    },
    expanded: {
      type: Boolean,
      required: false,
      default: false
    },
    expandable: {
      type: Boolean,
      required: false,
      default: true
    },
    additionalDescValue: {
      type: Array,
      required: false,
      default: () => []
    }
  }
};
</script>

<style scoped>
.rotate {
  transition: transform 0.5s ease-in-out;
}
.rotating {
  transform: rotateZ(-180deg);
}

.fade-enter-active,
.fade-leave-active {
  transition: opacity 1s;
}
.fade-enter,
.fade-leave-to {
  opacity: 0;
}

.display {
  display: flex;
  width: 100%;
}

.right-bar {
  flex: 0 10%;
  min-width: 30px;
  text-align: right;
  position: relative;
}

.middle-bar {
  flex: 1;
}

.dashboard-stat2 .display .icon {
  float: inherit !important;
}

.right-align {
  text-align: right !important;
  padding-right: 10px !important;
}

.bottom-align {
  position: absolute;
  bottom: 0;
  right: 1px;
}

.btn-expand {
  margin-right: 10px;
}
</style>
