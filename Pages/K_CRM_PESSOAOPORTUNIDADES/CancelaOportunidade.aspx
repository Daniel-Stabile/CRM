<%@ Page Title="Gerenciar Oportunidades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_GERENCIAROPORTUNIDADES" Title="Gerenciar Oportunidades" Subtitle="Administrador" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAOPORTUNIDADES.CANCELA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS IN (11,12,13,15)" FormUrl="~/Pages/K_CRM_PESSOAOPORTUNIDADES/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_CANCELAOPORTUNIDADE" Level="50" Order="20"  />
        <wes:SimpleGrid runat="server" ID="K_GERENCIAROPORTUNIDADES_1" Title="Gerenciar Oportunidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAOPORTUNIDADES.CANCELA_REGIONAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS IN (11,12,13,15)" FormUrl="~/Pages/K_CRM_PESSOAOPORTUNIDADES/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PESSOAOPORTUNIDADES_CANCELAOPORTUNIDADE" Level="50" Order="30"  />
        </div>
    
      </asp:Content>
    