<%@ Page Title="Classificação de serviços prestados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CLASSIFICAODESERVIOSPRESTADOS" Title="Classificação de serviços prestados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="PORTAL_REINF_TABELA_SERVICOSPRESTADOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/PortalReinf/a/Tabelas/ServicosPrestados.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_REINF_TABELA_SERVICOSPRESTADOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    