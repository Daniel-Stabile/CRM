<%@ Page Title="Ocorr&ecirc;ncia parcelas CPA" Language="C#" CodeFile="~/aga/e/financeiro/OcorrenciaParcelasCpa.aspx.cs" Inherits="OcorrenciaParcelasCpaPage" %>
   
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

        <wes:SimpleGrid
            runat="server"
            ID="OCORRNCIAPARCELASCPA"
            Title="Ocorr&ecirc;ncia parcelas"
            Subtitle="Contas a pagar"
            PortletCssClass=""
            DefaultFilterName="Padrão"
            PortletLayout="Default"
            BootstrapCols="12"
            FontIcon=""
            ShowTitle="true"
            ProviderWidgetUniqueId=""
            ChromeState="Normal"
            CanDelete="False"
            CanUpdate="False"
            CanInsert="False"
            EntityViewName="FN_PARCELAS.OCORRENCIASCPA.GRID"
            Mode="Selectable"
            UserDefinedSelectColumnVisible="True"
            UserDefinedPageSize="50"
            SystemFilterOnly="False"
            DisplayRowCommand="True"
            CompanyFilterMode="CompanyAndBranch"
            ShowExport="True"
            UserDefinedDisableRowSelection="False"
            Level="20"
            Order="30"
            />
    </div>
    <script type="text/javascript">

        function AtribuirMensagem() {
            MontarDivMensagemSelecionarTodos();
        }

        function MontarDivMensagemSelecionarTodos() {
            var qtdDocumentos = parseInt(document.getElementById("hfQtdDocumentos").value);
            var qtdMaxDocumentos = parseInt(document.getElementById("hfQtdMaxDocumentos").value);

            console.log("qtdDocumentos = " + qtdDocumentos);
            console.log("qtdMaxDocumentos = " + qtdMaxDocumentos);

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
                                '      <br><label>Todos os <span runat="server" style="font-weight: 600;">' + qtdMaxDocumentos + '</span> documentos nesta p&aacute;gina est&atilde;o selecionados. </label>' +
                                '      <a id="selecionaTodos" onclick="SelecionarTodosDocumentos(true)" style="font-weight: 600;">                                  ' +
                                '             Selecionar todos os <span style="font-weight: 600;">' + qtdDocumentos + '</span> documentos existentes</a>                             ' +
                                '   </div>                                                                                                                          ' +
                                '   <div id="divMensagemParaLimparSelecao" ' + displayMensagemParaLimparSelecao + '>                                                ' +
                                '      <br><label>Todos os <span style="font-weight: 600;">' + qtdDocumentos + '</span> documento est&atilde;o selecionados.</label>                            ' +
                                '      <a id="deselecionaTodos" onclick="SelecionarTodosDocumentos(false)" style="font-weight: 600;">Limpar sele&ccedil;&atilde;o</a>             ';
                    '   </div>                                                                                                                          ' +
                    '</div>                                                                                                                             ';
                    parent.insertAdjacentHTML('beforebegin', child);
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
    </script>
</asp:Content>
    