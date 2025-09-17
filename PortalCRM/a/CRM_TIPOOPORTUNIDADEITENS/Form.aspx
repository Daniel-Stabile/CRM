<%@ Page Title="Tipo oportunidade itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_635769776263356632" Title="Tipo oportunidade itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_TIPOOPORTUNIDADEITENS.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGEID_635769776143244589" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635769816030162428" Title="Tipo oportunidade tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_635769776263356632" ChromeState="Normal" EntityViewName="CRM_TIPOOPORTUNIDADETAREFAS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FASETIPO = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_TIPOOPORTUNIDADETAREFAS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="PAGEID_635769776143244589" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    