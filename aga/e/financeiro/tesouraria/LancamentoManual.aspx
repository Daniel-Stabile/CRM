<%@ Page Title="Lan&ccedil;amento manual" Language="C#" CodeFile="~/aga/e/financeiro/tesouraria/LancamentoManual.aspx.cs" Inherits="tesourariaLancamentoManualPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

   
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" />
            <asp:HiddenField runat="server" ID="DocumentoCriado" Value="" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
            <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa fa-check"></i>Sele&ccedil;&atilde;o Conta</span></a></li>
            <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa fa-check"></i>Documento</span></a></li>
            <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa fa-check"></i>Movimenta&ccedil;&otilde;es</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
            <div class="tab-pane active" id="tab1">
                <div class="row">
                    <wes:SimpleGrid 
                        runat="server" 
                        ID="SELEODECONTA" 
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
                        UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT A.HANDLE FROM FN_CONTASTESOURARIA A LEFT JOIN GN_PESSOAS C ON A.FORNECEDOR = C.HANDLE, FN_TIPOSCONTAS B WHERE A.EMPRESA = @EMPRESA AND A.TIPOCONTA = B.HANDLE AND A.CONTAINATIVA = 'N')"
                        UserDefinedPageSize="10"
                        SystemFilterOnly="False" 
                        DisplayRowCommand="True" 
                        CompanyFilterMode="OnlyCompany" 
                        ShowExport="True" 
                        UserDefinedDisableRowSelection="False"
                        PageId="LANCAMENTOMANUALAUTO"
                        Level="20"
                        Order="10"  />

                </div>
            </div>
            <div class="tab-pane active" id="tab2">
                <div class="row">
                    <wes:AjaxForm runat="server" 
                        ID="FORMTS_LANCAMENTOS"
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
                        CanInsert="True"
                        EntityViewName="VT_FN_LANCAMENTO_MANUAL.TESOURARIA.FORM"
                        FormMode="Insert"
                        IncludeRecordInRecentItems="True"
                        UserDefinedCommandsVisible="True" Order="100" />
                </div>
            </div>
            <div class="tab-pane active" id="tab3">
                <div class="row">
                    <wes:SimpleGrid
                        runat="server"
                        ID="MOVIMENTACOES"
                        Title="Movimentações"
                        Subtitle=""
                        PortletCssClass=""
                        PortletLayout="None"
                        ProviderWidgetUniqueId="FORMTS_LANCAMENTOS" 
                        BootstrapCols="12"
                        FontIcon=""
                        ShowTitle="true"
                        ChromeState="Normal"
                        CanDelete="False"
                        CanUpdate="False"
                        CanInsert="False"
                        UserDefinedCriteriaWhereClause="A.LANCAMENTOTESOURARIA = 1"
                        EntityViewName="FN_MOVIMENTACOES.LANCAMENTOMANUAL.GRID"
                        DefaultFilterName="Por data"
                        Mode="Selectable"
                        UserDefinedSelectColumnVisible="False"
                        UserDefinedPageSize="20"
                        SystemFilterOnly="False"
                        DisplayRowCommand="True"
                        CompanyFilterMode="None"
                        ShowExport="True"
                        UserDefinedDisableRowSelection="True"
                        Order="105" />
                </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    <script type="text/javascript">

        Sys.Application.add_init(appl_init);
        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_endRequest(EndHandler);
        }

        var toolBarFiltrosTopo = document.getElementById('ctl00_Main_FORMTS_LANCAMENTOS_toolbar');
        var btnProximoFiltrosTopo = $(toolBarFiltrosTopo).children(".btn-save")[0];

        function afterAsyncPostBack() {
            if ($('#ctl00_Main_FORMTS_LANCAMENTOS_toolbar .btn-save').length > 0)
                $('#ctl00_Main_FORMTS_LANCAMENTOS_toolbar .btn-save').remove();

            if ($('#ctl00_Main_FORMTS_LANCAMENTOS_toolbar').length > 0)
                document.getElementById('ctl00_Main_FORMTS_LANCAMENTOS_toolbar').append(btnProximoFiltrosTopo);

            if ($(btnProximoFiltrosTopo).length > 0)
                $(btnProximoFiltrosTopo).attr("href", "javascript:__doPostBack('ctl00$Main$FORMTS_LANCAMENTOS', 'Save')");

            if ($('#ctl00_Main_FORMTS_LANCAMENTOS_FormContainer .commands-bar').length > 0) {
                $($(document.getElementById('ctl00_Main_FORMTS_LANCAMENTOS_FormContainer')).children(".commands-bar")[0]).remove();
            }
        }

        function EndHandler() {           
            afterAsyncPostBack();
        }

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
    