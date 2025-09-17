<%@ Page Title="Início" Language="C#" CodeFile="~/aga/e/ativo/inicio.aspx.cs" Inherits="ativoHomePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Web" Namespace="Benner.Erp.Web" TagPrefix="aga" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <aga:AGAResource runat="server" Src="~/Content/aga/js/complete.js" />

    <div class="row">
        <wes:CommandsPanel runat="server" 
            ID="BOTOES" 
            Title="Botões" 
            Subtitle="" 
            PortletCssClass="" 
            PortletLayout="Default" 
            BootstrapCols="12" 
            FontIcon="" 
            ShowTitle="false" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            EntityViewName="WEB_AT_MODULO.FORM" 
            CanDelete="False" 
            CanUpdate="False" 
            CanInsert="False" 
            VerticalOrientation="False" 
            PageWidgetHandle="13551" 
            Level="20"
            Order="1"  />
    </div>

    <div id="container-filtros">
        <div class="col-md-10 col-xs12 col-sm-12">
            <h1 class="page-title">Dashboard <small>ativo</small></h1>
        </div>
    </div>

    <div class="row">
        <wes:Tile runat="server" 
            ID="BENSATIVOSNOIMOBILIZADO" 
            Title="Bens ativos no imobilizado" 
            Subtitle="" 
            PortletCssClass="" 
            PortletLayout="None" 
            BootstrapCols="3" 
            FontIcon="" 
            ShowTitle="true" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            CanDelete="True" 
            CanUpdate="True" 
            CanInsert="True" 
            EntityViewName="AT_BENS_ATIVOS.DATASOURCE.GRID" 
            CompanyFilterMode="OnlyCompany" 
            Value="CODIGOREDUZIDO" 
            Description="Bens ativos no imobilizado" 
            CommandName="CMD_REDIRECIONAR_BENS"
            Icon="fa fa-building" 
            Color="blue" 
            ValueAggregation="Count" 
            TileType="Default" 
            PageWidgetHandle="22510" 
            Level="20"        
            Order="10"  />

        <wes:Tile runat="server" 
            ID="MOVIMENTAESNOPERODO" 
            Title="Movimentações no período" 
            Subtitle="" 
            PortletCssClass="" 
            PortletLayout="None" 
            BootstrapCols="3" 
            FontIcon="" 
            ShowTitle="true" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            CanDelete="True" 
            CanUpdate="True" 
            CanInsert="True" 
            EntityViewName="AT_MOVIMENTACOES_DOPERIODO.DATASOURCE.GRID" 
            CompanyFilterMode="OnlyCompany" 
            Value="DATA" 
            Description="Movimentações no período" 
            Icon="fa fa-exchange" 
            Color="green" 
            ValueAggregation="Count" 
            TileType="Default" 
            PageId="TESTE" 
            Level="20" 
            Order="20"  />
    
        <wes:Tile runat="server" 
            ID="CALCULOS" 
            Title="NOMESITUACAO" 
            Subtitle="" 
            PortletCssClass="" 
            PortletLayout="None" 
            BootstrapCols="3" 
            FontIcon="" 
            ShowTitle="False" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            CanDelete="True" 
            CanUpdate="True" 
            CanInsert="True" 
            EntityViewName="AT_LOGBTLCALCULOS.DATASOURCE.GRID" 
            CompanyFilterMode="OnlyCompany" 
            CriteriaWhereClause="A.SITUACAO = 5" 
            Status="NOMESITUACAO" 
            TotalValue="SITUACAO" 
            Value="SITUACAO" 
            Description="Status último cálculo" 
            Icon="fa fa-exchange" 
            Color="green" 
            ValueAggregation="Count" 
            TileType="Progress" 
            Level="20" 
            Order="30"  />

        <wes:AmCharts runat="server" 
            ID="INVENTRIOSDOPATRIMNIO" 
            Title="Status dos inventários dos bens" 
            Subtitle="" 
            PortletCssClass=""
            PortletLayout="Default" 
            BootstrapCols="6" 
            FontIcon="" 
            ShowTitle="true" 
            ProviderWidgetUniqueId="" 
            ChromeState="Normal" 
            CanDelete="True" 
            CanUpdate="True" 
            CanInsert="True" 
            EntityViewName="ATIVO_INVENTARIOS.DATASOURCE.GRID" 
            CommandName="CMD_INVENTARIOS"
            Mode="None" 
            CompanyFilterMode="OnlyCompany" 
            ChartType="Pie"
            ChartHeight="200" 
            ChartDefinition="eyJ0eXBlIjoicGllIiwibGFuZ3VhZ2UiOiJwdCIsInRoZW1lIjoibGlnaHQiLCJwdWxsT3V0T25seU9uZSI6dHJ1ZSwiZXhwb3J0Ijp7ImVuYWJsZWQiOnRydWV9LCJ0aXRsZUZpZWxkIjoic3RhdHVzIiwidmFsdWVGaWVsZCI6InF0ZGUiLCJhbHBoYUZpZWxkIjoiZmlsbF9hbHBoYV9maWVsZCIsImJhbGxvb25UZXh0IjoiW1t0aXRsZV1dPGJyPjxzcGFuIHN0eWxlPSdmb250LXNpemU6MTRweCc+PGI+W1t2YWx1ZV1dPC9iPiAoW1twZXJjZW50c11dJSk8L3NwYW4+IiwibGFiZWxUZXh0IjoiW1t2YWx1ZV1dIiwibGFiZWxzRW5hYmxlZCI6dHJ1ZSwibGVnZW5kIjp7ImVuYWJsZWQiOnRydWUsImFsaWduIjoiY2VudGVyIiwibWFya2VyVHlwZSI6ImNpcmNsZSIsInBvc2l0aW9uIjoicmlnaHQiLCJsYWJlbFRleHQiOiJbW3RpdGxlXV0iLCJ2YWx1ZVRleHQiOiJbW3BlcmNlbnRzXV0lIn0sImlubmVyUmFkaXVzIjoiMCUiLCJhbmdsZSI6MzAsImRlcHRoM0QiOjMwfQ==" 
            PageWidgetHandle="22587" 
            Level="20" 
            Order="50"  />

        <wes:SimpleGrid runat="server" 
            ID="RAZOAUXILIAR" 
            Title="Razão auxiliar" 
            Subtitle=""  PortletCssClass="" PortletLayout="Default" 
            BootstrapCols="6" 
            FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" 
            CanDelete="False" CanUpdate="False" CanInsert="False" 
            EntityViewName="AT_RAZAO_AUXILIAR_ATIVO_RESUMIDO.DATASOURCE.GRID" 
            Mode="None" UserDefinedSelectColumnVisible="False" 
            UserDefinedPageSize="10" SystemFilterOnly="False" 
            DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" 
            ShowExport="False" UserDefinedDisableRowSelection="True" 
            PageId="TESTE" Level="20" Order="70"  />
    </div>
    
    <script>
        ExibirMenusModuloAtivo();
    </script>

</asp:Content>
