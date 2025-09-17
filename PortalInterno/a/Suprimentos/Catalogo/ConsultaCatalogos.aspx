<%@ Page Title="Consulta de catálogos" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636240432927105831" Title="Consulta de catálogos &gt;&gt; Lista de catálogos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_INT_CONSULTA_CATALOGOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" DefaultFilterName="Pesquisar por" UserDefinedSelectColumnVisible="False" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 2 AND @HOJE BETWEEN A.INICIOVIGENCIA AND A.FINALVIGENCIA" FormUrl="~/PortalInterno/e/Suprimentos/Catalogo/VisualizarCatalogo.aspx" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_CONSULTACATALOGO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    