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

