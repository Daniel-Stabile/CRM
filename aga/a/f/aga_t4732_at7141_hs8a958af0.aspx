<%@ Page Title="Configurações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configurações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_CARGATRIBVIGENCIA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_TRIBUTARIA_VIGENCIA__VIGENCIA_CARGA_TRIBUTARIA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7139" class="active"><a data-toggle="tab" href="#tabWIDGET_7139"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos estimados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7140"><a data-toggle="tab" href="#tabWIDGET_7140"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valores dos itens do documento")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7139">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7139" Title="Impostos estimados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_CARGATRIBCOMPOSICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.VIGENCIACARGATRIBUTARIA = @CAMPO(HANDLE) AND A.CAMPO IS NULL" FormUrl="~/aga/a/f/aga_t4735_at7139_hs68cc9f46.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_TRIBUTARIA_VIGENCIA__VIGENCIA_CARGA_TRIBUTARIA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7140">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7140" Title="Valores dos itens do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_CARGATRIBCOMPOSICAO.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.VIGENCIACARGATRIBUTARIA = @CAMPO(HANDLE) AND A.IMPOSTO IS NULL" FormUrl="~/aga/a/f/CargaTributariaComposicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_TRIBUTARIA_VIGENCIA__VIGENCIA_CARGA_TRIBUTARIA_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    