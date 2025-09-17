<%@ Page Title="Materiais / Serviços Externos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="MATERIALSERVIOEXTERNO" Title="Material / Serviço Externo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOPRODUTOS.NOVAORDEM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_MATERIAISSERVICOSEXTERNOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="UTILIZAODOPRODUTONOVECULO" Title="Utilização do produto no veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="MATERIALSERVIOEXTERNO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMSERVICOPRODUTOS.UTILIZACAOPRODUTOVEICULO.GRID" DefaultFilterName="Filtro datas" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_MATERIAISSERVICOSEXTERNOS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    