<%@ Page Title="Resultado Calculo" Language="C#"  Inherits="Benner.Corporativo.Wes.WebApp.aga.a.producao.NecessidadeLiquida.ResultadoCalculoNecessidadeLiquida.ResultadoCalculoNecessidadeLiquidaResultadoCalculoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <%--<wes:FilterWidget runat="server" ID="FILTROPRODUTOSGERAL" Title="Filtro Produtos Geral" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_VTFILTRORESULTADONECESLIQ.GRID" DefaultFilterName="Padrão" Mode="Fixed" PageId="AGA_A_PRODUCAO_RESULTADOCALCULONECESSIDADELIQUIDA_RESULTADOCALCULO" Level="20"  />--%>
        <wes:SimpleGrid runat="server" ID="GRIDRESULTADOGERAL" Title="Resultado Geral" UserDefinedSelectColumnVisible ="false" UserDefinedDisableRowSelection="true" DisplayRowCommand="True"/>
        <%--<wes:FilterWidget runat="server" ID="FILTROPRODUTOSMANUFATURADOSEINSUMOS" Title="Filtro Produtos Manufaturados e Insumos" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_VTFILTRONLMANUFINSUMOS.GRID" DefaultFilterName="Padrão" Mode="Fixed" PageId="AGA_A_PRODUCAO_RESULTADOCALCULONECESSIDADELIQUIDA_RESULTADOCALCULO" Level="20"   />--%>
        <wes:SimpleGrid runat="server" ID="GRIDMANUFATUARDOS" Title="Manufaurados" UserDefinedSelectColumnVisible ="true" UserDefinedDisableRowSelection="true"/>
        <wes:SimpleGrid runat="server" ID="GRIDINSUMOS" Title="Insumos" UserDefinedSelectColumnVisible ="true" UserDefinedDisableRowSelection="true"/>
        
        </div>
    
      </asp:Content>
    