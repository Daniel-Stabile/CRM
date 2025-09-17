<%@ Page Title="Devolução adiantamento fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Devolução adiantamento fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_MOVIMENTACAOCAMPOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CODIGOINTERNO=17 AND A.MOVIMENTACAOOPERACAO IS NULL" FormUrl="~/aga/a/f/aga_t1213_at7423_hs1998893f.aspx" UserDefinedDisableRowSelection="False" PageId="CAMPOS_POR_CODIGO_INTERNO__DEVOLUCAO_ADIANTAMENTO_FORNECEDORES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    