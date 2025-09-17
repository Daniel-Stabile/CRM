<%@ Page Title="Classifica&ccedil;&otilde;es Reajuste" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.orcamento.ClassificacaoReajuste" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.ERP.Comum" Namespace="Benner.ERP.Comum" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<script src="../../../../scripts/handsontable/handsontable.full.js"></script>
	<link rel="stylesheet" media="screen" href="../../../../Content/css/handsontable.full.css">


	<div class="row">
		<wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="OP_FILTROCLASSIFICACAO.CUSTOM.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_CLASSIFICACAOORCAMENTARIA_REAJUSTE" Level="20" Order="10" />
	</div>


	
	
		

	<div class="row">
		<div class="col-md-12 widget  portlet-default">
			<div class="portlet light">
				<div class="message-panel" id="containerOrcamento"></div>
				<div id="app">
					<orcamento-publico-reajustar ref="reajustar"/>
				</div>
				<a style="margin-top: 20px;" id="saveButton" class="btn blue btn-save command-action predef-action editable" title="Ctrl + Enter" style="">
					<i class="fa fa-save btn-action"></i> 
					Salvar
				</a>
			</div>
		</div>



	</div>


	<script>

		$(function() {
			$("#saveButton").hide();
			$("#saveButton").on("click", Salvar)
		})

	var app = new window.Vue({
		el: '#app'
	});

	function MontarTable( dataTable,reajuste = 0,anoInicial,anoFinal) {

		let reajusteDecimal = 1 + (parseFloat(reajuste) / 100);

		$("#saveButton").show();
		app.$refs.reajustar.render(dataTable.reduce((arr,v) => [...arr,{...v.Fields}],[]),reajusteDecimal,anoInicial,anoFinal);
	}

		function Salvar() {

			var data = app.$refs.reajustar.getData();
			$("#saveButton").hide();
			var url = (Benner.Page.getApplicationPath() + 'api/orcamentoPublico/reajustarClassificacoesOrcamentarias');
		
			const formatedData = {
				Classificacoes: data.map(item => ({
					Handle: item.HANDLE,
					Valor: item.VALOR
				}))
			}

			StartLoading();

			console.log(formatedData);
			App.blockUI({
				target: '#ORCAMENTO',
				animate: true
			});
			$.ajax({
				type: "POST",
				url: url,
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(formatedData),
				success: function(_data, status) {
					StopLoading();
					ShowSuccess();
				},
				error: function(_data) {
					StopLoading();
					ShowError();
				}
			});

		}

	

		function StartLoading() {

			$("#saveButton").hide();
			const div = document.createElement("div");
			div.setAttribute("id", "loading")
			div.innerHTML = `
				<div class="blockUI blockMsg blockPage" style="z-index: 11011; position: fixed; padding: 0px; margin: 0px; width: 30%; top: 40%; left: 35%; text-align: center; color: rgb(0, 0, 0); border: 0px; cursor: wait;"><div class="loading-message loading-message-boxed"><img src="../../../../content/assets/img/loading-spinner-grey.gif" align=""><span>&nbsp;&nbsp;Salvando Tabela</span></div></div>
			`
			document.querySelector("body").append(div);

		}

		function StopLoading() {
			document.querySelector("#loading").remove();
				$("#saveButton").show();
		}


		function ShowSuccess() {

			$("#saveButton").hide();
			const div = document.createElement("div");
			div.setAttribute("id", "apistatus")
			div.innerHTML = `
				<div 
					class="blockUI blockMsg blockPage"
					 style="z-index: 11011;
					  position: fixed;
					   padding: 0px; 
					   margin: 0px; 
					   width: 30%; 
					   top: 40%; 
					   left: 35%;
					    text-align: center; 
						color: rgb(0, 0, 0); 
						border: 0px; cursor: wait;">
					 
					 <div class="loading-message loading-message-boxed" style="background-color: #D7EDF4;">
						<i class="fa fa-check"></i>
						<span>&nbsp;&nbsp;Salvo com sucesso!</span>
					 </div>
				</div>
			`
			document.querySelector("body").append(div);
			$("#saveButton").show();
			setTimeout(() => {
				HiddenStatusAlert();
				
			},3000)

		}

		function ShowError() {

			$("#saveButton").hide();
			const div = document.createElement("div");
			div.setAttribute("id", "apistatus")
			div.innerHTML = `
				<div 
					class="blockUI blockMsg blockPage"
					 style="z-index: 11011;
					  position: fixed;
					   padding: 0px; 
					   margin: 0px; 
					   width: 30%; 
					   top: 40%; 
					   left: 35%;
					    text-align: center; 
						color: rgb(0, 0, 0); 
						border: 0px; cursor: wait;">
					 
					 <div class="loading-message loading-message-boxed" style="background-color: #FCE8E7;">
						<i class="fa fa-check"></i>
						<span>&nbsp;&nbsp;Problemas ao salvar!</span>
					 </div>
				</div>
			`
			document.querySelector("body").append(div);
			$("#saveButton").show();

			setTimeout(() => {
				HiddenStatusAlert();
				
			},3000)

		}

		function HiddenStatusAlert() {
			document.querySelector("#apistatus").remove();
		}

		
	</script>

	

</asp:Content>