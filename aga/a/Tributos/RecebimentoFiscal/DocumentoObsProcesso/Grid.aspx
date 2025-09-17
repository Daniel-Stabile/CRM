<%@ Page Title="Processos Referenciados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDFN_DOCUMENTOOBSPROCESSO" Title="Processos Referenciados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSPROCESSO.RECEBIMENTOFISCAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_RECEBIMENTOFISCAL_DOCUMENTOOBSPROCESSO_GRID" Level="20" Order="100"  />
        <wes:AjaxForm runat="server" ID="PROCESSOREFERENCIADO" Title="Processo Referenciado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRIDFN_DOCUMENTOOBSPROCESSO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSPROCESSO.PROCESSOSREFERENCIADOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_RECEBIMENTOFISCAL_DOCUMENTOOBSPROCESSO_GRID" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    