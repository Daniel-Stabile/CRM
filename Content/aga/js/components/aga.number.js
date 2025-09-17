/* global AGA */
AGA.Number = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);
    var initializedClassName = "aga-initialized";

    // customizações
    var ensureInit = function (element) {
        if (!$(element).hasClass(initializedClassName)) {
            $(element).addClass(initializedClassName);
            $(element).autoNumeric("init");        
        }
    };

    var valueFromElement = function (element) {
        ensureInit(element);
        var strValue = $(element).autoNumeric("get");
        if (strValue === "") return 0;
        var nrDec = $(element).attr("data-m-dec");
        if (nrDec === "0" || nrDec === 0)
            return parseInt(strValue);
        return parseFloat(strValue);
    };
    
    publicMethods.getValue = function (selector) {
        var element = AGA.Helper.resolveElement(selector);
        if (element) {
            return valueFromElement(element);
        }
        return 0;
    };

    publicMethods.setValue = function (selector, value) {
        var element = AGA.Helper.resolveElement(selector);
        if (element) {
            ensureInit(element);
            $(element).autoNumeric("set", value);
        }
    };

    publicMethods.internalChange = function (input) {
        AGA.Form.dispatchChange(input,
            function () {
                var value = valueFromElement(input);
                return {
                    target: input,
                    currentTarget: input,
                    value: value,
                    isNull: false
                };
            });
    };

    publicMethods.clear = function (selector) {
        publicMethods.setValue(selector, 0);
    };

    publicMethods.getControlClass = function () { return "aga-number" };

    publicMethods.initAll = function () {
        $(".aga-number:not(."+initializedClassName+")").autoNumeric("init");
        $(".aga-number").addClass(initializedClassName);        
    };
    
    // retornar implementação final
    return publicMethods;

})();

// adicionar reader de valores no AGA.Form
AGA.Form.addControl(AGA.Number);
