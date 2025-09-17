<%@ Page Title="Apontamentos trocar nome" Language="C#" Inherits="aga.a.producao.Apontamentos.ApontamentosDetalhadoGridPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="APONTAMENTOSDETALHADOS" Title="Apontamentos detalhados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="PR_ORDEMPRODUCAOAPONTAMENTOS.DETALHADO.GRID" DefaultFilterName="Filtro detalhado" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/OrdemProducaoApontamento/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_APONTAMENTOSDETALHADO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    