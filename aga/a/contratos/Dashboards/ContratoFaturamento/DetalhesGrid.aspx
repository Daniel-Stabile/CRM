<%@ Page Title="Detalhes" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.faturamento.dashboard.DetalhesGrid" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ANALITICO_INDICADORES" Title="Indicadores faturamento - Analítico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONTRATOS_FATURAMENTO_ANALITICO_INDICADORES.DATASOURCE.ANALITICO.GRID" DefaultFilterName="Filtro analítico indicadores" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_DASHBOARDS_CONTRATOFATURAMENTO_DETALHESGRID" Level="20" Order="10"  />
        </div>
    
        <style>
              #ANALITICO_INDICADORES th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    