<%@ Page Title="Renegociação de parcela" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.Renegociacao.RenegociacaoParcelaPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:updatepanel runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="hf_value" ClientIDMode="Static" /> 
            <asp:HiddenField runat="server" ID="hf_dateLimit" ClientIDMode="Static" /> 
        </ContentTemplate>
    </asp:updatepanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="row">
                <wes:AjaxForm Visible="true" runat="server" ID="PARCELA" Title="Parcela" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="VT_RENEGOCIACAO_PARCELA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22515" Level="20" Order="10" />
            </div>
        </div>
    </div>

    <script type="text/javascript">

        var app = new window.Vue({
            el: '#app',
            methods: {
                setConfiguracaoParcelasField: function (args) {
                    $('#ctl00_Main_PARCELA_CONFIGURACAOPARCELA_HiddenField').val(JSON.stringify(app.$refs.renegociacaoParcelas.rows));
                    $('#PARCELA [data-field="CONFIGURACAOPARCELA"]').val(JSON.stringify(app.$refs.renegociacaoParcelas.rows));
                }
            }
        });

        setValue = function () {
            app.$refs.renegociacaoParcelas.total = $('#hf_value').val();
        }

        concluir = function () {
            app.setConfiguracaoParcelasField();
            if (parseFloat(app.$refs.renegociacaoParcelas.leftOver != undefined && app.$refs.renegociacaoParcelas.leftOver.toFixed(2)) != 0)
                toastr.info("O valor preenchido nas parcelas totaliza R$" + app.$refs.renegociacaoParcelas.totalInRows.toFixed(2) + ". Esse valor não corresponde ao total do documento R$" + app.$refs.renegociacaoParcelas.total + ".", "Atenção", "");
            else
                __doPostBack('ctl00$Main$PARCELA', 'Save');
        };

        alteraComportamentoSaveButton = function () {
            $(".concluir.btn-save").attr('href', '');
            $(".concluir.btn-save").attr('onclick', 'concluir()');
        };

        setDataLimite = function () {
            console.log($('#hf_dateLimit').val());
            app.$refs.renegociacaoParcelas.initialMaturityDate = $('#hf_dateLimit').val();
        }

        $(function () { alteraComportamentoSaveButton(); });

    </script>

</asp:Content>