<%@ Page Title="Tabelas auxiliares - Unidades de medida" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Unidades de medida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_UNIDADESMEDIDA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__UNIDADESMEDIDA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="UNIDADESALTERNATIVAS" class="active"><a data-toggle="tab" href="#tabUNIDADESALTERNATIVAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Unidades alternativas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabUNIDADESALTERNATIVAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="UNIDADESALTERNATIVAS" Title="Unidades alternativas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_UNIDADESMEDIDASALTERNATIVA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.UNIDADE = @CAMPO(HANDLE)" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__UNIDADESMEDIDA_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    