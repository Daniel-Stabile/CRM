<%@ Page Title="Item consumo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.ItemConsumo.ItemConsumoformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="ITEMCONSUMO" Title="Item consumo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="PR_ITEMCONSUMOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ITEMCONSUMO_FORM" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="INFORMAESLOTE" Title="Informações Lote" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITEMCONSUMO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ITEMCONSUMOLOTES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ITEMCONSUMO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ITEMCONSUMO_FORM" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    