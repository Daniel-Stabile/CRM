<%@ Page Title="Resultado Cálculos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.producao.NecessidadeLiquida.ResultadoCalculos.ResultadoCalculosResultadosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="RESULTADOGERAL" Title="Resultado Geral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_NECESSIDADELIQUIDACALCGERAL.RESULTADOCALCULO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PRODUCAO_RESULTADOCALCULOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="MANUFATURADOS" Title="Manufaturados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_NECLIQRESULTCALCMANUFATURAD.RESULTADOCALCULO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PRODUCAO_RESULTADOCALCULOS" Level="20" Order="16"  />
        <wes:SimpleGrid runat="server" ID="INSUMOS" Title="Insumos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_NECLIQRESULTCALCINSUMOS.RESULTADOCALCULO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PRODUCAO_RESULTADOCALCULOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    