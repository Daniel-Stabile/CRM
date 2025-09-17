/* global AGA, AGATableExport */
AGA.Grid = (function () {

    function getAlignClass(value) {
        if (value === 1) return "text-center";
        if (value === 2) return "text-right";
        return undefined; // left é o padrão
    }

    function formatValue(decimals, value) {
        if (!decimals)
            return value;

        if (AGA.Helper.isNullValue(value))
            return "";

        var sign = (value < 0) ? "-" : "";
        var v = Math.abs(value).toString();
        var p = v.indexOf(".");
        if (p < 0) {
            v += ".";
            p = v.length - 1;
        }

        while (v.length <= (p + decimals)) {
            v += "0";
        }

        // Trocar de ponto para virgula
        v = v.replace(".", ",");

        // Incluir ponto de milhar
        if (p > 3) {
            return sign + v.substr(0, p - 3) + "." + v.substr(p - 3);
        }
        return sign + v;
    }

    function createAfterRenderRowInvoker(grid) {
        var result = {
            call: function () { }
        };

        var evt = $(grid).data("afterrenderrow");
        if (evt) {
            result.grid = grid;
            result.evt = evt;
            result.call = function (tr, record) {
                AGA.Helper.invoke(evt, {
                    grid: grid,
                    tr: tr,
                    record: record
                });
            };
        }
        return result;
    }

    function updateData(grid, data) {
        var tbody = $(grid).find("table tbody");
        $(tbody).empty();

        // Pegar informações de colunas
        var allThs = [];
        $(grid).find("tr.header > th").each(function (index, obj) {
            allThs.push({
                name: $(obj).data("field"),
                decs: $(obj).data("decs"),
                alignment: getAlignClass($(obj).data("alignment")),
                cmdTemplate: $(obj).find(".cmd-template").first()
            });
        });

        var afterRenderRowInvoker = createAfterRenderRowInvoker(grid);

        var index = data.StartIndex || 0;
        for (var i = 0; i < data.Rows.length; i++) {
            var record = AGA.Grid.getRecord(data, i);

            var tr = document.createElement("tr");
            if (record.HANDLE) $(tr).data("handle", record.HANDLE);
            if (record.URL) $(tr).data("url", record.URL);

            $(tr).data("index", index).appendTo(tbody);
            index++;

            for (var p = 0; p < allThs.length; p++) {
                var info = allThs[p];
                var tc = document.createElement("td");
                if (info.alignment)
                    $(tc).addClass(info.alignment);
                if (info.cmdTemplate.length > 0)
                    $(tc).html($(info.cmdTemplate[0]).html()).appendTo(tr);
                else
                    $(tc).html(formatValue(info.decs, record[info.name])).appendTo(tr);
            }

            // disparar afterRenderRow event
            afterRenderRowInvoker.call(tr, record);

        }
    }

    function updatePagination(grid, data) {
        var start = data.StartIndex;
        var moreData = data.More;

        $(grid).data("current", start);
        var prev = start > 0;
        var next = moreData;

        var needPagination = prev || next;

        $(grid).find(".grid-footer-row").toggleClass("hide", !needPagination);
        $(grid).find(".previous").toggleClass("hide", !prev);
        $(grid).find(".next").toggleClass("hide", !next);
    }

    function getPageSize(grid) {
        var pageSize = $(grid).data("pagesize");
        return pageSize ? pageSize : 10;
    }

    function getCurrent(grid) {
        var startIndex = $(grid).data("current");
        return startIndex ? startIndex : 0;
    }

    function deltaPage(any, delta) {
        var grid = $(any).closest(".aga-grid");

        var startIndex = getCurrent(grid);
        var pageSize = getPageSize(grid);

        var newIndex = startIndex + (delta * pageSize);
        if (newIndex < 0)
            newIndex = 0;
        $(grid).data("current", newIndex);
        internalLoad(grid);
    }

    function callEvent(grid, eventName, data) {
        var evt = $(grid).data(eventName);
        if (evt)
            AGA.Helper.invoke(evt, {
                grid: grid,
                eventName: eventName,
                gridData: data
            });
    }

    function internalLoad(grid, optionalData) {
        callEvent(grid, "beforeload");

        var processFunction = function (data) {
            // Atualizar dados da tabela
            updateData(grid, data);

            // Paginação
            updatePagination(grid, data);

            AGA.Grid.hideMessagePanel(grid);

            // Exportacao
            //checkCanExport(grid);

            $(grid).show();
            callEvent(grid, "afterload", data);
        };

        if (!AGA.Helper.isNullValue(optionalData)) {
            processFunction(optionalData);
        } else {
            var pars = AGA.Grid.getCallParameters(grid);
            AGA.Ajax.callWebMethod("AGAGridGet",
                pars,
                function (data) {
                    processFunction(data.d);
                },
                function (errorData) {
                    var msg = AGA.Ajax.getErrorMessage(errorData);
                    AGA.Helper.createMessagePanel($(grid).find(".message-panel").first()[0], "alert-danger", msg);
                    $(grid).show();
                });
        }
    }

    return {
        initAll: function () {
            $(".aga-grid.auto-load").each(function (index, element) {
                AGA.Grid.load(element);
            });
        },

        hideMessagePanel: function (selector) {
            $(AGA.Helper.resolveElement(selector)).find(".message-panel").addClass("hide");
        },

        load: function (selector, optionalData) {
            // Quanto o load é chamado deve ser recarregado completo
            var grid = $(AGA.Helper.resolveElement(selector)).closest(".aga-grid");
            $(grid).data("current", 0);
            internalLoad(grid, optionalData);
        },

        getCallParameters: function (selector) {
            var grid = AGA.Helper.resolveElement(selector);
            var filterValues = {};
            var formFilterId = $(grid).data("formfilter");
            if (formFilterId)
                filterValues = AGA.Form.getValues("#" + formFilterId);

            var callingMethod = $(grid).data("method");
            var pageSize = $(grid).data("pagesize");
            var orderField = $(grid).data("order");
            var orderFieldDesc = $(grid).data("orderdesc");
            var startIndex = $(grid).data("current");

            return {
                method: callingMethod,
                fields: filterValues,
                startIndex: (startIndex ? startIndex : 0),
                count: pageSize,
                orderField: (orderField ? orderField : ""),
                descending: (orderFieldDesc ? orderFieldDesc : 0)
            };
        },

        getRecord: function (obj, rowIndex) {
            // var record = {};
            // for (var p = 0; p < obj.Columns.length; p++) {
            //    record[obj.Columns[p]] = obj.Rows[rowIndex][p];
            // }
            // return record;
            return obj.Columns.reduce(function (result, colName, index) {
                result[colName] = obj.Rows[rowIndex][index];
                return result;
            }, {});
        },

        nextPage: function (element) {
            deltaPage(element, 1);
        },

        priorPage: function (element) {
            deltaPage(element, -1);
        },

        sort: function (element) {
            var th = $(element).closest("th");
            var fieldName = $(th).data("field");
            var orderdesc = 0;
            if ($(th).data("sort") === "asc") {
                $(th).data("sort", "desc");
                orderdesc = 1;
            } else {
                $(th).data("sort", "asc");
            }

            var grid = $(th).closest(".aga-grid");
            $(grid).data({
                "order": fieldName,
                "orderdesc": orderdesc,
                "current": 0
            });
            AGA.Grid.load(grid);
        },

        cmdRowClick: function (element) {
            var a = $(element).closest("a");
            //var handle = $(a).closest("tr").data("handle");

            var s = $(a).data("client");
            if (s) {
                AGA.Helper.invoke(s, element);
            }

            s = $(a).data("server");
            if (s) {
                alert("Chamar o servidor " + s);
            }

            return false;
        },

        cmdClick: function (element) {
            var a = $(element).closest("a");
            var s = $(a).data("client");
            if (s) {
                AGA.Helper.invoke(s, a);
            }

            s = $(a).data("server");
            if (s) {
                alert("Chamar o servidor " + s);
            }

            return false;
        },

        download: function (target, format) {
            var table = $(target).closest(".aga-grid").find("table").first();

            if (format && format.toLowerCase() === "xlsx")
                AGATableExport.clickHandlerXLSX({
                    target: table,
                    currentTarget: table
                });

            if (format && format.toLowerCase() === "csv")
                AGATableExport.clickHandlerCSV({
                    target: table,
                    currentTarget: table
                });
        },

        enableCommand: function (jQuerySelector) {
            $(jQuerySelector)
                .removeClass("disabled")
                .removeAttr("disabled");
        },

        disableCommand: function (jQuerySelector) {
            $(jQuerySelector)
                .addClass("disabled")
                .attr("disabled", "disabled");
        }

    };
})();
