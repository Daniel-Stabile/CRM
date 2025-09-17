<%@ Page Title="Devolução adiantamento clientes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Devolução adiantamento clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_MOVIMENTACAOCAMPOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CODIGOINTERNO=16 AND A.MOVIMENTACAOOPERACAO IS NULL" FormUrl="~/aga/a/f/aga_t1213_at7422_hs73ac171c.aspx" UserDefinedDisableRowSelection="False" PageId="CAMPOS_POR_CODIGO_INTERNO__DEVOLUCAO_ADIANTAMENTO_CLIENTES_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    