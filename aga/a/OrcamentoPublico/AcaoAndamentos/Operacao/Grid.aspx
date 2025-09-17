<%@ Page Title="Ação andamentos de Operações Especiais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="AESEMANDAMENTO" Title="Ações em Andamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACAOANDAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAOESPECIAL IS NOT NULL AND (
SELECT U.HANDLE FROM Z_GRUPOUSUARIOS U
INNER JOIN OP_ACOESPROJETOS B ON B.HANDLE = A.ACOESPROJETOS
WHERE U.HANDLE = @USUARIO AND (U.CENTROCUSTOREQUISICAO = B.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcaoAndamentos/Operacao/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACAOANDAMENTOSOPERACAO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    