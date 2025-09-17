<%@ Page Title="Copiar dados" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.CopiarDados" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Tipo seleção</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Campos</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Produtos destino</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="TIPOSELECAO" Title="Tipo seleção" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VTCOPIARDADOSPRODUTO.TIPO_SELECAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COPIAR_DADOS_PRODUTO" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="CAMPOS" Title="Campos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="Z_CAMPOS.COPIAR_DADOS_PRODUTO.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COPIAR_DADOS_PRODUTO" Level="20" Order="20"  /></div>
          </div>
          <div class="tab-pane" id="tab3">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="PRODUTODESTINO" Title="Produtos destino" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOS.COPIAR_DADOS.DESTINO.GRID" DefaultFilterName="Filtro produto destino" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COPIAR_DADOS_PRODUTO" Level="20" Order="30"  /></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript">
            const associarEventosClickTipoSelecao = function() {
  $( "#ParaTodosTitulo,#ParaTodosIcone" ).unbind('click').click(function() {
    selecionarParaTodos();
    $("#ctl00_Main_TIPOSELECAO_TIPOSELECAO_HiddenField").val("2");
  });

  $( "#ParaIrmaosTitulo,#ParaIrmaosIcone").unbind('click').click(function() {
    selecionarParaIrmaos();
    $("#ctl00_Main_TIPOSELECAO_TIPOSELECAO_HiddenField").val("1");
  });
};

const selecionarParaTodos = () => {
    $("#ParaTodosIcone a i").removeClass("icon-close").addClass("icon-check");
    $("#ParaTodosIcone").toggleClass("done", true);
    $("#ParaIrmaosIcone a i").removeClass("icon-check").addClass("icon-close");
    $("#ParaIrmaosIcone").toggleClass("done", false);
};

const selecionarParaIrmaos = () => {
    $("#ParaIrmaosIcone a i").removeClass("icon-close").addClass("icon-check");
    $("#ParaIrmaosIcone").toggleClass("done", true);
    $("#ParaTodosIcone a i").removeClass("icon-check").addClass("icon-close");
    $("#ParaTodosIcone").toggleClass("done", false);
};

const tratarTipoSelecaoAtual = () => {
  var tipoSelecaoAtual = $("#ctl00_Main_TIPOSELECAO_TIPOSELECAO_HiddenField").val();
  if (tipoSelecaoAtual == "1") { 
    selecionarParaIrmaos();
  } else {
    selecionarParaTodos();  
  }
};

$(document).ready(function() {
  $("#ctl00_Main_TIPOSELECAO_TIPOSELECAO_HiddenField").val("1");
  selecionarParaIrmaos();
  
  associarEventosClickTipoSelecao();

  var prm = Sys.WebForms.PageRequestManager.getInstance();

  prm.add_endRequest(associarEventosClickTipoSelecao);
  prm.add_endRequest(tratarTipoSelecaoAtual);
});
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
    