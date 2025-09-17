<%@ Page Title="Grupo de itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMWIDGET_635712597828357955" Title="Grupo de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CRM_AREASNEGOCIO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FORMPAGEID_635712597828357955" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635713367519305015" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMWIDGET_635712597828357955" ChromeState="Normal" EntityViewName="CRM_AREASNEGOCIOPRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.AREA = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_AREASNEGOCIOPRODUTOS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="FORMPAGEID_635712597828357955" Level="20" Order="220"  />
        </div>
    
      </asp:Content>
    