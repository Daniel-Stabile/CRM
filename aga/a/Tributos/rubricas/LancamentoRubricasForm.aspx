<%@ Page Title="Lançamento de rubricas" Language="C#" Inherits="aga.a.Tributos.rubricas.rubricasLancamentoRubricasFormPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LANAMENTODERUBRICAS" Title="Lançamento de rubricas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="10" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_RUBRICALANCAMENTOS.COMSECOES.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_RUBRICAS_LANCAMENTORUBRICASFORM" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              var Pagina = window.Sys.WebForms.PageRequestManager.getInstance();
if (!Pagina.get_isInAsyncPostBack()) {
    Pagina.add_pageLoaded(function(){
        $('#ctl00_Main_LANAMENTODERUBRICAS_PageControl_GERAL_GERAL_GRPVALOR').remove();
        $('#ctl00_Main_LANAMENTODERUBRICAS_PageControl_GERAL_GERAL_GRPCPRB').remove();
    });
}

              </script>
      </asp:Content>
    