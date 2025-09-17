/* global AGA */

AGA.Checkbox = (function () {


    var getValue = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        return element.checked;
    };

    var setValue = function (selector, value) {
        var element = AGA.Helper.resolveElement(selector);
        element.checked = value;
    };

    var internalChange = function (element) {
        AGA.Form.dispatchChange(element,
            function () {
                return {
                    target: element,
                    currentTarget: element,
                    value: element.checked,
                    isNull: false
                };
            });
    };

    var getReadOnly = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        return element.disabled;
    };

    var setReadOnly = function (selector, isReadOnly) {
        var element = AGA.Helper.resolveElement(selector);
        element.disabled = isReadOnly;
        $(element).parent().toggleClass("mt-checkbox-disabled", isReadOnly);
    };

    var isNull = function () {
        return false;
    };

    var clear = function (selector) {
        setValue(selector, false);
    };

    var getControlClass = function () {
        return "aga-checkbox";
    };


    return {
        internalChange: internalChange,
        getValue: getValue,
        setValue: setValue,
        clear: clear,
        isNull: isNull,
        getReadOnly: getReadOnly,
        setReadOnly: setReadOnly,
        getControlClass: getControlClass
    };
})();

AGA.Form.addControl(AGA.Checkbox);