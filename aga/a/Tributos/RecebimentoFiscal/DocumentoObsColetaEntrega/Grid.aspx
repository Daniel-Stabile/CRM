<%@ Page Title="Local de coleta e entrega" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDFN_DOCUMENTOOBSCOLETAENTREGA" Title="Local de coleta e entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSCOLETAENTREGA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_RECEBIMENTOFISCAL_DOCUMENTOOBSCOLETAENTREGA_GRID" Level="20" Order="100"  />
        <wes:AjaxForm runat="server" ID="LOCALDECOLETAEENTREGA" Title="Local de coleta e entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRIDFN_DOCUMENTOOBSCOLETAENTREGA" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOOBSCOLETAENTREGA.RECEBIMENTOFISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_RECEBIMENTOFISCAL_DOCUMENTOOBSCOLETAENTREGA_GRID" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    