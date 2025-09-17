function htmlEncode(value) {
    return $('<div/>').text(value).html();
};
function callPostBack(data, action, widgetId, controllerId) {
    var widgetId = $("#widgetId").val();
    var controllerId = $("#controllerId").val();
    __doPostBack(
        widgetId,
        controllerId + '$' + action + '$' + htmlEncode(JSON.stringify(data)));
};
function addToArray(targetArray, item) {
    var index = targetArray.indexOf(item);
    if (index > -1)
        return;
    targetArray.push(item);
};
function removeFromArray(targetArray, item) {
    var index = targetArray.indexOf(item);
    if (index > -1)
        targetArray.splice(index, 1);
};
function toggleAll(input, grid) {
    var conciliacao = JSON.parse($("#conciliacao").val());
    var checkBox = $(input);
    var table = checkBox.closest("table");
    var checked = checkBox.is(":checked");
    var targetArray = null;
    if (grid == "extrato") {
        targetArray = conciliacao.SelecionadosNoExtrato;
        conciliacao.SelecionarTodosNoExtrato = checked;
    }
    else {
        targetArray = conciliacao.SelecionadosNoSistema;
        conciliacao.SelecionarTodosNoSistema = checked;
    }
    var action = checked
        ? function (item) { addToArray(targetArray, item); }
        : function (item) { removeFromArray(targetArray, item); };
    table.find("tr.help-tooltip").each(function () {
        var handle = parseInt($(this).attr('handle'));
        action(handle);
    });
    callPostBack(conciliacao, "Toggle");
};
function toggleItem(input, grid) {
    var conciliacao = JSON.parse($("#conciliacao").val());
    var checkBox = $(input);
    var tr = checkBox.closest("tr");
    var handle = parseInt(tr.attr('handle'));
    if (checkBox.is(":checked")) {
        tr.addClass("active");
        addToArray(
            grid == "extrato"
                ? conciliacao.SelecionadosNoExtrato
                : conciliacao.SelecionadosNoSistema,
            handle);
    }
    else {
        tr.removeClass("active");
        removeFromArray(
            grid == "extrato"
                ? conciliacao.SelecionadosNoExtrato
                : conciliacao.SelecionadosNoSistema,
            handle);
    }
    callPostBack(conciliacao, "Toggle");
};
function conciliar() {
    var conciliacao = JSON.parse($("#conciliacao").val());
    callPostBack(conciliacao, 'Conciliar');
};
function lancarDiferenca() {
    var conciliacao = JSON.parse($("#conciliacao").val());
    callPostBack(conciliacao, 'LancarDiferenca');
};