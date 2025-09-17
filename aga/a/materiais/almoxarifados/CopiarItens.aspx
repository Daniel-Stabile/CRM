<%@ Page Title="Copiar itens" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.almoxarifados.CopiarItens" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="PRODUTOS" Title="Copiar itens entre almoxarifados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_PRODUTOS.COPIARITENSALMOXARIFADO.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_ALMOXARIFADOS_COPIARITENS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    