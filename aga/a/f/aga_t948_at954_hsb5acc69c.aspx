<%@ Page Title="Tipo de documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tipo de documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_TIPOSDOCUMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOS_DE_DOCUMENTOS_FORM" Level="20" Order="10"  />
      <div class="col-md-7"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BAIXAS" class="active"><a data-toggle="tab" href="#tabBAIXAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Baixas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_879"><a data-toggle="tab" href="#tabWIDGET_879"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Retenções de impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPODOCUMENTODIRDES"><a data-toggle="tab" href="#tabTIPODOCUMENTODIRDES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipo documento Dir/Des")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabBAIXAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="BAIXAS" Title="Baixas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_TIPODOCUMENTOBAIXAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TIPODOCUMENTO = @CAMPO(HANDLE))" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOS_DE_DOCUMENTOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_879">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_879" Title="Retenções de impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_TIPODOCUMENTOIMPOSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPODOCUMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1215_at879_hse7460b4e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOS_DE_DOCUMENTOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPODOCUMENTODIRDES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TIPODOCUMENTODIRDES" Title="Tipo documento Dir/Des" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_TIPODOCTIPODOCDIRDES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TIPODOCUMENTO = @CAMPO(HANDLE))" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOS_DE_DOCUMENTOS_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(function () {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
	if (!pagina.get_isInAsyncPostBack()) {
		pagina.add_endRequest(ControlElements);
	}
    
	ControlElements();
});

function ControlElements() {
	$('#ColunaImposto').parent().parent().css("text-align","left");
}

            </script>
      </asp:Content>
    