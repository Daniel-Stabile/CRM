<%@ Page Title="Grupos de alçadas - Ativos" Language="C#" CodeFile="~/aga/a/f/aga_t1645_at8039_hse56c35d7.aspx.cs" Inherits="faga_t1645_at8039_hse56c35d7Page" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Grupos de alçadas - Ativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CP_GRUPOALCADAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PASTA_DE_GRUPOS_ALCADAS__ATIVOS_FORM" Level="20" Order="1"  />
      <div class="col-md-5"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1534" class="active"><a data-toggle="tab" href="#tabWIDGET_1534"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Integrantes do grupo de alçada")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1534">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1534" Title="Integrantes do grupo de alçada" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CP_GRUPOALCADASINTEGRANTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1646_at1534_hsaffaf53a.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_GRUPOS_ALCADAS__ATIVOS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    