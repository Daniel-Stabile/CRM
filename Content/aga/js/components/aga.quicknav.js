"use strict";

//var AGA = AGA || {};

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