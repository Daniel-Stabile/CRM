<%@ Page Title="Suspender parcelas" Language="C#" Inherits="aga.e.Financeiro.Documentos.SuspenderParcelas" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:UpdatePanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li>
                            <a data-toggle="tab" class="step" href="#tab1">
                                <span class="number">1</span>
                                <span class="desc">
                                    <i class="fa fa-check"></i>Selecionar parcelas
                                </span>
                            </a>
                        </li>
                        <li>
                            <a data-toggle="tab" class="step" href="#tab2">
                                <span class="number">2</span>
                                <span class="desc">
                                    <i class="fa fa-check"></i>Motivo da suspens&atilde;o
                                </span>
                            </a>
                        </li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row">
                                <wes:SimpleGrid runat="server" 
                                    ID="SELECIONARPARCELAS" 
                                    Title="Selecionar parcelas" 
                                    Subtitle="" 
                                    PortletCssClass="" 
                                    PortletLayout="None" 
                                    BootstrapCols="12"
                                    FontIcon="" 
                                    ShowTitle="false" 
                                    ProviderWidgetUniqueId="" 
                                    ChromeState="Fixed" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="FN_PARCELAS.ZOOMDOCUMENTOS.SUSPENDERPARCELAS.GRID" 
                                    Mode="None" 
                                    UserDefinedSelectColumnVisible="True" 
                                    UserDefinedPageSize="100" 
                                    SystemFilterOnly="False" 
                                    DisplayRowCommand="True" 
                                    CompanyFilterMode="OnlyCompany" 
                                    ShowExport="True" 
                                    UserDefinedDisableRowSelection="False" 
                                    PageWidgetHandle="22514" 
                                    Level="20" 
                                    Order="10" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <wes:AjaxForm 
                                    runat="server" 
                                    ID="MOTIVODASUSPENSO" 
                                    Title="Motivo da suspensão" 
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
                                    EntityViewName="FN_FILTRO_SUSPENDERPARCELA.ZOOMDEDOCUMENTOS.FORM" 
                                    FormMode="None" 
                                    IncludeRecordInRecentItems="True" 
                                    UserDefinedCommandsVisible="True" 
                                    PageWidgetHandle="22515" 
                                    Level="20" 
                                    Order="20" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        jQuery(function ($) {
            divParcelas = $("#tab1")
            if (!!(divParcelas[0])) {
                const ckSelecionarTodasParcelas = divParcelas.find("input[id$=SelectAllCheckBoxHeader]")
                if (!!(ckSelecionarTodasParcelas[0])) {
                    ckSelecionarTodasParcelas.click()
                }
            }
        })

        $(function () {
            // default form wizard
            $('#form_wizard').bootstrapWizard({
                onTabClick: function (tab, navigation, index, clickedIndex) {
                    return false
                },
                onTabShow: function (tab, navigation, index) {
                    var total = navigation.find('li').length
                    var current = index + 1
                    var $percent = (current / total) * 100
                    $('#form_wizard').find('.progress-bar').css({
                        width: $percent + '%'
                    });
                }
            });

            selectCurrentStep = function () {
                var currentStep = $("#CurrentStep").val()
                $('[href="#tab' + currentStep + '"]').tab('show')

                const msgUser = $("div[id$=MsgUser]")
                if (!!(msgUser[0]) && msgUser.html().indexOf("A ação foi executada") > 0) {
                    msgUser.remove()
                }
            };

            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance()
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    selectCurrentStep()
                });
            }

            selectCurrentStep()
        });
    </script>
</asp:Content>
