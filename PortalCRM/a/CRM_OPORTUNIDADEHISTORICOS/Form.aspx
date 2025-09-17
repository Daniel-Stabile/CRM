<%@ Page Title="Históricos de oportunidades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_635749083574508858" Title="Históricos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_OPORTUNIDADEHISTORICOS.CUSTOM.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGEID_635749082740763686" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635767130409336453" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_635749083574508858" ChromeState="Normal" EntityViewName="CRM_OPORTUNIDADEHISTPRODUTOS.CUSTOM.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HISTORICOOPORTUNIDADE = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_OPORTUNIDADEHISTPRODUTOS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="PAGEID_635749082740763686" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    