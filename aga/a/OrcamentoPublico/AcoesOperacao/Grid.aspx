<%@ Page Title="Ações da operaçao" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDOP_ACOESPROJETOS" Title="Ações de Operação Especial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_ACOESPROJETOSOPERACAOESPECIAL.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.OPERACAOESPECIAL IS NOT NULL AND ( SELECT HANDLE FROM Z_GRUPOUSUARIOS U WHERE U.HANDLE = @USUARIO AND ( U.CENTROCUSTOREQUISICAO = A.CENTROCUSTO OR U.GESTORORCAMENTOPUBLICO = 'S')) IS NOT NULL" FormUrl="~/aga/a/OrcamentoPublico/AcoesOperacao/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_ACOESOPERACAO_GRID" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    