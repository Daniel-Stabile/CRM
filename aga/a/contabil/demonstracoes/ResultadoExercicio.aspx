<%@ Page Title="Demonstração de Resultado do Exercício" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="RESULTADODOEXERCCIO" Title="DEMONSTRAÇÃO DO RESULTADO DO EXERCÍCIO" Subtitle="(DRE)" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_DEMONSTRACOES.DRE.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_DEMONSTRACOES_RESULTADOEXERCICIO" Level="20" Order="10"  />
        <wes:ActionView runat="server" ID="DREDEMONSTRATIVODORESULTADODOEXERCCIO" Title="DEMONSTRATIVO RESULTADO DO EXERCÍCIO" Subtitle="(DRE)" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="RESULTADODOEXERCCIO" ChromeState="Fixed" Controller="DemonstracoesContabil" Action="ResultadoExercicio" PageId="AGA_A_CONTABIL_DEMONSTRACOES_RESULTADOEXERCICIO" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              var periodoBase, anobase, mesBase, periodocomparacao, mesComparacao, anoComparacao;
$(function () {
    //Escondemos o WIDGET de resultado.
    ExibirFiltros(true);
    
    //Buscamos a instancia de requisições http
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    if (!prm.get_isInAsyncPostBack()) {
    
        prm.add_endRequest(function (sender, args) {
    
            //Validamos o retorno do servidor para montar a grid somente com dados válidos.
            var dados = $('#dadosJSON').val();
            
            if (ValidarJSON(dados)) {
                
                //Modelagem do retorno para que se possa criar agrupadores na tabela.
                var dadosModelados = ModelarJSON(JSON.parse(dados).PACKEDCONTAINER.CONTENT.ROW);
                
                //Configurações da grid.
                $('#tblResultadoExercicio').BennerGrid({
                    header: [{field:'COL000', value:"CONTA", class:"col-md-9"}, {value:anobase, class:"col-md-3 right", field:'COL003', type:'money'},{value:anoComparacao, class:"col-md-3 right", field:'COL004', type:'money'}], 
                    body: dadosModelados, group: ["OPERADOR", "GRUPO"]});
                
                var btnVoltarFiltros = $('<a href="#" onclick="ExibirFiltros(true)" class="btn btn-circle btn-default" title="Voltar para tela de filtros"><i class="fa fa-arrow-left"></i> Voltar </a>');
                
                var btnExcel = $('<a href="#" onclick="ExportarPlanilha();" class="btn btn-circle btn-default" title="Exportar para planilha do excel"><i class="fa fa-file-excel-o"></i> Exportar </a>');
                
                var btnFullScreen = $('<a class="btn btn-circle btn-icon-only btn-default fullscreen" href="#" title="Exibir tela cheia" onclick="ExibirTelaCheia(this);"> </a>');
                
                
                $('#portlet_DREDEMONSTRATIVODORESULTADODOEXERCCIO .tools').empty();
                $('#portlet_DREDEMONSTRATIVODORESULTADODOEXERCCIO .actions').empty().append(btnVoltarFiltros).append(btnExcel).append(btnFullScreen);
                $('#portlet_DREDEMONSTRATIVODORESULTADODOEXERCCIO').show();
                
                OrdenarTabela();
                
                ExibirFiltros(false);
            }
        });
    }
    
});

//Efetua a modelagem dos dados, para que possa ser feito o agrupamento(+) das linhas na grid.
function ModelarJSON(list) {
    var retorno = [];
    
    var lastGroup = null, lastOp = TituloPorPeriodo();
    
    $.each(list, function(i, linha) {
        
        if(linha["COL003"] !== undefined && linha["COL000"] !== undefined) {
            if(EhAgrupador(linha["COL000"])) {
               lastGroup = linha["COL000"].replace('(', '').replace(')', '').replace('-', '').replace('=', '').replace('+', '');
               
               linha["COL000"] = lastGroup;
            }
            
            linha.OPERADOR = lastOp;
            linha.GRUPO = lastGroup;
            retorno.push(linha);
        }
        
    })
    
    return retorno;
}

//Exibe o título para a tabela conforme o período(mensal, semestral, anual, etc).
function TituloPorPeriodo() {
    
    periodoBase = $('[data-field="PERIODOBASE"]').val();
    anobase = periodoBase.substr(periodoBase.indexOf('/')+1, 4);
    mesBase = parseInt(periodoBase.substr(0,2), 10);
    periodocomparacao = $('[data-field="COMPARACAO"]').val();
    
    if(periodocomparacao === '')
        periodocomparacao = new Date();
    
    mesComparacao = parseInt(periodocomparacao.substr(0,2), 10);
    anoComparacao = periodocomparacao.substr(periodocomparacao.indexOf('/') + 1, 4);
    var de = new Date(anobase, mesBase, 1), ate = new Date(anoComparacao, mesComparacao, 1);
    var totalMeses = DiferencaEmMeses(de, ate);
    
    switch(totalMeses) {
        case 0:
            return (MesPorExtenso(mesBase)) + ' DE ' + anobase;
        case 1:
            return 'MENSAL ('+ (MesPorExtenso(mesBase)) + ' DE ' + anobase + ')';
        case 2:
            return 'BIMESTRAL ('+ (MesPorExtenso(mesBase) + ' DE ' + anobase + ' ATÉ ' + MesPorExtenso(mesComparacao)+ ' DE ' + anoComparacao) + ')';
        case 3:
            return 'TRIMESTRAL ('+ (MesPorExtenso(mesBase) + ' DE ' + anobase + ' ATÉ ' + MesPorExtenso(mesComparacao)+ ' DE ' + anoComparacao) + ')';
        case 6:
            return 'SEMESTRAL ('+ (MesPorExtenso(mesBase) + ' DE ' + anobase + ' ATÉ ' + MesPorExtenso(mesComparacao)+ ' DE ' + anoComparacao) + ')';
        case 12:
            return 'ANUAL ('+ (MesPorExtenso(mesBase) + ' DE ' + anobase + ' ATÉ ' + MesPorExtenso(mesComparacao)+ ' DE ' + anoComparacao) + ')';
        default:
            return (MesPorExtenso(mesBase) + ' DE ' + anobase + ' ATÉ ' + MesPorExtenso(mesComparacao)+ ' DE ' + anoComparacao)
    }
}

//Verifica se a linha atual é um agrupador(para BP e DRE identificamos isso quando todas as letras estão em maiúsculo :/)
function EhAgrupador(conta){
    if(conta === undefined)
        return false;
    
    return conta.toUpperCase() === conta;
}

//Verifica a diferença para ser utilizada em TituloPorPeriodo()
function DiferencaEmMeses(d1, d2) {
    return d2.getMonth() - d1.getMonth() + (12 * (d2.getFullYear() - d1.getFullYear()));
}

//Efetua realmente o agrupamento do array conforme as colunas escolhidas.
function AgruparJSON(colunas, lista) {
    var colsObjData = {};

    // 1. agrupamos por categorias em chaves que são a concatenação dos valores das colunas desejadas
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

//Efetua a validação de uma string como JSON.
function ValidarJSON(str) {
    try {
        JSON.parse(str);
    } catch (e) {
        return false;
    }
    return true;
}

//Efetua a exportação no formato excel(.XLS)
function ExportarPlanilha() {
    
    if($('#tblResultadoExercicio tr').length > 1) {
    
        $('#tblResultadoExercicio').table2excel({
        	exclude: ".noExl",
        	name: "Balanço patrimonial",
        	filename: "BP" + new Date().toISOString().replace(/[\-\:\.]/g, ""),
        	fileext: ".xls",
        	exclude_img: true,
        	exclude_links: true,
        	exclude_inputs: true
        });
    }
}

//Escreve um mês por extenso. data Javascript tem o indíce de mesês não baseado em zero(non zero based). por iss o primeiro item vazio.
function MesPorExtenso(numMes) {
    
    var mesesNomes = ["", "JANEIRO", "FEVEREIRO", "MARÇO", "ABRIL", "MAIO", "JUNHO",
    "JULHO", "AGOSTO", "SETEMBRO", "OUTUBRO", "NOVEMBRO", "DEZEMBRO"];
    
    return mesesNomes[numMes]
}

//Ordenaremos a tabela primeiro as linhas que tem filhos para expandir(+) e depois as que não tem.
function OrdenarTabela() {
    var retorno = [];
    
    $('.agrupador:has(i)').each(function (i, tr){
        
        retorno.push($(tr).parent());
        
    });
    
    $('.agrupador:not(:has(i))').each(function (i, tr){
        
        retorno.push($(tr).parent());
        
    });
    
    $('#tblResultadoExercicio tboby').remove();
    $('#tblResultadoExercicio').append(retorno);

}

//Exibe ou oculta o WIDGET de filtros.
function ExibirFiltros(exibir){
    
    if (exibir) {
        
        $('#portlet_RESULTADODOEXERCCIO').show();
        $('#portlet_DREDEMONSTRATIVODORESULTADODOEXERCCIO').hide();
        
    }
    else{
        
        $('#portlet_RESULTADODOEXERCCIO').hide();
        $('#portlet_DREDEMONSTRATIVODORESULTADODOEXERCCIO').show();
        
    }
    
    $('.alert-info').hide();
}

              </script>
      </asp:Content>
    