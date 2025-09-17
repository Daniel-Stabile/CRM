<%@ Page Title="Calcular depreciação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CALCULARDEPRECIAO" class="active"><a data-toggle="tab" href="#tabCALCULARDEPRECIAO">Calcular depreciação</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOG"><a data-toggle="tab" href="#tabLOG">Logs do último cálculo</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabCALCULARDEPRECIAO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CALCULARDEPRECIAO" Title="Calcular depreciação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_VTCALCULARDEPRECIACAOBENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CALCULAR_DEPRECIACAO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabLOG">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOG" Title="Logs do último cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AT_LOGBTLCALCULOS.DATASOURCE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CALCULAR_DEPRECIACAO" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    