<%@ Page Title="Liberar Parcelas" Language="C#" Inherits="aga.a.Financeiro.LiberarParcelas" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LIBERARPARCELAS" Title="LIBERAR PARCELAS" Subtitle="Contas a pagar" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="WEB_FN_PARCELAS_LIBERAR_CONTASAPAGAR.GRID" DefaultFilterName="Filtro" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_LIBERARPARCELAS_GRIDLIBERARCONTASAPAGAR" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    