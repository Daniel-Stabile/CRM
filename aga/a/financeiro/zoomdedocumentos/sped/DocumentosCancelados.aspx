<%@ Page Title="Documentos cancelados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOSCANCELADOS" Title="Documentos cancelados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOINFDOCCANCELADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_SPED_DOCUMENTOSCANCELADOS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="DOCUMENTOSCANCELADOS_1" Title="Documentos cancelados" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOSCANCELADOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOINFDOCCANCELADOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_SPED_DOCUMENTOSCANCELADOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    