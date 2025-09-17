/* global AGA */
AGA.Radio = (function () {
    var nullValue = "";

    var getValue = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        var result = nullValue;
        $(element).find("input").each(function (index, obj) {
            if (obj.checked)
                result = obj.value;
        });
        return result;
    };

    var setValue = function (selector, value) {
        var element = AGA.Helper.resolveElement(selector);
        $(element).find("input").each(function (index, obj) {
            var ck = (obj.value === value);
            obj.checked = ck;
            $(obj).parent().toggleClass("active", ck);
            if (ck) {
                $(obj).attr("checked", "checked");
            } else {
                $(obj).removeAttr("checked");
            }
            
        });
    };

    var clear = function (selector) {
        setValue(selector, null);
    };

    var isNull = function(selector) {
        return getValue(selector) === nullValue;
    };

    var internalChange = function (element) {
        AGA.Form.dispatchChange(element,
            function () {
                var v = AGA.Radio.getValue(element);
                return {
                    target: element,
                    currentTarget: element,
                    value: v,
                    isNull: AGA.Helper.isNullValue(v)
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

        $(element).children("label")
            .each(function (index, obj) {
                if (isReadOnly) {
                    $(obj).attr("disabled", "disabled");
                    $(obj).addClass("mt-radio-disabled");
                    $(obj).children("input").each(function (index, objChild) {
                        $(objChild).attr("disabled", "disabled");
                    })
                } else {
                    $(obj).removeAttr("disabled");
                    $(obj).removeClass("mt-radio-disabled");
                    $(obj).children("input").each(function (index, objChild) {
                        $(objChild).removeAttr("disabled");
                    })
                }
            });
    };

    var getControlClass = function () {
        return "aga-radio";
    };

    return {
        internalChange: internalChange,
        getValue: getValue,
        setValue: setValue,
        clear: clear,
        getReadOnly: getReadOnly,
        setReadOnly: setReadOnly,
        isNull: isNull,
        getControlClass: getControlClass

    };
    
})();

AGA.Form.addControl(AGA.Radio);