/// CorporativoGrid - Utilizado para geração do elemento HTML table apartir de uma matriz de dados JSON, 
///                   Recebe por parâmetros as configurações de colunas, agrupamentos, eventos, javascripts e classes CCS.
/// By: Toninho xD

//Registro do componente ao prototype JQUERY
$.fn.CorporativoGrid = function (opt) {

    //Validar as opções informadas pelo usuário, afinal, sempre tem um bendito querendo medir a febre do programador.
    ValidarOpcoes(opt);
    
    //Inicializa as propriedades, seta as variáveis globais e limpa as tabelas existentes em cache, para casos onde exista mais de um componente na mesma página.
    InicializarComponente(this);

    //Seta as configurações informadas pelo usuário, ou as padrões caso não seja informada.
    SetarConfiguracaoUsuario(opt);

    //Renderiza o elemento HTML.
    RenderizarTabela();

    //Renderiza o elemento WIDGET na página
    if (_Options.SomenteTabela) {
        return elementoAdicionar.empty().append(_TabelaAtual);
    }
    else
        return RenderizarWidget();
}

function RenderizarWidget() {

    var exibeIcone = (_Options.Icone !== undefined && _Options.Icone != '')
    if (exibeIcone) {
        _htmlPadraoWidget =  _htmlPadraoWidget.replace('{2}', _Options.Icone);
    }
    else
        _htmlPadraoWidget = _htmlPadraoWidget.replace('{2}', '');

    var _subtitulo = _Options.SubTitulo ? (' - ' + _Options.SubTitulo) : '';

    var _widgetVinculado = $(_htmlPadraoWidget.replace('{0}', _Options.Titulo).replace('{1}', _subtitulo));

    if (_Options.ExportarExcel) {
        _widgetVinculado.find('.tools').append(_btnExportarPlanilha);
        var imported = document.createElement('script');
        imported.src = Benner.Page.getApplicationPath() + 'Content/js/jquery.table2excel.js';
        document.head.appendChild(imported);
    }

    if (_Options.ExibirTelaInteira)
        _widgetVinculado.find('.tools').append(_btnFullscreen);

    if (_Options.Voltar != undefined) {
        _widgetVinculado.find('.tools').prepend(_btnVoltar);
    }

    if (_Options.FecharJanela != undefined) {
        _widgetVinculado.find('.tools').append(_btnFechar);
    }

    _widgetVinculado.find('.table-scrollable').empty().append(_TabelaAtual);
    elementoAdicionar.html(_widgetVinculado);

    //Fixar colunas de um elemento table utilizando técnicas de CSS(position). 
    if (_Options.CongelarColunas !== undefined) {
        _TabelaAtual.tableHeadFixer(_Options.CongelarColunas);
    }

    return _widgetVinculado;
}

//Validar opções informadas pelo usuário
function ValidarOpcoes(options) {
    //Objeto com as informações
    if (options.Body === undefined || options.Body.length == 0 || !ValidarJSON(options.Body))
        throw new Error("Opção 'body' inválida ou não informada. Essa informação é de preenchimento obrigatório e os dados informados deverão ser em um formato JSON válido.");

    //Agrupamentos
    if (options.Group !== undefined && options.Group.length > 0) {
        var objReferencia = options.Body[0];

        for (var i = 0, len = options.Group.length; i < len; i++) {

            if (typeof objReferencia[options.Group[i]] == 'undefined') {
                throw new Error("Coluna de agrupamento '{0}', não encontrada nos dados disponíveis, verifique o nome informado, lembrando que javascript é CaseSensitive.".replace('{0}', objReferencia[options.Group[i]]));
            }

        }
    }

    //Exportar para excel, aceita somente verdadeiro ou falso.
    if (options.ExportarExcel !== undefined && typeof options.ExportarExcel !== 'boolean') {
        throw new Error("Opção 'ExportarExcel' inválida, essa opção deve ser um tipo booleano.")
    }

    //Exibir tela inteira, aceita somente verdadeiro ou falso.
    if (options.ExibirTelaInteira !== undefined && typeof options.ExibirTelaInteira !== 'boolean') {
        throw new Error("Opção 'ExibirTelaInteira' inválida, essa opção deve ser um tipo booleano.")
    }

    //Vincular dados, aceita somente verdadeiro ou falso, essa opção é utilizada para vincular os dados junto com a linha inserindo-as em um attributo data-key.
    if (options.VincularDados !== undefined && typeof options.VincularDados !== 'boolean') {
        throw new Error("Opção 'VincularDados' inválida, essa opção deve ser um tipo booleano.")
    }

    if (options.IniciarAgrupamentosExpandidos !== undefined && typeof options.IniciarAgrupamentosExpandidos !== 'boolean') {
        throw new Error("Opção 'IniciarAgrupamentosExpandidos' inválida, essa opção deve ser um tipo booleano.")
    }

    if (options.InserirLinhaAgrupador !== undefined && typeof options.InserirLinhaAgrupador !== 'boolean') {
        throw new Error("Opção 'InserirLinhaAgrupador' inválida, essa opção deve ser um tipo booleano.")
    }

    //Congelar colunas, 
    if (options.CongelarColunas !== undefined) {

        if (typeof options.CongelarColunas !== 'object') {
            throw new Error("Opção 'CongelarColunas' inválida, essa opção deve conter as propriedades 'left' e 'header'.")
        }
        else {
            //Quantidades de colunas a esquerda que irá ser congelada.
            if (options.CongelarColunas.left === undefined || typeof options.CongelarColunas.left != 'number' || options.CongelarColunas.left > options.Header.length) {
                throw new Error("Opção 'left' para 'CongelarColunas' inválida, essa opção aceita somente números, de valor máximo sendo o total de colunas da tabela.")
            }

            //Cabeçalho da tabela congelado ou lado.
            if (options.CongelarColunas.Header !== undefined && typeof options.CongelarColunas.Header !== 'boolean') {
                throw new Error("Opção 'header' para 'CongelarColunas' inválida, essa opção deve ser um tipo booleano.")
            }

        }        
    }

}

//Setar as configurações padrões ou as que usuário informar.
function SetarConfiguracaoUsuario(options) {

    //Classe Css da tabela
    var tblClass = options.class ? options.class : 'table table-light table-striped';
    _TabelaAtual.addClass(tblClass);
    _Options.css = tblClass;

    //Corpo contendo os dados
    _Options.Body = options.Body;

    //Agrupamentos
    _Options.Group = options.Group ? options.Group : [];

    //Cabecalhos
    _Options.Header = options.Header;
    _Options.HeaderAuxiliar = options.HeaderAuxiliar ? options.HeaderAuxiliar : [];

    //Rodapé
    _Options.Footer = options.Footer;

    
    //Opções extras para o usuário
    _Options.ExibirTelaInteira = (options.ExibirTelaInteira != undefined && !options.ExibirTelaInteira) ? options.ExibirTelaInteira : true;

    _Options.ExportarExcel = (options.ExportarExcel != undefined && !options.ExportarExcel) ? options.ExportarExcel : true;

    _Options.VincularDados = options.VincularDados ? options.VincularDados : false;

    _Options.CongelarColunas = options.CongelarColunas ? options.CongelarColunas : false;

    _Options.IniciarAgrupamentosExpandidos = (options.IniciarAgrupamentosExpandidos != undefined && !options.IniciarAgrupamentosExpandidos) ? options.IniciarAgrupamentosExpandidos : true;

    _Options.InserirLinhaAgrupador = (options.InserirLinhaAgrupador != undefined && !options.InserirLinhaAgrupador) ? options.InserirLinhaAgrupador : false;

    _Options.Titulo = options.Titulo ? options.Titulo : '';

    _Options.SubTitulo = options.SubTitulo ? options.SubTitulo : '';

    _Options.Icone = options.Icone ? options.Icone : '';

    _Options.Voltar = options.Voltar ? options.Voltar : undefined;

    _Options.FecharJanela = options.FecharJanela ? options.FecharJanela : undefined;

    _Options.SomenteTabela = options.SomenteTabela ? options.SomenteTabela : undefined;

    _Options.Eventos = options.Eventos ? options.Eventos : undefined;

    _Options.Caption = options.Caption ? options.Caption : undefined;

}

//Validar um objeto como um Java Script Object Notation válido. Caso válido retorna o parse do objeto.
function ValidarJSON(obj) {
    try {
        if ($.isArray(obj)) {
            return true;
        }        
        return JSON.parse(obj);
    } catch (e) {
        return false;
    }

}

//Inicializa as propriedades padrão, e limpa as tabelas existentes em cache, para casos onde exista mais de um componente na mesma página.
function InicializarComponente(el) {
    _tbodys = [];
    _tbody = $('<tbody />'), _thead = $('<thead />'), _tfooter = $('<tfoot />'), tr = $('<tr />'), td = $('<td />'), th = $('<th />');

    _TabelaAtual = $('<table />', { id: GerarIdRamdomico(), style: 'border-collapse: separate' });
    _TabelaAtual.empty();

    elementoAdicionar = $(el);
}

//Renderizar o elemento Table no DOM HTML 
function RenderizarTabela() {

    if (_Options.Group.length > 0)
        _Options.Body = AgruparDados();

    var cabecalho = RenderizarCabecalho();
    var corpo = RenderizarCorpo();
    var caption = RenderizarCaption();

    _TabelaAtual.append(corpo).prepend(cabecalho).prepend(caption);

    if (_Options.Footer !== undefined) {
        _TabelaAtual.append(RenderizarFooter());
    }

    //Exibir agrupadores e operadores expandidos ou não, conforme opção do usuário.
    if (_Options.Group.length > 0) {
        $(_TabelaAtual).find('.agrupador').each(function (i, ln) {
            ExibirLinhasDetalhes(ln, _Options.IniciarAgrupamentosExpandidos);
        })
        $(_TabelaAtual).find('.op').each(function (i, ln) {
            ExibirMestreDetalhes(ln, _Options.IniciarAgrupamentosExpandidos);
        });
    }
    

    if (_Options.Eventos !== undefined) {
        $(_TabelaAtual).find('tbody tr').each(function (i, ln) {
            $.each(_Options.Eventos, function (ev, fun) {
                $(ln).on(ev, fun);
            });
        })
    }
}

//Renderizar o elemento THEAD na tabela.
function RenderizarCabecalho() {
    _thead = $('<thead />');
    _tr = $('<tr />');

    //Percorrer o cabeçalho principal, informado pelo usuário.
    for (var posColHeaderAtual = 0, total = _Options.Header.length; posColHeaderAtual < total; posColHeaderAtual++) {

        var hcolAtual = _Options.Header[posColHeaderAtual];
        _th = $('<th />');

        if (typeof (hcolAtual) == 'object') {

            for (var propHeader in hcolAtual) {

                if (hcolAtual[propHeader] == 'checkbox') {

                    var chk = $('<input />', { type: hcolAtual[propHeader] });

                    if (hcolAtual["onclick"] !== undefined) {
                        $(chk).click(function () {
                            hcolAtual["onclick"]
                        });
                    }
                    _th.append(chk);
                    continue;
                    
                }
                else if (propHeader == 'class')
                    _th.addClass(hcolAtual[propHeader]);
                else if (propHeader == 'value')
                    _th.append(hcolAtual[propHeader]);
                else if (_HtmlAtributosNativos.indexOf(propHeader) > -1) //Se o atributo atual é nativo do html adicionaremos ele sem o prefixo data-, pois, este prefixo foi adicionado somente no html5
                    _th.attr(propHeader, hcolAtual[propHeader]);
                else
                    _th.attr(('data-' + propHeader), hcolAtual[propHeader])
            }
        }
        else
            _th.append(hcolAtual);

        if (_Options.HeaderAuxiliar == undefined || _Options.HeaderAuxiliar.length < 1) {
            _th.css('border-color', '#4B77BE');
        }

        _tr.append(_th);

    }

    _thead.append(_tr);
    _tr = $('<tr />');

    //Percorrer o cabeçalho auxiliar
    for (var posColHeaderAuxAtual = 0, total = _Options.HeaderAuxiliar.length; posColHeaderAuxAtual < total; posColHeaderAuxAtual++) {

        var hcolAuxAtual = _Options.HeaderAuxiliar[posColHeaderAuxAtual];
        _th = $('<th />');

        if (typeof (hcolAuxAtual) == 'object') {
            for (var propHeader in hcolAuxAtual) {
                if (hcolAuxAtual[propHeader] == 'checkbox') {
                    var chk = $('<input />', { type: hcolAuxAtual[propHeader] })
                    _th.append(chk);
                }
                else if (propHeader == 'class')
                    _th.addClass(hcolAuxAtual[propHeader]);
                else if (propHeader == 'value')
                    _th.append(hcolAuxAtual[propHeader]);
                else if (_HtmlAtributosNativos.indexOf(propHeader) > -1) //Se o atributo atual é nativo do html adicionaremos ele sem o prefixo data-, pois, este prefixo foi adicionado somente no html5
                    _th.attr(propHeader, hcolAuxAtual[propHeader]);
                else
                    _th.attr(('data-' + propHeader), hcolAuxAtual[propHeader])
            }
        }
        else
            _th.append(hcolAuxAtual);

        _th.css('border-color', '#4B77BE');

        _tr.append(_th);

        _thead.prepend(_tr);
    }

    return _thead;
}

//Renderizar os elementos TBODY na tabela.
function RenderizarCorpo() {

    return PercorrerAtributosFilhos(_Options.Body);
}

//Renderizar o elemento caption da tabela
function RenderizarCaption() {
    if (_Options.Caption != undefined) {

        var _caption = $('<caption/>', { text: _Options.Caption })
        return _caption;
    }
}

//Renderizar o rodapé(tfoot) do elemento table
function RenderizarFooter() {
    var linha = $('<tr></tr>'), coluna = $('<td></td>');

    $.each(_Options.Footer, function (i, col) {
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

    return tfoot;
}

//Adicionar a matriz de dados JSON em um TBODY
function CorpoTabela(body) {
    _tbody = $('<tbody />');
    _tr = $('<tr />');
    if (_UltimaChaveAgrupamento != null)
        _tbody.attr('data-mestre', _UltimaChaveAgrupamento);

    if (_Options.InserirLinhaAgrupador) {

        td = $('<td></td>').attr('colspan', _Options.Header.length).append(nomeAttr);
        _tr.append(td);
        _tr.addClass('agrupador');

        if (_Options.Group.length > 0) {
            _tr.click(function (e) {
                ExibirLinhasDetalhes(this);
            });
        }
        _tbody.append(_tr);

    }


    //Percorre-los para adicionar à tabela
    $.each(body, function (nomeAttrFilho, linha) {

        _tr = $('<tr></tr>');
        if (!_Options.InserirLinhaAgrupador && nomeAttrFilho == 0) {
            _tr.addClass('agrupador');
            if (_Options.Group.length > 0) {
                _tr.click(function (e) {
                    ExibirLinhasDetalhes(this);
                });
            }
            
        }

        $.each(_Options.Header, function (i, colHeader) {

            _td = $('<td></td>');

            if (typeof (colHeader) == 'object') {

                for (attr in colHeader) {
                    if (colHeader[attr] == 'checkbox') {
                        var chk = $('<input />', { type: colHeader[attr] })
                        _td.append(chk);
                    }
                    else if (attr == 'class') {

                        _td.addClass(colHeader[attr]);

                    }
                    else if (attr == 'field' || attr == 'value') {

                        var vlAtual = linha[colHeader[attr]];
                        if (colHeader["type"] === 'money') {

                            if (vlAtual !== undefined) {
                                vlAtual = FormatarMoeda(vlAtual);

                                if (vlAtual !== undefined) {
                                    _td.append(vlAtual.ValorFormatado);

                                    if (vlAtual.EhNegativo)
                                        _td.addClass('red-intense')
                                }
                                else
                                    _td.append('0,00');
                            }
                        }
                        else if (colHeader["type"] === 'date') {

                            if (vlAtual !== undefined) {
                                var formato = colHeader["format"];
                                vlAtual = FormatarData(vlAtual, (formato ? formato : 'dd/MM/yyyy'));
                                _td.append(vlAtual);
                            }
                        }
                        else
                            _td.append(vlAtual);
                    }
                    else if (_HtmlAtributosNativos.indexOf(attr) > -1) //Se o atributo atual é nativo do html adicionaremos ele sem o prefixo data-, pois, este prefixo foi adicionado somente no html5
                        _td.attr(attr, colHeader[attr]);
                    else
                        _td.attr(('data-' + attr), colHeader[attr])
                }
            }
            else
                _td.append(linha[colHeader]);

            _tr.append(_td);
        });

        if (_Options.VincularDados)
            $(_tr).attr('data-key', JSON.stringify(linha));

        _tbody.append(_tr);

    });
    return _tbodys.push(_tbody);
}

function FecharJanela() {
    $('.modal').modal('hide');
}
//Recursividade para percorrer todos os atributos filhos gerados pelo agrupador de dados.
function PercorrerAtributosFilhos(objAtual) {
    if ($.isArray(objAtual)) {
        CorpoTabela(objAtual);
    }
    else {

        $.each(objAtual, function (nomeAttr, dadosFilhos) {

            if (!$.isArray(dadosFilhos)) {

                if (_Options.InserirLinhaAgrupador) {

                    _UltimaChaveAgrupamento = 'DTK-' + GerarIdRamdomico();

                    _tbody = $('<tbody data-key="' + _UltimaChaveAgrupamento + '"></tbody>');

                    _tr = $('<tr class="op"></tr>'), _td = $('<td></td>');
                    _td.attr('colspan', _Options.Header.length).append(nomeAttr);
                    _tr.append(td);

                    _tr.click(function (e) {
                        ExibirMestreDetalhes(this);
                    });

                    _tbody.append(_tr);
                    _tbodys.push(_tbody);
                }
                PercorrerAtributosFilhos(dadosFilhos);
            }
            else { //Chegamos à matriz com os dados.

                CorpoTabela(dadosFilhos);
            }
        });

    }
    
    return _tbodys;
    
}

//Agrupamento de dados por colunas.
function AgruparDados() {
    var colsObjData = {};
    var finalData = {};
    var colunas = _Options.Group;

    for (var pos = 0, total = _Options.Body.length; pos < total; pos++) {
        var obj = _Options.Body[pos];
        var key = colunas.reduce(function (a, b) {
            return (a ? a + ';' : a) + obj[b];
        }, '');
        if (!(key in colsObjData)) {
            colsObjData[key] = [];
        }
        colsObjData[key].push(obj);

    }

    for (var key in colsObjData) {

        var data = finalData;
        var splited = key.split(';');

        for (var posAux = 0, total = splited.length; posAux < total; posAux++) {

            var objSplit = splited[posAux];
            var col = objSplit[0];
            
            if (!(col in data)) {
                data[col] = {}
            }
            if (posAux === splited.length - 1) {
                data[col] = colsObjData[key];
            }
            else {
                data = data[col];
            }

        }
    }

    return finalData;
}

function FormatarData(data, formato) {
    
    return data;

}

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

function RedimensionarTabela(lnk) {

    if (lnk === undefined) {
        $('.table-scrollable').height('65vh');
    }
    else {

        var PorCento = (window.screen.height / 100) * 79;

        if (!$(lnk).hasClass('on')) {
            //tela cheia??
            if ((window.fullScreen) || (window.innerWidth == screen.width && window.innerHeight == screen.height)) {

                $('.table-scrollable').height('88vh');
            }
            else {
                $('.table-scrollable').height(PorCento + 'px');
            }
        }
        else
            $('.table-scrollable').height('65vh');
    }
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
        else if (!expandir)
            $(linha).find('td:first-child').prepend('<i class="fa fa-plus" aria-hidden="true"></i> ');
    }

}

function GerarIdRamdomico() {
    return Math.floor(Math.random() * 9999);
} 

function Voltar() {
    if (typeof _Options.Voltar == 'boolean') {
        if (_Options.Voltar) {
            history.go(-1);
        }
    }
    else if (typeof _Options.Voltar == 'function') {
        _Options.Voltar();
    }
}

function ExportarPlanilha(table, nomeArquivo, nomeTabela) {

    table = table ? table : ('#' + _TabelaAtual.attr('id'));
    nomeArquivo = nomeArquivo ? nomeArquivo : 'PNL' + GerarIdRamdomico();
    nomeTabela = nomeTabela ? nomeTabela : 'XLS-' + GerarIdRamdomico();

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

function ExibirMensagem(exibir, msg, beforeElement) {
    if (exibir) {
        var elementsMsg = $('[data-corp-message="true"]');
        elementsMsg.remove();

        var html = _HtmlPadraoMsgAlerta.replace('{0}', msg);

        $(html).insertBefore(beforeElement).show();
    }
    else {
        $('[data-corp-message="true"]').hide();
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

//Variáveis internas do componente.
var _UltimaChaveAgrupamento = null, _Agrupamentos = null, _TabelaAtual = null, _Options = {}, _tbodys = [], _tbody = null, _thead = null, _tfooter = null, _tr = null, _td = null, _th = null;
var _HtmlAtributosNativos = ['colspan', 'style', 'onclick', 'onmouseover', 'onmouseout', 'onmousemove', 'onenter', 'onchange', 'type'];

var _htmlPadraoWidget = '<div class="row"><div class="col-md-12 col-lg-12 col-sm-12"><div class="portlet light"><div class="portlet-title" style="border-color:#4B77BE;margin-bottom: 0;"><div class="caption"><i class="fa {2} font-blue-ebonyclay"></i><span class="caption-subject bold font-blue-steel">{0}</span><span class="caption-helper">{1}</span></div><div class="tools"></div></div><div class="portlet-body" style="padding:0;"><div class="table-scrollable" style="min-height:350px;height:350px;overflow:auto;margin:0!important;padding:0!important"></div></div></div></div></div>';
var _HtmlPadraoMsgAlerta = '<div class="row" data-corp-message="true"><div class="col-md-12 col-lg-12 col-sm-12"><div class="alert alert-warning alert-dismissable"><button type="button" class="close" data-dismiss="alert" aria-hidden="true"></button><div>{0}</div></div></div></div>';

var _btnFullscreen = '<a href="#" class="fullscreen font-blue-steel" style="top: 0!important" title="Exibir em modo de tela cheia." onclick="RedimensionarTabela(this)"></a>';
var _btnExportarPlanilha = '<a href="#" class="fa fa-download font-blue-steel" style="padding:3px" title="Exportar para planilha do excel." onclick="ExportarPlanilha()"></a>';
var _btnVoltar = '<a href="#" onclick="Voltar(this)" class="fa fa-arrow-left font-blue-steel" title="Voltar para filtros."></a>';
var _btnFechar = '<a href="#" onclick="FecharJanela()" class="fa fa-times font-blue-steel" style="font-size: 16px;padding:3px" title="Fechar esta janela!"></a>';
var elementoAdicionar = null;


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
                var pos = { top: y, left: x };
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

