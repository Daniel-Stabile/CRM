<%@ Page Title="Centro de custo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CENTRODECUSTO" Title="Centro de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CENTROSDECUSTOSVINCULADO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.CONTABEIS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_LANCAMENTOS_NOVOLANCAMENTOCC" Level="20" Order="2"  />
        <wes:SimpleGrid runat="server" ID="CENTROSDECUSTOSVINCULADO" Title="Centros de custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.NEW.CUSTOM.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_LANCAMENTOS_NOVOLANCAMENTOCC" Level="20" Order="12"  />
        </div>
    
        <script type="text/javascript">
              var prm = window.Sys.WebForms.PageRequestManager.getInstance();
if (!prm.get_isInAsyncPostBack()) {
    prm.add_endRequest(function () {
        var temp = $('#CENTRODECUSTO_GERAL').find('[data-class="note-info"]');
        $('#CENTRODECUSTO_GERAL').find('[data-class="form-group"]').remove();
        $('#CENTRODECUSTO_GERAL').find('[data-class="note-info"]').remove();
        var formGroup = $('<div class="form-group row" data-class="form-group"></div>');
        $.each(temp, function(index, cmp){
           var divCol = $('<div class="col-md-4 col-sm-4 value"></div>');
           divCol.append(cmp);
           formGroup.append(divCol);
        });
        
        $('#CENTRODECUSTO_GERAL').prepend(formGroup);
    });
}

var temp = $('#CENTRODECUSTO_GERAL').find('[data-class="note-info"]');
$('#CENTRODECUSTO_GERAL').find('[data-class="note-info"]').remove();
var formGroup = $('<div class="form-group row" data-class="form-group"></div>');
$.each(temp, function(index, cmp){
   var divCol = $('<div class="col-md-4 col-sm-4 value"></div>');
   divCol.append(cmp);
   formGroup.append(divCol);
});

$('#CENTRODECUSTO_GERAL').prepend(formGroup);

$(function (){
   // $('#ctl00_Main_CENTRODECUSTO_toolbar > a').trigger('click');
})

              </script>
        <style>
              #ctl00_Main_CENTRODECUSTO .note{
    margin: 0px;
    padding: 10px 15px 1px 15px;
}

              </style>
      </asp:Content>
    