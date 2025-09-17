<%@ Page Title="Configurações apuração DIFAL/FCP - Estados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configurações apuração DIFAL/FCP - Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOESTADOSDIFAFCP.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS_DIFA_FCP__DIFA_FCP_ESTADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8068" class="active"><a data-toggle="tab" href="#tabWIDGET_8068"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Fórmulas de cálculo apuração DIFAL/FCP")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8068">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8068" Title="Fórmulas de cálculo apuração DIFAL/FCP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_IMPOSTOESTADOFORMULADIFAFCP.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTOESTADODIFAFCP = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5544_at8068_hsbe1dd5f7.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_DIFA_FCP__DIFA_FCP_ESTADOS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    