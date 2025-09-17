
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
            if  (data.Message)
                errorText = data.Message;
            else if (data.responseJSON && data.responseJSON.ExceptionMessage)
                errorText = data.responseJSON.ExceptionMessage;
            else if (data.responseText && data.responseText.indexOf("lblErrorMessage") > 0) {
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
