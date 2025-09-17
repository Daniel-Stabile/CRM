<%@ Page Title="Wizard2" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Geral</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Visita</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Avaliações</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGETID_636050441166321948" Title="Geral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="VT_CM_VISITA_GERAL.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_REP_VISITAS_WIZARD2" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGETID_636050441578737623" Title="Visita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="VT_CM_VISITA_VISITA.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_REP_VISITAS_WIZARD2" Level="20" Order="20"  /></div>
          </div>
          <div class="tab-pane" id="tab3">
            <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGETID_636051256729646185" Title="Avaliações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="VT_CM_VISITAAVALIACAO.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PORTAL_REP_VISITAS_WIZARD2" Level="20" Order="30"  /></div>
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
      });
    </script>
      </asp:Content>
    