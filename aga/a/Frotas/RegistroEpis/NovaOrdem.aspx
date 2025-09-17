<%@ Page Title="Nova Ordem" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.a.RegistroEPIs.NovaOrdem" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDEMDEEPI" class="active"><a data-toggle="tab" href="#tabORDEMDEEPI">Ordem de Epi</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EPIS_1"><a data-toggle="tab" href="#tabEPIS_1">EPI's</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabORDEMDEEPI">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ORDEMDEEPI" Title="Ordem de Epi" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOSEPIS.NOVAORDEM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_REGISTROEPIS_NOVAORDEM" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabEPIS_1">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EPIS_1" Title="EPI's" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEEPI" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOSEPISPRODUTOS.REQUISICAOEPIS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_REGISTROEPIS_NOVAORDEM" Level="20" Order="30"  />
    <wes:AjaxForm runat="server" ID="EPIS" Title="EPI's" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="EPIS_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOSEPISPRODUTOS.REGISTROEPIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_REGISTROEPIS_NOVAORDEM" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDEEPI" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMSERVICOSEPIS.AUDITORIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_REGISTROEPIS_NOVAORDEM" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    