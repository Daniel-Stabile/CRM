<%@ Page Title="Acoplagem Rapida" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.e.AcoplagemRapida.AcoplagemRapida" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ACOPLAGEMRAPIDA" Title="Acoplagem Rapida" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="VT_MF_ACOPLAGEMRAPIDA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="MF_ACOPLAGEMRAPIDA" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="VEICULOSDISPONIVEIS" Title="Veiculos Disponiveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ACOPLAGEMRAPIDA.DATASOURCE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="MF_ACOPLAGEMRAPIDA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    