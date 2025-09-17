"use strict";
//var AGA = AGA || {};

AGA.JavascriptButton = (function () {

    var click = function (target) {
        var method = $(target).data("callback");
        if (method)
            AGA.Helper.invoke(method, target);
    };

    var enable = function (target) {
        var ele = AGA.Helper.resolveElement(target);
        if (ele)
            $(ele).removeAttr("disabled").removeClass("disabled");
    };

    var disable = function (target) {
        var ele = AGA.Helper.resolveElement(target);
        if (ele)
            $(ele).attr("disabled", "disabled");
    };

    var setEnabled = function (target, isEnabled) {
        if (isEnabled)
            enable(target);
        else
            disable(target);
    };

    return {
        click: click,
        enable: enable,
        disable: disable,
        setEnabled: setEnabled
    };

})();