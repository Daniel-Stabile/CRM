<%@ Page Title="Novo Item de Performance" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_NOVOTIPODEITEM" Title="Novo Tipo de Item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PERFORMANCETIPO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_PERFORMANCETIPO_FORM" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_NOVOTIPODEITEM" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PERFORMANCETIPOTAREFA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_PERFORMANCETIPOTAREFA/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_PERFORMANCETIPO_FORM" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    