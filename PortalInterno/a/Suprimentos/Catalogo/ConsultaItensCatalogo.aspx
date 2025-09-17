<%@ Page Title="Consulta de itens por catálogo" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONSULTADEITENS" Title="Consulta de Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PORTAL_INT_ITENS_CATALOGO_FORNECIMENTO.GRID" DefaultFilterName="Pesquisar por" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
  SELECT Z.HANDLE
    FROM CP_CATALOGOFORNECIMENTOITENS Z 
  INNER JOIN CP_CATALOGOSFORNECIMENTO V ON V.HANDLE = Z.CATALOGOFORNECIMENTO
  WHERE V.INICIOVIGENCIA &lt;= @HOJE AND V.FINALVIGENCIA &gt;= @HOJE AND V.STATUS = 2 AND V.EMPRESA = @EMPRESA
) " ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_CONSULTA_ITEM_CATALOGO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    