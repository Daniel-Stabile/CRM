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