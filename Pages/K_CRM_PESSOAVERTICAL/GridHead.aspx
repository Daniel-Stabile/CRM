<%@ Page Title="Verticais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="K_VERTICAL" Title="Vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAVERTICAL.HEAD.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VERTICAL IN (SELECT VERTICAL FROM K_CRM_DIRETORVERTICAL WHERE NOME=@USUARIO)" FormUrl="~/Pages/K_CRM_PESSOAVERTICAL/resumo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_PAGES_K_CRM_PESSOAVERTICALHEAD_GRID" Level="50" Order="10"  />
        <wes:SimpleGrid runat="server" ID="K_VERTICAL_1" Title="Vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAVERTICAL.GERAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VERTICAL IN (SELECT DISTINCT(HANDLE) FROM K_CRM_VERTICAL V
JOIN STRING_SPLIT
((SELECT REPLACE(REPLACE(SUBSTRING(K_VERTICALPRODUTO,0, LEN(K_VERTICALPRODUTO)-1), '|', ''),'_',',')
FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO), ',') ON VALUE = V.HANDLE)" FormUrl="~/Pages/K_CRM_PESSOAVERTICAL/resumo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_PAGES_K_CRM_PESSOAVERTICALHEAD_GRID" Level="50" Order="20"  />
        <wes:SimpleGrid runat="server" ID="K_VERTICAL_2" Title="Vertical" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_PESSOAVERTICAL.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.VERTICAL IN (SELECT DISTINCT(HANDLE) FROM K_CRM_VERTICAL V
JOIN STRING_SPLIT
((SELECT REPLACE(REPLACE(SUBSTRING(K_VERTICALPRODUTO,0, LEN(K_VERTICALPRODUTO)-1), '|', ''),'_',',')
FROM Z_GRUPOUSUARIOS WHERE HANDLE = @USUARIO), ',') ON VALUE = V.HANDLE)" FormUrl="~/Pages/K_CRM_PESSOAVERTICAL/resumo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_PAGES_K_CRM_PESSOAVERTICALHEAD_GRID" Level="50" Order="30"  />
        </div>
    
      </asp:Content>
    