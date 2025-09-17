<%@ Page Title="Lançamento de Código de Barras" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.CodigoBarras.Lancamentos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="Contas a pagar" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.CODIGOBARRAS.GRID" DefaultFilterName="Filtro padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_CODIGOBARRAS_LANCAMENTOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    