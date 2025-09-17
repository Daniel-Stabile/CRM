<%@ Page Title="Lançamentos Manuais" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="LANAMENTOSFINANCEIROS" Title="Lançamentos Manuais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_LANCAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ATIVO = 'S' AND A.FORMALANCAMENTO = 'M'" FormUrl="~/FluxoCaixa/a/Lancamentos/FxLancamentos/FormEdicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PAGES_FXLANCAMENTOS_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    