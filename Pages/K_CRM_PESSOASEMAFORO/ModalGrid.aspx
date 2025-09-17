<%@ Page Title="SEMÁFORO" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_SEMFORO" Title="Semáforo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFORO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/K_CRM_PESSOASEMAFORO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_CRM_SEMAFORO" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_ITENSDOSEMFORO" Title="Itens do semáforo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_SEMFORO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOASEMAFOROITEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SEMAFORO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PESSOASEMAFOROITEM/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_CRM_SEMAFORO" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    