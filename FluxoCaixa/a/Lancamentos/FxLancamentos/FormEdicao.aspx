<%@ Page Title="LANÇAMENTO MANUAL" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.FluxoCaixa.a.Lancamentos.LancamentoManual" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LANAMENTOMANUAL" Title="LANÇAMENTO MANUAL" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FX_LANCAMENTOS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="FLUXOCAIXA_A_LANCAMENTOS_FXLANCAMENTOS_FORMEDICAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="RATEIOSDOLANAMENTO" Title="Rateios do lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANAMENTOMANUAL" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_RATEIOSLANCAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)" FormUrl="~/FluxoCaixa/a/Lancamentos/FxLancamentos/FxRateioslancamento/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_A_LANCAMENTOS_FXLANCAMENTOS_FORMEDICAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    