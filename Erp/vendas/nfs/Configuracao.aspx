<%@ Page Title="Configuração para emitir Notas Fiscais" Language="C#" CodeFile="~/Erp/Vendas/NFS/Configuracao.aspx.cs" Inherits="Erp_Vendas_NFS_Configuracao" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <style>
        .empresas-certificado {
            height: 140px;
            width: 138px;
            border: 1px solid #C9D3DD;
            background-repeat: no-repeat;
            background-position: center center;
        }

        .serasa {
            background-image: url(../../../content/img/serasa-icon.png);
        }

        .caixa {
            background-image: url(../../../content/img/caixa-icon.png);
        }

        .valid {
            background-image: url(../../../content/img/valid-icon.png);
        }

        .certisign {
            background-image: url(../../../content/img/certsign-icon.png);
        }

        .certificado-margin {
            margin-left: 15px;
        }

    </style>

    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light" id="form_wizard_1">
                <div class="portlet-body form">
                    <div class="form-wizard">
                        <div class="form-body">
                            <ul class="nav nav-pills nav-justified steps">
                                <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Confira os dados de sua empresa</span></a></li>
                                <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Configuração do Certificado Digital</span></a></li>
                            </ul>
                            <div id="bar" class="progress progress-striped" role="progressbar">
                                <div class="progress-bar progress-bar-success"></div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="row">
                                        <wes:AjaxForm runat="server" ID="FORMCONFIRAOSDADOSDESUAEMPRESA" Title="Confira os dados de sua empresa" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="A.HANDLE = @FILIAL" IncludeRecordInRecentItems="True" CanInsert="False" CanUpdate="True" CanDelete="False" ChromeState="Normal" EntityViewName="CLOUD_FILIAIS.CONFIGNOTAFISCAL.FORM" ShowTitle="False" PageWidgetHandle="268" />
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab2">
                                    <asp:UpdatePanel runat="server" ID="updatePanelMsgErro" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:Panel ID="msgError" CssClass="alert alert-danger" runat="server">
                                                <asp:Label ID="lblMsg" runat="server" />
                                            </asp:Panel>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        Para emitir NFS-e você precisa ter um <b>Certificado Digital</b>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <div class="mt-radio-list">
                                                            <label class="mt-radio mt-radio-outline">
                                                                <input runat="server" type="radio" name="certificadoDigital" id="semCertificadoDigital" value="no" />Ainda não possuo um Certificado Digital
                                                                <span class="certificado"></span>
                                                            </label>
                                                            <label class="mt-radio mt-radio-outline">
                                                                <input runat="server" type="radio" name="certificadoDigital" id="comCertificadoDigital" value="yes" />Já possuo um Certificado A1
                                                                <span class="certificado"></span>
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                    <div id="divSemCertificadoDigital" class="row hidden">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                Compre o certificado A1 em uma das unidades certificadoras abaixo:
                                            </div>
                                            <div class="pull-left">
                                                <a href="http://serasa.certificadodigital.com.br/produtos/para-emissao-de-nf-e/nfe/" target="_blank">
                                                    <div class="empresas-certificado serasa"></div>
                                                </a>
                                            </div>
                                            <div class="pull-left certificado-margin">
                                                <a href="https://certificadodigital.caixa.gov.br/cefar/solicitacao/nao_tem/como_obter/pj_form_v2.htm"  target="_blank">
                                                    <div class="empresas-certificado caixa"></div>
                                                </a>
                                            </div>
                                            <div class="pull-left certificado-margin">
                                                <a href="https://www.validcertificadora.com.br/Identificacao.aspx" target="_blank">
                                                    <div class="empresas-certificado valid"></div>
                                                </a>
                                            </div>
                                            <div class="pull-left certificado-margin">
                                                <a href="https://www.certisign.com.br/certificado-digital/para-empresa/ecnpj" target="_blank">
                                                    <div class="empresas-certificado certisign"></div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <asp:Panel runat="server" ID="divCadastroCertificado" CssClass="cadastroCertificado hidden">
                                        <div class="row">
                                            <wes:AjaxForm runat="server" ID="FORMCONFIGURACAODOCERTIFICADODIGITAL" Title="Configuração do Certificado Digital" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="A.FILIAL = @FILIAL" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_TR_PARAMETROFILIAL.CONFIGNOTAFISCAL.FORM" ShowTitle="False" PageWidgetHandle="269" />
                                        </div>
                                    </asp:Panel>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
        }
    </script>
    <script type="text/javascript">
        $(".mt-radio.mt-radio-outline").live("click", function () {
            if ($(this).children()[0].value == "no")
                VisibilidadeComponentes(true);
            else
                VisibilidadeComponentes(false);
        });

        function VisibilidadeComponentes(value) {
            if (value === true) {
                $("#divSemCertificadoDigital").removeClass("hidden");
                $(".cadastroCertificado").addClass("hidden");
                $(".alert.alert-danger").addClass("hidden");
            } else {
                $("#divSemCertificadoDigital").addClass("hidden");
                $(".cadastroCertificado").removeClass("hidden");
                $(".alert.alert-danger").removeClass("hidden");
            }
        }
        // default form wizard
        $('#form_wizard_1').bootstrapWizard({
            onTabClick: function (tab, navigation, index, clickedIndex) {
                return false;
            },
            onNext: function (tab, navigation, index) {
            },
            onPrevious: function (tab, navigation, index) {
            },
            onTabShow: function (tab, navigation, index) {
                var total = navigation.find('li').length;
                var current = index + 1;
                var $percent = (current / total) * 100;
                $('#form_wizard_1').find('.progress-bar').css({
                    width: $percent + '%'
                });
            }
        });

        selectCurrentStep = function () {
            var currentStep = $("#CurrentStep").val();
            $('[href="#tab' + currentStep + '"]').tab('show');
        };

        // Application event handlers for component developers.
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        if (!prm.get_isInAsyncPostBack()) {
            prm.add_endRequest(function (sender, args) {
                selectCurrentStep();
            });
        }

        selectCurrentStep();
      </script>
</asp:Content>
