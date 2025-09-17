<%@ Page Title="Gerar variações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Materiais.GerarVariacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
      <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VT_GERARVARIACOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_E_MATERIAIS_GERARVARIACOES" Level="20" Order="10"  />
		<wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_VT_GERARVARIACOES_COMANDOS.FORM" VerticalOrientation="False" PageId="AGA_E_MATERIAIS_GERARVARIACOES" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="Variacoes" Title="Variações" BootstrapCols="6" UserDefinedSelectColumnVisible="True" CanView="false" UserDefinedDisableRowSelection="true" />
        </div>
    
      </asp:Content>
    