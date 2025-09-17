var lastKey = null, agrupamento = null, ExibirLinhaAgrupamento = false, colAuxiliares = [], trVinculo = null, InseriuHeader = false;
var temVinculo = false;
$.fn.BennerGrid = function (options) {
    var tbodys = [];
    var tbody = $('<tbody></tbody>');

    var _tbl = $(this);

    if (options.class !== undefined) {
        _tbl.addClass(options.class);
    }
    else {
        _tbl.addClass('table table-light table-striped');
    }

    _tbl.empty();
    colAuxiliares = [];
    InseriuHeader = false;
    trVinculo = $('<tr style="border-bottom:2px solid #4B77BE !important"></tr>');

    var thead = $('<thead></thead>'), tfooter = $('<thead></thead>'), tr = $('<tr></tr>'), td = $('<td></td>'), th = $('<th></th>');
    agrupamento = options.group;

    if (options.body === undefined || options.body.length == 0)
        return false;

    if (options.vincular !== undefined)
        temVinculo = options.vincular;

    if (temVinculo) {
        thVinculo = $('<th colspan="2" style="text-align:center;font-size:12px;border-right:2px solid #F2F5F8!important">CONTAS CONTÁBEIS</th>');
        trVinculo.append(thVinculo);

        if (options.body[0].SALDOANTERIOR !== undefined) {
            thVinculo = $('<th style="text-align:center;font-size:12px;border-right:2px solid #F2F5F8!important">SALDO</th>');
            trVinculo.append(thVinculo);
        }
        
    }
    

    if (agrupamento !== undefined) {

        //1° - Percorrer o Header adicionando as colunas do cabeçalho da tabela
        $.each(options.header, function (i, colHeader) {
            th = $('<th></th>');

            //Para colunas do tipo objeto adicionaremos os atributos html, para os tipos string apenas o valor.
            if (typeof (colHeader) == 'object') {
                for (attr in colHeader) {
                    if (attr == 'class')
                        th.addClass(colHeader[attr]);
                    else if (attr == 'value')
                        th.append(colHeader[attr]);
                    else
                        th.attr(attr, colHeader[attr])
                }
            }
            else
                th.append(colHeader);

            //Adicionamos a coluna na linha atual
            tr.append(th);
        });

        //Adicionamos a linha no cabeçalho
        thead.append(tr);
        //Agrupamos os dados conforme grupos mencionados nos parâmetros.
        var dadosAgrupados = AgruparJSON(agrupamento, options.body);
        PercorrerAtributosFilhos(dadosAgrupados, options.header, tbodys, thead, options);
    }
    else {

        $.each(options.header, function (i, colHeader) {
            th = $('<th></th>');

            //Para colunas do tipo objeto adicionaremos os atributos html, para os tipos string apenas adicionaremos o valor.
            if (typeof (colHeader) == 'object') {
                for (attr in colHeader) {
                    if (attr == 'class')
                        th.addClass(colHeader[attr]);
                    else if (attr == 'value')
                        th.append(colHeader[attr]);
                    else
                        th.attr(attr, colHeader[attr])
                }
            }
            else
                th.append(colHeader);

            //Adicionamos a coluna na linha atual
            tr.append(th);
        });

        //Adicionamos a linha no cabeçalho
        thead.append(tr);
        
        
        var tbody = $('<tbody></tbody>');
        $.each(options.body, function (i, linha) {
            tr = $('<tr></tr>');

            $.each(options.header, function (i, colHeader) {
                
                td = $('<td></td>');
                if (typeof (colHeader) == 'object') {
                    for (attr in colHeader) {
                        if (attr == 'class')
                            td.addClass(colHeader[attr]);
                        else if (attr == 'field' || attr == 'value') {

                            var vlAtual = linha[colHeader[attr]];

                            if (colHeader["type"] === 'money') {

                                if (vlAtual !== undefined) {
                                    vlAtual = FormatarMoeda(vlAtual);
                                    if (vlAtual !== undefined) {
                                        td.append(vlAtual.ValorFormatado);

                                        if (vlAtual.EhNegativo)
                                            td.addClass('red-intense')
                                    }
                                    else
                                        td.append('0,00')
                                }
                            }
                            else
                                td.append(vlAtual);
                        }
                        else if (attr == 'vinculo') {
                            if (colAuxiliares.indexOf(colHeader[attr]) < 0 && linha[colHeader[attr]] != null) {
                                thVinculo = $('<th colspan="2" style="text-align:center;font-size:12px"></th>');
                                thVinculo.append(colHeader[attr]);
                                trVinculo.append(thVinculo);
                                colAuxiliares.push(colHeader[attr]);
                            }
                        }
                        else 
                            td.attr(attr, colHeader[attr])
                    }
                }
                else
                    td.append(linha[colHeader]);

                tr.append(td);
            });

            if (options.key)
                $(tr).attr('data-key', JSON.stringify(linha));

            tbody.append(tr);
            thead.prepend(trVinculo);

        });
        tbodys.push(tbody);
    }

    _tbl.append(thead);
    _tbl.append(tbodys);

    if (options.caption === undefined) {

        var titulo = _tbl.find('.op').first().text();
        if (titulo != '') {
            var thMaster = $('<th class="titulo"></th>');
            tr = $('<tr></tr>');
            thMaster.attr('colspan', options.header.length).append(titulo);
            _tbl.find('.op').first().remove();
            tr.append(thMaster);
            thead.prepend(tr);
        }
    }
    else if (options.caption.length > 0) {

        var elCaption = $('<caption></caption>');
        elCaption.append(options.caption);
        _tbl.prepend(elCaption);
    }

    $(_tbl).find('tbody').each(function (i, tbody) {
        if (tbody.firstChild == null)
            $(tbody).remove();
    })

    $(_tbl).find('thead tr').each(function (i, th) {
        if (th.firstChild == null)
            $(th).remove();
    })

    $(_tbl).find('.agrupador').each(function (i, ln) {
        ExibirLinhasDetalhes(ln, options.ExibirAgrupamentosExpandidos);
    })

    $(_tbl).find('.op').each(function (i, ln) {
        ExibirMestreDetalhes(ln, options.ExibirAgrupamentosExpandidos);
    })

    if (options.events !== undefined) {
        $(_tbl).find('tbody tr').each(function (i, ln) {
            $.each(options.events, function (ev, fun) {
                $(ln).on(ev, fun);
            });
        })
    }

    var headers = $('[data-vinculo]');
    $.each(headers, function (i, comp) {
        $(comp).text($(comp).attr('data-vinculo'));
    });

    if (options.footer !== undefined) {
        
        var linha = $('<tr></tr>'), coluna = $('<td></td>');

        $.each(options.footer, function (i, col) {
            coluna = $('<td></td>');
            for (var prop in col) {
                

                switch (prop) {
                    case 'value':
                        var value = col.value;
                        if (col["type"] == 'money') {
                            value = (FormatarMoeda(col.value));
                            if (value.EhNegativo) {
                                coluna.addClass('red-intense');
                            }
                            coluna.text(value.ValorFormatado);
                        }
                        else
                            coluna.text(value);
                        
                        break;
                    case 'class':
                        coluna.addClass(col[prop]);
                        break;
                    default:
                        coluna.attr(prop, col[prop]);
                        break;
                }

                linha.append(coluna);
            }

        });

        var tfoot = $('<tfoot></tfoot>');
        tfoot.append(linha);
        _tbl.append(tfoot);

    }



};

//Percorrer todos os itens dos agrupamentos(recursividade).
function PercorrerAtributosFilhos(attrAtual, colunasHeader, _bds, thead, opt) {

    $.each(attrAtual, function (i, dadosFilhos) {

        if (!$.isArray(dadosFilhos)) {
            lastKey = i + Math.floor(Math.random() * 9999);

            tbody = $('<tbody data-key="' + lastKey + '"></tbody>');

            tr = $('<tr class="op"></tr>'), td = $('<td></td>');
            td.attr('colspan', colunasHeader.length).append(i);
            tr.append(td);

            tr.click(function (e) {
                ExibirMestreDetalhes(this);
            })

            tbody.append(tr);
            _bds.push(tbody);

            PercorrerAtributosFilhos(dadosFilhos, colunasHeader, _bds, thead, opt);

        }
        else {
            var tbody = $('<tbody data-mestre="' + lastKey + '"></tbody>');
            tr = $('<tr></tr>');
            if (ExibirLinhaAgrupamento) {
                            
                td = $('<td></td>').attr('colspan', colunasHeader.length).append(i);
                tr.append(td);
                tr.addClass('agrupador');

                tr.click(function (e) {
                    ExibirLinhasDetalhes(this);
                })
                tbody.append(tr);

            }

            $.each(dadosFilhos, function (i, linha) {

                tr = $('<tr></tr>');
                if (!ExibirLinhaAgrupamento && i == 0) {
                    tr.addClass('agrupador');

                    tr.click(function (e) {
                        ExibirLinhasDetalhes(this);
                    })
                }
                $.each(colunasHeader, function (i, colHeader) {
                    td = $('<td></td>');
                    if (typeof (colHeader) == 'object') {
                        
                        for (attr in colHeader) {
                            if (attr == 'class')
                                td.addClass(colHeader[attr]);
                            else if (attr == 'field' || attr == 'value') {

                                var vlAtual = linha[colHeader[attr]];

                                if (colHeader["type"] === 'money') {

                                    if (vlAtual !== undefined) {
                                        vlAtual = FormatarMoeda(vlAtual);
                                        if (vlAtual !== undefined) {
                                            td.append(vlAtual.ValorFormatado);

                                            if (vlAtual.EhNegativo)
                                                td.addClass('red-intense')
                                        }
                                        else
                                            td.append('0,00')
                                    }
                                }
                                else if (colHeader["type"] === 'date') {
                                    if (vlAtual !== undefined) {
                                        vlAtual = dateFormat(vlAtual, 'default');
                                        td.append(vlAtual);
                                    }
                                }
                                else 
                                    td.append(vlAtual);
                            }
                            else if (attr == 'vinculo') {
                                if (colAuxiliares.indexOf(colHeader[attr]) < 0) {
                                    thVinculo = $('<th colspan="2" data-vinculo="' + colHeader[attr] + '" style="border-right:2px solid #F2F5F8;text-align:center;font-size:12px"></th>');
                                    thVinculo.append(linha[colHeader[attr]]);
                                    trVinculo.append(thVinculo);
                                    colAuxiliares.push(colHeader[attr]);
                                }
                            }
                            else
                                td.attr(attr, colHeader[attr])
                        }
                    }
                    else
                        td.append(linha[colHeader]);

                    tr.append(td);
                });

                if (opt.key)
                    $(tr).attr('data-key', JSON.stringify(linha));
                
                tbody.append(tr);
                
            });
            _bds.push(tbody);
        }

        if (typeof (thead) != 'undefined' && (colAuxiliares != null && colAuxiliares.length > 0) && !InseriuHeader) {
            thVinculo = $('<th style="text-align:center;font-size:12px;border-right:2px solid #F2F5F8">SALDO</th>');
            trVinculo.append(thVinculo);
            
            thead.prepend(trVinculo);
            InseriuHeader = true;
        }
    });
}

//Converte os valores string em decimais válidos para o servidor
function ToDecimal(vl, casas) {

    if (vl === undefined) {
        return 0;
    }
    var retorno = vl.replace('R$ ', '').replace('R$', '');

    while (retorno.indexOf('.') > 0) {
        retorno = retorno.replace('.', '');
    }
	
	retorno = retorno.replace(',', '.');
	retorno = parseFloat(retorno);

    casas = casas ? casas : 2;
    return retorno;
}

//Convert uma data no formato .NET em uma data válida para JS
function ToDate(vl, formato) {

    var ret = new Date(parseInt(vl.substr(6)));

    return ret;
}

function FormatarMoeda(value) {
    var numero = value;

    if (value !== undefined && value != null) {

        if (typeof value === 'string') {
            numero = parseFloat(value.replace(',', '.'));
        }

        return { ValorFormatado: numero.FormatoPadraoMoeda(2, ',', '.'), EhNegativo: (numero < 0), ValorFloat: parseFloat(numero.toFixed(2)) };

    }
    else
        return { ValorFormatado: '0,00', EhNegativo: false, ValorFloat: parseFloat('0') };

}

function AjustarDiv(lnk) {
    var PorCento = (window.screen.height / 100) * 75;

    if (!$(lnk).hasClass('on')) {
        //tela cheia??
        if ((window.fullScreen) || (window.innerWidth == screen.width && window.innerHeight == screen.height)) {
            $('.table-scrollable').height('88vh');
        }
        else
            $('.table-scrollable').height(PorCento + 'px');
    }
    else {
        $('.table-scrollable').height('75vh');
    }
}

Number.prototype.FormatoPadraoMoeda = function (c, d, t) {
    var n = this,
        c = isNaN(c = Math.abs(c)) ? 2 : c,
        d = d == undefined ? "." : d,
        t = t == undefined ? "," : t,
        s = n < 0 ? "-" : "",
        i = parseInt(n = Math.abs(+n || 0).toFixed(c)) + "",
        j = (j = i.length) > 3 ? j % 3 : 0;
    return s + (j ? i.substr(0, j) + t : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + t) + (c ? d + Math.abs(n - i).toFixed(c).slice(2) : "");
};


//Formatar datas
var dateFormat = function () {
    var token = /d{1,4}|m{1,4}|yy(?:yy)?|([HhMsTt])\1?|[LloSZ]|"[^"]*"|'[^']*'/g,
		timezone = /\b(?:[PMCEA][SDP]T|(?:Pacific|Mountain|Central|Eastern|Atlantic) (?:Standard|Daylight|Prevailing) Time|(?:GMT|UTC)(?:[-+]\d{4})?)\b/g,
		timezoneClip = /[^-+\dA-Z]/g,
		pad = function (val, len) {
		    val = String(val);
		    len = len || 2;
		    while (val.length < len) val = "0" + val;
		    return val;
		};

    return function (date, mask, utc) {
        var dF = dateFormat;
        if (arguments.length == 1 && Object.prototype.toString.call(date) == "[object String]" && !/\d/.test(date)) {
            mask = date;
            date = undefined;
        }
        date = date ? new Date(date) : new Date;
        if (isNaN(date)) throw SyntaxError("Data em formato inválido");

        mask = String(dF.masks[mask] || mask || dF.masks["default"]);

        // Allow setting the utc argument via the mask
        if (mask.slice(0, 4) == "UTC:") {
            mask = mask.slice(4);
            utc = true;
        }

        var _ = utc ? "getUTC" : "get",
			d = date[_ + "Date"](),
			D = date[_ + "Day"](),
			m = date[_ + "Month"](),
			y = date[_ + "FullYear"](),
			H = date[_ + "Hours"](),
			M = date[_ + "Minutes"](),
			s = date[_ + "Seconds"](),
			L = date[_ + "Milliseconds"](),
			o = utc ? 0 : date.getTimezoneOffset(),
			flags = {
			    d: d,
			    dd: pad(d),
			    ddd: dF.i18n.dayNames[D],
			    dddd: dF.i18n.dayNames[D + 7],
			    m: m + 1,
			    mm: pad(m + 1),
			    mmm: dF.i18n.monthNames[m],
			    mmmm: dF.i18n.monthNames[m + 12],
			    yy: String(y).slice(2),
			    yyyy: y,
			    h: H % 12 || 12,
			    hh: pad(H % 12 || 12),
			    H: H,
			    HH: pad(H),
			    M: M,
			    MM: pad(M),
			    s: s,
			    ss: pad(s),
			    l: pad(L, 3),
			    L: pad(L > 99 ? Math.round(L / 10) : L),
			    t: H < 12 ? "a" : "p",
			    tt: H < 12 ? "am" : "pm",
			    T: H < 12 ? "A" : "P",
			    TT: H < 12 ? "AM" : "PM",
			    Z: utc ? "UTC" : (String(date).match(timezone) || [""]).pop().replace(timezoneClip, ""),
			    o: (o > 0 ? "-" : "+") + pad(Math.floor(Math.abs(o) / 60) * 100 + Math.abs(o) % 60, 4),
			    S: ["th", "st", "nd", "rd"][d % 10 > 3 ? 0 : (d % 100 - d % 10 != 10) * d % 10]
			};

        return mask.replace(token, function ($0) {
            return $0 in flags ? flags[$0] : $0.slice(1, $0.length - 1);
        });
    };
}();

dateFormat.masks = {
    "competencia": "mmmm/yyyy",
    "default": "dd/mm/yyyy",
    shortDate: "m/d/yy",
    mediumDate: "mmm d, yyyy",
    longDate: "mmmm d, yyyy",
    fullDate: "dddd, mmmm d, yyyy",
    shortTime: "h:MM TT",
    mediumTime: "h:MM:ss TT",
    longTime: "h:MM:ss TT Z",
    isoDate: "yyyy-mm-dd",
    isoTime: "HH:MM:ss",
    isoDateTime: "yyyy-mm-dd'T'HH:MM:ss",
    isoUtcDateTime: "UTC:yyyy-mm-dd'T'HH:MM:ss'Z'"
};

dateFormat.i18n = {
    dayNames: [
		"DOM", "SEG", "TER", "QUA", "QUI", "SEX", "SAB",
		"Domingo", "Segunda", "Terça", "Quarta", "Quinta", "Sexta", "Sábado"
    ],
    monthNames: [
		"JAN", "FEV", "MAR", "ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ",
		"Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"
    ]
};

Date.prototype.format = function (mask, utc) {
    return dateFormat(this, mask, utc);
};

function AgruparJSON(colunas, lista) {
    var colsObjData = {};

    // 1. agrupamos por categorias em chaves que são a concatenação dos valores das colunas desejadas.
    lista.forEach(function (userObj) {
        var key = colunas.reduce(function (a, b) {
            return (a ? a + ';' : a) + userObj[b];
        }, '');
        if (!(key in colsObjData)) {
            colsObjData[key] = [];
        }
        colsObjData[key].push(userObj);
    });

    // 2. já possuimos os agrupamentos, agora é apenas uma questão de transformar eles na estrutura desejada
    var finalData = {};
    for (var key in colsObjData) {
        var data = finalData;
        var splited = key.split(';');
        splited.forEach(function (col, index) {
            if (!(col in data)) {
                data[col] = {}
            }
            if (index === splited.length - 1) {
                data[col] = colsObjData[key];
            }
            else {
                data = data[col];
            }
        });
    }
    return finalData;
}

function ValidarJSON(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

function ExibirLinhasDetalhes(linha, expandir) {
    var tbody = $(linha).parent();
    var exibindo = expandir, temRegistro = false;

    tbody.find('tr').not(linha).each(function (i, ln) {
        temRegistro = true;
        if (i % 2 == 0)
            $(ln).addClass('odd');

        if ($(ln).hasClass('hide')) {
            $(ln).removeClass('hide').show();
            exibindo = true;
        }
        else if (!expandir)
            $(ln).addClass('hide').hide();
    });

    $(linha).find('td').find('i').remove()

    if (temRegistro) {
        if (exibindo)
            $(linha).find('td:first-child').prepend('<i class="fa fa-minus" aria-hidden="true"></i> ');
        else
            $(linha).find('td:first-child').prepend('<i class="fa fa-plus" aria-hidden="true"></i> ');
    }
}

function ExibirMestreDetalhes(linha, expandir) {
    var mestre = $(linha).parent().attr('data-key');
    var filhos = $('[data-mestre="' + mestre + '"]')
    var exibindo = expandir ? expandir : false;
    var temRegistro = false;

    $.each(filhos, function (x, tbody) {
        temRegistro = true;
        if ($(tbody).hasClass('hide')) {
            $(tbody).removeClass('hide').show();
            exibindo = true;
        }
        else if (!expandir)
            $(tbody).addClass('hide').hide();
    });

    $(linha).find('td').find('i').remove();

    if (temRegistro) {
        if (exibindo)
            $(linha).find('td:first-child').prepend('<i class="fa fa-minus" aria-hidden="true"></i> ');
        else if(!expandir)
            $(linha).find('td:first-child').prepend('<i class="fa fa-plus" aria-hidden="true"></i> ');
    }

}

Array.prototype.SomarTotalPorPropriedade = function (prop) {
    var total = 0;
    for (var i = 0, _len = this.length; i < _len; i++) {
        total += this[i][prop]
    }
    return total
}

String.prototype.SomarTotalPorPropriedade = function (prop) {
    var total = 0;
    for (var i = 0, _len = this.length; i < _len; i++) {
        total += this[i][prop]
    }
    return total
}


function ExportarPlanilha(table, nomeArquivo, nomeTabela) {

    $(table).table2excel({
        exclude: ".noExl",
        name: nomeTabela,
        filename: nomeArquivo,
        fileext: ".xls",
        exclude_img: true,
        exclude_links: true,
        exclude_inputs: true
    });

    return false;
}



(function ($) {

    $.fn.tableHeadFixer = function (param) {

        return this.each(function () {
            table.call(this);
        });

        function table() {
            function setCorner() {
                var table = $(settings.table);

                if (settings.head) {
                    if (settings.left > 0) {
                        var tr = table.find("thead tr");

                        tr.each(function (k, row) {
                            solverLeftColspan(row, function (cell) {
                                $(cell).css("z-index", settings['z-index'] + 1);
                            });
                        });
                    }

                    if (settings.right > 0) {
                        var tr = table.find("thead tr");

                        tr.each(function (k, row) {
                            solveRightColspan(row, function (cell) {
                                $(cell).css("z-index", settings['z-index'] + 1);
                            });
                        });
                    }
                }

                if (settings.foot) {
                    if (settings.left > 0) {
                        var tr = table.find("tfoot tr");

                        tr.each(function (k, row) {
                            solverLeftColspan(row, function (cell) {
                                $(cell).css("z-index", settings['z-index']);
                            });
                        });
                    }

                    if (settings.right > 0) {
                        var tr = table.find("tfoot tr");

                        tr.each(function (k, row) {
                            solveRightColspan(row, function (cell) {
                                $(cell).css("z-index", settings['z-index']);
                            });
                        });
                    }
                }
            }


            function setParent() {
                var parent = $(settings.parent);
                var table = $(settings.table);

                parent.append(table);
                parent
                    .css({
                        'overflow-x': 'auto',
                        'overflow-y': 'auto'
                    });

                parent.scroll(function () {
                    var scrollWidth = parent[0].scrollWidth;
                    var clientWidth = parent[0].clientWidth;
                    var scrollHeight = parent[0].scrollHeight;
                    var clientHeight = parent[0].clientHeight;
                    var top = parent.scrollTop();
                    var left = parent.scrollLeft();

                    if (settings.head)
                        this.find("thead tr > *").css("top", top);

                    if (settings.foot)
                        this.find("tfoot tr > *").css("bottom", scrollHeight - clientHeight - top);

                    if (settings.left > 0)
                        settings.leftColumns.css("left", left);

                    if (settings.right > 0)
                        settings.rightColumns.css("right", scrollWidth - clientWidth - left);
                }.bind(table));
            }

            function fixHead() {
                var thead = $(settings.table).find("thead");
                var tr = thead.find("tr");
                var cells = thead.find("tr > *");

                setBackground(cells);
                cells.css({
                    'position': 'relative'
                });
            }

            function fixFoot() {
                var tfoot = $(settings.table).find("tfoot");
                var tr = tfoot.find("tr");
                var cells = tfoot.find("tr > *");

                setBackground(cells);
                cells.css({
                    'position': 'relative'
                });
            }

            function fixLeft() {
                var table = $(settings.table);

                settings.leftColumns = $();

                var tr = table.find("tr");
                tr.each(function (k, row) {

                    solverLeftColspan(row, function (cell) {
                        settings.leftColumns = settings.leftColumns.add(cell);
                    });
                });

                var column = settings.leftColumns;

                column.each(function (k, cell) {
                    var cell = $(cell);

                    setBackground(cell);
                    cell.css({
                        'position': 'relative'
                    });
                });
            }

            // Set table right column fixed
            function fixRight() {
                var table = $(settings.table);

                var fixColumn = settings.right;

                settings.rightColumns = $();

                var tr_head = table.find('thead').find("tr");
                var tr_body = table.find('tbody').find("tr");
                var fcell = null;
                tr_head.each(function (k, row) {
                    solveRightColspanHead(row, function (cell) {
                        if (k === 0) {
                            fcell = cell;
                        }
                        settings.rightColumns = settings.rightColumns.add(fcell);
                    });
                });

                tr_body.each(function (k, row) {
                    solveRightColspanBody(row, function (cell) {
                        settings.rightColumns = settings.rightColumns.add(cell);
                    });
                });

                var column = settings.rightColumns;

                column.each(function (k, cell) {
                    var cell = $(cell);

                    setBackground(cell);
                    cell.css({
                        'position': 'relative',
                        'z-index': '9999'
                    });
                });

            }

            // Set fixed cells backgrounds
            function setBackground(elements) {
                elements.each(function (k, element) {
                    var element = $(element);
                    var parent = $(element).parent();

                    var elementBackground = element.css("background-color");
                    elementBackground = (elementBackground == "transparent" || elementBackground == "rgba(0, 0, 0, 0)") ? null : elementBackground;

                    var parentBackground = parent.css("background-color");
                    parentBackground = (parentBackground == "transparent" || parentBackground == "rgba(0, 0, 0, 0)") ? null : parentBackground;

                    var background = parentBackground ? parentBackground : "white";
                    background = elementBackground ? elementBackground : background;

                    element.css("background-color", background);
                });
            }

            function solverLeftColspan(row, action) {
                var fixColumn = settings.left;
                var inc = 1;

                for (var i = 1; i <= fixColumn; i = i + inc) {
                    var nth = inc > 1 ? i - 1 : i;

                    var cell = $(row).find("> *:nth-child(" + nth + ")");
                    var colspan = cell.prop("colspan");

                    if (cell.cellPos().left < fixColumn) {
                        action(cell);
                    }

                    inc = colspan;
                }
            }

            function solveRightColspanHead(row, action) {
                var fixColumn = settings.right;
                var inc = 1;
                for (var i = 1; i <= fixColumn; i = i + inc) {
                    var nth = inc > 1 ? i - 1 : i;

                    var cell = $(row).find("> *:nth-last-child(" + nth + ")");
                    var colspan = cell.prop("colspan");

                    action(cell);

                    inc = colspan;
                }
            }

            function solveRightColspanBody(row, action) {
                var fixColumn = settings.right;
                var inc = 1;
                for (var i = 1; i <= fixColumn; i = i + inc) {
                    var nth = inc > 1 ? i - 1 : i;

                    var cell = $(row).find("> *:nth-last-child(" + nth + ")");
                    var colspan = cell.prop("colspan");
                    action(cell);
                    inc = colspan;
                }
            }

            var defaults = {
                head: true,
                foot: false,
                left: 0,
                right: 0,
                'z-index': 0
            };

            var settings = $.extend({}, defaults, param);

            settings.table = this;
            settings.parent = $(settings.table).parent();
            setParent();

            if (settings.head == true) {
                fixHead();
            }

            if (settings.foot == true) {
                fixFoot();
            }

            if (settings.left > 0) {
                fixLeft();
            }

            if (settings.right > 0) {
                fixRight();
            }

            setCorner();

            $(settings.parent).trigger("scroll");

            $(window).resize(function () {
                $(settings.parent).trigger("scroll");
            });
        }
    };

})(jQuery);

(function ($) {

    function scanTable($table) {
        var m = [];
        $table.children("tr").each(function (y, row) {
            $(row).children("td, th").each(function (x, cell) {
                var $cell = $(cell),
                    cspan = $cell.attr("colspan") | 0,
                    rspan = $cell.attr("rowspan") | 0,
                    tx, ty;
                cspan = cspan ? cspan : 1;
                rspan = rspan ? rspan : 1;
                for (; m[y] && m[y][x]; ++x);  //skip already occupied cells in current row
                for (tx = x; tx < x + cspan; ++tx) {  //mark matrix elements occupied by current cell with true
                    for (ty = y; ty < y + rspan; ++ty) {
                        if (!m[ty]) {  //fill missing rows
                            m[ty] = [];
                        }
                        m[ty][tx] = true;
                    }
                }
                var pos = {top: y, left: x};
                $cell.data("cellPos", pos);
            });
        });
    };

    $.fn.cellPos = function (rescan) {
        var $cell = this.first(),
            pos = $cell.data("cellPos");
        if (!pos || rescan) {
            var $table = $cell.closest("table, thead, tbody, tfoot");
            scanTable($table);
        }
        pos = $cell.data("cellPos");
        return pos;
    }
})(jQuery);