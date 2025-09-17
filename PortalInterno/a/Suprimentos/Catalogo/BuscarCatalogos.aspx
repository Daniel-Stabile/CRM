<%@ Page Title="Catalogos" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636243876981093667" Title="Catálogos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTA_INT_BUSCAR_CATALOGOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" DefaultFilterName="Pesquisar por" UserDefinedSelectColumnVisible="False" Mode="Fixed" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND @HOJE BETWEEN A.INICIOVIGENCIA AND A.FINALVIGENCIA" FormUrl="~/PortalInterno/e/Suprimentos/Catalogo/BuscarItensCatalogo.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_BUSCARCATALOGOS" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    