<template>
  <div>
    <div
      class="modal fade"
      id="modalExemplo"
      tabindex="-1"
      role="dialog"
      aria-labelledby="exampleModalLabel"
      aria-hidden="true"
    >
      <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <button
              type="button"
              class="close"
              data-dismiss="modal"
              v-on:click="limparDataTable()"
              aria-label="Fechar"
            >
              <span aria-hidden="true">&times;</span>
            </button>
            <slot name="header">
              <h5 class="modal-title" id="exampleModalLabel">{{tituloModal}}</h5>
            </slot>
          </div>
          <div class="modal-body" style="overflow: scroll;">
            <slot name="body"></slot>
          </div>
          <div class="modal-footer">
            <slot name="footer">
              <button
                type="button"
                class="btn btn-secondary"
                v-on:click="limparDataTable()"
                data-dismiss="modal"
              >{{textoBotao}}</button>
            </slot>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  props: {
    tituloModal: {
      type: String,
      default: ""
    },
    textoBotao: {
      type: String,
      default: "Fechar"
    }
  },
  methods: {
    limparDataTable: function() {
      $("#benner-data-table-vue")
        .dataTable()
        .fnDestroy();
    }
  }
};
</script>

<style scoped>
.modal-body {
  max-height: 512px;
}
</style>