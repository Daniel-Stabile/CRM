<%@ Page Title="Classificação Orçamentária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDOP_CLASSIFICACAOORCAMENTARIA" Title="Classificações Orçamentárias de Atividades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOORCAMENTARIA_ATIVIDADE.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATIVIDADE IS NOT NULL AND (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoOrcamentariaAtividade/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_CLASSIFICACAOORCAMENTARIAATIVIDADE_GRID" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    