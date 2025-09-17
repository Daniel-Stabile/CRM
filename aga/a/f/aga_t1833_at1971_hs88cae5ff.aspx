<%@ Page Title="Inventários de bens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Inventários de bens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_INVENTARIOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ATIVO__INVENTARIOS_DE_BENS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4848" class="active"><a data-toggle="tab" href="#tabWIDGET_4848"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Bens inventariados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1972"><a data-toggle="tab" href="#tabWIDGET_1972"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Bens inventariados")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4848">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4848" Title="Bens inventariados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_ITEMINVENTARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INVENTARIO = @CAMPO(HANDLE)) AND (A.DATA = @CAMPO(DATA))" FormUrl="~/aga/a/f/aga_t1834_at4848_hs18c839d4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ATIVO__INVENTARIOS_DE_BENS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1972">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1972" Title="Bens inventariados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AT_ITEMINVENTARIOS.LEITURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.INVENTARIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1834_at1972_hs72b68113.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ATIVO__INVENTARIOS_DE_BENS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    