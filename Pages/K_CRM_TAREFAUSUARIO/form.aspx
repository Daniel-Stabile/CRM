<%@ Page Title="Tarefa Usuario" Language="C#" CodeFile="~/Pages/K_CRM_TAREFAUSUARIO/form.aspx.cs" Inherits="K_CRM_TAREFAUSUARIOformPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="K_TAREFAUSURIO" Title="Tarefa usuário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_TAREFAUSUARIO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="K_PAGES_K_CRM_TAREFAUSUARIO_FORM" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="K_TAREFAUSURIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_TAREFAUSUARIOARQUIVO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TAREFAUSUARIO = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_TAREFAUSUARIOARQUIVO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_TAREFAUSUARIO_FORM" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    