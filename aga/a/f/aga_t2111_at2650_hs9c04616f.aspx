<%@ Page Title="Cláusulas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATO_PERMISSOES__CLAUSULAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3690" class="active"><a data-toggle="tab" href="#tabWIDGET_3690"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parágrafos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3690">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3690" Title="Parágrafos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLAUSULA = @CAMPO(HANDLE) AND A.CONTRATO = @CAMPO(CONTRATO))" FormUrl="~/aga/a/f/aga_t2111_at3690_hs5e62a7f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_PERMISSOES__CLAUSULAS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    