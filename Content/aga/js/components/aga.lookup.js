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
