<%@ Page Title="Abertos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRID" Title="Abertos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FT_SOLICITACAODOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.NUMERO IS NOT NULL AND A.SOLICITACAO IN (SELECT HANDLE FROM FT_SOLICITACOES WHERE STATUS = 5 AND FILIAL IN @FILIAIS) AND ((A.VALOR &gt; (SELECT SUM(VALOR) VALOR FROM FT_SOLICITACAODOCUMENTOBAIXAS WHERE SOLICITACAO = A.HANDLE)) OR ((SELECT COUNT(HANDLE) NRECS FROM FT_SOLICITACAODOCUMENTOBAIXAS WHERE SOLICITACAO = A.HANDLE) = 0))" FormUrl="~/aga/a/f/aga_t2253_at3732_hsfb8bc04a.aspx" UserDefinedDisableRowSelection="False" PageId="FT_PASTA_ATENDASE__ABERTOS_GRID" Level="20" Order="1"  />
        </div>
    
      </asp:Content>
    