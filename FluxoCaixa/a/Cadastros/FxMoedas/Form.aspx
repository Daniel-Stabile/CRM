<%@ Page Title="Moedas" Language="C#" Inherits="PortalBase.CorpBasePage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMGN_MOEDAS" Title="Moedas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_MOEDAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_FXMOEDAS_FORM" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="COTAES" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMGN_MOEDAS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FX_MOEDACOTACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MOEDA= @CAMPO(HANDLE)" FormUrl="~/FluxoCaixa/a/Cadastros/FxMoedaCotacoes/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FXMOEDAS_FORM" Level="20" Order="110"  />
        </div>
    
      </asp:Content>
    