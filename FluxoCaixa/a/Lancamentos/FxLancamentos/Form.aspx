<%@ Page Title="Lançamentos Manuais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.FluxoCaixa.a.Lancamentos.LancamentoManual" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LANAMENTOFINANCEIRO" Title="Lançamento Manuais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_VIRTUAL_LANCAMENTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_FXLANCAMENTOS_FORM" Level="20" Order="120"  />
        <wes:SimpleGrid runat="server" ID="RATEIODOLANAMENTO" Title="Rateio do lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANAMENTOFINANCEIRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_RATEIOSLANCAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(LANCAMENTO)" FormUrl="~/FluxoCaixa/a/Lancamentos/FxLancamentos/FxRateioslancamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FXLANCAMENTOS_FORM" Level="20" Order="310"  />
        </div>
    
      </asp:Content>
    