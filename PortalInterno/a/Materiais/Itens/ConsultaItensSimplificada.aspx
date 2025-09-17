<%@ Page Title="Consulta de itens" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636173134843003026" Title="Consulta de itens &gt;&gt; Lista de itens da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_CONSULTA_ITENS_SIMPLIFICADA.GRID" DefaultFilterName="Pesquisar por" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATIVO = 'S'" FormUrl="~/PortalInterno/e/Materiais/Itens/ItemSimplificado.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_CONSULTA_ITENS_SIMPLIFICADA" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    