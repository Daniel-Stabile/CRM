<%@ Page Title="Registro de EPI's" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GERENCIAMENTODEEPIS" Title="Gerenciamento de EPI's" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="MF_ORDEMSERVICOSEPIS.REGISTROEPIS.GRID" DefaultFilterName="Filtro Gerenciamento de Epi" Mode="FixedRequired" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/Frotas/RegistroEpis/NovaOrdem.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_REGISTROEPIS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    