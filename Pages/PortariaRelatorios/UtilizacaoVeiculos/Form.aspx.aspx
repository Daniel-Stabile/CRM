<%@ Page Title="Utilização de Veículos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="UTILIZAODEVECULOS" Title="Utilização de Veículos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_AGENDA_PORTARIARELATORIOS_UTILIZACAOVEICULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="50" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/Pages/PortariaRelatorios/UtilizacaoVeiculos/Form.aspx.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_PORTARIARELATORIOS_UTILIZACAOVEICULOS" Level="30" Order="10"  />
        </div>
    
      </asp:Content>
    