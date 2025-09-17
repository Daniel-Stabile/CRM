<%@ Page Title="Desempenho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:FilterWidget runat="server" ID="FILTRO" Title="FILTRO" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOSESTRATEGICOS.FILTRO.GRID" DefaultFilterName="Filtro desempenho" Mode="FixedRequired" PageId="DESEMPENHO_MAPA_ESTRATEGICO" Level="20" Order="13"  />
        <wes:SimpleGrid runat="server" ID="PERSPECTIVAS_1" Title="Perspectivas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="INDICADOR_DESEMPENHO_PERSPECTIVAS_MAPA_ESTRATEGICO.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@CONDICAO('PLANEJAMENTOESTRATEGICO', 'IGUAL', PLANEJAMENTO) AND
(@CONDICAO('CICLO', 'IGUAL', CICLO) OR CICLO IS NULL) AND
@CONDICAO('PERSPECTIVA', 'IGUAL', PERSPECTIVA)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="DESEMPENHO_MAPA_ESTRATEGICO" Level="20" Order="40"  />
        <wes:SimpleGrid runat="server" ID="OBJETIVOS_1" Title="Objetivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="INDICADOR_DESEMPENHO_OBJETIVOS_MAPA_ESTRATEGICO.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@CONDICAO('PLANEJAMENTOESTRATEGICO', 'IGUAL', PLANEJAMENTO) AND
@CONDICAO('CICLO', 'IGUAL', CICLO) AND
@CONDICAO('PERSPECTIVA', 'IGUAL', PERSPECTIVA) AND
@CONDICAO('HANDLE', IGUAL, OBJETIVO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="DESEMPENHO_MAPA_ESTRATEGICO" Level="20" Order="50"  />
        <wes:SimpleGrid runat="server" ID="INDICADORES_1" Title="Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="INDICADOR_DESEMPENHO_INDICADORES_MAPA_ESTRATEGICO.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="@CONDICAO('PLANEJAMENTOESTRATEGICO', 'IGUAL', PLANEJAMENTO) AND
@CONDICAO('CICLO', 'IGUAL', CICLO) AND
@CONDICAO('PERSPECTIVA', 'IGUAL', PERSPECTIVA) AND
@CONDICAO('OBJETIVO', 'IGUAL', OBJETIVO)
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="DESEMPENHO_MAPA_ESTRATEGICO" Level="20" Order="60"  />
        </div>
    
      </asp:Content>
    