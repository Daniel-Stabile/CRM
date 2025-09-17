
"use strict";
var AGA = AGA || {};

AGA.Wizard = (function () {
    var isRequiredClass = "is-wizard-required";

    function isCheckFields(target) {
        return (String($(target).data("checkfields")).toUpperCase() === "TRUE");
    }

    function checkFields(target) {
        if (!isCheckFields(target))
            return true;

        var result = true;
        var form = $(target).closest("form");
        // Remover classe required
        $(form).find("." + isRequiredClass).removeClass(isRequiredClass);

        $(form).find("input[required], select[required]").each(function (index, obj) {
            var value = $(obj).val();
            if (typeof value == "undefined" || value === null || value === "") {
                if (obj.parentNode && $(obj.parentNode).hasClass("form-group"))
                    $(obj.parentNode).addClass(isRequiredClass);
                else
                    $(obj).addClass(isRequiredClass);
                result = false;
            }
        });

        $(form).find("textarea[required]").each(function (index, obj) {
            var value = $(obj).val();
            if (typeof value == "undefined" || value === null || value === "") {
                $(obj).addClass(isRequiredClass);
                result = false;
            } else {
                $(obj).removeClass(isRequiredClass);
            }
        });

        $(".wizard-alert").remove();
        $(".wizard-alert-control").hide();
        if (!result) {
            $(".wizard-progress").after('<div class="alert alert-warning wizard-alert"><button class="close" data-dismiss="alert"></button>Falta preencher os campos obrigatórios.</div>');
        }

        return result;
    };

    function doPostBack(target, param) {
        var fn = window["__doPostBack"];
        if (fn) {
            $("[disabled]").data("disabled-attribute", 1).prop('disabled', false);
            fn(target, param);
            $("[data-disabled-attribute=1]").prop('disabled', true);
        }
        else
            throw Error("Não existe função de PostBack.");
    }

    return {

        init: function () {
            $("body").on("click", ".wizard-cancel", AGA.Wizard.cancel);
            $("body").on("click", ".wizard-next", AGA.Wizard.next);
            $("body").on("click", ".wizard-prior", AGA.Wizard.prior);
        },

        // cancel fecha o modal
        cancel: function () {
            parent.Benner.ModalPage.hide();
        },

        next: function () {

            if (!checkFields(this))
                return;

            var mustBlockUi = isCheckFields(this);
            if (mustBlockUi) {
                var blocked = $(".modal-dialog");
                App.blockUI(blocked);
            }
            try {
                var target = $(this).data("postback");
                doPostBack(target, "Save");
            } catch (e) {
                if (mustBlockUi)
                    App.unblockUI();
            }
        },

        prior: function () {
            var target = $(this).data("postback");
            doPostBack(target, "Prior");
        },

        unblockUI: function () {
            App.unblockUI();
        }

    };


})();

AGA.Wizard.init();