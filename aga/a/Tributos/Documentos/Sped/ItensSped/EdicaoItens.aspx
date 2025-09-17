<%@ Page Title="Itens do documento" Language="C#" CodeFile="~/aga/a/Tributos/Documentos/Sped/ItensSped/EdicaoItens.aspx.cs" Inherits="ItensSpedEdicaoItensPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ITENSDODOCUMENTO" Title="Itens do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="ED_ITENS.TRIBUTOSFISCAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_SPED_ITENSSPED_EDICAOITENS" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="ITEMDODOCUMENTO" Title="Item do documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITENSDODOCUMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="ED_ITENS.TRIBUTOSFISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_SPED_ITENSSPED_EDICAOITENS" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    