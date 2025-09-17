<%@ Page Title="Gerar variações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.GerarVariacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="Filtro" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VT_GERARVARIACOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_GERARVARIACOES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="Variacoes" Title="Variações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_GERARVARIACOES" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    