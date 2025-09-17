<%@ Page Title="Encontro de contas" Language="C#"  Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.Processos.EncontroContasIndividualPage" %>
      
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Selecionar contas</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Selecionar baixas</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
    <wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_ENCONTRODECONTAS.GRID" VerticalOrientation="False" PageId="AGA_E_FINANCEIRO_PROCESSOS_ENCONTROCONTAS" Level="20" Order="5" DisplayCommandExecutedDefaultMessage="false"  />
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:FilterWidget runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_PARCELAS.GRID" DefaultFilterName="Encontro de contas" Mode="FixedRequired" PageId="AGA_E_FINANCEIRO_PROCESSOS_ENCONTROCONTAS" Level="20" Order="10"  />
    <wes:SimpleGrid runat="server" ID="CONTASAPAGAR" Title="Contas a pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.ENCONTROCONTASCPA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="20"  />
    <wes:SimpleGrid runat="server" ID="CONTASARECEBER" Title="Contas a receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.ENCONTROCONTASCRE.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="30"  />
            </div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:AjaxForm runat="server" ID="PARMETROSPARABAIXA" Title="Par&acirc;metros para baixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_VT_BAIXACPACRE.ENCONTROCONTAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="50"  />
            </div>
          </div>
      </div>
    </div>
  </div>
</div>
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
            LimparClasseTopAction('CONTASARECEBER');
            LimparClasseTopAction('CONTASAPAGAR');
        });
    </script>
      </asp:Content>
    