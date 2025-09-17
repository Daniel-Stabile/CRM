<%@ Page Title="Performance Test" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.SiteSettings.PerformanceTestPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="METABELASDOSISTEMA" Title="Metabelas do Sistema" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="Z_TABELAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.TIPO = 'S'" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PERFORMANCETEST" Level="15" Order="10"  />
        <wes:Tile runat="server" ID="TEMPOGERAOARQUIVOS" Title="Tempo Geração Arquivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_TABELAS.GRID" CompanyFilterMode="OnlyCompany" Value="0" Description="Tempo Geração Arquivos" Icon="fa fa-hourglass-2" Color="default" ValueAggregation="None" TileType="Default" PageId="PERFORMANCETEST" Level="15" Order="16"  />
        <wes:Tile runat="server" ID="TEMPOEXCLUSOARQUIVOS" Title="Tempo Exclusão Arquivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_TABELAS.GRID" CompanyFilterMode="OnlyCompany" Value="0" Description="Tempo Exclusão Arquivos" Icon="fa fa-trash" Color="default" ValueAggregation="None" TileType="Default" PageId="PERFORMANCETEST" Level="15" Order="18"  />
        <wes:AjaxForm runat="server" ID="METATABELA" Title="Metatabela" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="METABELASDOSISTEMA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="Z_TABELAS.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PERFORMANCETEST" Level="15" Order="20"  />
        </div>
    
      </asp:Content>
    