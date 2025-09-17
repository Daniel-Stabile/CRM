<%@ Page Title="Classificação Orçamentária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDOP_CLASSIFICACAOORCAMENTARIA" class="active"><a data-toggle="tab" href="#tabGRIDOP_CLASSIFICACAOORCAMENTARIA">Classificações Orçamentárias de Projetos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAO"><a data-toggle="tab" href="#tabCLASSIFICAO">Classificação Orçamentária de Atividade</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAO_1"><a data-toggle="tab" href="#tabCLASSIFICAO_1">Classificação Orçamentária de Operação Especial</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabGRIDOP_CLASSIFICACAOORCAMENTARIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="GRIDOP_CLASSIFICACAOORCAMENTARIA" Title="Classificações Orçamentárias de Projetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1 AND  (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentaria/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_CLASSIFICACAOORCAMENTARIA_GRID" Level="20" Order="100"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICAO" Title="Classificação Orçamentária de Atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 2  AND  (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentaria/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_CLASSIFICACAOORCAMENTARIA_GRID" Level="20" Order="110"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICAO_1">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICAO_1" Title="Classificação Orçamentária de Operação Especial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 3  AND  (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentaria/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_CLASSIFICACAOORCAMENTARIA_GRID" Level="20" Order="120"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    