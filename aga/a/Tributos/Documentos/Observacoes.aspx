<%@ Page Title="Observações do documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="OBSERVAESDODOCUMENTO" Title="Observações do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOOBSERVACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_OBSERVACOES" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="OBSERVAESDODOCUMENTO_1" Title="Observações do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="OBSERVAESDODOCUMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSERVACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_OBSERVACOES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    