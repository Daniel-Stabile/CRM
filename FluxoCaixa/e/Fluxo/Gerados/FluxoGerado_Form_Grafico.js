
function carregaGrafico(idElemento, url){
	
    var handleFluxo = $('span[data-field="HANDLE"] > input').val();
	
	if(handleFluxo > 0){
	
		var json = "";
		var url = Benner.Page.getApplicationPath() + url;

		$.ajax({
			type: 'POST',
			dataType: 'JSON',
			url: url,
			data: { 'handleFluxo': handleFluxo }
		}).done(function (data) {
			var result = jQuery.parseJSON(data)
			json = result;	

			AmCharts.makeChart(idElemento, json);
								
		}).fail(function (jqXHR, textStatus, errorThrown) {
			console.log(textStatus);			
			$.unblockUI();
        });	

		$.unblockUI();
	}
}

function carregaGraficoPorPeriodo(){
	
	carregaGrafico('chartPorPeriodo','api/FluxoCaixa/GraficoFluxoPorPeriodo');	
}

function carregaGraficoPorConta(){
	
	carregaGrafico('chartPorConta','api/FluxoCaixa/GraficoFluxoPorContaGerencial');	
}

function carregaTodosGraficos() {
	carregaGraficoPorPeriodo();
	carregaGraficoPorConta();
	$.unblockUI();
}

$(document).ready(function () {    
	carregaTodosGraficos();
});