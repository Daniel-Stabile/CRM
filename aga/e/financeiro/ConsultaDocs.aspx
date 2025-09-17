<%@ Page Title="Consulta de Documentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.ConsultaDocumentosPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRODACONSULTADEDOCUMENTOS" Title="Filtro da consulta de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="FN_FILTROCONSULTADOC.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_E_FINANCEIRO_CONSULTADOCS" Level="20" Order="10" />
    </div>

    <div id="grid">
        <div class="portlet-body" style="height: auto;">
			<div id="btnInc"></div>
			<div id="btnDec"></div>
            <div id="gridContainer"></div>
        </div>
    </div>
<script type="text/javascript" src="../../../Content/js/dx.messages.pt.js"></script>
    <script>

	
	
	var fontSize = 14;

        $("#btnInc").dxButton({icon: 'fa fa-plus', onClick: function(){
	        $("#gridContainer").css('font-size', ++fontSize + 'px')
        }});

        $("#btnDec").dxButton({icon: 'fa fa-minus', onClick: function(){
	        $("#gridContainer").css('font-size', --fontSize + 'px')
        }});

        const botoesControle = () => {
            $('#ctl00_Main_FILTRODACONSULTADEDOCUMENTOS_toolbar').prepend('<a class="btn custom-action command-action blue active" style="display: none" onclick="exibirFiltro();" id="labelExibirFiltro"> Exibir filtro </a><a class="btn custom-action command-action blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltro"> Ocultar filtro </a>');
        };

        var ocultarFiltro = (fadeOut) => {
            if (fadeOut)
                $('#ctl00_Main_FILTRODACONSULTADEDOCUMENTOS_FilterControl_FilterContainer').fadeOut(500);
            else
                $('#ctl00_Main_FILTRODACONSULTADEDOCUMENTOS_FilterControl_FilterContainer').hide();

            $('#labelOcultarFiltro').addClass('active');
            $('#labelExibirFiltro').removeClass('active');
            $('#labelOcultarFiltro').css('display', 'none');
            $('#labelExibirFiltro').css('display', '');

            sessionStorage.setItem('TOGGLE_FILTRO_FILTRODACONSULTADEDOCUMENTOS', "Oculto");
        };

        var exibirFiltro = () => {
            $('#ctl00_Main_FILTRODACONSULTADEDOCUMENTOS_FilterControl_FilterContainer').fadeIn(500);
            $("#HasFilterApplied_FILTRODACONSULTADEDOCUMENTOS").val("False");

            $('#labelOcultarFiltro').css('display', '');
            $('#labelExibirFiltro').css('display', 'none');

            sessionStorage.setItem('TOGGLE_FILTRO_FILTRODACONSULTADEDOCUMENTOS', "Visivel");
        };

        var processarVisibilidadeFiltro = () => {
            var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_FILTRODACONSULTADEDOCUMENTOS');

            if (estadoFiltro === "Oculto" || $("#HasFilterApplied_FILTRODACONSULTADEDOCUMENTOS").val() == "True")
                ocultarFiltro();
        };

        $(function () {
            var pagina = Sys.WebForms.PageRequestManager.getInstance();

            if (!pagina.get_isInAsyncPostBack()) {
                pagina.add_endRequest(HideRadioButton);
                pagina.add_endRequest(processarVisibilidadeFiltro);
                pagina.add_endRequest(botoesControle);
            }
            
            HideRadioButton();
            processarVisibilidadeFiltro();
            botoesControle();
        });
        $("#btnDec").css("visibility", "hidden");$("#btnInc").css("visibility", "hidden");

        function HideRadioButton() {
            var classe = "";
            var ehTesouraria = $('#ctl00_Main_FILTRODACONSULTADEDOCUMENTOS_PageControl_GERAL_GERAL_VISAOselect').val() == 4;

            var baixa = $('div[data-field="PERIODO"]').find('label.mt-radio.mt-radio-outline').find('label:contains("Baixa")').parent();
            var vencimentos = $('div[data-field="PERIODO"]').find('label.mt-radio.mt-radio-outline').find('label:contains("Vencimento")').parent();

            if (ehTesouraria) 
                classe = "mt-radio-disabled";

            vencimentos.addClass(classe);
            vencimentos.find('input').prop('disabled', ehTesouraria);
            baixa.addClass(classe);
            baixa.find('input').prop('disabled', ehTesouraria);
        }

        function Salvar() {
            var Parametros = {
                DefinicaoGrid: JSON.stringify($("#gridContainer").dxDataGrid("instance").state())
            };
            console.log(Parametros.DefinicaoGrid);
            $.post(Benner.Page.getApplicationPath() + 'api/ConsultarDocumentosCpaCre/SalvarDefinicaoGrid', Parametros);
        }

        function Filtrar(tipoDoc, empresa, filial, conta, centroCusto, projeto, dataInicio, dataFim, periodo, emAberto, baixas, baixasConciliados, definicaoGrid, conciliados, natureza, pessoas, considerar, confirmados, selecionar) {
            App.blockUI({ target: "#ContentPanel", animate: true });
            var filtro = {
                TipoDoc: tipoDoc,
                Empresa: empresa,
                Filial: filial,
                Conta: conta,
                CentroCusto: centroCusto,
                Projeto: projeto,
                DataInicio: dataInicio,
                DataFim: dataFim,
                Periodo: periodo,
                EmAberto: emAberto,
                Baixas: baixas,
                BaixasBaixados: baixasConciliados,
                DefinicaoGrid: definicaoGrid,
                Conciliados: conciliados,
                Natureza: natureza,
                Pessoas: pessoas,
                Considerar: considerar,
                Confirmados: confirmados,
                Selecionar: selecionar
            };
            $.post(Benner.Page.getApplicationPath() + 'api/ConsultarDocumentosCpaCre/MontarGrid', filtro)
            .done(function (result) {
                console.log("JSON result");
                console.log(JSON.parse(result));
                $("#gridContainer").dxDataGrid({
                    selection: {
                        mode: "single"
                    },onSelectionChanged: function (selectedItems) {
                        console.log(selectedItems);
                    }});
                $("#gridContainer").dxDataGrid("instance").state({});
                $("#gridContainer").dxDataGrid(JSON.parse(result));

                
                $("#gridContainer").dxDataGrid("instance").state().columns.filter(x=>x.filterValues != undefined).forEach(function(i, teste) {
                    $("#gridContainer").dxDataGrid("columnOption", i.dataField, "filterValues", null);    
                })
                
                $("#gridContainer").dxDataGrid("instance").state().columns.filter(x=>x.visible != true).forEach(function(i, teste) {
                    $("#gridContainer").dxDataGrid("columnOption", i.dataField, "visible", true);    
                })
                
                $("#gridContainer").dxDataGrid("instance").state().columns.filter(x=>x.groupIndex > -1).forEach(function(i, teste) {
                    $("#gridContainer").dxDataGrid("columnOption", i.dataField, "groupIndex", -1);    
                })

                if (filtro.DefinicaoGrid != "")
                {
                    console.log("Definição Grid");
                    console.log(JSON.parse(filtro.DefinicaoGrid));
                    $("#gridContainer").dxDataGrid("instance").state(JSON.parse(filtro.DefinicaoGrid));                 
                    JSON.parse(filtro.DefinicaoGrid).columns.filter(x=>x.groupIndex > -1).forEach(function(i, teste) {
                        $("#gridContainer").dxDataGrid("columnOption", i.dataField, "groupIndex", i.groupIndex);    
                    });                
                }

                App.unblockUI("#ContentPanel");
            })
            .fail(function (xhr, status, error) {
                $("#gridContainer").html("<div class='alert alert-danger'><button class='close' data-dismiss='alert'></button><span>Ocorreu um erro ao filtrar.</span></div>");    
                App.unblockUI("#ContentPanel");
            });
        };
    </script>
    <style>
        .dx-toolbar-item {
            padding: 5px 5px 5px 5px !important;
        }

        .dx-datagrid {
            padding: 20px 20px 20px 20px !important;
        }
		
		#btnDec, #btnInc {

		}
    </style>
</asp:Content>


