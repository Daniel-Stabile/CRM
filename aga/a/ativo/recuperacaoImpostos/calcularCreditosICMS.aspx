<%@ Page Title="Calcular créditos de ICMS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CALCULAR" class="active"><a data-toggle="tab" href="#tabCALCULAR">Calcular</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FATORESDECRDITO"><a data-toggle="tab" href="#tabFATORESDECRDITO">Fatores de crédito</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabCALCULAR">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CALCULAR" Title="Calcular" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_VTCALCULOCIAP.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CALCULAR_CREDITOS_ICMS" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabFATORESDECRDITO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FATORESDECRDITO" Title="Fatores de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_CREDITOICMSFATORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t1767_at1823_hse7a1ebbe.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULAR_CREDITOS_ICMS" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    