<%@ Page Title="Gerar ordem de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.GerarOrdemDeCompraProposta" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Propostas selecionadas</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Dados finais</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="PROPOSTASSELECIONADAS" Title="Propostas selecionadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DADOSFINAIS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_COTACOESCAPAITENS.COTACOES_PROPOSTA_GERAR_OC.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT MIN(COTACAOCAPAITENS.HANDLE) FROM CP_COTACOESCAPAITENS COTACAOCAPAITENS
JOIN CP_REQUISICAOPRODUTOS REQPRODUTO ON COTACAOCAPAITENS.REQUISICAOPRODUTO = REQPRODUTO.HANDLE
JOIN CP_REQUISICAOCOTACOES REQCOTACOES ON REQPRODUTO.HANDLE = REQCOTACOES.COTACAO
WHERE (FILTROCOTACAOCAPA)
AND REQPRODUTO.TIPO = 'C'
AND REQPRODUTO.STATUS = 1
AND REQPRODUTO.COMPRADOR = @CAMPO(COMPRADOR)
AND REQPRODUTO.FORNECEDOR IS NOT NULL
AND REQCOTACOES.STATUS = 1
AND REQCOTACOES.SELECIONADO = 2
AND REQCOTACOES.COMPRADOR = @CAMPO(COMPRADOR)
AND REQCOTACOES.DATAVALIDADE &gt;= @HOJE
GROUP BY COTACAOCAPAITENS.FORNECEDOR, COTACAOCAPAITENS.COTACAOCAPA)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERACAOORDEMCOMPRAWIZARDPROPOSTA" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:AjaxForm runat="server" ID="DADOSFINAIS" Title="Dados finais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_VT_GERARORDEMCOMPRACOTACOES.COTACOES_PROPOSTA_GERAR_OC.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERACAOORDEMCOMPRAWIZARDPROPOSTA" Level="20" Order="20"  /></div>
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
    