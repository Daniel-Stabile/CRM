<%@ Page Title="Aglutinar documentos" Language="C#" CodeFile="~/aga/e/financeiro/aglutinador/aglutinar.aspx.cs" Inherits="aglutinadoraglutinarPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
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
            <div class="col-sm-6">
                <wes:AjaxForm
                    runat="server"
                    ID="AGLUTINADOR"
                    Title="Aglutinação"
                    Subtitle=""
                    PortletCssClass=""
                    PortletLayout="Default"
                    BootstrapCols="12"
                    FontIcon=""
                    ShowTitle="false"
                    ProviderWidgetUniqueId=""
                    ChromeState="Fixed"
                    CanDelete="True"
                    CanUpdate="True"
                    CanInsert="True"
                    EntityViewName="FN_VIRTUAL_AGLUTINADOR.CUSTOM.FORM"
                    FormMode="None"
                    IncludeRecordInRecentItems="True"
                    UserDefinedCommandsVisible="True"
                    PageWidgetHandle="22527"
                    Level="20"
                    Order="10" />
            </div>
            <div id="app" class="col-sm-6" style="margin-top: 52px; border-left: 2px solid #e7ecf1;">
                <h4 class="form-section">Parcelas</h4>
                <renegociacao-parcelas 
                    ref="renegociacaoParcelas" 
                    v-on:changed="setConfiguracaoParcelasField($event)" 
                    classparcelas="col-md-12" />
            </div>
        </div>
    </div>
    <script type="text/javascript">

        var app = new window.Vue({
            el: '#app',
            methods: {
                setConfiguracaoParcelasField: function (args) {
                    $('#ctl00_Main_AGLUTINADOR_CONFIGURACAOPARCELA_HiddenField').val(JSON.stringify(app.$refs.renegociacaoParcelas.rows));
                }
            }
        });

        setValue = function () {
            app.$refs.renegociacaoParcelas.total = $('#hf_value').val();
        }

        concluir = function () {
            app.setConfiguracaoParcelasField();
            if ($("#saldo-restante").text() != "0,00")
                toastr.info("O valor preenchido nas parcelas totaliza R$" + app.$refs.renegociacaoParcelas.totalInRows.toFixed(2) + ". Esse valor não corresponde ao total do documento R$" + app.$refs.renegociacaoParcelas.total + ".", "Atenção", "");
            else
                __doPostBack('ctl00$Main$AGLUTINADOR', 'Save');
        };

        alteraComportamentoSaveButton = function () {
            $(".concluir.btn-save").attr('href', '');
            $(".concluir.btn-save").attr('onclick', 'concluir()');
        };

        setDataLimite = function () {
            console.log($('#hf_dateLimit').val());
            app.$refs.renegociacaoParcelas.initialMaturityDate = $('#hf_dateLimit').val();
        }

        $(document).ready(function() {
            alteraComportamentoSaveButton();            
        });

    </script>
</asp:Content>
