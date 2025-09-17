$(document).ready(function () {
    LoadInfoTiles();
});

function GetHandlePessoa() {
    return $('#ctl00_Main_PESSOA_HANDLE_HiddenField').val();
}

function GetTipo() {
    const urlParams = new URLSearchParams(window.location.search);
    const myParam = urlParams.get('tp');

    if (myParam != null) {
        if (myParam.toString() == "4") {
            return "S";
        }
        else if (myParam.toString() == "3") {
            return "E";
        }
    }

    return "";
}

function LoadInfoTiles() {
    spars = JSON.stringify({ 'handlePessoa': GetHandlePessoa(), 'tipo': GetTipo() });
    $.ajax({
        type: "POST",
        url: "adt_fornecedor_cliente.aspx/BuscarValoresTiles",
        data: spars,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            bindTiles(response.d);
        }
    });
}

function bindTiles(prDados) {
    setNoteValue("CUSTOM_QTD_ADTOS", prDados.QuantidadePagos);
    setNoteValue("CUSTOM_QTD_COMPENSADOS", prDados.QuantidadeCompensados);
    setNoteValue("CUSTOM_VALOR_ADTO", prDados.ValorPagos);
    setNoteValue("CUSTOM_VALOR_COMPENSADOS", prDados.ValorCompensados);
    setNoteValue("CUSTOM_MEDIO_ADTO", prDados.MediaPagos);
    setNoteValue("CUSTOM_MEDIO_COMPENSADOS", prDados.MediaCompensados);
}

function setNoteValue(field, value) {
    $('.somatorio').find('[data-field="' + field + '"]').text(" " + value);
}
