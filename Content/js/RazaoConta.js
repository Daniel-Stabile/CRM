//Executa a requisição ao servidor renderizando o retorno em um modal contendo os detalhes do razão.
function ObterRazao(objEnvioPost, _target) {
    if (_target === undefined) {
        _target = '#divResultados';
    }
    $.ajax({
        type: "POST",
        dataType: "json",
        url: Benner.Page.getApplicationPath() + 'ConsultasContabil/RazaoConta',
        data: objEnvioPost,
        beforeSend: function () {
            App.blockUI({ target: _target, animate: true });
        },
        success: function (data) {

            if (typeof data == 'object') {

                $('#tblRazao').BennerGrid({
                    header: [{ value: "CHAVE", field: "HANDLE" },
                    { value: "HISTÓRICO", class: "col-md-7 col-lg-7 col-sm-7", field: "HISTORICODET" },
                    { value: "DATA", class: "center", field: "DATACAST" },
                    { value: "DOCUMENTO", class: "center col-md-2 col-lg-2 col-sm-2", field: "DOCUMENTOCONTABIL" },
                    { value: "LOTE", class: "center", field: "PCLOTE" },
                    { value: "DÉBITO", class: "right", field: 'DEBITOS', type: 'money' },
                    { value: "CRÉDITO", class: "right", field: 'CREDITOS', type: 'money', onclick: 'ExibirDetalhes(this, objEnvioPost);' }],
                    body: ModelarDados(data),
                    vincular: false,
                    class: 'table table-hover simple-grid',
                    events: {
                        click: function () {
                            ExibirDetalhes(this, objEnvioPost)
                        }
                    },
                    key: true
                });

                $("#tblRazao").tableHeadFixer({ 'left': 0, 'head': false });
                $('#contaContabil').text('Razão da conta: ' + JSON.parse(objEnvioPost.ContaContabil).SelectedItems[0].text);
				
				

                var saldoAtual = FormatarMoeda(objEnvioPost.SaldoAtual);

                $('#spSaldoAtual').text(saldoAtual.ValorFormatado);
                if (saldoAtual.EhNegativo)
                    $('#spSaldoAtual').closest('.dashboard-stat').addClass('red-intense').removeClass('blue');
                else
                    $('#spSaldoAtual').closest('.dashboard-stat').addClass('blue').removeClass('red-intense');


                var saldoDoMes = FormatarMoeda(vlDoMes);
                $('#spSaldoMensal').text(saldoDoMes.ValorFormatado);
                if (saldoDoMes.EhNegativo)
                    $('#spSaldoMensal').closest('.dashboard-stat').addClass('red-intense').removeClass('blue');
                else
                    $('#spSaldoMensal').closest('.dashboard-stat').addClass('blue').removeClass('red-intense');

                BuscarSaldoAnterior(objEnvioPost);
            }
            else
                Benner.ModalMessage.alert("Atenção", data, function () { });
        },
        error: function (xhr, textStatus, error) {
            console.log(error);
        },
        complete: function () {
            App.unblockUI(_target);
        }
    });
}

function BuscarSaldoAnterior(obj) {

    $.ajax({
        type: "GET",
        contentType: "application/json; charset=utf-8",
        url: Benner.Page.getApplicationPath() + 'ConsultasContabil/SaldoAnterior',
        data: obj,
        beforeSend: function () {
            App.blockUI({ target: '#divResultados', animate: true });
        },
        success: function (data) {
            var saldoAnterior = FormatarMoeda(data);
            $('#spSaldoAnterior').text(saldoAnterior.ValorFormatado);
            if (saldoAnterior.EhNegativo)
                $('#spSaldoAnterior').closest('.dashboard-stat').addClass('red-intense').removeClass('blue');
            else
                $('#spSaldoAnterior').closest('.dashboard-stat').addClass('blue').removeClass('red-intense');

            $('#DetalhesRazao').appendTo('body').modal('show');
            var maximixado = $('#maxPortlet').hasClass('on');
            if (!maximixado)
                $('#maxPortlet').trigger('click');

            bckLinhas = null;
        },
        error: function (xhr, textStatus, error) {
            console.log(error);
        },
        complete: function () {
            App.unblockUI('#divResultados');
        }
    });
}

//Modela o retorno do servidor para exibir os dados de maneira amigável ao usuário, no bennergrid.
var vlDoMes = 0;
var vlDoMesCC = 0;
var vldoMesSemCC = 0;
var agrupaCCProjPorLanc = [];
var totalAdicionado = 0;

function ModelarDados(dados) {
    var retorno = [];
    vlDoMes = 0;
	vlDoMesCC = 0;
	vldoMesSemCC = 0;
    var uniqueData = {};
    totalAdicionado = 0;
    $.each(dados, function (i, linha) {
		
		//SMS-1829471
		/*Isso foi modificado pois o saldo do mês (quando é é utilizado filtros) contabiliza o valor da tabela
			CT_LANCAMENTOSCC utilizando o campo VALORCC retornado pelo server
		*/
		if (linha.NATUREZA == 'C'){
			vlDoMesCC -= linha.VALORCC;
		} else{
			vlDoMesCC += linha.VALORCC;
		}
		
		
        if (!uniqueData[linha.HANDLE.Value]) {
            agrupaCCProjPorLanc[totalAdicionado] = {};
            agrupaCCProjPorLanc[totalAdicionado]['HANDLE'] = linha.HANDLE.Value;
            agrupaCCProjPorLanc[totalAdicionado].LINHAS = [];
            agrupaCCProjPorLanc[totalAdicionado].LINHAS.push(linha);

            totalAdicionado = totalAdicionado + 1;

            uniqueData[linha.HANDLE.Value] = linha.HANDLE.Value;
            linha.DATACAST = moment(ToDate(linha.DATA)).format('DD/MM/YYYY');
            linha.DEBITOS = linha.NATUREZA == 'C' ? 0 : linha.VALOR;
            linha.CREDITOS = linha.NATUREZA == 'C' ? linha.VALOR : 0;
            linha.PCLOTE = linha.LOTE;
            linha.HANDLE = linha.HANDLE.Value;
            linha.BLOQUEADO = linha.BLOQUEADO == 'N' ? 'Não' : 'Sim';
            linha.HISTORICODET = linha.COMPLEMENTO;
            delete linha.DOCUMENTO;
            delete linha.LOTE;
            delete linha.DATA;
			
			//SMS-1829471
			/*Isso foi modificado pois o saldo do mês (quando não é utilizado filtros) contabiliza o valor da tabela
				CT_LANCAMENTOS utilizando o campo VALOR retornado pelo server
			*/
			if (linha.NATUREZA == 'C'){
				vldoMesSemCC -= linha.VALOR;
			} else{
				vldoMesSemCC += linha.VALOR;
			}

            retorno.push(linha);
        }
        else {
            var handleAdicionar = BuscarPosicaoLinha(linha.HANDLE.Value);
            if (handleAdicionar > -1) {
                agrupaCCProjPorLanc[handleAdicionar].LINHAS.push(linha);
            }
        }
    });
	
	
	//SMS-1829471
	/*Essa modificação foi feita, pois a contabilização do saldo mensal era baseado apenas na tabela CT_LANCAMENTOS
		e quando um filtro de Projeto ou Centro de custo é utilizado, a tabela que deve ser levada em consideração para
		totalizar o saldo do mês é a CT_LANCAMENTOSCC
	*/
	var temCentroCusto = JSON.parse($('[data-field="ESTRUTURACENTROCUSTO"]').val())["SelectedItems"][0]["id"] != -1;
    var temProjeto = JSON.parse($('[data-field="ESTRUTURAPROJETO"]').val())["SelectedItems"][0]["id"] != -1;

	if(temCentroCusto || temProjeto){
		vlDoMes = vlDoMesCC;
	} else {
		vlDoMes = vldoMesSemCC;
	}
	
    return retorno;
}

function BuscarPosicaoLinha(handle) {
    for (var i = 0; i < agrupaCCProjPorLanc.length; i++) {
        var linha = agrupaCCProjPorLanc[i];
        if (linha.HANDLE == handle) {
            return i;
        }
    }
}
var htmlTabela = '<table class="table table-hover" id="tblDetalhesCentroCusto"><thead><tr><th>CENTRO DE CUSTO</th><th>PROJETO</th><th>PERCENTUAL</th><th>VALOR</th></tr></thead><tbody></tbody></table>';
function ExibirDetalhes(linha, objEnvioPost) {
    var objLinha = $(linha).data('key');
    var handleLinha = objLinha.HANDLE;
    var recebDados = {};
    var isOpen = $('.DetalhesRazao_' + handleLinha).length == 0;

    if (isOpen) {
        for (var i = 0; i < agrupaCCProjPorLanc.length; i++) {
            if (handleLinha == agrupaCCProjPorLanc[i].HANDLE) {
                recebDados = agrupaCCProjPorLanc[i].LINHAS;
            }
        }

        var tblAdicionar = $(htmlTabela);

        tblAdicionar.addClass('DetalhesRazao_' + handleLinha);

        var linhaAdicionar = $('<tr />');        
        for (var i = 0; i < recebDados.length; i++) {
            var trAtual = $('<tr/>');

            trAtual.append('<td>' + (recebDados[i].ESTRUTURACC != null ? recebDados[i].ESTRUTURACC + ' - ' + recebDados[i].NOMECC : '') + '</td>');           
            trAtual.append('<td>' + (recebDados[i].ESTRUTURAPROJETO != null ? recebDados[i].ESTRUTURAPROJETO + ' - ' + recebDados[i].NOMEPROJETO : '') + '</td>');
            trAtual.append('<td>' + (recebDados[i].PERCENTUALCC != null ? FormatarMoeda(recebDados[i].PERCENTUALCC).ValorFormatado : '') + '</td>');
            trAtual.append('<td>' + (recebDados[i].VALORCC != null ? FormatarMoeda(recebDados[i].VALORCC).ValorFormatado : '') + '</td>');


            if (recebDados[i].ESTRUTURACC != null || recebDados[i].ESTRUTURAPROJETO != null) {
                tblAdicionar.find('tbody').append(trAtual);
            }
        }

        linhaAdicionar.append('<td colspan="7"></td>');
        linhaAdicionar.find('td').append(tblAdicionar);
        linhaAdicionar.insertAfter(linha);
    }
    else {
        $('.DetalhesRazao_' + handleLinha).closest('tr').remove();
    }
}

var meses = { "JANEIRO": "01", "FEVEREIRO": "02", "MARÇO": "03", "ABRIL": "04", "MAIO": "05", "JUNHO": "06", "JULHO": "07", "AGOSTO": "08", "SETEMBRO": "09", "OUTUBRO": "10", "NOVEMBRO": "11", "DEZEMBRO": "12" };
function ExibirRazaoDaConta(col) {
    var coluna = $(col);

    if (col.tagName !== "TD" || $(col).closest('tr').hasClass('agrupador') || $(col).closest('tr').hasClass('op'))
        return false;

    var trAtual = coluna.closest('tr');
    var index = coluna.index();
    var thReferente = $('thead').find('tr').eq(1);
    var competencia = thReferente.find('th').eq(index).attr('vinculo');
    var dados = JSON.parse(trAtual.attr('data-key'));
    var dtCompetencia = competencia.split('/');
    var objetoFiltros = {};

    objetoFiltros.ContaContabil = dados.HANDLECONTA;
    objetoFiltros.ContaContabilTexto = dados.ESTRUTURA + ' - ' + dados.NOME;
    objetoFiltros.Competencia = dtCompetencia[1] + '-' + meses[dtCompetencia[0]] + '-01';
    objetoFiltros.SaldoAtual = dados.SALDO;
    ObterRazao(objetoFiltros);
}

function RazaoContaAnalitico() {
    toastr.info("Exportar razão analítico da conta.", "Exportar excel");

    var objetoFiltros = {};
    objetoFiltros.ContaContabil = $('[data-field="ESTRUTURACONTACONTABIL"]').val();
    objetoFiltros.Ano = $("[data-field='ANO'] .datepicker").val();
    objetoFiltros.Filial = $('[data-field="FILIAL"]').val();
    objetoFiltros.CentroCusto = $('[data-field="ESTRUTURACENTROCUSTO"]').val();
    objetoFiltros.Projeto = $('[data-field="ESTRUTURAPROJETO"]').val();

    $.ajax({
        type: "POST",
        dataType: "json",
        url: Benner.Page.getApplicationPath() + 'ConsultasContabil/RazaoContaAnalitico',
        data: objetoFiltros
    }).done(function (data) {
        Benner.AsyncProcesses.initAjax();
    });
}

function SublinharTexto(col) {
    if (col.tagName !== "TD" || $(col).closest('tr').hasClass('agrupador') || $(col).closest('tr').hasClass('op'))
        return false;

    $(col).css('text-decoration', 'underline').css('cursor', 'Pointer');
}

function RemoverSublinhado(col) {
    if (col.tagName !== "TD" || $(col).closest('tr').hasClass('agrupador') || $(col).closest('tr').hasClass('op'))
        return false;
    $(col).css('text-decoration', 'none').css('cursor', 'Pointer');
}

var bckLinhas = null;
function FiltrarNaTabela(cmp) {        
    //if (bckLinhas == null) {
    //    bckLinhas = $("#tblRazao tbody tr");        
    //}
    //else {
    //    $("#tblRazao tbody").append(bckLinhas);
    //}       
    //$('#tblRazao').find('tr:not(:has(th))').filter(
    //    function () {
    //        console.log(cmp.value);
    //        //console.log($(this).find('td').text());
    //        return ($(this).find('td').text().toUpperCase().indexOf(cmp.value.toUpperCase()) < 0);
    //    }).remove();
    
    var campos = $('#tblRazao').find('tr:not(:has(th))')
    $.each(campos, function (i, campo) {
        var campoFilho = $('.DetalhesRazao_' + $(campo).data('key').HANDLE).closest('tr');
        if (cmp.value != "") {
            var qtd = $(campo).find('td').text().toUpperCase().indexOf(cmp.value.toUpperCase()) < 0;
            if (qtd) {
                $(campo).hide();
                campoFilho.hide();
            } else {
                $(campo).show();
                campoFilho.show();
            }
        } else {
            $(campo).show();
            campoFilho.show();

        }
    })   
}


function ExportarExcel(type, fn, dl) {
    var elt = document.getElementById("tblRazao");
    var wb = XLSX.utils.table_to_book(elt, { sheet: "Resumo detalhado por regra", raw: true });
    return dl ?
        XLSX.write(wb, { bookType: type, bookSST: true, type: 'base64' }) :
        XLSX.writeFile(wb, fn || ('ResumoPorRegra.' + (type || 'xlsx')));
}

function MontarPlanilha() {
    //Montar cabeçalho
    var tcaption = document.createElement('thead');
    var tr = document.createElement('tr');
    var th = document.createElement('th');
	
	
    th.innerText = $('#contaDescricao').text()
    th.colSpan = 7;
    th.style = 'text-align:center';
    $(tr).append(th);
    $(tr).appendTo(tcaption);
    $(tcaption).addClass('hide');
    $('#tblRazao').prepend($(tcaption));
	
	//SMS-1816659 - CONSULTA DE RAZÃO CONTÁBIL COM ERRO
	//O erro nos saldos de consulta contábil já havia sido melhorado quando a versão 6.0 foi liberada.
	//Aqui apenas a atualização do xlsx (para ter o sando atual e anterior) está sendo feito.
	var trSaldoAnterior = document.createElement('tr');
	var thSaldoAnterior = document.createElement('th');
	var trSaldoAtual = document.createElement('tr');
	var thSaldoAtual = document.createElement('th');
	var trSaldoMes = document.createElement('tr');
	var thSaldoMes = document.createElement('th');
	
	
	thSaldoAnterior.innerText = 'Saldo anterior: ' + $('#spSaldoAnterior').text()
	thSaldoAnterior.colSpan = 7;
	$(trSaldoAnterior).append(thSaldoAnterior)
	
	thSaldoAtual.innerText = 'Saldo atual: ' + $('#spSaldoAtual').text()
	thSaldoAtual.colSpan = 7
	$(trSaldoAtual).append(thSaldoAtual)
	
	thSaldoMes.innerText = 'Saldo do mês: ' + $('#spSaldoMensal').text()
	thSaldoMes.colSpan = 7;
	$(trSaldoMes).append(thSaldoMes)
	
	
	$(trSaldoAnterior).appendTo(tcaption);
	$(trSaldoAtual).appendTo(tcaption);
	$(trSaldoMes).appendTo(tcaption);

    //Montar body
    ExportarExcel("xlsx");
}
