<%@ Page Title="Ocorrência" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.ErpWeb.Financeiro.OcorrenciaParcelas.OcorrenciaParcelasFormPage" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light">
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs persist-selection">
                                    <li class="active">
                                        <a href="#tab-ocorrencia" data-toggle="tab" id="link-ocorrencia">
                                            <i class="fa fa-edit"></i>
                                            Ocorrência
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#tab-contabilizacao" data-toggle="tab" id="link-contabilizacao" style="display: none">
                                            <i class="fa fa-balance-scale"></i>
                                            Contabilização
                                        </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab-ocorrencia">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <wes:AjaxForm runat="server"
                                                    ID="FormOcorrencia"
                                                    Title="Ocorrência"
                                                    Subtitle=""
                                                    PortletCssClass=""
                                                    PortletLayout="None"
                                                    BootstrapCols="12"
                                                    FontIcon=""
                                                    ShowTitle="false"
                                                    ChromeState="Normal"
                                                    CanDelete="True"
                                                    CanUpdate="True"
                                                    CanInsert="True"
                                                    EntityViewName="FN_MOVIMENTACOES.OCORRENCIAPARCELA.FORM"
                                                    FormMode="View"
                                                    IncludeRecordInRecentItems="False"
                                                    UserDefinedCommandsVisible="True"
                                                    PageWidgetHandle="22486"
                                                    Level="20"
                                                    Order="30"
                                                    OnCommandExecute="FormOcorrencia_CommandExecute" />
                                            </div>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab-contabilizacao">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <wes:CommandsPanel runat="server"
                                                    ID="ComandosContabilizacao"
                                                    Title="Contabilização"
                                                    Subtitle=""
                                                    PortletCssClass=""
                                                    PortletLayout="Default"
                                                    BootstrapCols="12"
                                                    FontIcon=""
                                                    ShowTitle="false"
                                                    ProviderWidgetUniqueId="FormOcorrencia"
                                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="false"
                                                    CanInsert="false"
                                                    EntityViewName="FN_MOVIMENTACOES.OCORRENCIAPARCELAS.COMANDOSCONTABILIZACAO.GRID"
                                                    VerticalOrientation="False"
                                                    PageWidgetHandle="22497"
                                                    Level="20"
                                                    Order="40"
                                                    OnDataLoaded="ComandosContabilizacao_Load" />

                                                <wes:SimpleGrid runat="server"
                                                    ID="GridContabilizacoes"
                                                    Title=""
                                                    Subtitle=""
                                                    PortletCssClass=""
                                                    PortletLayout="None"
                                                    BootstrapCols="12"
                                                    FontIcon=""
                                                    ShowTitle="false"
                                                    ProviderWidgetUniqueId="FormOcorrencia"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    EntityViewName="CT_LANCAMENTOS.OCORRENCIAPARCELAS.GRID"
                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOMOVIMENTACAO = @CAMPO(HANDLE) AND A.LANCAMENTOORIGINAL IS NULL"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="True"
                                                    CompanyFilterMode="OnlyCompany"
                                                    ShowExport="True"
                                                    UserDefinedDisableRowSelection="False"
                                                    PageWidgetHandle="22495"
                                                    Level="20"
                                                    Order="40" />
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 col-sm-12">
                                                <div class="portlet box blue-hoki">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-bars"></i>Detalhes
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <wes:AjaxForm runat="server"
                                                                    ID="FormContabilizacao"
                                                                    Title="Detalhes"
                                                                    Subtitle=""
                                                                    PortletCssClass=""
                                                                    PortletLayout="None"
                                                                    BootstrapCols="12"
                                                                    FontIcon=""
                                                                    ShowTitle="true"
                                                                    ProviderWidgetUniqueId="GridContabilizacoes"
                                                                    ChromeState="Normal"
                                                                    CanDelete="false"
                                                                    CanUpdate="false"
                                                                    CanInsert="false"
                                                                    EntityViewName="CT_LANCAMENTOS.OCORRENCIAPARCELAS.FORM"
                                                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                                                                    FormMode="View"
                                                                    IncludeRecordInRecentItems="False"
                                                                    UserDefinedCommandsVisible="True"
                                                                    PageWidgetHandle="22486"
                                                                    Level="20"
                                                                    Order="50" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-6 col-sm-12">
                                                <div class="portlet box yellow">
                                                    <div class="portlet-title">
                                                        <div class="caption">
                                                            <i class="fa fa-calculator"></i>Rateio
                                                        </div>
                                                    </div>
                                                    <div class="portlet-body">
                                                        <div class="row">
                                                            <div class="col-md-12">
                                                                <wes:SimpleGrid runat="server"
                                                                    ID="GridRateioCC"
                                                                    Title=""
                                                                    Subtitle=""
                                                                    PortletCssClass=""
                                                                    PortletLayout="None"
                                                                    BootstrapCols="12"
                                                                    FontIcon=""
                                                                    ShowTitle="false"
                                                                    ProviderWidgetUniqueId="FormContabilizacao"
                                                                    ChromeState="Normal"
                                                                    CanDelete="False"
                                                                    CanUpdate="False"
                                                                    CanInsert="False"
                                                                    EntityViewName="CT_LANCAMENTOCC.OCORRENCIAPARCELAS.GRID"
                                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                                                                    Mode="None"
                                                                    UserDefinedSelectColumnVisible="False"
                                                                    UserDefinedPageSize="10"
                                                                    SystemFilterOnly="False"
                                                                    DisplayRowCommand="True"
                                                                    CompanyFilterMode="OnlyCompany"
                                                                    ShowExport="True"
                                                                    UserDefinedDisableRowSelection="False"
                                                                    PageWidgetHandle="22495"
                                                                    Level="20"
                                                                    Order="60" />
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <asp:HiddenField runat="server" ID="hfIgualarDataLimite" Value="true" />
    </div>
    
    <script type="text/javascript">
        $(document).ready(function () {
            onLoadOcorrencia()
        })

        Sys.WebForms.PageRequestManager.getInstance().add_endRequest(onLoadOcorrencia)


        function onLoadOcorrencia() {
            //ocultarCamposAuditoriaPaginaGeral()
            atualizarValorCampoDataLimite()
            definirEventoChangeCampoDataLimite()
            habilitarCampoDataLimite()
            atualizarTabContabilizacao()
        }

        function habilitarCampoDataLimite() {
            const ckIgualarDataLimite = $("#ckIgualarDataLimite")
            const txtData = $("input[data-field=DATA]")

            if (!!!(ckIgualarDataLimite[0]))
                return

            ckIgualarDataLimite.attr("disabled", !!!(txtData[0]))
        }

        function definirEventoChangeCampoDataLimite() {
            const ckIgualarDataLimite = $("#ckIgualarDataLimite")
            const hfIgualarDataLimite = $("input[id$=hfIgualarDataLimite]")

            if (!!!(ckIgualarDataLimite[0]) || !!!(hfIgualarDataLimite[0]))
                return

            $("#ckIgualarDataLimite").on("change", function () {
                $("input[id$=hfIgualarDataLimite]").val(this.checked)
            })
        }

        function atualizarValorCampoDataLimite() {
            const ckIgualarDataLimite = $("#ckIgualarDataLimite")
            const hfIgualarDataLimite = $("input[id$=hfIgualarDataLimite]")

            if (!!!(ckIgualarDataLimite[0]) || !!!(hfIgualarDataLimite[0]))
                return

            ckIgualarDataLimite.attr("checked", $("input[id$=hfIgualarDataLimite]").val() == "true")
        }

        function ocultarCamposAuditoriaPaginaGeral() {
            let txtDataInclusao = $("input[data-field=DATAINCLUSAO][id*=GERAL]")

            if (!!(txtDataInclusao[0]))
                ocultarCamposAuditoriaEdicao()
            else
                ocultarCamposAuditoriaViewMode()
        }

        function ocultarCamposAuditoriaEdicao() {
            let txtDataInclusao = $("input[data-field=DATAINCLUSAO][id*=GERAL]")
            if (!!(txtDataInclusao[0]))
                txtDataInclusao.closest("div[class=form-group]").css("display", "none")

            let txtDataAlteracao = $("input[data-field=DATAALTERACAO][id*=GERAL]")
            if (!!([0]))
                txtDataAlteracao.closest("div[class=form-group]").css("display", "none")
        }

        function ocultarCamposAuditoriaViewMode() {
            let hfUsuarioIncluiu = $("input[id*=USUARIOINCLUIU][id*=GERAL]")
            if (!!(hfUsuarioIncluiu[0]))
                hfUsuarioIncluiu.closest(".row").css("display", "none")

            let hfUsuarioAlterou = $("input[id*=USUARIOALTEROU][id*=GERAL]")
            if (!!(hfUsuarioAlterou[0]))
                hfUsuarioAlterou.closest(".row").css("display", "none")
        }

        function atualizarTabContabilizacao() {
            const linkContabilizacao = $("#link-contabilizacao")
            const exibirContabilizacao = !!($("table[id*=GridContabilizacoes]")[0])

            if (exibirContabilizacao) {
                linkContabilizacao.css("display", "")
            } else {
                linkContabilizacao.css("display", "none")

                const linkOcorrenia = $("#link-ocorrencia")
                linkOcorrenia.click()
            }
        }
    </script>
</asp:Content>
