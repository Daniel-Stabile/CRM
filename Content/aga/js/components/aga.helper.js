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

