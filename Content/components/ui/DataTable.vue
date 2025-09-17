<template>
  <table id="benner-data-table-vue" class="table table-hover cell-border">
    <slot id="thead"></slot>
    <slot id="tbody"></slot>
    <slot id="tfloor"></slot>
  </table>
</template>

<script>
require("datatables/media/js/jquery.dataTables");

export default {
  props: {
    dataObject: {}
  },
  watch: {
    dataObject: function() {
      if (this.dataObject !== undefined)
        $("#benner-data-table-vue").DataTable({
          language: {
            loadingRecords: "Buscando...",
            search: "Procurar por:",
            lengthMenu: "Exibir _MENU_ por pagina",
            info: "Exibindo página _PAGE_ de _PAGES_",
            "zeroRecords:":
              "Nenhum registro encontrado com o filtro informado.",
            paginate: {
              previous: "Anterior",
              next: "Próxima"
            }
          },
          columnDefs: [
            { className: "encolherColuna", targets: "_all" },
            {
              targets: "_all",
              createdCell: function(td, cellData, rowData, row, col) {
                $(td).attr("data-toggle", "tooltip");
                $(td).attr("title", cellData);
              }
            }
          ],
          data: this.dataObject.Data,
          columns: this.dataObject.Headers
        });
    }
  }
};

$(document).ready(function() {
  $('[data-toggle="tooltip"]').tooltip();
});
</script>
<style>
.encolherColuna {
  white-space: nowrap;
  width: 100px;
  max-width: 105px;
  word-wrap: break-word;
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
