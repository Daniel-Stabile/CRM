/* global AGA */
// Este objeto é base para objetos do tipo input simples
AGA.BaseInputControl = function () {

    var internalChange = function (input) {
        AGA.Form.dispatchChange(input,
            function () {
                var value = $(input).val();
                return {
                    target: input,
                    currentTarget: input,
                    value: value,
                    isNull: AGA.Helper.isNullValue(value)
                };
            });
    };

    var getValue = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        if (element)
            return $(element).val();
        return null;
    };

    var isNull = function (selector) {
        var value = getValue(selector);
        return AGA.Helper.isNullValue(value);
    };

    var setValue = function (selector, value) {
        var element = AGA.Helper.resolveElement(selector);
        if (element)
            $(element).val(value);
    };

    var clear = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        if (element)
            $(element).val("");
    };

    var getReadOnly = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        return element && element.disabled;
    };

    var setReadOnly = function (selector, isReadOnly) {
        var element = AGA.Helper.resolveElement(selector);
        if (element)
            element.disabled = isReadOnly;
    };
    
    return {
        internalChange: internalChange,
        getValue: getValue,
        setValue: setValue,
        isNull: isNull,
        clear: clear,
        getReadOnly: getReadOnly,
        setReadOnly: setReadOnly
    };
};
