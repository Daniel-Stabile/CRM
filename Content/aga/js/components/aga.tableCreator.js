
AGA.TableCreator = function (attributes) {
    var _root = document.createElement("table");
    if (attributes) {
        $(_root).attr(attributes);
    }
    var _tbody = document.createElement("tbody");
    _root.appendChild(_tbody);
    var _headerRow = document.createElement("tr");
    $(_headerRow).appendTo(_tbody);
    var _columns = [];

    function addCol(args) {
        var newCol = {
            name: _columns.length.toString(),
            title: "",
            setValue: defaultSetValue
        };
        var typeOf = typeof args;
        if (typeOf === "string") {
            newCol.title = args;
        }
        else if (typeOf === "object") {
            $.extend(newCol, args);
        }

        newCol.th = document.createElement("th");
        if (newCol.title) {
            if ($.isFunction(newCol.title)) {
                newCol.title(newCol.th);
            }
            else {
                $(newCol.th).text(newCol.title);
            }
        }

        _headerRow.appendChild(newCol.th);
        _columns.push(newCol);
        return newCol;
    };

    function findColumn(selector) {
        if (!selector)
            return undefined;

        if (typeof selector === "number") {
            return _columns[selector];
        }

        for (var i = 0; i < _columns.length; i++) {
            if (_columns[i].name === selector) {
                return _columns[i];
            }
        }
        return undefined;
    }

    function defaultSetValue(td, dto, colName) {
        if (!dto)
            return;

        if (dto[colName]) {
            $(td).text(dto[colName]);
        }
    }

    return {
        table: _root,

        headerRow: _headerRow,

        addColumns: function (columns) {
            if (columns) {
                if (columns instanceof Array) {
                    var res = [];
                    for (var i = 0; i < columns.length; i++) {
                        res.push(addCol(columns[i]));
                    }
                    return res;
                }
                else {
                    return addCol(columns);
                }
            }
            return undefined;
        },

        getHeaderCell: function (selector) {
            var col = findColumn(selector);
            if (col)
                return col.th;
            return undefined;
        },

        addRow: function (dataObject) {
            var tr = document.createElement("tr");
            $(tr).appendTo(_tbody);

            for (var i = 0; i < _columns.length; i++) {
                var td = document.createElement("td");
                // Setar o valor
                _columns[i].setValue(td, dataObject, _columns[i].name);
                // Incluir atributos
                if (_columns[i].attributes)
                    $(td).attr(_columns[i].attributes);

                $(td).appendTo(tr);
            }

            return (function (c, t) {
                var _tr = t;
                var _cols = c;

                return {
                    getCell: function (selector) {
                        if (!selector)
                            return undefined;

                        if (typeof selector === "number") {
                            return _tr.children[selector];
                        }

                        for (var i = 0; i < _columns.length; i++) {
                            if (_cols[i].name === selector) {
                                return _tr.children[i];
                            }
                        }
                        return undefined;
                    }
                };
            })(_columns, tr);
        }
    };
    
};



/*
 EXEMPLO DE UTILIZAÇÃO do AGA.TableCreator
  <div id="teste">
  </div>
    
    <script>
        var tabela = new AGA.TableCreator({ "class": "table table-hover", "id": "testeTable", "data-orderby": "NOME" });
        $(tabela.headerRow).addClass("header");

        tabela.addColumns({ name: "Coluna1", title: "Minha coluna 1" });
        tabela.addColumns({
            name: "Colunax",
            title: function (node) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:ManutencaoVerbas.setOrderBy('NOME');")
                    .text("Matricula").appendTo(node);
            },
            setValue: function (td, dataObject) {
                var a = document.createElement("a");
                $(a).attr("href", "javascript:;")
                    .text(AGA.Helper.getProps(dataObject)).appendTo(td);
            }
        });
        tabela.addColumns("Minha coluna 2");
        tabela.addColumns(["Minha coluna 3", "Minha coluna 4"]);
        
        var col3 = tabela.getHeaderCell(3);
        $(col3).css("background-color", "red");

        var colx = tabela.getHeaderCell("Colunax");
        $(colx).css("background-color", "blue");

        var row = tabela.addRow({ "Coluna1": "Valorcoluna1" });
        
        row.getCell(3).innerText = "Meu teste coluna 3";
        row.getCell("Coluna1").innerText = "1";

        $("#teste").append(tabela.table);


    </script>
 
  
 */