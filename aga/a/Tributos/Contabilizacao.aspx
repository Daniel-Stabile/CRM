<%@ Page Title="Contabilização" Language="C#" Inherits="aga.a.Tributos.tributosContabilizacaoPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONTABILIZAO" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOS.TRIBUTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_CONTABILIZACAO" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="CONTABILIZAO_1" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONTABILIZAO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOS.TRIBUTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_CONTABILIZACAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    