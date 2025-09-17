<%@ Page Title="Empresas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDWIDGET_635709273782781537" Title="Relação de Empresas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="EMPRESAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" DefaultFilterName="PADRAO" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE = @EMPRESA" FormUrl="~/PortalCRM/a/EMPRESAS/Form.aspx" UserDefinedDisableRowSelection="False" PageId="GRIDPAGEID_635709273782781537" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    