<%@ Page Title="Tipos de movimentação - Recebimento fiscal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Tipos de movimentação" Subtitle="Recebimento fiscal" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACOESFATURAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOOPERACAO = 2)" FormUrl="~/aga/a/f/aga_t1749_at2440_hs67806dd5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOSMOVIMENTACAORECFISCAL_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    