<%@ Page Title="Planos de Contas Gerenciais" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMCT_PLANOSGERENCIAIS" Title="Planos de Contas Gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PLANOSGERENCIAIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSGERENCIAIS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="CONTASGERENCIAIS" Title="Contas Gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMCT_PLANOSGERENCIAIS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_CONTASGERENCIAIS_FLUXOCAIXA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PLANO = @CAMPO(HANDLE)" FormUrl="~/FluxoCaixa/a/Cadastros/CtContasGerenciais/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FLUXOCAIXA_CADASTROS_CTPLANOSGERENCIAIS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    