<%@ Page Title="Confirmar documentos contábeis" Language="C#" Inherits="aga.a.contabil.lancamentos.DocumentoContabil" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRARDOCUMENTOS" Title="Filtrar documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CT_FILTROAPROVARDOCUMENTOS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_LANCAMENTOS_DOCUMENTOCONTABIL" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSDISPONVEIS" Title="Documentos disponíveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRARDOCUMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_DOCUMENTOS.CONFIRMAR.BLOQUEAR.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_LANCAMENTOS_DOCUMENTOCONTABIL" Level="20" Order="30"  />
        </div>
    
        <script type="text/javascript">
              
var bloqueando = ObterValorQueryString("operacao") == 2;
var preencherData = false;
var dataInicial, dataFinal;
$(function(){
    var Pagina = window.Sys.WebForms.PageRequestManager.getInstance();
    if (!Pagina.get_isInAsyncPostBack()) {
        Pagina.add_endRequest(function () {
            if ($(Pagina._activeElement).hasClass('btn-cancel')) {
                $('input[type="text"]', idFormFiltro).val('');
            }
            else if ($(Pagina._activeElement).hasClass('btn-save')) {
                DesmarcarCheckBox();
            }
            preencherData = false;
            ValidarOperacoes(bloqueando);
            GanchoMarcarCheckBox();
            VerificaAlgumSelecionado();
            AdequarFiltro();
        });
    }
    
    $('.btn-save').click(function(){
        
        DesmarcarCheckBox();
        
    })
    preencherData = true;
    ValidarOperacoes(bloqueando);
    GanchoMarcarCheckBox();
    RenderizarWidgetComoFiltro();
    VerificaAlgumSelecionado();
    AdequarFiltro();
    $( window ).resize(function(e) {
        var btnConfirmar = $('.btn.command-action.custom-action.blue');
        var btnBloquear = $('.btn.command-action.custom-action.red-intense');
        
        if (bloqueando) {
            btnConfirmar.css('display', 'none').hide();
            btnBloquear.css('display', '').show();
            EsconderColunas('bloqueio');
        }
        else
        {
            btnConfirmar.css('display', '').show();    
            btnBloquear.css('display', 'none').hide();
            EsconderColunas('confirmação');
        }
        
    });
    

})

function EsconderColunas(coluna){
    var colunas = $('#ctl00_Main_DOCUMENTOSDISPONVEIS_SimpleGrid').find('a:contains(' + coluna + ')');
    for(var i = 0; i < colunas.length; i++){
        var colAtual = colunas[i];
        var header = $(colAtual).closest('th');
        var index = header.index();
        
        if (index > -1) {
            $('#ctl00_Main_DOCUMENTOSDISPONVEIS_SimpleGrid td:nth-child(' + (index + 1) + ')').remove();
        }
        header.remove();
    }
}

function RenderizarWidgetComoFiltro(){
    
    $('#ctl00_Main_FILTRARDOCUMENTOS_ctl04').addClass('filter-search-form note note-info note-bordered');
    
}

function DesmarcarCheckBox(){
    
    $('input:checked').each(function(i, cmp){
            
        $(cmp).removeAttr('checked');
        
    });   
    
}

function ValidarOperacoes(bloqueando){
    var btnConfirmar = $('.btn.command-action.custom-action.blue');
    var btnBloquear = $('.btn.command-action.custom-action.red-intense');
    
	var lnkBloquear = $('#topmenu-CT_DOCUMENTOS_BLOQUEAR');
	
	var lnkConfirmar = $('#topmenu-AGA_A_CONTABIL_LANCAMENTOS_DOCUMENTOCONTABIL');
	var DocumentosIndisponiveis = $("td:contains('Sem dados para exibir.')").length > 0 || 
								  $("td:contains('Nenhum registro encontrado.')").length > 0;
	

	
    if(bloqueando){
		document.title = "Bloquear documentos contábeis";
		btnConfirmar.css('display', 'none').hide();
        btnBloquear.css('display', '').show();
		EsconderColunas('bloqueio');
        
        lnkBloquear.addClass('active');
        lnkConfirmar.removeClass('active');        
    }
    else{
        
		btnConfirmar.css('display', '').hide();
        btnBloquear.css('display', 'none').hide();
		EsconderColunas('confirmação');
        
        lnkConfirmar.addClass('active');
        lnkBloquear.removeClass('active');        
    }
	
    if(DocumentosIndisponiveis){
        btnConfirmar.css('display', 'none').hide();
        btnBloquear.css('display', 'none').hide();        
    }
}

function GanchoMarcarCheckBox() {
    $('[type=checkbox]').click(function() {        
        VerificaAlgumSelecionado();
    });
}

function VerificaAlgumSelecionado() {
    
	var totalMarcados = $('[type=checkbox]:checked').length;
	if(bloqueando){
        
        $('.btn.command-action.custom-action.red-intense').hide();
        
        if (totalMarcados > 0) {
            $('.btn.command-action.custom-action.red-intense:contains(selecionados)').removeClass('hide').show();
        }
        else {
            $('.btn.command-action.custom-action.red-intense:contains(todos)').show();
        }
        
        
    }
    else{
        
        $('.btn.command-action.custom-action.blue').hide();
        
        if (totalMarcados > 0) {
            $('.btn.command-action.custom-action.blue:contains(selecionados)').removeClass('hide').show();
        }
        else {
            $('.btn.command-action.custom-action.blue:contains(todos)').show();
        }
    }
    
    var DocumentosIndisponiveis = $("td:contains('Sem dados para exibir.')").length > 0 || $("td:contains('Nenhum registro encontrado.')").length > 0;
    
    if(DocumentosIndisponiveis){
        $('.btn.command-action.custom-action.blue').hide();
        $('.btn.command-action.custom-action.red-intense').hide();
    }
}

var htmlGroup = '<div class="form-group"><label class="control-label col-md-2 col-sm-2"><div class="label-form"><div class="label-title">Filtrar por:</div></div></label><div class="col-md-4 col-sm-4 value"><div><div class="input-group" id="linhaFiltros"></div></div></div>';

var idFormFiltro = '#ctl00_Main_FILTRARDOCUMENTOS_formView_PageControl_GERAL_GERAL';
var ultimoFiltroSelecionado = null;
function AdequarFiltro(){
	$(idFormFiltro).prepend($(htmlGroup));
	var select = GerarElementoFiltro(ultimoFiltroSelecionado);
	select.appendTo($('#linhaFiltros'));
	ExibirFiltroPorSelecao(ultimoFiltroSelecionado);
}


function ExibirFiltroPorSelecao(dataatual) {
    if (ultimoFiltroSelecionado === null) {
        ultimoFiltroSelecionado = 0;
    }
    else{
        ultimoFiltroSelecionado = Number($('#selFiltrosDisponiveis').val());
    }
    
    //Escondemos todos os filtros
    $('#ctl00_Main_FILTRARDOCUMENTOS_formView_PageControl_GERAL_GERAL').find('.form-group').slice(1).hide();
    
    var linhaData = $('[data-field="DATADE"]').closest('.form-group');
    var linhaDocumento = $('[data-field="DOCUMENTODE"]').closest('.form-group');
    var linhaChave = $('[data-field="CHAVEDE"]').closest('.form-group');
    var linhaDescricao = $('[data-field="DESCRICAO"]').closest('.form-group');
    
	if(ultimoFiltroSelecionado == 0){
		if(dataatual)
			VerificarCompetencia(dataatual);
		else
			VerificarCompetencia(preencherData);
	}
	else
	{
		linhaData.show();
		linhaChave.show();
		linhaDocumento.show();
		linhaData.show();
		linhaDescricao.show();		
	}    
}

function VerificarCompetencia(setarCampo){
    
    var d = new Date();
    var dateStart = moment([d.getFullYear(), d.getMonth(), 1]);
    var dateEnd = moment([d.getFullYear(), d.getMonth(), 1]).endOf('month');
    if (setarCampo) {
        $('[data-field="DATADE"]').val(dateStart.format('DD/MM/YYYY'));
        $('[data-field="DATAATE"]').val(dateEnd.format('DD/MM/YYYY'));    
    }    
}

function GerarElementoFiltro(selecionado){
    var select = $('<select id="selFiltrosDisponiveis" class="form-control" onchange="ExibirFiltroPorSelecao(true)"></select>');

	var optCompetencia = CriarElementoHtml('option','Competência atual', 0, selecionado === 0);
	var optChave = CriarElementoHtml('option','Filtros diversos',1, selecionado == 1);
	select.append(optCompetencia).append(optChave);
	
	return select;
}

              </script>
        <style>
              #portlet_FILTRARDOCUMENTOS{margin-bottom: 0px;}
.table-scrollable{margin: 0px!important;}
#ctl00_Main_FILTRARDOCUMENTOS_MsgUser.alert-info{display: none!important;}

              </style>
      </asp:Content>
    