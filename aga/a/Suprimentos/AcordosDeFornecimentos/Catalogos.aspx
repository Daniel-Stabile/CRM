<%@ Page Title="Acordos de fornecimentos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.AcordosDeFornecimento.CatalogosGrid" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CATALGOS" Title="Catálogos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_CATALOGOSFORNECIMENTO.CATALOGOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/Suprimentos/AcordosDeFornecimentos/Catalogos/CatalogosForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ACORDOSDEFORNECIMENTOS_CATALOGOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    