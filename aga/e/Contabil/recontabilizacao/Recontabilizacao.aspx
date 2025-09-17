<%@ Page Title="Recontabilização" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Contabil.Recontabilizacao.Recontabilizacao" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="HandleDocumentoAtual" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="VisibilidadeGridMovimentacoes" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="IndexOrigemAtual" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>

    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTRO" Title="Recontabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.CUSTOM.RECONTABILIZACAO.GRID" DefaultFilterName="Recontabilização" Mode="FixedRequired" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" ProviderWidgetUniqueId="FILTRO" Title="Documentos" Subtitle="Apenas documentos marcados serão processados." BootstrapCols="12" ChromeState="Fixed"  UserDefinedDisableRowSelection="true" UserDefinedPageSize="10" CanView="false" DisplayRowCommand="true" UserDefinedSelectColumnVisible="true" />
        <wes:SimpleGrid runat="server" ID="MOVIMENTACOES" ProviderWidgetUniqueId="FILTRO" Title="Movimentações" Subtitle="Apenas movimentações marcadas de documentos marcados serão processadas." BootstrapCols="6" ChromeState="Fixed"  UserDefinedDisableRowSelection="true" UserDefinedPageSize="10" CanView="false" UserDefinedSelectColumnVisible="true" />
    </div>
    
    <script type="text/javascript">
        $(() => {
            $('#ctl00_Main_FILTRO .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="ExibirFiltro();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="OcultarFiltro(true);" id="labelOcultarFiltroFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');
            $('#ctl00_Main_MOVIMENTACOES .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarMovimentacoes" class="btn command-action custom-action btn command-action blue" style="" onclick="OcultarGridMovimentacoes()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');

            var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
            if (!pagina.get_isInAsyncPostBack()) {
                pagina.add_endRequest(ProcessarVisibilidadeFiltro);
                pagina.add_endRequest(ProcessarVisibilidadeGridMovimentacoes);
                pagina.add_endRequest(function (sender, args) {
                    transformarSelectEmMultiselect("ctl00_Main_FILTRO_FilterControl_GERAL_TIPOSMOVIMENTACAO", "ctl00_Main_FILTRO_FilterControl_SELECAOTIPOSMOVIMENTACAO_HiddenField");
                    //Removendo esta opção do filtro para ser inserida novamente sob demanda.
                    //transformarSelectEmMultiselect("ctl00_Main_FILTRO_FilterControl_GERAL_CAMPOSAJUSTELANCAMENTOS", "ctl00_Main_FILTRO_FilterControl_SELECAOCAMPOSAJUSTELANCAMENTOS_HiddenField");
                });
            }
                
            ProcessarVisibilidadeGridMovimentacoes();
            ProcessarVisibilidadeFiltro();
            transformarSelectEmMultiselect("ctl00_Main_FILTRO_FilterControl_GERAL_TIPOSMOVIMENTACAO", "ctl00_Main_FILTRO_FilterControl_SELECAOTIPOSMOVIMENTACAO_HiddenField");
            //Removendo esta opção do filtro para ser inserida novamente sob demanda.
            //transformarSelectEmMultiselect("ctl00_Main_FILTRO_FilterControl_GERAL_CAMPOSAJUSTELANCAMENTOS", "ctl00_Main_FILTRO_FilterControl_SELECAOCAMPOSAJUSTELANCAMENTOS_HiddenField");
        });      

        const transformarSelectEmMultiselect = (campoLista, campoStringOculto) => {
            let campoListaSelect = campoLista + "select";
            $('#' + campoListaSelect).each((index, el) => {
                if ($(el).find('option').get(0) != undefined) {
                    $(el).find('option').get(0).remove();
                    $('#' + campoListaSelect).val(-1);
                }
                $(el).attr("multiple", "multiple");
            }).multiselect({
                buttonWidth: '100%',
                includeSelectAllOption: 'true',
                buttonClass: 'mt-multiselect btn btn-default form-control',
                nonSelectedText: 'Nenhum item selecionado',
                selectAllText: 'Selecionar todos',
                nSelectedText: ' itens selecionados',
                allSelectedText: 'Selecionado todos os itens',
                onChange: function (option, checked) {
                    $('#' + campoStringOculto).val($('#' + campoListaSelect).val());
                }
            });

            $('#' + campoListaSelect).multiselect('deselectAll', false);
            if ($('#' + campoStringOculto).val()) {
                $('#' + campoListaSelect).multiselect('select', $('#' + campoStringOculto).val().split(','));
            }
            else
            {
                $('#' + campoLista).attr("key", null);
                $('#' + campoLista).attr("value", null);
            }
        };               

        const OcultarFiltro = (fadeOut) => {
            if (fadeOut)
                $('#ctl00_Main_FILTRO_FilterControl_FilterContainer').fadeOut(500);
            else
                $('#ctl00_Main_FILTRO_FilterControl_FilterContainer').hide();
    
            $('#toggleOcultarFiltro').prop('checked', true);
            $('#labelOcultarFiltroFiltro').addClass('active');
            $('#labelExibirFiltro').removeClass('active');
    
            sessionStorage.setItem('TOGGLE_FILTRO_RECONTABILIZACAO', "Oculto");
        };

        const ExibirFiltro = () => {
            $('#ctl00_Main_FILTRO_FilterControl_FilterContainer').fadeIn(500);
            sessionStorage.setItem('TOGGLE_FILTRO_RECONTABILIZACAO', "Visivel");
        };

        const ProcessarVisibilidadeFiltro = () => {
            var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_RECONTABILIZACAO');
    
            if (estadoFiltro === "Oculto")
                OcultarFiltro();
        };

        const ProcessarVisibilidadeGridMovimentacoes = () => {
            if ($("#VisibilidadeGridMovimentacoes").val() == "False")
                OcultarGridMovimentacoes();
            else
                ExibirGridMovimentacoes();
        };

        const ExibirGridMovimentacoes = () => {
	        $("#MOVIMENTACOES").fadeIn();
	        $('#DOCUMENTOS').removeClass('col-md-12');
	        $('#DOCUMENTOS').addClass('col-md-6');
            $("#VisibilidadeGridMovimentacoes").val("True");
            let handleDocumentoAtual = $("#HandleDocumentoAtual").val();

            if (handleDocumentoAtual)
                $("#DOCUMENTOS tr[handle=" + handleDocumentoAtual + "]").addClass("documentoAtual");
        };

        const OcultarGridMovimentacoes = () => {
	        $("#MOVIMENTACOES").hide();
	        $('#DOCUMENTOS').removeClass('col-md-6');
	        $('#DOCUMENTOS').addClass('col-md-12');
            $("#VisibilidadeGridMovimentacoes").val("False");
            let handleDocumentoAtual = $("#HandleDocumentoAtual").val();

            if (handleDocumentoAtual)
                $("#DOCUMENTOS tr[handle=" + handleDocumentoAtual + "]").removeClass("documentoAtual");
        };
    </script>

    <style type="text/css">
        #DOCUMENTOS th, td {
            white-space:nowrap !important;
        }

        #MOVIMENTACOES th, td {
            white-space:nowrap !important;
        }

        .documentoAtual td, .table-hover>tbody>tr.documentoAtual:hover, .table-hover>tbody>tr.documentoAtual:hover>td {
            background: #5C9BD1 !important;
        }

        .tooltip {
	        opacity: 1 !important;
        }

        .error-tooltip-inner, .tooltip-inner {
            background-color: #000 !important;
        }

        .input-group, .form-group {
            z-index: 0 !important;
        }
    </style>
</asp:Content>