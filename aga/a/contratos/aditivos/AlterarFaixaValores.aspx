<%@ Page Title="Faixa por valores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="FAIXAVALORES" Title="Faixa valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ADITIVOOBJETOFAIXAVALORES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 2" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_ADITIVOS_ALTERARFAIXAVALORES" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="FAIXAVALORES_1" Title="Faixa valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FAIXAVALORES" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ADITIVOOBJETOFAIXAVALORES.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_ADITIVOS_ALTERARFAIXAVALORES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    