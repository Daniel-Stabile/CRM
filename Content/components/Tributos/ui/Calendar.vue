<template>
  <div class="portlet calendar light portlet-fit bordered">
    <div class="portlet-title">
      <div class="caption">
        <i :class="iconClass + ' ' + titleColor"></i>
        <span class="caption-subject sbold uppercase" :class="titleColor">{{title}}</span>
      </div>
    </div>
    <div class="portlet-body" style="min-height: 300px">
      <div class="row">
        <div
          id="calendar"
          class="has-toolbar fc fc-ltr fc-unthemed"
          style="margin: 10px 10px 10px 10px;"
        ></div>
      </div>
    </div>
  </div>
</template>
<script>
import ptbrLocale from "../../../custom/fullcalendar/core/locales/pt-br";

export default {
  inheritAttrs: false,
  watch: {
    title: "init"
  },
  methods: {
    getClassName(val) {
      if (val == 3)
        return "bg-green-meadow bg-font-green-meadow border-green-meadow";
      else if (val == 2)
        return "bg-purple-sharp bg-font-purple-sharp border-purple-sharp";
      else return "bg-yellow-gold bg-font-yellow-gold border-yellow-gold";
    },
    init: function() {
      var recurringEvents = new Array();
      var eventos = JSON.parse(JSON.stringify(this.events));

      let self = this;
      $.each(eventos, function(key, event) {
        recurringEvents.push({
          ...event,
          className: self.getClassName(event.type) + " popovers"
        });
      });

      var calendarEl = document.getElementById("calendar");
      var calendar = new FullCalendar.Calendar(calendarEl, {
        header: {
          left: "title",
          center: "",
          right: "prevYear,prev,next,nextYear today dayGridMonth "
        },
        themeSystem: "bootstrap",
        plugins: ["dayGrid", "rrule", "interaction"],
        contentHeight: "auto", // para esconder a barra de rolagem
        locale: ptbrLocale,
        displayEventTime: false,
        events: recurringEvents,
        eventLimit: true,
        datesRender: function(selectionInfo) {
          self.$emit(
            "bc-date-change",
            moment(selectionInfo.view.currentStart).month()
          );
          $(".popover").remove();
          $('[data-toggle="popover"]').popover();
        },
        eventRender: function(info) {
          info.el.setAttribute("title", info.event.title);
          info.el.setAttribute("data-container", "body");
          info.el.setAttribute("data-toggle", "popover");
          info.el.setAttribute("data-placement", "top");
          if (info.event.extendedProps.description)
            info.el.setAttribute(
              "data-content",
              info.event.extendedProps.description
            );
        },
        eventClick: function(eventClickInfo) {
          self.$emit("bc-event-click", eventClickInfo);
        },
        dateClick: function(info) {
          self.$emit("bc-day-click", eventClickInfo);
        }
      });

      calendar.render();
    }
  },
  props: {
    title: {
      type: String,
      required: true
    },
    titleColor: {
      type: String,
      required: false
    },
    iconClass: {
      type: String,
      required: false,
      default: "fa fa-calendar"
    },
    events: {
      type: Array,
      required: true
    }
  }
};
</script>