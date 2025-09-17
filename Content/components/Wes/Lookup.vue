<template>
  <select class="form-control" :disabled="!enabled"></select>
</template>

<script>
import LookupService from "../../services/LookupService";

export default {
  props: {
    entityName: { type: String },
    resultFields: { type: String },
    sc: { type: String },
    selectFirstUnique: { type: String },
    value: { type: Number },
    enabled: { type: Boolean, default: true },
    whereClauseSessionKey: { type: String, default: "" },
    placeholders: { type: Object, default() { return { enabled: "", disabled: "" } } }
  },
  data: function() {
    return {
      pageSize: 50,
      items: null,
      initialized: false
    };
  },
  methods: {
    select(item) {
      $(this.$el).append(new Option(item.nome, item.handle, true, true));
    },
    clear() {
      $(this.$el).val(null).trigger('change');
    },
    initSelect2: function() {
      var vm = this;
      LookupService.generateSearchContext(vm.entityName, vm.resultFields, vm.entityName + ".LOOKUP", vm.entityName, vm.whereClauseSessionKey)
        .then(response => {
          var searchContext = response.data;
          window
          .$(vm.$el)
          .select2({
            language: "pt-BR",
            allowClear: true,
            placeholder: vm.enabled ? vm.placeholders.enabled : vm.placeholders.disabled,
            ajax: {
              url: Benner.Page.getApplicationPath() + "api/search",
              dataType: "json",
              quietMillis: 200,
              type: "POST",
              data: function(params) {
                if (params.term === undefined) params.term = "";
                params.page = params.page || 1;
                return {
                  query: params.term,
                  sc: searchContext,
                };
              },
              processResults: function(data, params) {
                vm.items = data;
                return {
                  results: data,
                  pagination: {
                    more: data.length == vm.pageSize,
                  },
                };
              },
            },
          });

          if (!vm.initialized)
          {
            window.$(vm.$el)
            .on("change", function() {
              var eventoAEmitir = this.value ? "change" : "clear";
              vm.$emit(eventoAEmitir, Number(this.value));
            });

            vm.initialized = true;
          }

          if (vm.enabled && vm.selectFirstUnique) {
            setTimeout(() => {
              vm.internalSelectFirstUnique();
            }, 5000);
          }
        });
    },
    internalSelectFirstUnique: function() {
      if (!this.selectFirstUnique) return;
      if (this.items && this.items.length === 1) {
        window
          .$(this.$el)
          .val("1")
          .trigger("change");
      }
    },
  },
  mounted: function() {
    window.$.fn.select2.defaults.set("theme", "bootstrap");
    this.initSelect2();
    this.$emit("mounted");
  },
  watch: {
    value: function(value) {
      window
        .$(this.$el)
        .val(value)
        .trigger("change");
    },
    enabled: function(value) {
      this.initSelect2();
    }
  },
  destroyed: function() {
    window
      .$(this.$el)
      .off()
      .select2("destroy");
  },
};
</script>
