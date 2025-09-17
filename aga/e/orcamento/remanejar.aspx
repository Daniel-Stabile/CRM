<%@ Page Title="Remanejar" Language="C#" CodeFile="~/aga/e/orcamento/remanejar.aspx.cs" Inherits="orcamentoremanejarPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
      <ContentTemplate>
         <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
         <asp:HiddenField runat="server" ID="FiltroOrigem" Value="1" ClientIDMode="Static" />
         <asp:HiddenField runat="server" ID="FiltroDestino" Value="1" ClientIDMode="Static" />
      </ContentTemplate>
   </asp:updatepanel>
    <div class="portlet light row" id="form_wizard">
        <div class="portlet-body form wizard-orcamentos">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Filtro</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Remanejar</span></a></li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row">
                                <wes:AjaxForm
                                    runat="server"
                                    ID="FILTRO"
                                    Title="Filtro"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="REMANEJAR.FILTRO.FORM"
                                    FormMode="ReadOnly"
                                    IncludeRecordInRecentItems="False"
                                    UserDefinedCommandsVisible="True"
                                    Level="20"
                                    Order="10" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab2">
                            <div class="row">
                                <wes:CommandsPanel
                                    runat="server"
                                    ID="PAINELCOMANDOS"
                                    Title="PAINELCOMANDOS"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="FILTRO"
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="REMANEJAR.COMANDOS.GRID"
                                    VerticalOrientation="False"
                                    Level="20"
                                    Order="20"
                                    Visible="true" />
                            </div>
                            <div class="tabbable-line">
                                <ul class="nav nav-tabs ">
                                    <li class="active">
                                        <a href="#tab_15_1" data-toggle="tab" aria-expanded="true">Remanejamento </a>
                                    </li>
                                    <li class="">
                                        <a href="#tab_15_2" data-toggle="tab" aria-expanded="false">Histórico </a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tab_15_1">
                                        <div id="remanejar">
                                            <orcamento-remanejar />
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="tab_15_2">
                                        <div class="row">
                                            <wes:SimpleGrid
                                                runat="server"
                                                ID="ORIGEM"
                                                Title="Origem"
                                                Subtitle=""
                                                PortletCssClass=""
                                                PortletLayout="Default"
                                                BootstrapCols="6"
                                                FontIcon=""
                                                ShowTitle="true"
                                                ProviderWidgetUniqueId="FILTRO"
                                                ChromeState="Fixed"
                                                CanDelete="False"
                                                CanUpdate="False"
                                                CanInsert="False"
                                                EntityViewName="REMANEJAR.HISTORICO.GRID"
                                                Mode="None"
                                                UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="False"
                                                CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause=""
                                                ShowExport="True"
                                                UserDefinedDisableRowSelection="False"
                                                Level="20"
                                                Order="10" />
                                            <wes:SimpleGrid
                                                runat="server"
                                                ID="DESTINO"
                                                Title="Destino"
                                                Subtitle=""
                                                PortletCssClass=""
                                                PortletLayout="Default"
                                                BootstrapCols="6"
                                                FontIcon=""
                                                ShowTitle="true"
                                                ProviderWidgetUniqueId="FILTRO"
                                                ChromeState="Fixed"
                                                CanDelete="False"
                                                CanUpdate="False"
                                                CanInsert="False"
                                                EntityViewName="REMANEJAR.HISTORICO.GRID"
                                                Mode="None"
                                                UserDefinedSelectColumnVisible="False"
                                                UserDefinedPageSize="10"
                                                SystemFilterOnly="False"
                                                DisplayRowCommand="False"
                                                CompanyFilterMode="OnlyCompany"
                                                UserDefinedCriteriaWhereClause=""
                                                ShowExport="True"
                                                UserDefinedDisableRowSelection="False"
                                                Level="20"
                                                Order="20" />
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
    <script type="text/javascript">
        function ValoresRemanejados(valores) {
            if (Benner.OrcamentoRemanejarStore != undefined)
            {
                DefinirChaveRemanejamento();

                Benner.OrcamentoRemanejarStore.state.orcamentoRemanejar.remanejamentos = valores;
                Benner.OrcamentoRemanejarStore.state.orcamentoRemanejar.filtro = ObterFiltro();
                this.Erp.remanejamentos = valores;
            }
        }

        function DefinirChaveRemanejamento() {
            if (localStorage.getItem("chaveRemanejamento") == null)
                localStorage.setItem("chaveRemanejamento", '1');
            else
                localStorage.setItem("chaveRemanejamento", parseInt(localStorage.getItem("chaveRemanejamento")) + 1);
        }

        function ObterFiltro() {
            if (Benner.Page.FILTRO == undefined) return;

            var filtroFields = Benner.Page.FILTRO.fields();

            return { 
                VersaoOrcamento : filtroFields.versaoorcamento,
                Historico : filtroFields.historico,
                
                FilialOrigem : filtroFields.filialorigem.id,
                ContaOrigem : filtroFields.contaorigem.id,
                CentroCustoOrigem : filtroFields.ccorigem != null ? filtroFields.ccorigem.id : null,
                CentroCustoGerencialOrigem : filtroFields.ccgerencialorigem != null ? filtroFields.ccgerencialorigem.id : null,
                ProjetoOrigem : filtroFields.projetoorigem != null ? filtroFields.projetoorigem.id : null,
                ProjetoGerencialOrigem : filtroFields.projgerencialorigem != null ? filtroFields.projgerencialorigem.id : null,
                InicioOrigem : filtroFields.inicioorigem,
                FimOrigem : filtroFields.fimorigem,

                FilialDestino : filtroFields.filialdestino.id,
                ContaDestino : filtroFields.contadestino.id,
                CentroCustoDestino : filtroFields.ccdestino != null ? filtroFields.ccdestino.id : null,
                CentroCustoGerencialDestino : filtroFields.ccgerencialdestino != null ? filtroFields.ccgerencialdestino.id : null,
                ProjetoDestino : filtroFields.projetodestino != null ? filtroFields.projetodestino.id : null,
                ProjetoGerencialDestino : filtroFields.projgerencialdestino != null ? filtroFields.projgerencialdestino.id : null,
                InicioDestino : filtroFields.handle,
                FimDestino : filtroFields.handle
            };
        }

        var app = new window.Vue({
            el: '#remanejar',
            store: Benner.OrcamentoRemanejarStore
        });
        
        $(function () {
            // default form wizard
            $('#form_wizard').bootstrapWizard({
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
                    $('#form_wizard').find('.progress-bar').css({
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
        });
    </script>
</asp:Content>
