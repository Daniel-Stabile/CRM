<%@ Page Title="Planos - Projetos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Projeto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PROJETOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_PLANOS__PROJETOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7560" class="active"><a data-toggle="tab" href="#tabWIDGET_7560"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alçadas por filial")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7560">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7560" Title="Alçadas por filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FILIAIS.ALCADA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="((SELECT COUNT(ALCADA.HANDLE) FROM CP_GRUPOALCADAS ALCADA WHERE ALCADA.FILIAL = A.HANDLE AND ALCADA.EHALCADAPROJETO = 'S') &gt; 0)" FormUrl="~/aga/a/f/aga_t720_at7560_hsdef18963.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__PROJETOS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    