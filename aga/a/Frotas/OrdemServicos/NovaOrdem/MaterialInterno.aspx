<%@ Page Title="Materiais Internos" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.a.OrdemServico.MateriaisInternos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="MATERIALINTERNO" Title="Material Interno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMPRODUTOINTERNOS.NOVAORDEM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_MATERIALINTERNO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="UTILIZAODOPRODUTONOVECULO" Title="Utilização do produto no veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="MATERIALINTERNO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMPRODUTOINTERNOS.UTILIZACAOPRODUTOVEICULO.GRID" DefaultFilterName="Filtro datas" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_MATERIALINTERNO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    