<%@ Page Title="Ativo - Itens baixados do imobilizado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Ativo - Itens baixados do imobilizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.DATAULTIMABAIXA IS NOT NULL AND A.DATAULTIMABAIXA = (SELECT MAX(DATA) FROM AT_ITEMMOVIMENTACOES WHERE ITEM =  A.HANDLE AND MOVIMENTACAO IN (1,6) AND (EHBAIXAUNIAO = 'N' OR EHBAIXAUNIAO IS NULL))" FormUrl="~/aga/a/f/aga_t1255_at1070_hsa4ad1aef.aspx" UserDefinedDisableRowSelection="False" PageId="ATIVO__ITENS_BAIXADOS_DO_IMOBILIZADO_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    