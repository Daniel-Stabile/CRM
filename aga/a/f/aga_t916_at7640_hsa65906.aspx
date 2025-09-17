<%@ Page Title="Origens e aplicações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Origens e aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTASGERENCIAIS.SPED.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_CONTAGERENCIAL_IMUNES__CONTAGERENCIAL_IMUNES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7642" class="active"><a data-toggle="tab" href="#tabWIDGET_7642"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas contábeis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7643"><a data-toggle="tab" href="#tabWIDGET_7643"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cálculo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7642">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7642" Title="Contas contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAGERENCIALCONTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t917_at7642_hsd5a7c810.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONTAGERENCIAL_IMUNES__CONTAGERENCIAL_IMUNES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7643">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7643" Title="Cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAGERENCIALORCAMENTARIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2025_at7643_hsb33a83d9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONTAGERENCIAL_IMUNES__CONTAGERENCIAL_IMUNES_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    