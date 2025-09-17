import Page from './Page';
import Search from './Search';

var Control = function () {
};

Control.focusRestored = false;

Control.callFieldEventScript = function (formViewClientId, fieldName, focusNextField) {

    if (formViewClientId) {

        if (focusNextField === true)
            Control.storeCurrentFocus(null, "next");
        else
            Control.storeCurrentFocus(null, "same");
        //Correção para IE9 para o erro de acesso ao 'caller' no modo strict
        setTimeout(function () {
            __doPostBack(formViewClientId, "firefieldevent$" + fieldName);
            Search.close();
            $('.datepicker').datepicker('hide');
        }, 1);
    }
};

Control.callControlEventScript = function (formViewClientId, fieldName, controlClientId) {
    var control = document.getElementById(controlClientId);

    // armazenar o focus atual para restaurar após o postback
    Control.storeCurrentFocus(control, "next");

    //força blur por esse método é executado depois do change, como change dá um postback o blur não era executado
    if (control && control.onblur != null)
        control.onblur();

    if (control && $(control).data("events") !== undefined &&
        $(control).data("events")["blur"] !== undefined &&
        !$(control).hasClass("input-mask"))
    {
        $(control).blur();
    }
    Control.callFieldEventScript(formViewClientId, fieldName, true);
};

Control.callDateTimeControlEventScript = function (formViewClientId, fieldName, controlClientId, dateControlClientId, timeControlClientId) {
    var dateVal = $.trim($(document.getElementById(dateControlClientId)).val());
    var timeVal = $.trim($(document.getElementById(timeControlClientId)).val());

    if ((dateVal === "" && timeVal === "") || (dateVal !== "" && timeVal !== ""))
    {
        this.callControlEventScript(formViewClientId, fieldName, controlClientId);
    }
};

Control.storeCurrentFocus = function (currentControl, focusAt) {

    var assigned = $('body').data('last-focus');

    // caso já tenha sido armazenado, não sobrescreva! (BennerSearch.js agradece)
    if (assigned && assigned.length)
        return;

    if (currentControl == null)
        currentControl = document.activeElement;

    // pega o primeiro 'container' que tenha um id
    if ($(currentControl).attr('id') === undefined) {
        if ($(currentControl).context === undefined)
            currentControl = $(currentControl).closest("[id][id!='']");
        else
            currentControl = $(currentControl).context.children;
    }

    // caso não encontre nenhum, não tem o que fazer..
    if (currentControl == null)
        return;
    
    $('body').data('last-focus', $(currentControl).attr('id'));
    $('body').data('focus-at', focusAt);

    Control.focusRestored = false;
};

Control.restoreFocus = function () {

    var lastFocusId = $('body').data('last-focus');
    $('body').data('last-focus', '');

    var focusAt = $('body').data('focus-at');
    $('body').data('focus-at', '');

    if (Control.focusRestored &&
        lastFocusId === '')
        return;

    Control.focusRestored = true;

    if (focusAt === "ignore" || Page.isMobile.any)
        return;

    // se não tem informação, foca no primeiro e vaza!
    if (!lastFocusId || !lastFocusId.length) {
        $(".widget").first().focusOnFirstField();
        return;
    }

    // senão, verifica onde é para focar
    switch (focusAt) {
        case "next":
            $('#' + lastFocusId).focusOnNextField();
            return;
        case "same":
            $('#' + lastFocusId).focus();
			$('#' + lastFocusId).select();

			if ($('#' + lastFocusId).length > 0 && lastFocusId.endsWith("_select")) {
				var focusElement;
				if ($('#' + lastFocusId).is('[multiple]'))
					focusElement = $(`#${lastFocusId}`).parent().find('input:first');
				else
					focusElement = $(`#${lastFocusId}`).parent().find('span.select2-selection');
				$(focusElement).focus();
				$(focusElement).select();
            }
            return;
        case "first-child":
            $('#' + lastFocusId).focusOnFirstField();
            return;
    }
};

Control.getControlByDataField = function (fieldName, containerControl) {
    var control = Control.getControlByAttribNameAndValue("data-field", fieldName, containerControl);
    if (control) {
        return control;
    }

    control = tryRecoverControlByFieldNameAndPrefix(fieldName, containerControl)
    if (control) {
        return control;
    }

    control = tryRecoverControlByFieldNameAndPostfix(fieldName, containerControl)

    return control;
};

Control.getControlByAttribNameAndValue = function (name, value, containerControl) {
    var targetControl = $(containerControl).find(`[${name}='${value}']`);

    if (targetControl.length > 0)
        return targetControl[0];

    return null;
};

function tryRecoverControlByFieldNameAndPrefix(value, containerControl) {
    var targetControl = $(containerControl).find(`[data-field$='__${value}']`);
    if (targetControl.length > 0)
        return targetControl[0];

    return null;
}

function tryRecoverControlByFieldNameAndPostfix(value, containerControl) {
    var targetControl = $(containerControl).find(`[data-field^='${value}__']`);
    if (targetControl.length > 0)
        return targetControl[0];

    return null;
}

export default Control;