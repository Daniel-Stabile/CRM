var QuickNav = function () {

    return {
        init: function () {
            if ($('.quick-nav').length > 0) {
                var stretchyNavs = $('.quick-nav');
                stretchyNavs.each(function () {
                    var stretchyNav = $(this),
						stretchyNavTrigger = stretchyNav.find('.quick-nav-trigger');

                    stretchyNavTrigger.on('click', function (event) {
                        event.preventDefault();
                        stretchyNav.toggleClass('nav-is-visible');
                    });
                });

                $(document).on('click', function (event) {
                    (!$(event.target).is('.quick-nav-trigger') && !$(event.target).is('.quick-nav-trigger span')) && stretchyNavs.removeClass('nav-is-visible');
                });
            }
        }
    };
}();

$(document).ready(function() {
    QuickNav.init(); // init metronic core components
});
"use strict";

var AGA = AGA || {};

AGA.log = function (message) {
    if (console && console.log) {
        console.log(message);
    }
};


/*
    AGA.Menu
    Utilizado para quebrar os TABS das páginas auto geradas do RH.
    Destaca a página selecionada    
 */

AGA.Menu = (function () {

    var lastAgaMenuStack = [];

    function changeTabActive(tab, cur) {
        tab.uniqueId();
        var tabId = $(tab).attr("id");
        var found = false;
        for (var i = 0; i < lastAgaMenuStack.length; i++) {
            if (lastAgaMenuStack[i].key === tabId) {
                if (lastAgaMenuStack[i].item !== cur)
                    $(lastAgaMenuStack[i].item).parent().removeClass("active");
                lastAgaMenuStack[i].item = cur;
                found = true;
            }
        }
        if (!found)
            lastAgaMenuStack.push({ key: tabId, item: cur });
    };

    function detailClick(e) {
        var theTab = $(e.target).parent().closest('.aga-tabs');

        changeTabActive(theTab, e.target);

        $(theTab.find('a')).removeClass('aga-a-active');
        $(theTab.find('span.aga-sel')).empty();
        $($(theTab).find('a')).removeClass('aga-a-active');

        // Verifica se esta dentro de grupo
        var theDropDown = $(e.target).parent().parent().hasClass('aga-tab-dropdown') ? $(e.target).parent().parent() : null;
        if (theDropDown != null) {
            var id = '#' + $(theDropDown).attr("aria-labelledby");
            var firstSpan = $(id).children().first();
            if ($(id).children().length > 2)
                firstSpan.next().text(' | ' + $(e.target).text());
            else
                firstSpan.after('<span class="aga-sel aga-a-active"> | ' + $(e.target).text() + '</span>');
        }

        // Marcar item
        $(e.target).closest('a').addClass('aga-a-active');
    };

    function getItems(theUL) {
        var todosLI = [];
        var grupos = [];

        $(theUL).children("li").each(function (idx, li) {
            var s = $(li).text();
            var pos = s.indexOf('>');
            if (pos > 0) {
                var sGrupo = s.substring(0, pos);
                var sCaption = s.substring(pos + 1, 100);
                if (grupos.indexOf(sGrupo) < 0) {
                    grupos.push(sGrupo);
                }
                todosLI.push({ "li": li, "grupo": sGrupo, "caption": sCaption });
            }
        });

        return {
            todosLI: todosLI,
            grupos: grupos
        };
    };

    function createNewUL(caption, parent) {
        var li = document.createElement("li");
        var a = document.createElement("a");
        $(a).uniqueId();
        $(a).addClass("dropdown-toggle")
            .attr({
                "href": "javascript:;",
                "data-toggle": "dropdown",
                "aria-expanded": "false"
            })
            .appendTo(li);

        var span = document.createElement("span");
        $(span).text(caption).appendTo(a);
        $(document.createElement("i")).addClass("fa fa-angle-down").appendTo(a);
        var ul = document.createElement("ul");
        $(ul).addClass("dropdown-menu aga-tab-dropdown")
            .attr({ "role": "menu", "aria-labelledby": $(a).attr("id") })
            .appendTo(li);
        $(parent).append(li);

        return ul;
    };

    function breakMenuUL(theUL) {
        var obj = getItems(theUL);

        var todosLI = obj.todosLI;
        var grupos = obj.grupos;

        if (grupos.length === 0)
            return;

        for (var i = 0; i < grupos.length; i++) {
            var grupoAtual = grupos[i];

            var ul = createNewUL(grupoAtual, theUL);

            for (var i2 = 0; i2 < todosLI.length; i2++) {
                var atual = todosLI[i2];
                if (atual.grupo === grupoAtual) {
                    $(atual.li).find("a").first().text(atual.caption);
                    $(atual.li).appendTo(ul);
                }
            }
        }

    };

    return {
        init: function () {
            $(document).on("click", "li.aga-li", detailClick);
            AGA.Menu.breakMenus();
            AGA.Menu.activeFirstTabs();
        },

        activeFirstTabs: function () {
            $(".aga-tabs").each(function () {
                if ($(this).find("li.active").length === 0 && $(this.parentNode).closest(".tab-content").length === 0) {
                    var x = $(this).find("li");
                    if (x.length > 0) {
                        var tabRoot = $(this).find("li:first").find(":first-child");
                        if (tabRoot.find(":first-child").length === 0)
                            tabRoot.trigger("click");
                        else
                            tabRoot.find(":first-child").trigger("click");
                    }
                }
            });
        },

        breakMenus: function () {
            $("#ContentPanel .aga-tabs:not(.aga-breaked-menu)").each(
                function (ulIndex, theUL) {
                    $(theUL).addClass("aga-breaked-menu");
                    breakMenuUL(theUL);
                });
        }

    };

})();


AGA.Helper = (function () {
    var blockCount = 0;

    var blockUi = function () {
        if (blockCount === 0) {
            App.blockUI({ textOnly: false, message: "Carregando...", boxed: true });
        }
        blockCount++;
    };

    var unblockUi = function () {
        blockCount--;
        if (blockCount === 0)
            App.unblockUI();
    };

    var blockElement = function (element, message, options) {
        var opts = $.extend({
            target: element,
            textOnly: true,
            message: message,
            boxed: true
        }, options);
        App.blockUI(opts);
    };

    var unblockElement = function (element) {
        App.unblockUI(element);
    };

    var dateToStringDmy = function (date) {
        var d = date.getDate().toString();
        var m = (date.getMonth() + 1).toString();
        var y = date.getFullYear();
        d = d.length === 1 ? "0" + d : d;
        m = m.length === 1 ? "0" + m : m;
        return d + "/" + m + "/" + y;
    };

    var getDataName = function (element) {
        var name = $(element).data("name");
        if (!name)
            name = $(element).attr("id");
        return name;
    };

    var alertImplementation = function (title, message, disposeCallback) {
        if (title && !message) {
            message = title;
            title = "Mensagem";
        }
        var callback = disposeCallback || function () { };
        Benner.ModalMessage.alert(title, message, callback);
    };

    return {
        isNullValue: function (v) {
            return (typeof v === "undefined" || v === "" || v === null);
        },

        getDataName: getDataName,

        getProps: function (obj) {
            var r = "";
            for (var s in obj) {
                if (obj.hasOwnProperty(s)) {
                    r += s + "=" + obj[s] + "\n";
                }
            }
            return r;
        },

        requestConfirmation: function (title, message, yesCallback) {
            return AGA.Helper.requestConfirmationCustom({
                title: title,
                message: message,
                yesCallback: yesCallback
            });
        },

        requestConfirmationCustom: function (opts) {
            var defaults = {
                title: "Confirmar",
                message: "Confirma a execução da operação?",
                yesCallback: function () { },
                noCallback: function () { },
                yesBtn: "Sim",
                noBtn: "Não"
            };
            $.extend(defaults, opts);

            bootbox.dialog({
                title: defaults.title,
                message: defaults.message,
                onEscape: function () { bootbox.hideAll() },
                buttons: {
                    success: {
                        label: defaults.yesBtn,
                        className: "green btn-primary",
                        callback: defaults.yesCallback
                    },
                    main: {
                        label: defaults.noBtn,
                        className: "default",
                        callback: defaults.noCallback
                    }
                }
            });
        },

        /* Executa o método informado permitindo namespaces */
        invoke: function (method, args) {
            if (!method)
                return false;

            // O callback pode ser informado no formato  RH.Rotinas.Ponto.showXYZ, então deve fazer o parser dos pontos
            var parts = method.split(".");
            var obj = window;
            while (parts.length > 0) {
                if (!obj[parts[0]]) {
                    AGA.log("AGA.Helper.invoke(" + method + ") - método não encontrado.");
                    return false;
                }
                obj = obj[parts[0]];
                parts.splice(0, 1);
            }
            if (obj) {
                obj(args);
                return true;
            }
            AGA.log("AGA.Helper.invoke(" + method + ") - método não encontrado.");
            return false;
        },

        /* Cria um painel de aviso no padrão metronic */
        createMessagePanel: function (parent, alertClass, messageHtml) {
            // alertClass pode ser alert-success, alert-danger, alert-info, alert-warning
            if (!parent) {
                return false;
            }

            var realParent;
            if (typeof parent === "string") {
                var query = $(parent).first();
                if (query.length > 0)
                    realParent = query[0];
                else
                    return false;
            }
            else
                realParent = parent;

            var div = document.createElement("div");
            $(div).addClass("alert " + alertClass);

            var btn = document.createElement("button");
            $(btn).addClass("close").attr("data-dismiss", "alert").appendTo(div);

            // Preparar mensagem
            var message = messageHtml ? messageHtml.replace(/(?:\r\n|\r|\n)/g, "<br />") : "";

            var span = document.createElement("span");
            $(span).html(message).appendTo(div);

            $(realParent).hide().removeClass("hide").empty().append(div).show();
            return true;
        },

        /* Verifica se selector é uma string, se sim procura o primeiro elemento correspondente, senão retorna o próprio selector */
        resolveElement: function (selector) {
            if (typeof selector === "string") {
                if (selector.length > 0 && selector[0] === "#") {
                    var query = $(selector);
                    if (query.length > 0)
                        return query[0];
                    return undefined;
                }

                // Busca pelo id
                var element = document.getElementById(selector);
                if (element)
                    return element;

                // buscal por data-name
                var query2 = $('[data-name="' + selector + '"]');
                if (query2.length > 0)
                    return query2[0];

                return undefined;
            }
            return selector;
        },

        blockUI: blockUi,

        unblockUI: unblockUi,

        blockElement: blockElement,

        unblockElement: unblockElement,

        dateToStringDmy: dateToStringDmy,

        alert: alertImplementation
    };
})();


AGA.Loader = (function () {

    function loadJs(url, callback) {
        var node = document.createElement("script");
        node.setAttribute("type", "text/javascript");
        node.setAttribute("src", url);
        if (callback)
            node.addEventListener("load", callback);
        document.head.appendChild(node);
    };

    function loadCss(url, callback) {
        var node = document.createElement("link");
        node.setAttribute("type", "text/css");
        node.setAttribute("rel", "stylesheet");
        node.setAttribute("href", url);
        if (callback)
            node.addEventListener("load", callback);
        document.head.appendChild(node);
    };

    return {
        load: function (path, callback) {
            var fullPath = $("#Wes2008ApplicationPath").val() + path;
            var isJs = (fullPath.indexOf(".css") === -1);
            if (isJs)
                loadJs(fullPath, callback);
            else
                loadCss(fullPath, callback);
        }
    }


})();


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

/* global AGA */
AGA.Lookup = (function () {

    var cssFixed = false;

    var fixCss = function () {
        if (cssFixed)
            return;

        var node = document.createElement("style");
        var content = document.createTextNode(".select2-container.aga-lookup {position: relative;z-index: auto;float: left;width: 100%;margin-bottom: 0;display: table;table-layout: fixed;}");
        node.appendChild(content);
        content = document.createTextNode("select.aga-lookup {height:30px;}");
        node.appendChild(content);

        content = document.createTextNode(".aga-form .form-group{min-height:53px;}");
        node.appendChild(content);

        document.head.appendChild(node);
        cssFixed = true;
    };

    var configBuilder = function (targetElement) {

        var isServerLookup = function () {
            return (targetElement && targetElement.attributes["data-definition"] !== undefined);
        };

        var allowClear = function (target) {
            // Os campos sempre são obrigatórios, a menos que seja informado contrário
            var v = $(target).data("required");
            if (v === false)
                return true;

            if (v && v.toLowerCase() === "false")
                return true;
            return false;
        };

        var getFormValues = function (target) {
            var formValues = "";
            var values = AGA.Form.getValues(target);
            for (var name in values) {
                if (values.hasOwnProperty(name)) {
                    formValues += name + "=" + values[name] + "|";
                }
            }
            return formValues;
        };

        var createAjaxConfig = function () {
            var url = $("#Wes2008ApplicationPath").val() + "api/AGALookup";
            var pageSize = 30;
            var ajaxConfig = {
                url: url,
                dataType: "json",
                quietMillis: 250,
                data: function (params) {
                    if (params.term === undefined)
                        params.term = "";
                    params.page = params.page || 1;
                    var query = {};
                    query.def = $(this).data("definition");
                    query.frmValues = getFormValues(targetElement);
                    query.userText = params.term;
                    query.firstIndex = (params.page - 1) * pageSize;
                    query.count = pageSize;
                    return query;
                },
                processResults: function (data) {
                    return {
                        results: $.map(data.Items,
                            function (item) {
                                return {
                                    id: item.id,
                                    text: item.desc
                                };
                            }),
                        pagination: {
                            more: data.More === "S"
                        }
                    };
                },
                cache: true
            };

            return ajaxConfig;
        };

        var result = {
            allowClear: allowClear(targetElement),
            width: "100%",
            multiple: ($(targetElement).data("multiple") &&
                $(targetElement).data("multiple").toString().toLowerCase() === "true"),
            language: "pt-BR"
        };

        if (isServerLookup()) {
            result.ajax = createAjaxConfig(targetElement);
            result.formatAjaxError = formatAjaxError;
            result.escapeMarkup = function (markup) {
                return markup;
            };
            result.formatResult = function (data) {
                return data.desc;
            };
            result.formatSelection = function (data) {
                return data.desc;
            };

            if (result.multiple) {
                result.closeOnSelect = false;
                result.maximumSelectionSize = 50;
                result.maximumSelectionLength = 50;
            }

            // Limpar valor anterior
            $(targetElement).val("");
        }

        var placeholder = $(targetElement).data("placeholder");
        if (placeholder)
            result.placeholder = placeholder;

        return result;
    };

    var hasDependencies = function (element) {
        var father = $(element).data("depend");
        return (father && AGA.Lookup.isNull(father));
    };

    var kindNames = {
        // Seleciona um item, do servidor
        singleServer: "singleServer",
        // Seleciona um item, da lista de itens informados
        singleClient: "singleClient",
        // Seleciona n itens, do servidor
        multipleServer: "multipleServer",
        // Seleciona n itens, da lista de itens informados
        multipleClient: "multipleClient"
    };

    var kindImplementations = {};

    var initKindImplementations = function () {
        if (kindImplementations[kindNames.singleServer])
            return;

        // Lookup que seleciona 1 item e pesquisa na base
        var singleDefaultBuilder = function () {

            var isNull = function (element) {
                return AGA.Helper.isNullValue($(element).val());
            };

            return {
                getValue: function (element) {
                    var value = $(element).val();
                    if (!AGA.Helper.isNullValue(value))
                        return parseInt(value);
                    return -1;
                },
                setValue: function (element, value, text) {
                    // verifica se é valor diferente
                    if ($(element).val() === value.toString())
                        return false;

                    text = text || "?";
                    var $option = $("<option selected>" + text + "</option>").val(value);
                    $(element).append($option);
                    return true;
                },
                clear: function (element) {
                    if (!isNull(element)) {
                        $(element).find("option").detach();
                    }
                },
                isNull: isNull,

                getReadOnly: function (element) {
                    if ($(element).attr("readonly"))
                        return true;
                    return false;
                },
                setReadOnly: function (element, isReadOnly) {
                    if (!isReadOnly && hasDependencies(element))
                        return;
                    if (isReadOnly)
                        $(element).attr("readonly", "readonly");
                    else
                        $(element).removeAttr("readonly");

                    $(element).prop("disabled", isReadOnly);

                    var parent = element.parentNode;
                    if ($(parent).hasClass("input-group")) {
                        $(parent).find(".aga-btn-clear").toggleClass("disabled", isReadOnly);
                    }
                }
            };
        };

        kindImplementations[kindNames.singleServer] = singleDefaultBuilder();

        kindImplementations[kindNames.singleClient] = singleDefaultBuilder();

        kindImplementations[kindNames.singleClient].setValue = function (element, value) {
            // Verifica se é um valor diferente
            if ($(element).val() === value.toString())
                return false;
            $(element).val(value).trigger("change.select2");
            return true;
        };

        kindImplementations[kindNames.singleClient].clear = function (element) {
            $(element).val("").trigger("change.select2");
        };


        var mapValues = function (value, text) {
            if (value instanceof Array) {
                return value.map(function (item, index) {
                    return {
                        id: item,
                        desc: text[index]
                    };
                });
            }
            return [{
                id: value,
                desc: text
            }];
        };

        // Lookup que seleciona 1 item e pesquisa na base
        var multipleDefaultBuilder = function () {

            var isNull = function (element) {
                return AGA.Helper.isNullValue($(element).val());
            };

            var clear = function (element) {
                $(element).find("option").detach();
            };

            var setInternalValue = function (element, value, text) {
                var mappedItems = mapValues(value, text);
                if (mappedItems.length > 0) {
                    $(element).append(mappedItems.map(function (item) {
                        return $("<option selected>" + item.desc + "</option>").val(item.id);
                    }));
                }
                return true;
            };

            return {
                getValue: function (element) {
                    var value = $(element).val();
                    if (value instanceof Array)
                        return value.join(",");

                    if (typeof value === "undefined" || value === null)
                        return "";

                    return value;
                },

                setInternalValue: setInternalValue,
                setValue: function (element, value, text) {
                    clear(element);
                    return setInternalValue(element, value, text);
                },

                clear: clear,

                isNull: isNull,

                getReadOnly: function (element) {
                    if ($(element).attr("readonly"))
                        return true;
                    return false;
                },
                setReadOnly: function (element, isReadOnly) {
                    if (!isReadOnly && hasDependencies(element))
                        return;
                    if (isReadOnly)
                        $(element).attr("readonly", "readonly");
                    else
                        $(element).removeAttr("readonly");

                    $(element).prop("disabled", isReadOnly);

                    var parent = element.parentNode;
                    if ($(parent).hasClass("input-group")) {
                        $(parent).find(".aga-btn-clear").toggleClass("disabled", isReadOnly);
                    }
                }
            };
        };



        kindImplementations[kindNames.multipleServer] = multipleDefaultBuilder();

        kindImplementations[kindNames.multipleClient] = multipleDefaultBuilder();

        kindImplementations[kindNames.multipleClient].clear = function (element) {
            $(element).val("").trigger("change.select2");
        };

        kindImplementations[kindNames.multipleClient].setValue = function (element, value, text) {
            var mappedValues = mapValues(value, text);
            var selValues = mappedValues.map(function (item) {
                return item.id;
            });
            $(element).val(selValues).trigger("change.select2");
            return true;
        };
    };

    // métodos privados
    function dispathChangeEvent(element, isNull, e) {

        AGA.Form.dispatchChange(e.currentTarget, function () {
            var value = AGA.Lookup.getValue(element);
            return {
                target: e.currentTarget,
                currentTarget: e.currentTarget,
                handle: value,
                value: value,
                isNull: isNull
            };
        });
    }

    function internalChange(e) {
        var isNull = AGA.Lookup.isNull(e.currentTarget);

        // Executar o data-change-callback
        dispathChangeEvent(e.currentTarget, isNull, e);

        $(".aga-lookup[data-depend='" + $(e.currentTarget).data("name") + "']").each(function (index, obj) {
            AGA.Lookup.clear(obj);
            AGA.Lookup.setReadOnly(obj, isNull);
        });
    }

    function formatAjaxError(jqXhr, textStatus, errorThrown) {
        //Os browsers retornavam mensagens de erros diferentes quando a sessão expira
        if (jqXhr.status === 401)
            return jqXhr.statusText;

        if (jqXhr.responseText.indexOf("wesLogin") > 0)
            return "Sua sessão expirou. Faça o login novamente.";

        if (jqXhr.responseJSON === undefined)
            return errorThrown;

        if (!jqXhr.responseJSON.ExceptionMessage || !jqXhr.responseJSON.ExceptionMessage.length) {
            if (!jqXhr.responseJSON.Message || !jqXhr.responseJSON.Message.length)
                return errorThrown;

            return jqXhr.responseJSON.Message;
        }
        return jqXhr.responseJSON.ExceptionMessage;
    }

    function isLookup(element) {
        return (element && element.attributes["data-definition"] !== undefined);
    }

    function getKind(isMultiple, isServer) {
        if (isMultiple) {
            return isServer ? kindNames.multipleServer : kindNames.multipleClient;
        }
        return isServer ? kindNames.singleServer : kindNames.singleClient;
    }

    function internalInit(targetElement) {

        initKindImplementations();

        var config = configBuilder(targetElement);

        // Configurar o select2
        var $selObj = $(targetElement).select2(config);

        // Após criação deve limpar
        $(targetElement).val(null).trigger("change.select2");

        $selObj.on("change", internalChange);
        $($selObj).on("select2:close", function () { $(this).focus(); });

        // Verificar qual o kind do componente
        var kind = getKind(config.multiple, isLookup(targetElement));

        $(targetElement).data("kind", kind);

        // Verifica se fica como readonly
        if ($(targetElement).data("depend") || targetElement.hasAttribute("readonly")) {
            getImplementor(targetElement).setReadOnly(targetElement, true);
        }

        // Setar o focus no elemento se existe o atributo data-focus
        if ($(targetElement).data("focus")) {
            $(targetElement).select2("focus");
        }
    }

    function getImplementor(element) {
        if (element) {
            var kind = $(element).data("kind");
            return kindImplementations[kind];
        }
        return undefined;
    }

    var setValue = function (selector, value, text) {
        var element = AGA.Helper.resolveElement(selector);
        if (getImplementor(element).setValue(element, value, text)) {
            internalChange({
                currentTarget: element
            });
        }
    };

    var initValue = function (element) {
        var initialValue = $(element).data("initialValue");
        if (initialValue) {
            var intValue = parseInt(initialValue);
            var text = $(element).data("initialText");
            setValue(element, intValue, text);
            $(element).removeData("initialValue");
            $(element).removeData("initialText");
        }
    };

    // Para componentes de multipla seleção
    var initMultipleValue = function (element) {
        var initialValue = $(element).data("multipleInitialValue");
        if (initialValue) {
            var handles = [];
            var texts = [];
            var list = initialValue.split("|");
            for (var i = 0; i < list.length; i++) {
                var parts = list[i].split("=");
                if (parts.length > 1) {
                    handles.push(parseInt(parts[0]));
                    texts.push(parts[1]);
                }
            }
            setValue(element, handles, texts);
        }
    };

    var initAllValues = function () {

        $(".aga-lookup[data-initial-value]").each(function (index, element) {
            initValue(element);
        });
        $(".aga-lookup[data-multiple-initial-value]").each(function (index, element) {
            initMultipleValue(element);
        });
    };

    var init = function (targetElement) {
        var className = "aga-initialized";
        if ($(targetElement).hasClass(className))
            return;
        $(targetElement).addClass(className);

        internalInit(targetElement);
        fixCss();
    };

    var initAll = function () {
        $(".aga-lookup:not(.aga-initialized)").each(function (index, obj) {
            AGA.Lookup.init(obj);
        });

        // Inicializar valores iniciais
        initAllValues();
    };

    return {
        initAll: initAll,

        init: init,

        setReadOnly: function (selector, isReadOnly) {
            var element = AGA.Helper.resolveElement(selector);
            getImplementor(element).setReadOnly(element, isReadOnly);
        },

        getReadOnly: function (selector) {
            var element = AGA.Helper.resolveElement(selector);
            return getImplementor(element).getReadOnly(element);
        },

        getValue: function (selector) {
            var element = AGA.Helper.resolveElement(selector);
            return getImplementor(element).getValue(element);
        },

        setValue: setValue,

        clear: function (selector) {
            var element = AGA.Helper.resolveElement(selector);
            var impl = getImplementor(element);
            if (!impl.isNull(element)) {
                impl.clear(element);
                internalChange({
                    currentTarget: element
                });
            }
        },

        isNull: function (selector) {
            var element = AGA.Helper.resolveElement(selector);
            return getImplementor(element).isNull(element);
        },

        getControlClass: function () {
            return "aga-lookup";
        }
    };
})();

AGA.Form.addControl(AGA.Lookup);

/* global AGA */
AGA.Text = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // customizações
    publicMethods.getControlClass = function () { return "aga-text" };

    // retornar implementação final
    return publicMethods;

})();

AGA.Form.addControl(AGA.Text);

/* global AGA */
AGA.Number = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // customizações
    var valueFromElement = function (element) {
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
        if (element)
            $(element).autoNumeric("set", value);
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

    // retornar implementação final
    return publicMethods;

})();

// adicionar reader de valores no AGA.Form
AGA.Form.addControl(AGA.Number);

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

/*
  Dependencias:
  - AGA.Helper
  - AGA.log
 */
/* global AGA */

AGA.Ajax = (function () {

    function checkOperationSettings(settings) {
        for (var s in settings) {
            if (settings.hasOwnProperty(s)) {
                if ((s !== "operation") &&
                    (s !== "parameters") &&
                    (s !== "panelId") &&
                    (s !== "messagePanel") &&
                    (s !== "success") &&
                    (s !== "error") &&
                    (s !== "abort")) {
                    var errorText = "Parâmetro " + s + " não é válido para callOperation.";
                    AGA.log(errorText);
                    throw Error(errorText);
                }
            }
        }
    }

    function getPanelElement(settings, callback) {
        var element;
        if (settings.panelId && settings.panelId.length > 0) {
            var target = (settings.panelId[0] === '#') ? settings.panelId : "#" + settings.panelId;
            element = $(target).first();
        } else if (settings.messagePanel && typeof settings.messagePanel === "object") {
            element = settings.messagePanel;
        }

        if (element && callback) {
            callback(element);
        }
        return element;
    }

    function setPanelMessage(settings, alertClass, message) {
        getPanelElement(settings, function (element) {
            AGA.Helper.createMessagePanel(element, alertClass, message);
        });
    }

    function clearPanelMessage(settings) {
        getPanelElement(settings, function (element) {
            $(element).empty();
        });
    }

    function notifyResponseError(settings, message) {
        if (message && message.length > 0)
            setPanelMessage(settings, "alert-warning", message);

        if (settings.error)
            settings.error(message);
    }

    function notifyResponseSuccess(settings, response) {
        if (response && response.Mensagem && response.Mensagem.length > 0)
            setPanelMessage(settings, "alert-info", response.Mensagem);

        if (settings.success)
            settings.success(response.Mensagem, response.Resultado);
    }

    function internalCallOperation(settings, consistir) {
        AGA.Ajax.callWebMethodBlocked("AGAOperation", {
            operationName: settings.operation,
            consisted: (consistir ? 0 : 1),
            parameters: settings.parameters
        },
            function (responseData) {
                var response = responseData.d;
                if (response.Tipo === "advertencia") {
                    AGA.Helper.requestConfirmationCustom({
                        message: response.Mensagem,
                        yesCallback: function () {
                            internalCallOperation(settings, false);
                        },
                        noCallback: function () {
                            if (settings.abort) settings.abort();
                        }
                    });
                } else if ((response.Tipo === "inconsistencia") || (response.Tipo === "erro")) {
                    notifyResponseError(settings, response.Mensagem);
                } else if (response.Tipo === "sucesso") {
                    notifyResponseSuccess(settings, response);
                }
            },

            function (responseErrorData, message) {
                notifyResponseError(settings, message);
            });
    }

    return {
        /* Utilizar para chamadas AJAX assincronas de WebMethod da página */
        callWebMethod: function (methodName, dataObject, successCallback, errorCallback) {
            var url = window.location.href.split("?")[0];
            url = url.split("#")[0] + "/" + methodName;
            var config = {
                type: "POST",
                url: url,
                dataType: "json",
                contentType: "application/json"
            };

            if (dataObject)
                config.data = JSON.stringify(dataObject);

            if (successCallback)
                config.success = successCallback;

            if (errorCallback)
                config.error = function (data) {
                    var errorMessage = AGA.Ajax.getErrorMessage(data);
                    errorCallback(data, errorMessage);
                };

            $.ajax(config);
        },

        /* Utilizar para chamadas AJAX sincronas de WebMethod da página com bloqueio da interface */
        callWebMethodBlocked: function (methodName, dataObject, successCallback, errorCallback) {
            AGA.Helper.blockUI();
            try {
                AGA.Ajax.callWebMethod(methodName, dataObject,
                    function (data) {
                        try {
                            successCallback(data);
                        } finally {
                            AGA.Helper.unblockUI();
                        }
                    },

                    function (data, message) {
                        AGA.Helper.unblockUI();
                        if (errorCallback)
                            errorCallback(data, message);
                    });
            } catch (error) {
                AGA.Helper.unblockUI();
                throw error;
            }
        },

        /* Utilizar em eventos onClick de botões para excução de rotinas que possuem dois momentos: Validação e Persistência. 
           O CodeBehind da página deve ter os dois WebMethods implementados: Consistir[nomeOperacao] e Executar[nomeOperacao]
        Opções para o settings:
        settings = {
                    operation: nomeOperacao,                           => Nome da operação
                    parameters: {param1: valor1, param2: valor2},      => Parâmetros
                    panelId: "#meuPainelMensagem",                     => id do painel que recebe mensagens
                    messagePanel: $(obj),                              => painel (dom) que recebe as mensagens
                    success: function(successMessage, resultado){ },   => Operação executada com sucesso
                    error: function(errorMessage){ },                  => Erro interno, ou Inconsistência
                    abort: function(){ }                               => abort é chamado quando o usuário responde não para as advertências
                    };
         */
        callOperation: function (settings) {
            checkOperationSettings(settings);
            clearPanelMessage(settings);
            internalCallOperation(settings, true);
        },

        /* Utilizar para extrair a mensagem de erro retornado por uma chamada AJAX */
        getErrorMessage: function (data) {
            var errorText = "Não foi possível executar a operação.";
            if (data.responseJSON && data.responseJSON.Message)
                errorText = data.responseJSON.Message;

            if (data.responseText && data.responseText.indexOf("lblErrorMessage") > 0) {
                var labMessage = $(data.responseText).find("#lblErrorMessage").text();
                if (labMessage)
                    errorText = labMessage;
            }
            return errorText;
        },

        /* Utilizar para retornar a URL compleda da aplicação concatenada com a url relativa */
        getUrlPath: function (relativePath) {
            var fullPath = $("#Wes2008ApplicationPath").val() + relativePath;
            return fullPath;
        }

    };

})();

/* global AGA, AGATableExport */
AGA.Grid = (function () {

    function getAlignClass(value) {
        if (value === 1) return "text-center";
        if (value === 2) return "text-right";
        return undefined; // left é o padrão
    }

    function formatValue(decimals, value) {
        if (!decimals)
            return value;

        if (AGA.Helper.isNullValue(value))
            return "";

        var sign = (value < 0) ? "-" : "";
        var v = Math.abs(value).toString();
        var p = v.indexOf(".");
        if (p < 0) {
            v += ".";
            p = v.length - 1;
        }

        while (v.length <= (p + decimals)) {
            v += "0";
        }

        // Trocar de ponto para virgula
        v = v.replace(".", ",");

        // Incluir ponto de milhar
        if (p > 3) {
            return sign + v.substr(0, p - 3) + "." + v.substr(p - 3);
        }
        return sign + v;
    }

    function createAfterRenderRowInvoker(grid) {
        var result = {
            call: function () { }
        };

        var evt = $(grid).data("afterrenderrow");
        if (evt) {
            result.grid = grid;
            result.evt = evt;
            result.call = function (tr, record) {
                AGA.Helper.invoke(evt, {
                    grid: grid,
                    tr: tr,
                    record: record
                });
            };
        }
        return result;
    }

    function updateData(grid, data) {
        var tbody = $(grid).find("table tbody");
        $(tbody).empty();

        // Pegar informações de colunas
        var allThs = [];
        $(grid).find("tr.header > th").each(function (index, obj) {
            allThs.push({
                name: $(obj).data("field"),
                decs: $(obj).data("decs"),
                alignment: getAlignClass($(obj).data("alignment")),
                cmdTemplate: $(obj).find(".cmd-template").first()
            });
        });

        var afterRenderRowInvoker = createAfterRenderRowInvoker(grid);

        var index = data.StartIndex || 0;
        for (var i = 0; i < data.Rows.length; i++) {
            var record = AGA.Grid.getRecord(data, i);

            var tr = document.createElement("tr");
            if (record.HANDLE) $(tr).data("handle", record.HANDLE);
            if (record.URL) $(tr).data("url", record.URL);

            $(tr).data("index", index).appendTo(tbody);
            index++;

            for (var p = 0; p < allThs.length; p++) {
                var info = allThs[p];
                var tc = document.createElement("td");
                if (info.alignment)
                    $(tc).addClass(info.alignment);
                if (info.cmdTemplate.length > 0)
                    $(tc).html($(info.cmdTemplate[0]).html()).appendTo(tr);
                else
                    $(tc).html(formatValue(info.decs, record[info.name])).appendTo(tr);
            }

            // disparar afterRenderRow event
            afterRenderRowInvoker.call(tr, record);

        }
    }

    function updatePagination(grid, data) {
        var start = data.StartIndex;
        var moreData = data.More;

        $(grid).data("current", start);
        var prev = start > 0;
        var next = moreData;

        var needPagination = prev || next;

        $(grid).find(".grid-footer-row").toggleClass("hide", !needPagination);
        $(grid).find(".previous").toggleClass("hide", !prev);
        $(grid).find(".next").toggleClass("hide", !next);
    }

    function getPageSize(grid) {
        var pageSize = $(grid).data("pagesize");
        return pageSize ? pageSize : 10;
    }

    function getCurrent(grid) {
        var startIndex = $(grid).data("current");
        return startIndex ? startIndex : 0;
    }

    function deltaPage(any, delta) {
        var grid = $(any).closest(".aga-grid");

        var startIndex = getCurrent(grid);
        var pageSize = getPageSize(grid);

        var newIndex = startIndex + (delta * pageSize);
        if (newIndex < 0)
            newIndex = 0;
        $(grid).data("current", newIndex);
        internalLoad(grid);
    }

    function callEvent(grid, eventName, data) {
        var evt = $(grid).data(eventName);
        if (evt)
            AGA.Helper.invoke(evt, {
                grid: grid,
                eventName: eventName,
                gridData: data
            });
    }

    function internalLoad(grid, optionalData) {
        callEvent(grid, "beforeload");

        var processFunction = function (data) {
            // Atualizar dados da tabela
            updateData(grid, data);

            // Paginação
            updatePagination(grid, data);

            AGA.Grid.hideMessagePanel(grid);

            // Exportacao
            //checkCanExport(grid);

            $(grid).show();
            callEvent(grid, "afterload", data);
        };

        if (!AGA.Helper.isNullValue(optionalData)) {
            processFunction(optionalData);
        } else {
            var pars = AGA.Grid.getCallParameters(grid);
            AGA.Ajax.callWebMethod("AGAGridGet",
                pars,
                function (data) {
                    processFunction(data.d);
                },
                function (errorData) {
                    var msg = AGA.Ajax.getErrorMessage(errorData);
                    AGA.Helper.createMessagePanel($(grid).find(".message-panel").first()[0], "alert-danger", msg);
                    $(grid).show();
                });
        }
    }

    return {
        initAll: function () {
            $(".aga-grid.auto-load").each(function (index, element) {
                AGA.Grid.load(element);
            });
        },

        hideMessagePanel: function (selector) {
            $(AGA.Helper.resolveElement(selector)).find(".message-panel").addClass("hide");
        },

        load: function (selector, optionalData) {
            // Quanto o load é chamado deve ser recarregado completo
            var grid = $(AGA.Helper.resolveElement(selector)).closest(".aga-grid");
            $(grid).data("current", 0);
            internalLoad(grid, optionalData);
        },

        getCallParameters: function (selector) {
            var grid = AGA.Helper.resolveElement(selector);
            var filterValues = {};
            var formFilterId = $(grid).data("formfilter");
            if (formFilterId)
                filterValues = AGA.Form.getValues("#" + formFilterId);

            var callingMethod = $(grid).data("method");
            var pageSize = $(grid).data("pagesize");
            var orderField = $(grid).data("order");
            var orderFieldDesc = $(grid).data("orderdesc");
            var startIndex = $(grid).data("current");

            return {
                method: callingMethod,
                fields: filterValues,
                startIndex: (startIndex ? startIndex : 0),
                count: pageSize,
                orderField: (orderField ? orderField : ""),
                descending: (orderFieldDesc ? orderFieldDesc : 0)
            };
        },

        getRecord: function (obj, rowIndex) {
            // var record = {};
            // for (var p = 0; p < obj.Columns.length; p++) {
            //    record[obj.Columns[p]] = obj.Rows[rowIndex][p];
            // }
            // return record;
            return obj.Columns.reduce(function (result, colName, index) {
                result[colName] = obj.Rows[rowIndex][index];
                return result;
            }, {});
        },

        nextPage: function (element) {
            deltaPage(element, 1);
        },

        priorPage: function (element) {
            deltaPage(element, -1);
        },

        sort: function (element) {
            var th = $(element).closest("th");
            var fieldName = $(th).data("field");
            var orderdesc = 0;
            if ($(th).data("sort") === "asc") {
                $(th).data("sort", "desc");
                orderdesc = 1;
            } else {
                $(th).data("sort", "asc");
            }

            var grid = $(th).closest(".aga-grid");
            $(grid).data({
                "order": fieldName,
                "orderdesc": orderdesc,
                "current": 0
            });
            AGA.Grid.load(grid);
        },

        cmdRowClick: function (element) {
            var a = $(element).closest("a");
            //var handle = $(a).closest("tr").data("handle");

            var s = $(a).data("client");
            if (s) {
                AGA.Helper.invoke(s, element);
            }

            s = $(a).data("server");
            if (s) {
                alert("Chamar o servidor " + s);
            }

            return false;
        },

        cmdClick: function (element) {
            var a = $(element).closest("a");
            var s = $(a).data("client");
            if (s) {
                AGA.Helper.invoke(s, a);
            }

            s = $(a).data("server");
            if (s) {
                alert("Chamar o servidor " + s);
            }

            return false;
        },

        download: function (target, format) {
            var table = $(target).closest(".aga-grid").find("table").first();

            if (format && format.toLowerCase() === "xlsx")
                AGATableExport.clickHandlerXLSX({
                    target: table,
                    currentTarget: table
                });

            if (format && format.toLowerCase() === "csv")
                AGATableExport.clickHandlerCSV({
                    target: table,
                    currentTarget: table
                });
        },

        enableCommand: function (jQuerySelector) {
            $(jQuerySelector)
                .removeClass("disabled")
                .removeAttr("disabled");
        },

        disableCommand: function (jQuerySelector) {
            $(jQuerySelector)
                .addClass("disabled")
                .attr("disabled", "disabled");
        }

    };
})();

/* global AGA */
AGA.TextDecorator = (function () {

    function swap(f, t) {
        var fText = $(f).text();
        if (fText.length > 0) {
            $(t).text($(t).text() + fText[0]);
            $(f).text(fText.substring(1));
            return true;
        }
        return false;
    }

    return {
        fromToClass: function (parent, text, fromClass, toClass, doneFn) {
            if (!text || text.length === 0) {
                if (doneFn) doneFn();
                return;
            }

            var spTo = document.createElement("span");
            var spFrom = document.createElement("span");
            $(spTo).addClass(toClass).text("").appendTo(parent);
            $(spFrom).addClass(fromClass).text(text).appendTo(parent);

            var timer = 300 / text.length;
            if (timer < 5)
                timer = 5;

            var run = function (f, t, fn) {
                setTimeout(function () {
                    if (swap(f, t)) {
                        run(f, t, fn);
                    } else {
                        if (fn)
                            fn();
                    }
                },
                    timer);
            };

            run(spFrom, spTo, doneFn);
        }
    };
})();

/* global AGA */
// Inicializações quando o documento está pronto
(function () {

    $(document).ready(function () {
        AGA.Menu.init();
        AGA.Lookup.initAll();
        AGA.Grid.initAll();
        AGA.Form.initAll();
    });
})();

"use strict";
var AGA = AGA || {};

/*

Exemplo de tileMetadata:
{
       Uid,
       Value,
       Name,
       CssClass,
       FontIcon,
       Url,
       UrlTarget,
       ScriptClickCallback,
       UpdateTypeCallback,
       Size
}
 
 */



AGA.Tile = (function () {
    var wasInited = false;
    var defaults =
    {
        Uid: "",
        Value: "",
        Name: "",
        CssClass: "",
        FontIcon: "",
        Url: "",
        UrlTarget: 0, //Navigate
        ScriptClickCallback: "",
        UpdateTypeCallback: "",
        Size: 0 //Default
    }

    function getTileClasses(tileMetaData) {
        var fixeds = "dashboard-stat aga-tile " + tileMetaData.CssClass;

        switch (tileMetaData.Size) {
            case 1://Small
                return fixeds + " tile-small";

            case 2://Big
                return fixeds + " tile-big";

            default:
                return fixeds + " tile-default";
        }
    }

    function renderInnerContent(parent, tileMetaData) {
        var divVisual = document.createElement("div");
        $(divVisual)
            .addClass("visual")
            .appendTo(parent);

        var icon = document.createElement("i");
        $(icon)
            .addClass("fa " + tileMetaData.FontIcon)
            .appendTo(divVisual);

        var divDetails = document.createElement("div");
        $(divDetails)
            .addClass("details")
            .appendTo(parent);

        var divNumber = document.createElement("div");
        $(divNumber)
            .addClass("number")
            .text(tileMetaData.Value)
            .appendTo(divDetails);

        var divTitle = document.createElement("div");
        $(divTitle)
            .addClass("desc")
            .html(tileMetaData.Name)
            .appendTo(divDetails);
    }

    function createAnchorTile(tileMetaData) {
        var anchor = document.createElement("a");
        $(anchor)
            .attr("href", "javascript:;");

        if (tileMetaData.UrlTarget) {
            $(anchor)
                .attr("data-urltarget", tileMetaData.UrlTarget);
        }

        if (tileMetaData.Url) {
            $(anchor)
                .attr("data-url", tileMetaData.Url);
        }

        renderInnerContent(anchor, tileMetaData);
        return anchor;
    }

    function createDivTile(tileMetaData) {
        var div = document.createElement("div");
        renderInnerContent(div, tileMetaData);
        return div;
    }

    function createInner(tileMetaData) {

        if (AGA.Helper.isNullValue(tileMetaData.Url) && AGA.Helper.isNullValue(tileMetaData.ScriptClickCallback))
            return createDivTile(tileMetaData);

        return createAnchorTile(tileMetaData);
    }

    function internalRenderTile(tile, tileMetaData) {

        var inner = createInner(tileMetaData);

        $(inner)
            .addClass(getTileClasses(tileMetaData));

        if (tileMetaData.Uid)
            $(inner).attr("data-uid", tileMetaData.Uid);

        if (tileMetaData.ScriptClickCallback)
            $(inner).attr("data-clickcallback", tileMetaData.ScriptClickCallback);

        if (tileMetaData.UpdateTypeCallback)
            $(inner).attr("data-updatecallback", tileMetaData.UpdateTypeCallback);

        $(tile).append(inner);
    }

    function getCssClassFromSize(tileSize) {
        switch (tileSize) {
            case 1://Small
                return "col-lg-2 col-md-3 col-sm-3 col-xs-6";
            case 2://Big
                return "col-lg-4 col-md-6 col-sm-12 col-xs-12";
            default://Default
                return "col-lg-3 col-md-4 col-sm-6 col-xs-12";
        }
    }

    var renderImplementation = function (metaData) {
        var tileMetaData = $.extend(defaults, metaData);

        var tile = document.createElement("div");
        $(tile)
            .addClass(getCssClassFromSize(tileMetaData.Size));

        internalRenderTile($(tile), tileMetaData);

        return tile;
    };

    var getModalConfig = function (url, size) {
        return {
            url: url,
            id: "aga-tile-modal",
            size: size,
            height: 750,
            displayFooter: false,
            displayTitle: false,
            title: ""
        };
    }

    var handleUrl = function (url, target) {
        if (!url) return;

        if (!target || parseInt(target) === 0) {
            window.location.href = url;
            return;
        }

        var size = "default";
        var itarget = parseInt(target);
        if (itarget === 2)
            size = "large";
        else if (itarget === 3)
            size = "fullpage";

        var config = getModalConfig(url, size);
        Benner.ModalPage.show(config,
                Benner.WidgetCommandsBar.openModal,
                Benner.WidgetCommandsBar.disposeModal);
    };

    var handleClickImplementation = function (e) {
        var tile = $(e.currentTarget);

        var callback = $(tile).data("clickcallback");
        if (callback)
            AGA.Helper.invoke(callback, e);

        var url = $(tile).data("url");
        var target = $(tile).data("urltarget");

        handleUrl(url, target);


    };

    var initImplementation = function () {
        if (!wasInited)
            $("body").on("click", ".aga-tile", handleClickImplementation);
        wasInited = true;
    };

    var updateIt = function (element) {
        var updateCallback = $(element).data("updatecallback");
        var url = AGA.Ajax.getUrlPath("api/AGATile");
        $(element).find(".number").html('<i class="fa fa-spinner fa-pulse"></i>');
        $.ajax({
            url: url,
            data: { updateCallback: updateCallback },
            dataType: "json",
            cache: false,
            success: function (data) {

                var novo = renderImplementation(data);
                $(element).parent().html($(novo).html());

            },
            error: function (objError, status, erro) {
                var errorMessage = AGA.Ajax.getErrorMessage(erro);
                $(element).find(".visual").empty();
                $(element).find(".details > .number > i").addClass("fa-warning").removeClass("fa-spinner fa-pulse");
                $(element).find(".details .desc").text(errorMessage);
            }
        });
    };

    var updateAll = function () {
        $(".aga-tile[data-updatecallback]").each(function (index, obj) {
            updateIt(obj);
        });
    };

    var updateAllRequired = function () {
        $(".aga-tile[data-updaterequired]").each(function (index, obj) {
            updateIt(obj);
        });
    };

    return {
        init: initImplementation,
        render: renderImplementation,
        updateAll: updateAll,
        updateAllRequired: updateAllRequired
    };

})();

$(document).ready(function () {
    AGA.Tile.init();
    AGA.Tile.updateAllRequired();
});

"use strict";
var AGA = AGA || {};

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
"use strict";

var AGA = AGA || {};

AGA.QuickNav = (function () {

    var updateContent = function (data) {
        $(".quick-nav-placeholder").fadeOut(200, function () { $(this).remove(); });
        if (data && data.length > 0) {
            $("form").first().after(data);
            QuickNav.init();
        }
    };

    var update = function () {
        var url = AGA.Ajax.getUrlPath("api/QuickNav");
        $.ajax({
            url: url,
            cache: false,
            success: function (data) {
                updateContent(data);
            }
        });
    };

    return {
        update: update
    };
})();

AGA.TableCreator = function (attributes) {
    var _root = document.createElement("table");
    if (attributes) {
        $(_root).attr(attributes);
    }
    var _tbody = document.createElement("tbody");
    _root.appendChild(_tbody);
    var _headerRow = document.createElement("tr");
    $(_headerRow).appendTo(_tbody);
    var _columns = [];

    function addCol(args) {
        var newCol = {
            name: _columns.length.toString(),
            title: "",
            setValue: defaultSetValue
        };
        var typeOf = typeof args;
        if (typeOf === "string") {
            newCol.title = args;
        }
        else if (typeOf === "object") {
            $.extend(newCol, args);
        }

        newCol.th = document.createElement("th");
        if (newCol.title) {
            if ($.isFunction(newCol.title)) {
                newCol.title(newCol.th);
            }
            else {
                $(newCol.th).text(newCol.title);
            }
        }

        _headerRow.appendChild(newCol.th);
        _columns.push(newCol);
        return newCol;
    };

    function findColumn(selector) {
        if (!selector)
            return undefined;

        if (typeof selector === "number") {
            return _columns[selector];
        }

        for (var i = 0; i < _columns.length; i++) {
            if (_columns[i].name === selector) {
                return _columns[i];
            }
        }
        return undefined;
    }

    function defaultSetValue(td, dto, colName) {
        if (!dto)
            return;

        if (dto[colName]) {
            $(td).text(dto[colName]);
        }
    }

    return {
        table: _root,

        headerRow: _headerRow,

        addColumns: function (columns) {
            if (columns) {
                if (columns instanceof Array) {
                    var res = [];
                    for (var i = 0; i < columns.length; i++) {
                        res.push(addCol(columns[i]));
                    }
                    return res;
                }
                else {
                    return addCol(columns);
                }
            }
            return undefined;
        },

        getHeaderCell: function (selector) {
            var col = findColumn(selector);
            if (col)
                return col.th;
            return undefined;
        },

        addRow: function (dataObject) {
            var tr = document.createElement("tr");
            $(tr).appendTo(_tbody);

            for (var i = 0; i < _columns.length; i++) {
                var td = document.createElement("td");
                // Setar o valor
                _columns[i].setValue(td, dataObject, _columns[i].name);
                // Incluir atributos
                if (_columns[i].attributes)
                    $(td).attr(_columns[i].attributes);

                $(td).appendTo(tr);
            }

            return (function (c, t) {
                var _tr = t;
                var _cols = c;

                return {
                    getCell: function (selector) {
                        if (!selector)
                            return undefined;

                        if (typeof selector === "number") {
                            return _tr.children[selector];
                        }

                        for (var i = 0; i < _columns.length; i++) {
                            if (_cols[i].name === selector) {
                                return _tr.children[i];
                            }
                        }
                        return undefined;
                    }
                };
            })(_columns, tr);
        }
    };
    
};



/*
 EXEMPLO DE UTILIZAÇÃO do AGA.TableCreator
  <div id="teste">
  </div>
    
    <script>
        var tabela = new AGA.TableCreator({ "class": "table table-hover", "id": "testeTable", "data-orderby": "NOME" });
        $(tabela.headerRow).addClass("header");

        tabela.addColumns({ name: "Coluna1", title: "Minha coluna 1" });
        tabela.addColumns({
            name: "Colunax",
            title: function (node) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:ManutencaoVerbas.setOrderBy('NOME');")
                    .text("Matricula").appendTo(node);
            },
            setValue: function (td, dataObject) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:;")
                    .text(AGA.Helper.getProps(dataObject)).appendTo(td);
            }
        });
        tabela.addColumns("Minha coluna 2");
        tabela.addColumns(["Minha coluna 3", "Minha coluna 4"]);
        
        var col3 = tabela.getHeaderCell(3);
        $(col3).css("background-color", "red");

        var colx = tabela.getHeaderCell("Colunax");
        $(colx).css("background-color", "blue");

        var row = tabela.addRow({ "Coluna1": "Valorcoluna1" });
        
        row.getCell(3).innerText = "Meu teste coluna 3";
        row.getCell("Coluna1").innerText = "1";

        $("#teste").append(tabela.table);


    </script>
 
  
 */
/* global AGA */
AGA.Memo = (function () {

    // Obter implementação base
    var baseMethods = AGA.BaseInputControl();
    var publicMethods = $.extend({}, baseMethods);

    // customizações
    publicMethods.getControlClass = function () { return "aga-memo"; };

    // retornar implementação final
    return publicMethods;

})();

AGA.Form.addControl(AGA.Memo);

AGA.Toastr = (function () {

    var defaults = {
        kind: "Success",
        position: "BottomRight",
        timeout: 0,
        title: "",
        message: "",
        url: "",
        urlTarget: "Navigate"
    };

    function getPosition(name) {
        var matrix = {
            "BottomRight": "toast-bottom-right",
            "BottomLeft": "toast-bottom-left",
            "TopLeft": "toast-top-left",
            "TopCenter": "toast-top-center",
            "BottomCenter": "toast-bottom-center",
            "TopFullWidth": "toast-top-full-width",
            "BottomFullWidth": "toast-bottom-full-width",
            "TopRight": "toast-top-right"
        };

        return matrix[name] || "toast-top-right";
    };

    function getClass(kind) {
        var matrix = {
            "Success": "success",
            "Info": "info",
            "Warning": "warning",
            "Error": "error"
        };
        return matrix[kind] || "success";
    };

    function doModal(url) {

        var config = {
            url: url,
            id: "aga-tile-modal",
            size: "large",
            height: 750,
            displayFooter: false,
            displayTitle: false,
            title: ""
        };
        Benner.ModalPage.show(config,
            Benner.WidgetCommandsBar.openModal,
            Benner.WidgetCommandsBar.disposeModal);
    };

    function handleClickDelegate(options) {
        var url = options.url;
        var urlTarget = options.urlTarget;
        return function () {
            if (urlTarget === "Modal")
                doModal(url);
        };
    };

    var templates = {
        "Navigate": '<a href="%url%">%message%</a>',
        "BlankPage": '<a href="%url%" target="_blank">%message%</a>',
        "Modal": "%message%",
        "Default": "%message%"
    };

    function getMessage(options) {
        var url = options.url;
        var urlTarget = options.urlTarget;
        var message = options.message;
        var template = templates[urlTarget] || templates.Default;
        return template.replace("%url%", url).replace("%message%", message);
    };

    function show(options) {
        options = $.extend({}, defaults, options);

        toastr.options = {
            closeButton: true,
            debug: false,
            newestOnTop: true,
            positionClass: getPosition(options.position),
            onclick: handleClickDelegate(options),
            showDuration: 1000,
            hideDuration: 1000,
            timeOut: options.timeout,
            extendedTimeOut: 0,
            showEasing: "swing",
            hideEasing: "linear",
            showMethod: "fadeIn",
            hideMethod: "fadeOut"
        }
        toastr[getClass(options.kind)](getMessage(options), options.title);
    };
    
    var showAll = function () {
        $(".aga-toastr").each(function (index, item) {
            var opts = {
                kind: $(item).data("kind"),
                position: $(item).data("position"),
                timeout: $(item).data("timeout"),
                title: $(item).data("title"),
                message: $(item).data("message"),
                url: $(item).data("url"),
                urlTarget: $(item).data("urlTarget")
            };
            AGA.Toastr.show(opts);
            $(item).detach();
        });
    };

    return {
        show: show,
        showAll: showAll
    }
})();

$(document).ready(function () {
    AGA.Toastr.showAll();
});
AGA.UserConfirmation = (function () {

    var allMessages = [];
    var current = null;

    function callback(metodo) {
        AGA.Ajax.callWebMethodBlocked(
            metodo,
            { parametro: current.handle },
            function () { showCurrent(); },
            function (erro, mensagem) { alert(mensagem); showCurrent(); });
    }

    function yesCallback() {
        callback("AgaUserConfirmationYes");
    }

    function noCallback() {
        callback("AgaUserConfirmationNo");
    }

    function showCurrent() {
        if (allMessages.length === 0)
            return;
        current = allMessages[0];
        allMessages = allMessages.slice(1);

        AGA.Helper.requestConfirmationCustom({
            title: "Confirmação solicitada",
            message: current.message,
            yesCallback: yesCallback,
            noCallback: noCallback
        });
    }

    function showAll() {
        var messages = $(".aga-user-confirmation");
        if (messages.length === 0)
            return;

        allMessages = messages.map(function (index, item) {
            return {
                handle: $(item).data("handle"),
                message: $(item).html()
            };
        });

        $(".aga-user-confirmation").detach();
        showCurrent();
    };


    return {
        showAll: showAll
    }
})();

$(document).ready(function () {
    AGA.UserConfirmation.showAll();
});
var AGA = AGA || {};
AGA.Schedule = (function () {
    var CLASSES = {
        autoInit: "aga-autoinit",
        noPerson: "aga-no-schedule-person",
        needUpdate: "aga-need-update"
    };

    var SELECTOR = {
        calendar: ".aga-calendar",
        calendarBody: ".aga-calendar-body",
        calendarPlaceHolder: ".aga-calendar-placeholder",
        needUpdate: ".aga-need-update"
    };
    
    var isAllDay = function (mmt, mmtFim) {

        if (mmt.hour() !== 0 && mmt.minute() !== 0)
            return false;

        var fh = mmtFim.hour();
        if (fh !== 0 && fh !== 23)
            return false;
        var fm = mmtFim.minute();
        if (fm !== 0 && fm !== 59)
            return false;
        return true;
    };

    var getRoot = function (anyTarget) {
        return $(anyTarget).closest(SELECTOR.calendar);
    };

    var getLookupSchedule = function (root) {
        return $(root).find("[data-name='SCHEDULE_LOOKUP']");
    };

    var getLookupPerson = function (root) {
        return $(root).find("[data-name='SCHEDULE_PERSON']");
    };

    var hasPerson = function (lookupPerson) {
        return !$(lookupPerson).hasClass(CLASSES.noPerson);
    };

    var getModalUrl = function (schedule, event, person, date) {
        var dateStr = (date ? "&dt=" + date.format("YYYYMMDDHHmmss") : "");
        return AGA.Ajax.getUrlPath("aga/a/agenda/eventoagenda.aspx?imp=1" +
            "&s=" + schedule +
            "&pe=" + person +
            "&e=" + event +
            dateStr);
    };

    var tryShowNewEventButton = function(root) {
        var mustHide = ($(root).data("readonly") === "S") || ($(root).data("interval") === "S");
        $(".aga-schedule-new-event").toggleClass("hide", mustHide);
    };

    var unblock = function (anyTarget) {
        var root = getRoot(anyTarget);

        tryShowNewEventButton(root);

        if (!$(root).hasClass("blocked"))
            return;

        $(root).removeClass("blocked")
			.find(SELECTOR.calendarPlaceHolder).each(
            function (index, item) {
                AGA.Helper.unblockElement(item);
            });
    };

    var block = function (anyTarget) {
        var root = getRoot(anyTarget);
        if ($(root).hasClass("blocked"))
            return;

        $(root).addClass("blocked");
        AGA.Helper.blockElement($(root)
			.find(SELECTOR.calendarPlaceHolder)[0],
            "Selecione acima a agenda desejada");

        $(".aga-schedule-new-event").addClass("hide");
    };

    var canShowContent = function (anyTarget) {
        var root = getRoot(anyTarget);
        var lookupSchedule = getLookupSchedule(root);
        var mustBlock = (!lookupSchedule) || AGA.Lookup.isNull(lookupSchedule);
        if (!mustBlock) {
            var lookupPerson = getLookupPerson(root);
            if (hasPerson(lookupPerson)) {
                mustBlock = AGA.Lookup.isNull(lookupPerson);
            }
        }
        return !mustBlock;
    };

    var getCurrentInfo = function (anyTarget) {
        var root = getRoot(anyTarget);
        var lookupSchedule = getLookupSchedule(root);
        var lookupPerson = getLookupPerson(root);
        var person = hasPerson(lookupPerson) ? AGA.Lookup.getValue(lookupPerson) : 0;
        return {
            schedule: AGA.Lookup.getValue(lookupSchedule),
            person: person
        };
    };

    var getUnavailabilityText = function (period, title) {
        var rowTemplate = '<div class="row"><label class="col-md-3">%label%</label><div class="col-md-9 bold">%value%</div></div>';
        var buildRow = function (label, value) {
            return rowTemplate
                .replace("%label%", label)
                .replace("%value%", value);
        };

        return buildRow("Período:", period) + buildRow("Descrição:", title);
    };

    var updateSourceBuilder = function (root) {
        var myRoot = root;
        return function (start, end, utc, callback) {

            var show = canShowContent(myRoot);
            if (!show)
                callback([]);
            else {
                var info = getCurrentInfo(myRoot);
                info.start = start.format("DD/MM/YYYY");
                info.end = end.format("DD/MM/YYYY");

                $.ajax({
                    url: AGA.Ajax.getUrlPath("api/AGAAgendaProvider"),
                    data: info,
                    cache: false,
                    dataType: "json",
                    success: function (data) {
                        $(myRoot).data("hash", data.ScheduleHash);
                        $(myRoot).data("person", data.PersonHash);
                        $(myRoot).data("readonly", data.ReadOnly);
                        $(myRoot).data("interval", (data.Interval && data.Interval > 0) ? "S" : "N");

                        var events = data.Events.map(function (item) {
                            var startEvent = moment(item.Range.s);
                            var endEvent = moment(item.Range.e);
                            return {
                                id: item.Id,
                                start: startEvent,
                                end: endEvent,
                                title: item.Title,
                                allDay: isAllDay(startEvent, endEvent),
                                schedule: data.ScheduleHash,
                                person: data.PersonHash,
                                backgroundColor: "#69a4e0",
                                endOfScale: item.eos
                            };
                        });

                        if (data.Availabilities && data.Availabilities.length) {
                            for (var index = 0; index < data.Availabilities.length; index++) {
                                var range = data.Availabilities[index];
                                var startAvail = moment(range.s);
                                var endAvail = moment(range.e);
                                events.push(
                                    {
                                        id: "new",
                                        start: startAvail,
                                        end: endAvail,
                                        title: "Disponível",
                                        allDay: isAllDay(startAvail, endAvail),
                                        schedule: data.ScheduleHash,
                                        person: data.PersonHash,
                                        backgroundColor: "#1bbc9b",
                                        endOfScale: range.eos
                                    });
                            };
                        };

                        if (data.Unavailabilities && data.Unavailabilities.length) {
                            data.Unavailabilities.map(function (current) {
                                current.Ranges.map(function (range) {
                                    var startUn = moment(range.s);
                                    var endUn = moment(range.e);
                                    events.push(
                                        {
                                            id: "not",
                                            start: startUn,
                                            end: endUn,
                                            title: current.Title,
                                            rangeText: current.RangeText,
                                            allDay: isAllDay(startUn, endUn),
                                            backgroundColor: "#F3565D",
                                            resourceEditable: false,
                                            editable: false
                                        });
                                });
                            });
                        };

                        callback(events);
                        unblock(myRoot);
                    },
                    error: function (error) {
                        AGA.Helper.alert(AGA.Ajax.getErrorMessage(error));
                    }
                });
            }
        };
    };

    var updateContent = function (anyTarget) {
        var canUpdate = canShowContent(anyTarget);
        var root = getRoot(anyTarget);
        $(root).find(SELECTOR.calendarBody).fullCalendar("refetchEvents");
        if (canUpdate) {
            //unblock(anyTarget);
        } else {
            block(anyTarget);
        }
    };

    var scheduleChanged = function (e) {
        var url = "AgaAgendas/Agendado?agenda=" + e.value + "&_=" + new Date().getTime();
        url = AGA.Ajax.getUrlPath(url);
        $(".aga-schedule-scheduled").empty();
        $.get(url,
	        function (data) {
	            $(".aga-schedule-scheduled").html(data);
	            AGA.Lookup.initAll();
	            updateContent(e.currentTarget);
	        });
    };

    var scheduledPersonChanged = function (e) {
        updateContent(e.currentTarget);
    };

    var modalClose = function () {
        AGA.log("AGA.Schedule.modalClose");
        Benner.WidgetCommandsBar.disposeModal();
        $(SELECTOR.needUpdate).each(function (index, item) {
            $(item).removeClass(CLASSES.needUpdate);
            updateContent(item);
        });
    };

    var openModal = function (url) {
        AGA.log("AGA.Schedule.openModal");
        var config = {
            url: url,
            id: "aga-schedule-modal",
            size: "large",
            height: 750,
            displayFooter: false,
            displayTitle: false,
            title: ""
        };

        Benner.ModalPage.show(config,
            Benner.WidgetCommandsBar.openModal,
            modalClose);
    };

    var getConfig = function (root) {
        return {
            header: {
                //left: "prev,next today",
                left: "title",
                center: "",
                right: "prev,next today,agendaDay,agendaWeek,month"
            },
            monthNames: [
	            "Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro",
	            "Novembro", "Dezembro"
            ],
            monthNamesShort: ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"],
            dayNames: ["Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"],
            dayNamesShort: ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"],
            timeFormat: "HH:mm ",
            axisFormat: "HH:mm",
            allDayText: "Hora",
            lazyFetching: false,
            buttonText: {
                today: "Hoje",
                month: "Mês",
                week: "Semana",
                day: "Dia"
            },
            displayEventTime: false,
            slotDuration: "00:15:00",
            scrollTime: "06:00:00",
            columnFormat: {
                day: "ddd DD/MM",
                week: "ddd DD/MM",
                month: "ddd"
            },
            titleFormat: {
                month: "MMMM/YYYY",
                day: "ddd - DD/MM/YYYY",
                week: "DD/MM/YYYY"
            },
            eventSources: [updateSourceBuilder(root)],

            eventRender: function (event, element) {
                if (event.allDay) {
                    $(element).find(".fc-time").addClass("hide");
                }
                if (event.id === "not") {
                    $(element).find(".fc-time").text(event.start.format("HH:mm") +" - "+ event.end.format("HH:mm"));
                }


                if (event.endOfScale) {
                    $(element).css("border-bottom", "solid 2px #F3565D");
                } else {
                    $(element).css("border-bottom", "solid 1px #eee");
                }
            },
            eventClick: function (calEvent) {

                // alert('Event: ' + calEvent.schedule);
                // alert('Id: ' + calEvent.id);
                // alert('View: ' + view.name);

                if (calEvent.schedule) {
                    var url = getModalUrl(calEvent.schedule, calEvent.id, calEvent.person, calEvent.start);
                    openModal(url);
                } else {
                    AGA.Helper.alert("Indisponibilidade", getUnavailabilityText(calEvent.rangeText, calEvent.title));
                }
            }

        };

    };

    var initAll = function () {
        $(".aga-calendar").each(function (index, item) {
            $(item).removeClass(CLASSES.autoInit);
            $(item).find(SELECTOR.calendarBody).fullCalendar(getConfig(item));
            block(item);
        });
    };

    var needUpdate = function () {
        AGA.log("AGA.Schedule.needUpdate call");
        $(SELECTOR.calendar).addClass(CLASSES.needUpdate);
    };

    var newEvent = function (e) {
        var root = getRoot(e);
        var schedule = $(root).data("hash");
        var person = $(root).data("person");
        var url = getModalUrl(schedule, "new", person);
        openModal(url);
    };

    return {
        initAll: initAll,
        scheduleChanged: scheduleChanged,
        scheduledPersonChanged: scheduledPersonChanged,
        needUpdate: needUpdate,
        newEvent: newEvent
    };

})();

$(document).ready(function () { AGA.Schedule.initAll(); });
$(document).ready(function () {
	if (!$(".searcher-icon").length) {
		$("#searcher-modal").remove();
	}
});

var AGATableExport = (function () {

    function isReady() {
        return (window.XLSX);
    }

    function loadDependencies() {
        if (isReady())
            return;

        var files = [
            "fabric.js/fabric.min.js",
            "FileSaver.js/FileSaver.min.js",
            "jszip/jszip.min.js",
            "xlsx/xlsx.min.js"
        ];

        var root = "content/assets/amcharts/plugins/export/libs/";
        $(files).each(function (index, name) {
            AGA.Loader.load(root + name);
        });
    }

    return {

        createAllLinks: function () {
            $('table').each(function (index, obj) {
                AGATableExport.createLink(obj);
            });
        },

        createLink: function (table) {
            var tbl = $(table).closest("table");

            var th = $(tbl).find("th:last-of-type");
            if (th.children(".aga-table-export").length > 0)
                return;

            var link = AGATableExport.buildLinkElement();
            $(th).append(link);
        },

        buildLinkElement: function () {
            var link = document.createElement("div");
            $(link).addClass("btn-group aga-table-export-group");

            var a = document.createElement("a");
            $(a).addClass("btn btn-sm aga-table-export-btn").attr({
                "href": "javascript:;",
                "data-toggle": "dropdown",
                "aria-expanded": "false",
                "data-original-title": "Exportar tabela"
            }).appendTo(link);
            $(a).tooltip();

            var i = document.createElement("i");
            $(i).addClass("fa fa-download").appendTo(a);

            var ul = document.createElement("ul");
            $(ul).addClass("dropdown-menu pull-right").appendTo(link);

            // XLSX
            var li = document.createElement("li");
            $(li).appendTo(ul);
            a = document.createElement("a");
            $(a).attr("href", "javascript:;").text("XLSX").appendTo(li);
            $(li).on("click", AGATableExport.clickHandlerXLSX);

            //CSV
            li = document.createElement("li");
            $(li).appendTo(ul);
            a = document.createElement("a");
            $(a).attr("href", "javascript:;").text("CSV").appendTo(li);
            $(li).on("click", AGATableExport.clickHandlerCSV);

            return link;
        },

        clickHandlerXLSX: function (e) {
            loadDependencies();
            var handler = function () {
                if (!isReady()) {
                    setTimeout(handler, 300);
                } else {
                    var table = $(e.target).closest('table');
                    var data = AGATableExport.getData(table, AGATableExport.getNumberOrString);
                    AGATableExport.saveXLSX(data, "tabela.xlsx");
                }
            };
            handler();
        },

        clickHandlerCSV: function (e) {
            loadDependencies();
            var handler = function () {
                if (!isReady()) {
                    setTimeout(handler, 300);
                } else {

                    var table = $(e.target).closest('table');
                    var data = AGATableExport.getData(table);
                    var content = "";
                    for (var L = 0; L < data.length; L++) {
                        var line = "";
                        var sep = "";
                        for (var C = 0; C < data[L].length; C++) {
                            line += sep + '"' + data[L][C] + '"';
                            sep = ";";
                        }
                        content += "\n" + line;
                    }

                    function s2ab(s) {
                        var buf = new ArrayBuffer(s.length);
                        var view = new Uint8Array(buf);
                        for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
                        return buf;
                    }

                    saveAs(new Blob([s2ab(content)], { type: "" }), "tabela.csv");
                };
            };
            handler();
        },

        getData: function (table, dataConvert) {
            // Montar dados
            var data = [];

            // Headers 
            var headers = [];
            $(table).find("th:not(.column-action)").each(function (index, obj) {
                if (!$(obj).hasClass("aga-export-ignore")) {
                    var headerText = obj.firstChild ? obj.firstChild.textContent : obj.textContent;
                    headers.push(headerText);
                }
            });
            data.push(headers);

            // Linhas
            $(table).find("tr").each(function (index, tr) {
                var content = [];
                $(tr).find("td:not(.column-action)").each(function (index2, td) {
                    var s = $(td).text();
                    if (dataConvert)
                        s = dataConvert(s);
                    content.push(s);
                });
                if (content.length > 0)
                    data.push(content);
            });

            return data;
        },

        getNumberOrString: function (s) {
            var patt = /^[+-]?(\d*|\d{1,3}(\.\d{3})*)(\,\d+)?\b$/;
            if (patt.test(s)) {
                var ss = s.replace(".", "");
                ss = ss.replace(",", ".");
                return parseFloat(ss);
            }
            return s;
        },

        saveXLSX: function (data, fileName) {

            //var data = [[1, 2, 3.3], [true, false, null, "sheetjs"], ["foo", "bar", "0.3"], ["baz", null, "qux"]]
            var ws_name = "table";

            /* require XLSX */
            //var XLSX = require('xlsx')

            /* set up workbook objects -- some of these will not be required in the future */
            var wb = {}
            wb.Sheets = {};
            wb.Props = {};
            wb.SSF = {};
            wb.SheetNames = [];

            /* create worksheet: */
            var ws = {}

            var ws_cols = [];

            /* the range object is used to keep track of the range of the sheet */
            var range = { s: { c: 0, r: 0 }, e: { c: 0, r: 0 } };

            /* Iterate through each element in the structure */
            for (var R = 0; R != data.length; ++R) {
                if (range.e.r < R)
                    range.e.r = R;

                while (ws_cols.length < data[R].length)
                    ws_cols.push({ wch: 10 });

                for (var C = 0; C != data[R].length; ++C) {
                    if (range.e.c < C)
                        range.e.c = C;

                    /* create cell object: .v is the actual data */
                    var cell = { v: data[R][C] };
                    if (cell.v == null) continue;

                    /* create the correct cell reference */
                    var cell_ref = XLSX.utils.encode_cell({ c: C, r: R });

                    /* determine the cell type */
                    if (typeof cell.v === 'number') cell.t = 'n';
                    else if (typeof cell.v === 'boolean') cell.t = 'b';
                    else cell.t = 's';

                    /* add to structure */
                    ws[cell_ref] = cell;

                    // Check width
                    var valueWidth = data[R][C] ? (data[R][C]).toString().length : 10;
                    if (ws_cols[C].wch < valueWidth)
                        ws_cols[C].wch = valueWidth;
                }
            }
            ws['!ref'] = XLSX.utils.encode_range(range);

            /* add worksheet to workbook */
            wb.SheetNames.push(ws_name);
            wb.Sheets[ws_name] = ws;

            ws['!cols'] = ws_cols;

            /* write file */
            //   XLSX.writeFile(wb, 'test.xlsx');

            var wopts = { bookType: 'xlsx', bookSST: false, type: 'binary' };

            var wbout = XLSX.write(wb, wopts);

            function s2ab(s) {
                var buf = new ArrayBuffer(s.length);
                var view = new Uint8Array(buf);
                for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
                return buf;
            }

            /* the saveAs call downloads a file on the local machine */
            saveAs(new Blob([s2ab(wbout)], { type: "" }), fileName);
        }

    };
})();