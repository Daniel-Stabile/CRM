<%@ Page Title="Copiar itens de solicitação já existente" Language="C#" Inherits="PortalBase.CorpBasePage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="WIDGETID_636229482999248987" Title="ITENS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="PORTAL_INT_CONSULTAR_SOLICITACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" DefaultFilterName="Pesquisar por" UserDefinedSelectColumnVisible="True" Mode="Selectable" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SOLICITACAO IN (SELECT HANDLE FROM CP_SOLICITACOES WHERE  SOLICITANTE = @USUARIO AND MODALIDADE = 'N')" UserDefinedDisableRowSelection="False" PageId="PORTAL_INT_COPIARITENS_SOLICITACAO" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    