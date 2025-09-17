<%@ Page Title="Faturamento" Language="C#" CodeFile="~/aga/e/comercial/faturamento/ConsultaFaturamento.aspx.cs" Inherits="faturamentoConsultaFaturamentoPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
            <ContentTemplate>
                <asp:HiddenField runat="server" ID="hfSelecionaTodosDocumentos" Value="-1" ClientIDMode="Static" />
                <asp:HiddenField runat="server" ID="hfQtdDocumentos" Value="0" ClientIDMode="Static" />
                <asp:HiddenField runat="server" ID="hfQtdMaxDocumentos" Value="0" ClientIDMode="Static" />
            </ContentTemplate>
        </asp:updatepanel>

        <div id="Filtros">
            <wes:FilterWidget runat="server" ID="FiltroPadrao" DefaultFilterName="Pré-definido padrão"
                Title="Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default"
                BootstrapCols="12" FontIcon=""  ShowTitle="true" ChromeState="Normal" CanDelete="True"
                CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.FATURAMENTO.GRID"
                Mode="Selectable" Level="20" Order="10" />
        </div>
        <wes:SimpleGrid
            runat="server"
            ID="FATURAMENTOS"
            Title="Faturamentos"
            UserDefinedCriteriaWhereClause="A.OPERACAOFATURAMENTO IS NOT NULL AND @CRITERIOSELECAO"
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="12"
            FontIcon=""
            ShowTitle="false"
            ProviderWidgetUniqueId="FiltroPadrao"
            ChromeState="Normal"
            CanDelete="False"
            CanUpdate="False"
            Mode="None"
            CanInsert="False"
            EntityViewName="FN_DOCUMENTOS.FATURAMENTO.GRID"
            UserDefinedSelectColumnVisible="True"
            UserDefinedPageSize="10"
            SystemFilterOnly="False"
            DisplayRowCommand="True"
            FormUrl="~/aga/e/comercial/faturamento/FormFaturamento.aspx"
            CompanyFilterMode="OnlyCompany"
            ShowExport="True"
            UserDefinedDisableRowSelection="False"
            PageWidgetHandle="22700"
            Level="20"
            Order="20" />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            AtribuirClasseStatus();
            MontarDivMensagemSelecionarTodos();
            transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_STATUSselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTASTATUS_HiddenField");
            transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_MDEselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTAMDE_HiddenField");
            transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_NFEselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTANFE_HiddenField");

            AdicionarGanchoCaixaSelecao();
            var prm = window.Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    AdicionarGanchoCaixaSelecao();
                    transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_STATUSselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTASTATUS_HiddenField");
                    transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_MDEselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTAMDE_HiddenField");
                    transformarSelectEmMultiselect("ctl00_Main_FiltroPadrao_FilterControl_GERAL_NFEselect", "ctl00_Main_FiltroPadrao_FilterControl_LISTANFE_HiddenField");
                });
            }
        });

        const transformarSelectEmMultiselect = (campoLista, campoStringOculto) => {
            $('#' + campoLista).each((index, el) => {
                if ($(el).find('option').get(0) != undefined) {
                    $(el).find('option').get(0).remove();
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
                    $('#' + campoStringOculto).val($('#' + campoLista).val());
                }
            });

            $('#' + campoLista).multiselect('deselectAll', false)
            if ($('#' + campoStringOculto).val() != undefined) {
                $('#' + campoLista).multiselect('select', $('#' + campoStringOculto).val().split(','));
            }
        };

        function ApagarMensagemFiltro() {
            $(".alert-warning").remove();
        }

        function AtribuirClasseStatus() {
            $('.statusCadastrada').each(function (i) {
                $(this).parent().parent().css('border-left', 'solid 2px #3330B5');
            });
            $('.statusEmitida').each(function (i) {
                $(this).parent().parent().css('border-left', 'solid 2px #21A81A');
            });
            $('.statusCancelada').each(function (i) {
                $(this).parent().parent().css('border-left', 'solid 2px #CD2024');
            });
            $('.statusComDivergencia').each(function (i) {
                $(this).parent().parent().css('border-left', 'solid 2px #FFC923');
            });

            MontarDivMensagemSelecionarTodos();

        }

        function MontarDivMensagemSelecionarTodos() {
            var qtdDocumentos = parseInt(document.getElementById("hfQtdDocumentos").value);
            var qtdMaxDocumentos = parseInt(document.getElementById("hfQtdMaxDocumentos").value);

            if (qtdDocumentos > qtdMaxDocumentos) {
                if (document.getElementById("hfSelecionaTodosDocumentos").value === '0') {
                    $("#divMensagemParaSelecionarTodos").show()
                } else if (document.getElementById("hfSelecionaTodosDocumentos").value === '1') {
                    $("#divMensagemParaLimparSelecao").show();
                }
                if ($("#divMensagemParaSelecionarTodos").length === 0) {
                    var displayMensagemParaSelecionar = 'style="display: none;"';
                    var displayMensagemParaLimparSelecao = 'style="display: none;"';

                    if (document.getElementById("hfSelecionaTodosDocumentos").value === '0') {
                        displayMensagemParaSelecionar = '';
                    } else if (document.getElementById("hfSelecionaTodosDocumentos").value === '1') {
                        displayMensagemParaLimparSelecao = '';
                    }
                    var parent = $(".table-responsive")[0];
                    var child = '<div>                                                                                                                               ' +
                        '   <div id="divMensagemParaSelecionarTodos" ' + displayMensagemParaSelecionar + '>                                                 ' +
                        '      <label>Todos os <span runat="server" style="font-weight: 600;">' + qtdMaxDocumentos + '</span> documentos nesta página estão selecionados. </label>' +
                        '      <a id="selecionaTodos" onclick="SelecionarTodosDocumentos(true)" style="font-weight: 600;">                                  ' +
                        '             Selecionar todos os <span style="font-weight: 600;">' + qtdDocumentos + '</span> documentos existentes</a>                             ' +
                        '   </div>                                                                                                                          ' +
                        '   <div id="divMensagemParaLimparSelecao" ' + displayMensagemParaLimparSelecao + '>                                                ' +
                        '      <label>Todos os <span style="font-weight: 600;">' + qtdDocumentos + '</span> documento estão selecionados.</label>                            ' +
                        '      <a id="deselecionaTodos" onclick="SelecionarTodosDocumentos(false)" style="font-weight: 600;">Limpar seleção</a>             ';
                    '   </div>                                                                                                                          ' +
                        '</div>                                                                                                                             ';
                    parent.insertAdjacentHTML('beforebegin', child);
                }
            }
        }

        function RecolherSecaoDoFormulario(idSecao) {
            var selector = document.querySelectorAll("[id$=" + idSecao + "]");
            if (selector.length > 0) {
                var secao = selector[0].firstChild;
                var fontIcon = selector[0].lastElementChild.firstChild;

                if (fontIcon.classList.contains("fa-angle-down")) {
                    Benner.FormWidget.changeStateGroup(secao);
                }
            }
        }

        $(function () {
            $(document).on('click', function (e) {
                var checked = false;
                try {
                    if (e.originalEvent.srcElement !== null && e.originalEvent.srcElement !== undefined) {
                        if (e.originalEvent.srcElement.type == "checkbox") {
                            if (e.originalEvent.srcElement.id.indexOf("CheckBoxSelectedEntity") !== -1) {
                                document.getElementById("hfSelecionaTodosDocumentos").value = -1;//não exibe nenhuma mensagem
                                $("#divMensagemParaLimparSelecao").hide();
                                $("#divMensagemParaSelecionarTodos").hide();
                            }

                            if (e.originalEvent.srcElement.id.indexOf("SelectAllCheckBoxHeader") !== -1) {
                                document.getElementById("hfSelecionaTodosDocumentos").value = -1;//não exibe nenhuma mensagem
                                $("#divMensagemParaLimparSelecao").hide();
                                $("#divMensagemParaSelecionarTodos").hide();
                                if (e.originalEvent.srcElement.checked) {
                                    document.getElementById("hfSelecionaTodosDocumentos").value = 0;//exibe mensagem para selecionar todos
                                    $("#divMensagemParaSelecionarTodos").show();
                                }
                            }
                        }
                    }

                } catch (x) {
                    console.log("Ocorreu um erro" + x.message)
                }
            });
        });

        function SelecionarTodosDocumentos(selecionar) {
            if (selecionar) {
                document.getElementById("hfSelecionaTodosDocumentos").value = 1;//exibe mensagem para limpar seleção
                $("#divMensagemParaLimparSelecao").show();
                $("#divMensagemParaSelecionarTodos").hide();
            } else {
                $("#divMensagemParaLimparSelecao").hide();
                $("#divMensagemParaSelecionarTodos").hide();
                document.getElementById("hfSelecionaTodosDocumentos").value = -1;//não exibe nenhuma mensagem
                var chekboxHeader = $("[id$=SelectAllCheckBoxHeader]");
                if (chekboxHeader.length > 0 && chekboxHeader[0].checked) {
                    $("[id$=SelectAllCheckBoxHeader]").click();
                }
            }
        }

        function AdicionarGanchoCaixaSelecao() {
            var chks = $('table input[type="checkbox"]');
            $.each(chks, function (index, checkbox) {
                checkbox.addEventListener('change', function () {
                    AlterarEstadoBotaoEmitir(TemNotaEmitidaSelecionada());
                });
            });
        }

        function TemNotaEmitidaSelecionada() {
            var retorno = false;
            $('.statusEmitida').each(function (index, lnk) {
                if (!retorno)
                    retorno = $(this).closest('tr').find('input[type="checkbox"]').is(':checked');
            })

            return retorno;
        }

        function AlterarEstadoBotaoEmitir(TemNotaEmitidaSelecionada) {
            if (TemNotaEmitidaSelecionada)
                $('a[id*="CMD_EMITIR"]').hide();
            else
                $('a[id*="CMD_EMITIR"]').show();
        }
    </script>


    <script>
        /*----------------------------------- INICIO SCRIPT PARA OCULTAR/MOSTRAR GRID------------------------------*/
        //controle de visibilidade dos filtros.
        const OcultarFiltros = () => {
            Benner.Widget.changeServerChromeState('ctl00_Main_FiltroPadrao');
            $("#labelExibirFiltro").removeClass("active")
            $("#labelOcultarFiltro").addClass("active")
            document.getElementById('labelOcultarFiltro').style.visibility = 'hidden';
            document.getElementById('labelExibirFiltro').style.visibility = '';
        };
        const MostrarFiltros = () => {
            $("#Filtros").focus();
            $("#labelExibirFiltro").addClass("active")
            $("#labelOcultarFiltro").removeClass("active")
            Benner.Widget.changeServerChromeState('ctl00_Main_FiltroPadrao');
            document.getElementById('labelExibirFiltro').style.visibility = 'hidden';
            document.getElementById('labelOcultarFiltro').style.visibility = '';
        };

        //Insere botoes de visibilidade do filtro no DOM
        const InserirBotoesOcultarExibirFiltro = () => {
            var portletTitle = $('#portlet_FiltroPadrao').children()[0];
            var portletActions = $(portletTitle).children()[2];
            var botoesJaInseridos = $(portletActions).has("#DivBotoesVisibilidadeFiltro").length > 0;

            if (!botoesJaInseridos)
                $(portletActions).append('<div id="DivBotoesVisibilidadeFiltro" class="btn-group" data-toggle="buttons"><label class="btn blue active" style="left: 110px;" onclick="MostrarFiltros();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label class="btn blue" onclick="OcultarFiltros();" id="labelOcultarFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');

            if (document.getElementById('labelOcultarFiltro').style.visibility == '')
                document.getElementById('labelExibirFiltro').style.visibility = 'hidden';
        };
         /*----------------------------------- FIM SCRIPT PARA OCULTAR/MOSTRAR GRID ------------------------------*/
    </script>


</asp:Content>
