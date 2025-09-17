/* global AGA */

AGA.Date = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // deve converter tipo Date para string
    publicMethods.setValue = function (selector, value) {
        var adjustedValue = (value instanceof Date) ?
            AGA.Helper.dateToStringDmy(value) :
            value;
        baseMethods.setValue(selector, adjustedValue);
    };

    publicMethods.getValue = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        var value = baseMethods.getValue(selector);
        if (value.length == 0) return "";
        var values = value.split("/");
        var date;
        var currentDate = new Date();
        if (values.length == 3) {
            date = new Date(parseInt(values[2]), parseInt(values[1]) - 1, parseInt(values[0]));
        } else if (values.length == 2) {
            date = new Date(parseInt(values[1]), parseInt(values[0]) - 1);
        } else if (values.length == 1) {
            if ($(element).data("date-format") == "yyyy") {
                if (value.length != 4) return "";
                if (parseInt(value) == 0) return "";
                date = new Date(parseInt(value), 0);
            } else {
                if (value.length == 0) return "";
                if (value.length == 1) value = "0" + value;
                if (parseInt(value) == 0) return "";
                if ($(element).data("date-format") == "mm/yyyy") {
                    if (value.length >= 3) {
                        values[0] = value.substring(0, 2);
                        values[1] = value.substring(2);
                        if (values[1].length == 1 || values[1].length == 3) return "";
                        if (values[1].length == 2)
                            values[1] = parseInt(values[1]) + 2000;
                        date = new Date(parseInt(values[1]), parseInt(values[0]) - 1);
                    }
                    else if (value.length == 2)
                        date = new Date(parseInt(currentDate.getFullYear()), parseInt(value)-1);
                } else {
                    if (value.length == 2) {
                        date = new Date(parseInt(currentDate.getFullYear()), parseInt(currentDate.getMonth()), parseInt(value));
                    } else if (value.length >= 3 && value.length <= 4) {
                        values[0] = value.substring(0, 2);
                        values[1] = value.substring(2);
                        if (values[1].length == 1) return "";
                        date = new Date(parseInt(currentDate.getFullYear()), parseInt(values[1]) - 1, parseInt(values[0]));
                    } else {
                        values[0] = value.substring(0, 2);
                        values[1] = value.substring(2, 4);
                        values[2] = value.substring(4);
                        if (values[2].length == 2) values[2] = 2000 + parseInt(values[2]);
                        else if (values[2].length != 4) return "";

                        date = new Date(parseInt(values[2]), parseInt(values[1]) - 1, parseInt(values[0]));
                    }
                }
            }
            
        }
        return (date.getDate() < 10 ? "0" : "") + date.getDate() + "/" + (date.getMonth() + 1 < 10 ? "0" : "") + (date.getMonth() + 1) + "/" + date.getFullYear();
    };

    // O botão que abre o calendário também deve ficar ReadOnly
    publicMethods.setReadOnly = function (selector, isReadOnly) {
        var element = AGA.Helper.resolveElement(selector);
        if (element) {
            var parent = element.parentNode;
            if ($(parent).hasClass("input-group")) {
                $(parent).find("button").each(function (idx, obj) {
                    obj.disabled = isReadOnly;
                });
            }
        }
        baseMethods.setReadOnly(element, isReadOnly);
    };

    publicMethods.getControlClass = function () { return "aga-date" };

    // retornar implementação final
    return publicMethods;

})();

AGA.Form.addControl(AGA.Date);
