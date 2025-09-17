<%@ Page Title="Empenhos" Language="C#" Inherits="aga.a.Financeiro.tesouraria.Empenhos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="EMPENHOS" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="TS_LANCAMENTOSEMPENHOS.TESOURARIA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_TESOURARIA_EMPENHOS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="EMPENHO" Title="Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="EMPENHOS" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="TS_LANCAMENTOSEMPENHOS.TESOURARIA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_TESOURARIA_EMPENHOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    