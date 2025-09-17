<%@ Page Title="Competências" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Competências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_ED_COMPETENCIAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="SPED__COMPETENCIAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PERODOS" class="active"><a data-toggle="tab" href="#tabPERODOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Períodos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabPERODOS">
                    <div class="row">
    <wes:HtmlPanel runat="server" ID="PERODOS" Title="Períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" HtmlBase64="IAo8ZGl2IGNsYXNzPSJ2dWUiIGlkPSJ0cmVldnVlLWRpdiI+CiAgICAKICAgIDx3ZXMtbXRyZWV2aWV3ICBpZD0ibWV1dHJlZXZpZXciIGhhbmRsZT0iQENBTVBPKEhBTkRMRSkiIHRhYmVsYT0iRURfQ09NUEVURU5DSUFTIiBjYXJnYT0iU1BFRF9DT01QRVRFTkNJQVMiIHJlY29yZGhhbmRsZXM9IkVEX0NPTVBFVEVOQ0lBPTE5Ij48L3dlcy1tdHJlZXZpZXc+Cgo8L2Rpdj4KCgoKPHN0eWxlID4KICAgIC5qc3RyZWUtZGVmYXVsdCBhLmpzdHJlZS1zZWFyY2ggeyBjb2xvcjojRTM1QjVBICFpbXBvcnRhbnQ7IH0KICAgIC5mYS1mb2xkZXIgLAogICAgLmZhLWZvbGRlci1vIHsKICAgICAgICAgIGNvbG9yOiAjQzQ5RjQ3OwogICAgfQogICAgLmZhLWZpbGVzLW8gLAogICAgLmZhLWZpbGUtdGV4dC1vIHsKICAgICAgICAgIGNvbG9yOiAjNUM5QkQxOwogICAgfQo8L3N0eWxlPgo=" PageId="SPED__COMPETENCIAS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    