<%@ Page Title="Renegociação" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.Renegociacao.RenegociacaoDocumentoPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <style>
        .form-body {
            padding: 0px !important;
        }

        .mt-element-step {
            margin-bottom: 15px;
        }

            .mt-element-step .mt-step-col {
                height: 80px;
            }

            .mt-element-step .mt-step-title {
                font-size: 20px;
            }

        .margin-top {
            margin-top: 10px;
        }

        .padding-left {
            padding-left: 5px;
        }

        .padding-right {
            padding-right: 5px;
        }
    </style>
    <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /> 
            <asp:HiddenField runat="server" ID="hf_previous_step" value="" ClientIDMode="Static"/>
            <asp:HiddenField runat="server" ID="hf_parcelas_selecionadas" value="" />
            <asp:HiddenField runat="server" ID="hf_intent" value="" ClientIDMode="Static"/>
            <asp:HiddenField runat="server" ID="hf_quantidade_parcelas_selecionadas" value="" ClientIDMode="Static"/>
            <asp:HiddenField runat="server" ID="hf_favorecido" value="" ClientIDMode="Static"/>
            <asp:HiddenField runat="server" ID="hf_total_bruto" value="" ClientIDMode="Static"/>
        </ContentTemplate>
    </asp:updatepanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <div class="mt-element-step">
                        <div class="row step-thin">
                            <div class="col-md-3 bg-grey mt-step-col active" href="#tab1">
                                <div class="mt-step-number bg-white font-grey">1</div>
                                <div class="mt-step-title uppercase font-grey-cascade">Títulos</div>
                                <div class="mt-step-content font-grey-cascade tipo-contas"></div>
                                <div class="mt-step-content font-grey-cascade" style="padding-top: 5px">
                                    <b><span id="stepLbNumParecelasSelecionadas"></span></b>
                                </div>
                            </div>
                            <div class="col-md-3 bg-grey mt-step-col" href="#tab2">
                                <div class="mt-step-number bg-white font-grey">2</div>
                                <div class="mt-step-title uppercase font-grey-cascade">Documento</div>
                                <div class="mt-step-content font-grey-cascade" style="padding-top: 10px">
                                    <small>Total: R$</small>
                                    <b><span id="stepLbTotal"></span></b>
                                </div>
                            </div>
                            <div class="col-md-3 bg-grey mt-step-col " href="#tab3">
                                <div class="mt-step-number bg-white font-grey">3</div>
                                <div class="mt-step-title uppercase font-grey-cascade">Baixa</div>
                                <div class="mt-step-content font-grey-cascade">
                                    Data: 
                                    <b><span id="stepLbData"></span></b>
                                </div>
                                <div class="mt-step-content font-grey-cascade" style="padding-top: 2px">
                                    Data contábil: 
                                    <b><span id="stepLbDataContabil"></span></b>
                                </div>
                            </div>
                            <div class="col-md-3 bg-grey mt-step-col " href="#tab4">
                                <div class="mt-step-number bg-white font-grey">4</div>
                                <div class="mt-step-title uppercase font-grey-cascade">Vencimentos</div>
                                <div class="mt-step-content font-grey-cascade">
                                    <%--<small>Favorecido: </small>--%>
                                    <span id="stepLbFavorecido"></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-content">
                        <%--INICIO DO STEP 1--%>
                        <div class="tab-pane active" id="tab1">
                            <div class="row bt-proximo" style="display: none;">
                                <div class="col-md-12 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase btn-proximo" href="javascript:__doPostBack('ctl00$Main$PARCELASSELECIONAR','CMD_NEXT_STEP')">Próximo</a>
                                </div>
                            </div>
                            <div class="row">
                                <%--INICIO ABAS--%>
                                <br />
                                <div class="tabbable-line" style="margin-left: 15px; margin-right: 15px;">
                                    <ul class="nav nav-tabs">
                                        <li class="active">
                                            <a href="#selecionar" data-toggle="tab" aria-expanded="true"><i class="fa fa-search font-blue"></i>&nbsp;Buscar Parcelas</a>
                                        </li>
                                        <li class="">
                                            <a href="#selecionados" data-toggle="tab" aria-expanded="true"><i class="fa fa-check font-blue"></i>&nbsp;Parcelas Selecionadas
                                                <span class="badge badge-info num-parcelas-selecionadas" id="lbNumParecelasSelecionadas">0</span>
                                            </a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane active" id="selecionar">
                                            <wes:SimpleGrid runat="server"
                                                ID="PARCELASSELECIONAR"
                                                Title="Busca de Parcelas"
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
                                                EntityViewName="FN_PARCELAS.SELECIONAR_RENEGOCIACAO.GRID"
                                                DefaultFilterName="Padrão"
                                                Mode="Selectable"
                                                UserDefinedSelectColumnVisible="True"
                                                UserDefinedPageSize="20"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                ShowExport="False"
                                                UserDefinedDisableRowSelection="true"
                                                PageWidgetHandle="22298"
                                                Level="20"
                                                Order="20" />
                                        </div>
                                        <div class="tab-pane" id="selecionados">
                                            <wes:SimpleGrid runat="server"
                                                ID="PARCELASSELECIONADAS"
                                                Title="Parcelas Selecionadas"
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
                                                EntityViewName="FN_PARCELAS.SELECIONADAS_RENEGOCIACAO.GRID"
                                                Mode="None"
                                                UserDefinedSelectColumnVisible="True"
                                                UserDefinedPageSize="20"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="True"
                                                CompanyFilterMode="OnlyCompany"
                                                ShowExport="False"
                                                UserDefinedDisableRowSelection="true"
                                                PageWidgetHandle="22299"
                                                Level="20"
                                                Order="40" />
                                        </div>
                                    </div>
                                </div>
                                <%--FIM ABAS--%>
                            </div>
                        </div>
                        <%--FIM DO STEP 1--%>
                        <%--INICIO DO STEP 2--%>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase" href="javascript:__doPostBack('ctl00$Main$CONFIGURARDOCUMENTO','Cancel')">Voltar</a>
                                </div>
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase" href="javascript:__doPostBack('ctl00$Main$CONFIGURARDOCUMENTO','Save')">Próximo</a>
                                </div>
                            </div>
                            <div class="row margin-top">
                                <wes:AjaxForm runat="server" ID="CONFIGURARDOCUMENTO" Title="Configurar documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="VT_RENEGOCIACAO_DOCUMENTO.DOCDESCTAX.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22300" Level="20" Order="50" />
                            </div>
                        </div>
                        <%--FIM DO STEP 2--%>
                        <%--INICIO DO STEP 3--%>
                        <div class="tab-pane" id="tab3">
                            <div class="row">
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase" href="javascript:__doPostBack('ctl00$Main$BAIXADOCUMENTO','Cancel')">Voltar</a>
                                </div>
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase" href="javascript:__doPostBack('ctl00$Main$BAIXADOCUMENTO','Save')">Próximo</a>
                                </div>
                            </div>
                            <div class="row margin-top">
                                <wes:AjaxForm runat="server" ID="BAIXADOCUMENTO" Title="Configurar documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="VT_RENEGOCIACAO_BAIXA_AP.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22300" Level="20" Order="50" />
                            </div>
                        </div>
                        <%--FIM DO STEP 3--%>
                        <%--INICIO DO STEP 4--%>
                        <div class="tab-pane" id="tab4">
                            <div class="row">
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase" onclick="setStep(3)" href="javascript:__doPostBack('ctl00$Main$CONFIGURACAOPARCELA','Cancel')">Voltar</a>
                                </div>
                                <div class="col-md-6 margin-left margin-right margin-top">
                                    <a class="btn green-sharp btn-outline btn-block sbold uppercase concluir" onclick="concluir()">Concluir</a>
                                </div>
                            </div>
                            <div class="row margin-top">
                                <wes:AjaxForm runat="server"
                                    ID="CONFIGURACAOPARCELA"
                                    Title="Configuração de parcelas"
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
                                    EntityViewName="VT_RENEGOCIACAO_PARCELAS.CUSTOM.FORM"
                                    FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22300" Level="20" Order="50" />
                            </div>
                            <%--Inicio componente vue--%>
                            <div class="row">
                                <div id="app" class="col-md-12">
                                    <renegociacao-parcelas ref="renegociacaoParcelas" v-on:changed="setConfiguracaoParcelasField($event)"></renegociacao-parcelas>
                                </div>
                            </div>
                            <%--Fim componente vue--%>
                        </div>
                        <%--FIM DO STEP 4--%>
                    </div>
                </div>
            </div>
        </div>
    </div>



    <script type="text/javascript">
        var app = new window.Vue({
            el: '#app',
            methods: {
                setConfiguracaoParcelasField: function (args) {
                    $('#ctl00_Main_CONFIGURACAOPARCELA_CONFIGURACAOPARCELAS_HiddenField').val(JSON.stringify(app.$refs.renegociacaoParcelas.rows));
                }
            }
        });

        var intent = $('#hf_intent').val();

        $(function () {

            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    setStepLabels();
                    setStep();
                    setStyleForSessions();
                });
            }
            setCpaCreLabelOnStep1();
            setStyleForSessions();
            setStepLabels();
            setStep();

        });

        $("#n-firstDate").blur(function(){
            $("#1").children().children().children("input").val($("#n-firstDate").val());
        });

        setCpaCreLabelOnStep1 = function () {
            if (intent) {
                var origem = '';

                if (intent === "cpa")
                    origem = "Contas a pagar";
                else if (intent === "cre")
                    origem = "Contas a receber";

                $('.tipo-contas').text(origem)
            } else {
                bootbox.alert({
                    title: 'Atenção!',
                    message: "Para saber se a seleção de parcelas é de contas a pagar ou contas a receber, você deve chegar nesta página através do menu. <br><br>Em nosso menu selecione se deseja renegociar parcelas de contas a pagar ou contas a receber."
                });
            }
        }

        setStyleForSessions = function () {
            var sessaoDesconto = $('#CONFIGURARDOCUMENTO_GERAL .desconto');
            var sessaoTaxa = $('#CONFIGURARDOCUMENTO_GERAL .taxa');

            if (intent && !sessaoDesconto.find('i').length && !sessaoTaxa.find('i').length) {

                let iBlue = "<i class='fa fa-minus font-blue'></i>";
                let iRed = "<i class='fa fa-plus font-red'></i>"

                if (intent === "cpa") {
                    sessaoDesconto.prepend(iBlue);
                    sessaoDesconto.addClass("font-blue");
                    sessaoTaxa.prepend(iRed);
                    sessaoTaxa.addClass("font-red");
                } else if (intent === "cre") {
                    sessaoDesconto.prepend(iRed);
                    sessaoDesconto.addClass("font-red");
                    sessaoTaxa.prepend(iBlue);
                    sessaoTaxa.addClass("font-blue");
                }
            }
            var valor = recuperarCampoWidget('CONFIGURACAOPARCELA', 'VALOR');
            if (!valor.is(':disabled'))
                valor.prop("disabled", true);

        }

        showButtons = function (show) {
            var bt = $('.bt-proximo');

            if (show && $(bt).css('display') == 'none')
                $(bt).slideDown('500');
            else if (!show && ($(bt).css('display') == 'block'))
                $(bt).slideUp('500');
        };

        setStepLabels = function () {
            var totalQuantidadeParcelas = $('#hf_quantidade_parcelas_selecionadas').val();
            if (totalQuantidadeParcelas > 0) {
                $('#stepLbNumParecelasSelecionadas').text(totalQuantidadeParcelas + ' selecionado' + (totalQuantidadeParcelas > 1 ? 's' : ''));
                $('#lbNumParecelasSelecionadas').text(totalQuantidadeParcelas);
                showButtons(true)
            } else {
                $('#stepLbNumParecelasSelecionadas').text('');
                $('#lbNumParecelasSelecionadas').text(0);
                showButtons(false)
            }

            setTotalValue();

            var data = recuperarCampoWidget('BAIXADOCUMENTO', 'DATA_DATE').val();
            var dataContabil = recuperarCampoWidget('BAIXADOCUMENTO', 'DATACONTABIL_DATE').val();
            if (data != "" && dataContabil != null) {
                $('#stepLbData').text(data);
                $('#stepLbDataContabil').text(dataContabil);
            }
        };

        setTotalValue = function () {
            var valorTotalBruto = formatCurrencyStringToFloat($('#hf_total_bruto').val());
            valorTotalBruto = !isNaN(valorTotalBruto) ? valorTotalBruto : 0;

            var desconto = formatCurrencyStringToFloat(recuperarCampoWidget('CONFIGURARDOCUMENTO', 'DESCONTO').val());
            desconto = !isNaN(desconto) ? desconto : 0;

            var taxa = formatCurrencyStringToFloat(recuperarCampoWidget('CONFIGURARDOCUMENTO', 'TAXA').val());
            taxa = !isNaN(taxa) ? taxa : 0;

            var valorLiquido = valorTotalBruto + taxa - desconto;
            valorLiquido = formatCurrencyFloatToString(valorLiquido);

            $('#stepLbTotal').text(valorLiquido);
            recuperarCampoWidget('CONFIGURACAOPARCELA', 'VALOR').val(valorLiquido);
            app.$refs.renegociacaoParcelas.total = formatCurrencyStringToFloat(valorLiquido);
        };

        formatCurrencyStringToFloat = function (valueString) {
            if (valueString == '' || valueString == '0' || valueString == undefined)
                return 0;

            valueString = valueString.replace('.', '');
            valueString = valueString.replace(',', '.');
            valueString = valueString.replace(/[^0-9.-]+/g, "");
            valueString = Number(valueString).toFixed(2);
            return Number(valueString);
        };

        formatCurrencyFloatToString = function (valueFloat) {
            valueFloat = valueFloat.toFixed(2)
            valueFloat = valueFloat.replace('.', ',');
            return valueFloat;
        };

        setFavorecidoCpfCnpj = function () {
            var favorecido = $('#hf_favorecido').val();
            if (favorecido != '') {
                favorecido = JSON.parse(favorecido)

                recuperarCampoWidget('CONFIGURACAOPARCELA', 'FAVORECIDO').val(favorecido.Apelido);
                recuperarCampoWidget('CONFIGURACAOPARCELA', 'CPFCNPJ').val(favorecido.CpfCnpj);
                recuperarCampoWidget('CONFIGURACAOPARCELA', 'CONTACORRENTE').val(favorecido.ContaCorrente);
                $('#stepLbFavorecido').html('<small>Favorecido: </small> <b>' + favorecido.Apelido + '</b>');
            }
        };

        concluir = function () {
            app.setConfiguracaoParcelasField();
            if (parseFloat(app.$refs.renegociacaoParcelas.leftOver != undefined && app.$refs.renegociacaoParcelas.leftOver.toFixed(2)) != 0)
                toastr.warning("O valor preenchido nas parcelas totaliza R$ " + (!isNaN(app.$refs.renegociacaoParcelas.totalInRows) ? app.$refs.renegociacaoParcelas.totalInRows : '0,00') + ". Esse valor não corresponde ao total do documento R$" + app.$refs.renegociacaoParcelas.total + ".", "Atenção", "");
            else
                __doPostBack('ctl00$Main$CONFIGURACAOPARCELA', 'Save')
                //Benner.Form.save('ctl00$Main$CONFIGURACAOPARCELA', 'Save');
        };

        function recuperarCampoWidget(widget, campo) {
            return $('#' + widget + ' #ctl00_Main_' + widget + '_PageControl_GERAL_GERAL_' + campo);
        };

        setStep = function (nextStep) {
            if (nextStep == undefined)
                nextStep = null;

            var currentStep = $('#CurrentStep').val();
            var previousStep = $('#hf_previous_step').val();

            $('[href="#tab' + previousStep + '"]').removeClass('active');

            $('[href="#tab' + currentStep + '"]').tab('show');
            $('[href="#tab' + currentStep + '"]').addClass('active');
        };
    </script>
    <style>
        #ctl00_Main_PARCELASSELECIONAR_UpdatePanel, #ctl00_Main_PARCELASSELECIONADAS_UpdatePanel {
            margin-left: -15px;
            margin-right: -15px;
        }
    </style>
</asp:Content>
