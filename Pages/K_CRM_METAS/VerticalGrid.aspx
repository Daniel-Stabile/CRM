<%@ Page Title="Meta por Vertical" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_METAPORVERTICAL" Title="Meta por vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_METASVERTICAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/Pages/K_CRM_METASVERTICAL/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_META_POR_VERTICAL" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_METAPORVERTICAL_1" Title="Meta por Vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_METASVERTICAL.GER_PROD.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VERTICAL IN (SELECT HANDLE FROM K_CRM_PRODUTOS WHERE VERTICAL IN (SELECT DISTINCT(HANDLE) FROM K_CRM_VERTICAL V
JOIN STRING_SPLIT
((SELECT REPLACE(REPLACE(SUBSTRING(K_VERTICALPRODUTO,0, LEN(K_VERTICALPRODUTO)-1), '|', ''),'_',',')
FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO), ',') ON VALUE = V.HANDLE))
" FormUrl="~/Pages/K_CRM_METASVERTICAL/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_META_POR_VERTICAL" Level="50" Order="20"  />
        </div>
    
      </asp:Content>
    