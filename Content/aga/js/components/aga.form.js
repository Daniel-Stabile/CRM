/* global AGA */


/*
Eventos de campos recebem parâmetro no formato:
   {
     name: [data-name]
     target: [element],
     currentTarget: [element],
     value: [valor],
     isNull: [true/false]
   }   
*/


AGA.Form = (function () {
    var controlList = [];

    var addControl = function (control) {
        controlList.push(control);
    };

    var getControlElements = function (form, control) {
        var selector = "." + control.getControlClass();
        return $(form).find(selector);
    };

    // Esta função irá descobrir todos controles dentro do formulário e executar o callback
    var forEachElement = function (form, fnControlAndElement) {
        for (var i = 0; i < controlList.length; i++) {
            var control = controlList[i];
            var allElements = getControlElements(form, control);
            for (var indexElement = 0; indexElement < allElements.length; indexElement++) {
                fnControlAndElement(control, allElements[indexElement]);
            }
        }
    };

    return {
        addControl: addControl,

        getValues: function (anyTarget) {
            var result = {};
            var anyElement = AGA.Helper.resolveElement(anyTarget);
            $(anyElement).closest(".aga-form").each(function (index, form) {
                forEachElement(form, function (control, element) {
                    var isNull = control.isNull(element);
                    if (!isNull) {
                        var name = AGA.Helper.getDataName(element);
                        var value = control.getValue(element);
                        result[name] = value;
                    }
                });
            });

            return result;
        },

        dispatchChange: function (element, callbackArgs) {
            var onchange = $(element).data("changeCallback");
            var formChange = undefined;
            $(element).closest(".aga-form").first()
                .each(function (index, obj) {
                    formChange = $(obj).data("changeCallback");
                });

            if (onchange || formChange) {
                var fieldName = $(element).data("name");
                AGA.log(fieldName + ".Change");

                var args = $.extend({ name: fieldName }, callbackArgs());
                if (onchange)
                    AGA.Helper.invoke(onchange, args);

                if (formChange)
                    AGA.Helper.invoke(formChange, args);

                AGA.log(fieldName + ".Changed");
                return true;
            };
            return false;
        },

        setReadOnly: function (selector, isReadOnly) {
            var form = AGA.Helper.resolveElement(selector);
            if (form) {
                if (isReadOnly) $(form).attr("readonly", "readonly");
                else $(form).removeAttr("readonly");

                forEachElement(form,
                    function (control, element) {
                        control.setReadOnly(element, isReadOnly);
                    });
            }
        },

        initAll: function () {
            $(".aga-form[readonly]").each(function (index, form) {
                AGA.Form.setReadOnly(form, true);
            });
        }
    };
})();

