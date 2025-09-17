<%@ Page Title="Grupos de Lançamento" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMFX_GRUPOSLANCAMENTO" Title="Grupos de Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_GRUPOSLANCAMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_FXGRUPOSLANCAMENTO_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="LANAMENTOSDOGRUPO" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMFX_GRUPOSLANCAMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_LANCAMENTOS_GRUPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.GRUPOLANCAMENTO = @CAMPO(HANDLE) AND A.ATIVO = 'S' AND A.FORMALANCAMENTO &lt;&gt; 'R'" FormUrl="~/FluxoCaixa/a/Lancamentos/FxLancamentos/FormEdicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FXGRUPOSLANCAMENTO_FORM" Level="20" Order="110"  />
        <wes:SimpleGrid runat="server" ID="LANAMENTORPIDO" Title="Lançamento rápido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMFX_GRUPOSLANCAMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_LANCAMENTORAPIDO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.GRUPOLANCAMENTO = @CAMPO(HANDLE)" FormUrl="~/FluxoCaixa/a/Lancamentos/FxLancamentoRapido/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FXGRUPOSLANCAMENTO_FORM" Level="20" Order="120"  />
        </div>
    
      </asp:Content>
    