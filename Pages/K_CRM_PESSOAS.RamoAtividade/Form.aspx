<%@ Page Title="Ramo de Atividade" Language="C#" CodeFile="~/Pages/K_CRM_PESSOAS.RamoAtividade/Form.aspx.cs" Inherits="RamoAtividadeFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Ramo de Atividade</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Questionário de Qualificação</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="K_RAMODEATIVIDADE" Title="Ramo de Atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAS.RAMOATIVIDADE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_PESSOASRAMOATIVIDADE_FORM" Level="50" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:ActionView runat="server" ID="K_QUESTIONRIODEQUALIFICAO" Title="Questionário de Qualificação" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" Controller="CrmPesquisa" Action="Pesquisa" PageId="K_PAGES_K_CRM_PESSOASRAMOATIVIDADE_FORM" Level="50" Order="20"  /></div>
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

      var currentStep = $("#CurrentStep").val();

      document.addEventListener("DOMContentLoaded", function () {
      var btnVoltar = document.getElementById('btnVoltar');
          $("#btnVoltar").click(function () {
          //console.log(currentStep);
              //$('[href="#tab' + currentStep + '"]').tab('show');
              window.location.reload(1);

              const msgUser = $("div[id$=MsgUser]")
                if (!!(msgUser[0]) && msgUser.html().indexOf("A ação foi executada") > 0) {
                    msgUser.remove()
                }
      });      
      });

    </script>
      </asp:Content>
    