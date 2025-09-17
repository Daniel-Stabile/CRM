<%@ Page Title="Boletos bancários" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.BloquetosBancarios,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:UpdatePanel ID="UPStep" runat="server" UpdateMode="Always" xmlns:asp="http://www.asp.net"><ContentTemplate><asp:HiddenField runat="server" ID="CurrentStep" Value="1" ClientIDMode="Static" /></ContentTemplate></asp:UpdatePanel>
<div class="portlet light" id="form_wizard">
  <div class="portlet-body form">
    <div class="form-wizard">
      <div class="form-body">
        <ul class="nav nav-pills nav-justified steps">
          <li><a data-toggle="tab" class="step" href="#tab1"><span class="number">1</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Boletos</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab2"><span class="number">2</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Parcelas</span></a></li>
          <li><a data-toggle="tab" class="step" href="#tab3"><span class="number">3</span><span class="desc"><i class="fa-duotone fa-check fa-fw"></i>Títulos</span></a></li>
        </ul>
        <div id="bar" class="progress progress-striped" role="progressbar">
          <div class="progress-bar progress-bar-success"></div>
        </div>
        <div class="tab-content">
          <div class="tab-pane active" id="tab1">
            <div class="row">
    <wes:AjaxForm runat="server" ID="BLOQUETOSBANCRIOS" Title="Boletos" Subtitle="filtros" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-barcode" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="WEB_FN_BLOQUETOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_BLOQUETOS_EMITIR" Level="20" Order="10"  /></div>
          </div>
          <div class="tab-pane" id="tab2">
            <div class="row">
    <wes:AjaxForm runat="server" ID="FILTROS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BLOQUETOSBANCRIOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_FN_BLOQUETOS_FILTROS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_BLOQUETOS_EMITIR" Level="20" Order="20"  /></div>
          </div>
          <div class="tab-pane" id="tab3">
            <div class="row">
    <wes:SimpleGrid runat="server" ID="TTULOS" Title="Títulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_A_FN_BLOQUETOS_TITULOS.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_BLOQUETOS_EMITIR" Level="20" Order="30"  /></div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
    
    <script type="text/javascript">
            //Armazenamento temporário dos itens selecionados
var selecionados = [];

var toolBarFiltrosTopo = document.getElementById('ctl00_Main_FILTROS_toolbar');
var btnProximoFiltrosTopo = $(toolBarFiltrosTopo).children(".btn-save")[0];

function beforeAsyncPostBack() {
    var checkados = $('[type=checkbox]:checked');
    $.each(checkados, function(i, chk){
        var hnd = $(chk).closest('tr').attr('handle');
        if(hnd !== '' && (selecionados.indexOf(hnd) <0 ) )
        {
            selecionados.push(hnd);
            $('#ctl00_Main_BLOQUETOSBANCRIOS_SELECIONADOS_HiddenField').val(selecionados.join(","));
        }
    });
}

function afterAsyncPostBack() {
    // Trocar ordem de botões no Filtro
    if($('#ctl00_Main_FILTROS_toolbar .btn-save').length > 0)
        $('#ctl00_Main_FILTROS_toolbar .btn-save').remove();
    
    if($('#ctl00_Main_FILTROS_toolbar').length > 0)
        document.getElementById('ctl00_Main_FILTROS_toolbar').append(btnProximoFiltrosTopo);
        
    if($(btnProximoFiltrosTopo).length >0 )
        $(btnProximoFiltrosTopo).attr("href", "javascript:__doPostBack('ctl00$Main$FILTROS', 'Save')");
    
    if ($('#ctl00_Main_FILTROS_FormContainer .commands-bar').length > 0) {
        $($(document.getElementById('ctl00_Main_FILTROS_FormContainer')).children(".commands-bar")[0]).remove();
    }
    // Fim

    var seletor = 'tr[handle="{0}"] > td > label > [type=checkbox]';
    
    for (var i = 0; i < selecionados.length; i++) {
        var chk = $(seletor.replace('{0}', selecionados[i]));
        if(chk.length > 0) {
            chk.prop('checked', true);
        }
    }
    
    VerificarTodosSelecionados();
}

Sys.Application.add_init(appl_init);
function appl_init() {
    var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
    pgRegMgr.add_beginRequest(BeginHandler);
    pgRegMgr.add_endRequest(EndHandler);
}

function BeginHandler() {
    beforeAsyncPostBack();
}

function EndHandler() {           
    afterAsyncPostBack();
}

function VerificarTodosSelecionados(){
    console.log(selecionados);
    //Se o todas as linhas estiverem marcadas marcar tbm o chk do cabeçalho da tabela
    var tableRows = $('#ctl00_Main_TTULOS_SimpleGrid tr');
    
    $('th > label > [type=checkbox]').prop('checked', tableRows.length == ($('td > label > [type=checkbox]:checked').length +1));
    
}

$(function(){
    $(document).on('click', function(e){
        if (e.originalEvent.srcElement !== null && e.originalEvent.srcElement !== undefined) {
            if (e.originalEvent.srcElement.type == 'checkbox') {
                var handle = $(e.originalEvent.srcElement).closest('tr').attr('handle');
                
                if (!e.originalEvent.srcElement.checked && handle !== '') {
                    if(handle == undefined){
                        selecionados = [];
                        $('#ctl00_Main_BLOQUETOSBANCRIOS_SELECIONADOS_HiddenField').val(null);
                    }
                    RemoverSelecionado(handle);
                }
                else if (selecionados.indexOf(handle) <0) {
                    selecionados.push(handle);
                    $('#ctl00_Main_BLOQUETOSBANCRIOS_SELECIONADOS_HiddenField').val(selecionados.join(","));
                }
                
                VerificarTodosSelecionados();
                beforeAsyncPostBack();
            }
        }
    })
    
    function RemoverSelecionado(hnd){
        
        var index = selecionados.indexOf(hnd);
        if (index > -1) {
            selecionados.splice(index, 1);
            
        }
        VerificarTodosSelecionados();
    }
    
})

            </script>
    <style>
            .table.table-hover.simple-grid td{
    cursor: default!important;
}
.table >tbody >tr >td {
    padding: 3px!important;
}

.table a:hover {
    cursor: default!important;
    text-decoration: none!important
}

            </style><script type="text/javascript">
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
    