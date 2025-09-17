"use strict";
//var AGA = AGA || {};

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
