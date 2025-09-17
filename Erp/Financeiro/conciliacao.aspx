<%@ Page Title="Conciliação bancária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCONTA" Title="Conta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_FN_CONTASTESOURARIA.FINANCEIRO.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = 36" UserDefinedCommandsVisible="True" PageId="ERP_FINANCEIRO_CONCILIACAO" Level="20" Order="50"  />
        <wes:ActionView runat="server" ID="CONCILIACAO" Title="Conciliação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMCONTA" ChromeState="Normal" Controller="Conciliacao" Action="Index" PageId="ERP_FINANCEIRO_CONCILIACAO" Level="20" Order="80"  />
        </div>
    
        <script type="text/javascript">
              var checkExtratoChange = function(event) {
    var handle = $( event.target ).closest( "tr" ).attr('handle');
    /*if($( event.target ).is(":checked"))
        alert('Marcou o lançamento no extrato, handle: ' + handle);
    else
        alert('Desmarcou o lançamento no extrato, handle: ' + handle);
    */
};

var checkSistemaChange = function(event) {
    var handle = $( event.target ).closest( "tr" ).attr('handle');
    /*if($( event.target ).is(":checked"))
        alert('Marcou o lançamento no sistema, handle: ' + handle);
    else
        alert('Desmarcou o lançamento no sistema, handle: ' + handle);
    */
};

$(".action-extrato input[type=checkbox]" ).on( "click", checkExtratoChange );
$(".action-sistema input[type=checkbox]" ).on( "click", checkSistemaChange );

              </script>
        <style>
              .truncate-historico {
  max-width: 100px;
  white-space: nowrap;
  overflow: hidden;
  text-overflow: ellipsis;
}

              </style>
      </asp:Content>
    