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
