<%@ Page Title="Editar item" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="EDITARITEM" Title="Editar item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CM_VTEDICAOITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_FATURAMENTO_EDITARITEM" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              $(function () {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
	if (!pagina.get_isInAsyncPostBack()) {
		pagina.add_endRequest(AjustarCampos);
	}
    
	AjustarCampos();
});


function AjustarCampos() {
    $('label[data-field=EHMOVIMENTACAOFISICA]').parent().parent().attr("style", "margin-bottom: 1px;");
}

              </script>
      </asp:Content>
    