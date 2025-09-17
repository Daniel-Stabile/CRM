<%@ Page Title="Parâmetros do módulo SPED - ECD" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Parâmetros do módulo SPED - ECD" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_PARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_EMPRESA__PARAMETROS_DO_MODULO_SPED_ECD_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6416" class="active"><a data-toggle="tab" href="#tabWIDGET_6416"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Demonstrações contábeis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6416">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6416" Title="Demonstrações contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_ED_PARAMETROPLANOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PARAMETRO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4162_at6416_hs6ad16715.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_EMPRESA__PARAMETROS_DO_MODULO_SPED_ECD_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    