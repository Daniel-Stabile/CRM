<%@ Page Title="Monitor de integrações da NFe / NFes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.faturamento.FaturamentoMonitorIntegracoeNFPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="MONITORDEINTEGRAO" Title="Monitor de Integração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TQ_FATURAMENTOELETRONICO.MONITORINTEGRACOES.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CM_MONITORINTEGRACAONFE" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="INTEGRACONFENFES" Title="Status Integração NFe / NFSe" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="MONITORDEINTEGRAO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TQ_FATURAMENTOELETRONICO.MONITORINTERGRACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CM_MONITORINTEGRACAONFE" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    