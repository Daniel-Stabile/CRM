<%@ Page Title="Aprovação da segunda alçada" Language="C#" CodeFile="~/aga/e/financeiro/OfficeBanking/ConfirmarRemessa.aspx.cs" Inherits="OfficeBankingConfirmarRemessaPage" %>


<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:updatepanel>
    <div class="portlet light" id="form_wizard">
        <div class="portlet-body form">
            <div class="form-wizard">
                <div class="form-body">
                    <ul class="nav nav-pills nav-justified steps">
                        <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Sele&ccedil;&atilde;o da Conta</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Sele&ccedil;&atilde;o de servi&ccedil;o</span></a></li>
                        <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa fa-check"></i>Sele&ccedil;&atilde;o das parcelas</span></a></li>
                    </ul>
                    <div id="bar" class="progress progress-striped" role="progressbar">
                        <div class="progress-bar progress-bar-success"></div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab1">
                            <div class="row">
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="CONTA"
                                    Title="Seleção de conta"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="FN_CONTASTESOURARIA.LANCAMENTOMANUAL.GRID"
                                    Mode="Selectable"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageId="LANCAMENTOMANUALAUTO"
                                    Level="20"
                                    Order="10" />
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab2">
                            <div class="row">
                                <wes:AjaxForm runat="server"
                                    ID="REMESSA"
                                    Title="Documento"
                                    Subtitle=""
                                    ShowTitle="true"
                                    PortletCssClass="bg-white"
                                    PortletLayout="None"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="GN_PREREMESSAS.SEGUNDAALCADA.FORM"
                                    FormMode="Edit"
                                    IncludeRecordInRecentItems="True" 
                                    UserDefinedCommandsVisible="True" Order="100" />
                            </div>
                        </div>
                        <div class="tab-pane active" id="tab3">
                            <div class="row">
                                <wes:CommandsPanel 
                                    runat="server" 
                                    ID="COMANDOS" 
                                    Title="Comandos" 
                                    Subtitle="" 
                                    PortletCssClass="" 
                                    PortletLayout="Default" 
                                    BootstrapCols="12" 
                                    FontIcon="" 
                                    ShowTitle="false" 
                                    ProviderWidgetUniqueId="" 
                                    ChromeState="Normal" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="GN_PREREMESSAS.SEGUNDAALCADA.GRID" 
                                    VerticalOrientation="False" 
                                    PageId="APROVACAOPREREMESSAS" 
                                    Level="20" 
                                    Order="20"  />
                                <wes:Tile
                                    runat="server"
                                    ID="VALORTOTAL_TILE"
                                    Title=""
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="3"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="TTULOS"
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="FN_PARCELAPREREMESSAS.CUSTOM.GRID"
                                    CompanyFilterMode="OnlyCompany"
                                    ValueFormat="0.00"
                                    Prefix="Valor total"
                                    Description=""
                                    Icon="fa fa-dollar"
                                    Color="red"
                                    TileType="Flat"
                                    PageId="AGA_E_FINANCEIRO_OFFICEBANKING_PREREMESSA"
                                    Level="20"
                                    Order="5" />
                                <wes:Tile
                                    runat="server"
                                    ID="TOTALDESCONTO_TILE"
                                    Title=""
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="3"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="TTULOS"
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="FN_PARCELAPREREMESSAS.CUSTOM.GRID"
                                    CompanyFilterMode="OnlyCompany"
                                    ValueFormat="0.00"
                                    Prefix="Total desconto"
                                    Description=""
                                    Icon="fa fa-dollar"
                                    Color="red"
                                    TileType="Flat"
                                    PageId="AGA_E_FINANCEIRO_OFFICEBANKING_PREREMESSA"
                                    Level="20"
                                    Order="7" />
                                <wes:Tile
                                    runat="server"
                                    ID="VALORESBAIXADOS_TILE"
                                    Title=""
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="3"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="TTULOS"
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="FN_PARCELAPREREMESSAS.CUSTOM.GRID"
                                    CompanyFilterMode="OnlyCompany"
                                    ValueFormat="0.00"
                                    Prefix="Valor total baixado"
                                    Description=""
                                    Icon="fa fa-dollar"
                                    Color="red"
                                    TileType="Flat"
                                    PageId="AGA_E_FINANCEIRO_OFFICEBANKING_PREREMESSA"
                                    Level="20"
                                    Order="8" />
                                <wes:Tile
                                    runat="server"
                                    ID="VALORTOTALLQUIDO_TILE"
                                    Title=""
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="3"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="TTULOS"
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="FN_PARCELAPREREMESSAS.CUSTOM.GRID"
                                    CompanyFilterMode="OnlyCompany"
                                    ValueFormat="0.00"
                                    Prefix="Valor total líquido"
                                    Description=""
                                    Icon="fa fa-dollar"
                                    Color="red"
                                    TileType="Flat"
                                    PageId="AGA_E_FINANCEIRO_OFFICEBANKING_PREREMESSA"
                                    Level="20"
                                    Order="9" />
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="TTULOS"
                                    Title="Títulos"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="True"
                                    CanInsert="True"
                                    EntityViewName="FN_PARCELAPREREMESSAS.CUSTOM.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx"
                                    ShowExport="True" UserDefinedDisableRowSelection="False"
                                    PageId="AGA_E_FINANCEIRO_OFFICEBANKING_PREREMESSA"
                                    Level="20"
                                    Order="10" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <style type="text/css">
        .widget-thumb .widget-thumb-body .widget-thumb-body-stat {
            font-size: 18px;
        }
    </style>
    <script type="text/javascript">
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
