<%@ Page Title="Gerar notas fiscais" Language="C#" Inherits="aga.a.contratos.faturamento.GerarNotasFiscaisPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Parâmetros</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Filtros</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Registros a gerar</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="PARAMETROSPARAGERACAO" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CN_PARAMETROSNOTASFISCAIS.CUSTOM.FORM" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_FATURAMENTO_GERARNOTASFISCAIS" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtros" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_CN_FILTROFATURAMENTO.GERARNOTASFISCAIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.TIPO = 2)" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_FATURAMENTO_GERARNOTASFISCAIS" Level="20" Order="20"  /></div>
          </div>
          <div class="tab-pane" id="tab3">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="OBJETOS" Title="Registros a gerar" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_CN_LIBERACOESFATURAMENTO.GERARNOTASFISCAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedDisableRowSelection="True" PageId="AGA_A_CONTRATOS_FATURAMENTO_GERARNOTASFISCAIS" Level="20" Order="30"  /></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript">
            var prm = window.Sys.WebForms.PageRequestManager.getInstance();
if (!prm.get_isInAsyncPostBack()) {
    prm.add_endRequest(function () {
        Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Gerar");');
        Erp.contaItensChecadosEmGrid('OBJETOS', 'top-PROCESSAR', 'Gerar');
    });
}

Erp.associarCallbackEmGridSelecao('OBJETOS', 'Erp.contaItensChecadosEmGrid("OBJETOS", "top-PROCESSAR", "Gerar");');

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
    