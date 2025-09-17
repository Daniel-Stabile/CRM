<%@ Page Title="Funil de vendas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="WIDGETID_635773842967041698" Title="Funil de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CRM_FUNILVENDAS.CUSTOM.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGEID_635773841328471499" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="WIDGETID_635773846197107933" Title="Funil de vendas itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGETID_635773842967041698" ChromeState="Normal" EntityViewName="CRM_FUNILVENDAITENS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" UserDefinedSelectColumnVisible="False" Mode="None" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FUNIL = @CAMPO(HANDLE)" FormUrl="~/PortalCRM/a/CRM_FUNILVENDAITENS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="PAGEID_635773841328471499" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    