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

