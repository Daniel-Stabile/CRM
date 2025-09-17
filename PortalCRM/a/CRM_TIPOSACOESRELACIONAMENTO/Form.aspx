<%@ Page Title="Tipos Ações de Relacionamento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMWIDGET_635711913594491151" Title="Tipos Ações de Relacionamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_TIPOSACOESRELACIONAMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FORMPAGEID_635711913594491151" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635785363818873973" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMWIDGET_635711913594491151" ChromeState="Normal" EntityViewName="CRM_TIPOACAOTAREFAS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOACAORELACIONAMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_TIPOACAOTAREFAS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="FORMPAGEID_635711913594491151" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    