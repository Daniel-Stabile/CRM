
var AGATableExport = (function () {

    function isReady() {
        return (window.XLSX);
    }

    function loadDependencies() {
        if (isReady())
            return;

        var files = [
            "fabric.js/fabric.min.js",
            "FileSaver.js/FileSaver.min.js",
            "jszip/jszip.min.js",
            "xlsx/xlsx.min.js"
        ];

        var root = "content/assets/amcharts/plugins/export/libs/";
        $(files).each(function (index, name) {
            AGA.Loader.load(root + name);
        });
    }

    return {

        createAllLinks: function () {
            $('table').each(function (index, obj) {
                AGATableExport.createLink(obj);
            });
        },

        createLink: function (table) {
            var tbl = $(table).closest("table");

            var th = $(tbl).find("th:last-of-type");
            if (th.children(".aga-table-export").length > 0)
                return;

            var link = AGATableExport.buildLinkElement();
            $(th).append(link);
        },

        buildLinkElement: function () {
            var link = document.createElement("div");
            $(link).addClass("btn-group aga-table-export-group");

            var a = document.createElement("a");
            $(a).addClass("btn btn-sm aga-table-export-btn").attr({
                "href": "javascript:;",
                "data-toggle": "dropdown",
                "aria-expanded": "false",
                "data-original-title": "Exportar tabela"
            }).appendTo(link);
            $(a).tooltip();

            var i = document.createElement("i");
            $(i).addClass("fa fa-download").appendTo(a);

            var ul = document.createElement("ul");
            $(ul).addClass("dropdown-menu pull-right").appendTo(link);

            // XLSX
            var li = document.createElement("li");
            $(li).appendTo(ul);
            a = document.createElement("a");
            $(a).attr("href", "javascript:;").text("XLSX").appendTo(li);
            $(li).on("click", AGATableExport.clickHandlerXLSX);

            //CSV
            li = document.createElement("li");
            $(li).appendTo(ul);
            a = document.createElement("a");
            $(a).attr("href", "javascript:;").text("CSV").appendTo(li);
            $(li).on("click", AGATableExport.clickHandlerCSV);

            return link;
        },

        clickHandlerXLSX: function (e) {
            loadDependencies();
            var handler = function () {
                if (!isReady()) {
                    setTimeout(handler, 300);
                } else {
                    var table = $(e.target).closest('table');
                    var data = AGATableExport.getData(table, AGATableExport.getNumberOrString);
                    AGATableExport.saveXLSX(data, "tabela.xlsx");
                }
            };
            handler();
        },

        clickHandlerCSV: function (e) {
            loadDependencies();
            var handler = function () {
                if (!isReady()) {
                    setTimeout(handler, 300);
                } else {

                    var table = $(e.target).closest('table');
                    var data = AGATableExport.getData(table);
                    var content = "";
                    for (var L = 0; L < data.length; L++) {
                        var line = "";
                        var sep = "";
                        for (var C = 0; C < data[L].length; C++) {
                            line += sep + '"' + data[L][C] + '"';
                            sep = ";";
                        }
                        content += "\n" + line;
                    }

                    function s2ab(s) {
                        var buf = new ArrayBuffer(s.length);
                        var view = new Uint8Array(buf);
                        for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
                        return buf;
                    }

                    saveAs(new Blob([s2ab(content)], { type: "" }), "tabela.csv");
                };
            };
            handler();
        },

        getData: function (table, dataConvert) {
            // Montar dados
            var data = [];

            // Headers 
            var headers = [];
            $(table).find("th:not(.column-action)").each(function (index, obj) {
                if (!$(obj).hasClass("aga-export-ignore")) {
                    var headerText = obj.firstChild ? obj.firstChild.textContent : obj.textContent;
                    headers.push(headerText);
                }
            });
            data.push(headers);

            // Linhas
            $(table).find("tr").each(function (index, tr) {
                var content = [];
                $(tr).find("td:not(.column-action)").each(function (index2, td) {
                    var s = $(td).text();
                    if (dataConvert)
                        s = dataConvert(s);
                    content.push(s);
                });
                if (content.length > 0)
                    data.push(content);
            });

            return data;
        },

        getNumberOrString: function (s) {
            var patt = /^[+-]?(\d*|\d{1,3}(\.\d{3})*)(\,\d+)?\b$/;
            if (patt.test(s)) {
                var ss = s.replace(".", "");
                ss = ss.replace(",", ".");
                return parseFloat(ss);
            }
            return s;
        },

        saveXLSX: function (data, fileName) {

            //var data = [[1, 2, 3.3], [true, false, null, "sheetjs"], ["foo", "bar", "0.3"], ["baz", null, "qux"]]
            var ws_name = "table";

            /* require XLSX */
            //var XLSX = require('xlsx')

            /* set up workbook objects -- some of these will not be required in the future */
            var wb = {}
            wb.Sheets = {};
            wb.Props = {};
            wb.SSF = {};
            wb.SheetNames = [];

            /* create worksheet: */
            var ws = {}

            var ws_cols = [];

            /* the range object is used to keep track of the range of the sheet */
            var range = { s: { c: 0, r: 0 }, e: { c: 0, r: 0 } };

            /* Iterate through each element in the structure */
            for (var R = 0; R != data.length; ++R) {
                if (range.e.r < R)
                    range.e.r = R;

                while (ws_cols.length < data[R].length)
                    ws_cols.push({ wch: 10 });

                for (var C = 0; C != data[R].length; ++C) {
                    if (range.e.c < C)
                        range.e.c = C;

                    /* create cell object: .v is the actual data */
                    var cell = { v: data[R][C] };
                    if (cell.v == null) continue;

                    /* create the correct cell reference */
                    var cell_ref = XLSX.utils.encode_cell({ c: C, r: R });

                    /* determine the cell type */
                    if (typeof cell.v === 'number') cell.t = 'n';
                    else if (typeof cell.v === 'boolean') cell.t = 'b';
                    else cell.t = 's';

                    /* add to structure */
                    ws[cell_ref] = cell;

                    // Check width
                    var valueWidth = data[R][C] ? (data[R][C]).toString().length : 10;
                    if (ws_cols[C].wch < valueWidth)
                        ws_cols[C].wch = valueWidth;
                }
            }
            ws['!ref'] = XLSX.utils.encode_range(range);

            /* add worksheet to workbook */
            wb.SheetNames.push(ws_name);
            wb.Sheets[ws_name] = ws;

            ws['!cols'] = ws_cols;

            /* write file */
            //   XLSX.writeFile(wb, 'test.xlsx');

            var wopts = { bookType: 'xlsx', bookSST: false, type: 'binary' };

            var wbout = XLSX.write(wb, wopts);

            function s2ab(s) {
                var buf = new ArrayBuffer(s.length);
                var view = new Uint8Array(buf);
                for (var i = 0; i != s.length; ++i) view[i] = s.charCodeAt(i) & 0xFF;
                return buf;
            }

            /* the saveAs call downloads a file on the local machine */
            saveAs(new Blob([s2ab(wbout)], { type: "" }), fileName);
        }

    };
})();
