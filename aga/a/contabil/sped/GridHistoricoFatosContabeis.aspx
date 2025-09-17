<%@ Page Title="SPED Histórico fatos contábeis" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="HISTRICOFATOSCONTBEIS" Title="Histórico fatos contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="ED_HISTORICOSFATOSCONTABEIS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_SPED_GRIDHISTORICOFATOSCONTABEIS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="HISTRICOFATOCONTBIL" Title="Histórico fato contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="HISTRICOFATOSCONTBEIS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="ED_HISTORICOSFATOSCONTABEIS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_SPED_GRIDHISTORICOFATOSCONTABEIS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    