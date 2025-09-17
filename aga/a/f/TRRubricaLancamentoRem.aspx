<%@ Page Title="Remetente do Lançamento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="REMETENTEDOLANAMENTO_1" Title="Remetente do Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REMETENTEDOLANAMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_RUBRICALANCAMENTOSREM.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_TRIBUTOS_TR_RUBRICALANCAMENTOS_TR_RUBRICALANCAMENTOSREM_GRID" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="REMETENTEDOLANAMENTO" Title="Remetente do Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_RUBRICALANCAMENTOSREM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_TRIBUTOS_TR_RUBRICALANCAMENTOS_TR_RUBRICALANCAMENTOSREM_GRID" Level="20" Order="40"  />
        </div>
    
      </asp:Content>
    