<%@ Page Title="Elaborar or&ccedil;amento" Language="C#" Inherits="aga.e.comercial.ElaborarPage,Benner.Corporativo.Wes.WebApp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.ERP.Comum" Namespace="Benner.ERP.Comum" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
	<script src="../../../scripts/handsontable/handsontable.full.js"></script>
	<link rel="stylesheet" media="screen" href="../../../Content/css/handsontable.full.css">
	<script src="../../../Content/aga/js/complete.js"></script>
	<script src="http://handsontable.github.io/handsontable-ruleJS/lib/RuleJS/lib/numericjs/numeric.js"></script>

	<script src="../../../scripts/handsontable/formula.js"></script>
	<script src="../../../scripts/handsontable/parser.js"></script>
	<script src="../../../scripts/handsontable/ruleJS.js"></script>
	<script src="../../../scripts/handsontable/handsontable.formula.js"></script>

	<div class="row">
		<asp:HiddenField runat="server" ID="hfLink" Value="" ClientIDMode="Static" />
		<wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CT_ORCAMENTOELABORACAO.FILTRO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_E_ORCAMENTO_ELABORAR" Level="20" Order="10" />

		<wes:ActionView runat="server" ID="ORCAMENTO" Title="Or&ccedil;amento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" Controller="VisualizarOrcamento" Action="Orcamento" PageId="AGA_A_ORCAMENTO_VISUALIZAR" Level="20" Order="10" />
	</div>

	<script type="text/javascript">
		var Dados = null; // { data: Handsontable.helper.createSpreadsheetData(100, 50) };

		var hot = null;

		$(function() {
			MontarHandsomeTable(Dados);
		})

		function EsconderComponente(componente) {
			var item = $(componente);
			if (item.length > 0)
				item.hide();
		}

		function MontarHandsomeTable(dataTable) {
			var container = document.getElementById('containerOrcamento');
			container.innerHTML = '';

			App.blockUI({
				target: "#ContentPanel",
				animate: true
			});
			if (dataTable != null) {
				console.log(dataTable.data.length);
				if (dataTable.data.length > 1000) {
					$('#SALVARORCAMENTO').hide();
					$('#EXPORTARORCAMENTO').hide();
					$('#containerOrcamento').hide();
					$('#ERRO_CONTAINER').show();
				} else {
					$('#ERRO_CONTAINER').hide();
					$('#containerOrcamento').show();
					hot = new Handsontable(container, dataTable);
					hot.updateSettings({
						beforeChange: (changes) => {
							changes.forEach(([row, prop, oldValue, newValue]) => {

								let natureza = hot.getData()[row].natureza;
								let redutora = hot.getData()[row].redutora;

								if ((natureza == "D" || (natureza == "C" && redutora == 'S')) && newValue > 0)
									hot.setDataAtRowProp(row, prop, -newValue)
								else if (natureza == "C" && redutora == 'N' && newValue < 0)
									hot.setDataAtRowProp(row, prop, -newValue)
							})
						},
						cell: dataTable.cell
					});
					ReRenderTable();

					hot.addHook('afterChange', function(alt, ori) {
						ValidarValoresInseridosNaCelula(alt, ori, hot);
					});
				}
			}
			App.unblockUI("#ContentPanel");
		}

		function ValidarValoresInseridosNaCelula(col, tipo, m) {
			if (tipo == "edit" && col[0].length == 4) {
				var colunaAtiva = m.getActiveEditor();
				if (m.getDataAtCell(colunaAtiva.cellProperties.row, colunaAtiva.cellProperties.col) === '') {
					m.setDataAtCell(colunaAtiva.cellProperties.row, colunaAtiva.cellProperties.col, '0,00');
				}
			}
		}

		$(function() {
			var pagina = Sys.WebForms.PageRequestManager.getInstance();
			if (!pagina.get_isInAsyncPostBack()) {
				pagina.add_endRequest(ControlButtons);
			}

			ControlButtons();
		});

		function ControlButtons() {
			if (hot == null) {
				$('#SALVARORCAMENTO').hide();
				$('#EXPORTARORCAMENTO').hide();
				$('#containerOrcamento').height('0px');
			} else {
				$('#EXPORTARORCAMENTO').show();
				$('#SALVARORCAMENTO').show();
				$('#containerOrcamento').height('calc(100vh - 240px)');
				hot.render();
				AddExpandButton();
			}
		}

		var comandoExpandir = '<a id="EXPANDIRORCAMENTO" onClick="ReRenderTable()" class="btn btn-circle btn-icon-only btn-default fullscreen" style="margin-top: -3px" data-original-title="" title="" aria-describedby="tooltip138668"> </a>';

		function AddExpandButton() {
			$('#portlet_ORCAMENTO').find('.portlet-title').find('.actions').html(comandoExpandir);
		}

		function ReRenderTable() {
			var tamanho = $('#EXPANDIRORCAMENTO').hasClass('on') ? '240' : '140';

			$('#containerOrcamento').height('calc(100vh - ' + tamanho + 'px)');

			hot.render();
		}

		function Salvar() {
			if ($('.htInvalid').length > 0) {
				ExibirMensagem('A tabela possui valores inválidos, verifique.', TiposMensagem.Alerta, $('#containerOrcamento'));
			} else {
				var url = (Benner.Page.getApplicationPath() + 'api/orcamento/salvarOrcamento');
				var data = hot.getData();
				var versao = Benner.Form.FILTRO.fields().versaoorcamento;
				if (versao !== undefined && versao.id !== undefined) {
					versao = versao.id;
				}
				var request = {
					JsonDados: data,
					VersaoOrcamento: versao
				}
				App.blockUI({
					target: '#ORCAMENTO',
					animate: true
				});
				$.ajax({
					type: "POST",
					url: url,
					dataType: "json",
					contentType: "application/json; charset=utf-8",
					data: JSON.stringify(request),
					success: function(_data, status) {
						Benner.AsyncProcesses.initAjax();
					},
					error: function(_data) {},
					complete: function() {
						App.unblockUI($("#ORCAMENTO"));
					}
				});
			}
		}

		function Importar(link) {
			link = document.getElementById('hfLink').value;
			Benner.ModalPage.show({
				url: link,
				displayTitle: false,
				displayFooter: false,
				buttonLabel: 'Fechar',
				size: 'large',
				height: parseInt($(window).height() * 0.7),
				triggeredByCommand: false
			});
		}

		function Exportar() {
			var url = (Benner.Page.getApplicationPath() + 'api/orcamento/exportarOrcamento');
			var data = hot.getData();
			App.blockUI({
				target: '#ORCAMENTO',
				animate: true
			});
			$.ajax({
				type: "POST",
				url: url,
				dataType: "json",
				contentType: "application/json; charset=utf-8",
				data: JSON.stringify(data),
				success: function(_data, status) {
					Benner.AsyncProcesses.initAjax();
				},
				error: function(_data) {},
				complete: function() {
					App.unblockUI($("#ORCAMENTO"));
				}
			});
		}
	</script>

	<style>
		.htCore tbody tr {
			text-align: right;
		}

		.handsontable .currentRow {
			background-color: #E7E8EF;
		}

		.handsontable .currentCol {
			background-color: #E7E8EF;
		}

		.handsontableInput,
		.handsontable .handsontable:not(.ht_master) table {
			-webkit-box-shadow: none;
			-moz-box-shadow: none;
			box-shadow: none;
		}

		.htDimmed,
		.colHeader {
			text-overflow: ellipsis !important;
			white-space: nowrap !important;
			overflow: hidden !important;
			font-weight: bold;
			font-size: 14px;
		}

		td {
			min-width: 65px;
		}

		.handsontable tr th {
			background: #DEDEDE;
			border-color: #CCCCCC;
		}

		.comandoGrid {
			padding: 0px 10px;
			font-size: 13px;
			color: #4C87B9;
			font-weight: 700;
		}

		.comandoGrid:hover {
			color: #F2784B;
		}

		.widget-body-projecao {
			overflow: auto;
		}

		#ORCAMENTO .portlet>.portlet-title {
			margin-bottom: 0px;
			border-bottom: none;
		}

		.htCore tbody tr td:nth-child(1),
		td:nth-child(2),
		td:nth-child(3),
		td:nth-child(4) {
			text-align: left;
			font-size: 10px;
		}

		#PAINELCOMANDOS {
			margin-bottom: 10px;
		}
	</style>

</asp:Content>