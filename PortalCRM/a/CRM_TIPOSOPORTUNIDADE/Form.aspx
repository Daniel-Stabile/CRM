<%@ Page Title="Tipos de oportunidades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_635769773688470535" Title="Tipos de oportunidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_TIPOSOPORTUNIDADE.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGEID_635769769403396461" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635769777293195084" Title="Tipo oportunidade itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_635769773688470535" ChromeState="Normal" EntityViewName="CRM_TIPOOPORTUNIDADEITENS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOOPORTUNIDADE = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_TIPOOPORTUNIDADEITENS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="PAGEID_635769769403396461" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    