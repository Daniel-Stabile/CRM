<%@ Page Title="Itens a faturar" Language="C#" Inherits="aga.a.comercial.ItensFaturar.ItensFaturarPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Filtro</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Itens</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Faturar</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FILTRO.ITENSFATURAR.NOTAFISCAL.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_NOTAFISCAL_GERACAO" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="ITENSFATURARNOTAFISCALGRID.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="True" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_NOTAFISCAL_GERACAO" Level="20" Order="20"  /></div>
          </div>
          <div class="tab-pane" id="tab3">
            <div class="row">
    <wes:AjaxForm runat="server" ID="FATURAR" Title="Faturar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FILTRO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FATURAR.ITENSFATURAR.NOTAFISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.FATURAR = @CAMPO(FATURAR)" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_NOTAFISCAL_GERACAO" Level="20" Order="30"  /></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript">
            $(function () {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
	if (!pagina.get_isInAsyncPostBack()) {
		pagina.add_endRequest(HideRadioButton);
	}
    
	HideRadioButton();
});


function HideRadioButton() {
	$('#ctl00_Main_FILTRO_PageControl_GERAL_GERAL').find('label:contains("roformas")').addClass("hidden");
	$('#ctl00_Main_FATURAR_PageControl_GERAL_GERAL').find('label:contains("roformas")').addClass("hidden");
}

            </script><script type="text/javascript">
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
    