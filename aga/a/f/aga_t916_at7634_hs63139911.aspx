<%@ Page Title="Composição de custos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Composição de custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTASGERENCIAIS.COMPOSICAODECUSTOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_CONTAGERENCIAL_CUSTOS__COMPOSICAOCUSTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7635" class="active"><a data-toggle="tab" href="#tabWIDGET_7635"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas contábeis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7636"><a data-toggle="tab" href="#tabWIDGET_7636"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cálculo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7635">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7635" Title="Contas contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTAGERENCIALCONTAS.COMPOSICAODECUSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t917_at7635_hs7773e59b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONTAGERENCIAL_CUSTOS__COMPOSICAOCUSTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7636">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7636" Title="Cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTAGERENCIALORCAMENTARIAS.COMPOSICAODECUSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2025_at7636_hsaea554e3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONTAGERENCIAL_CUSTOS__COMPOSICAOCUSTOS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    