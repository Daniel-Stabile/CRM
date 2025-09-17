<%@ Page Title="Conjuntos" Language="C#" CodeFile="~/Frotas/a/CadastroVeiculos/Conjunto/Grid.aspx.cs" Inherits="CadastroVeiculoForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONJUNTOS" Title="COnjuntos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MA_RECURSOPARTES.PARTES_CONJUNTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Frotas/a/CadastroVeiculos/Conjunto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_A_CADASTROVEICULO_CONJUNTO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    