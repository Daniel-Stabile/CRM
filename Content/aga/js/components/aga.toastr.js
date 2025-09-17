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