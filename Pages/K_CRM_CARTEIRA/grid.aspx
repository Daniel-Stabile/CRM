<%@ Page Title="Carteira" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_CARTEIRAS" Title="Carteiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_CARTEIRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/K_CRM_CARTEIRA/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_CARTEIRA_GRID" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_CONTAS" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_CARTEIRAS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CARTEIRA = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PESSOAS/resumo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_CARTEIRA_GRID" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    