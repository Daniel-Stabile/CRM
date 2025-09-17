<%@ Page Title="Baixa saldo" Language="C#" Inherits="aga.a.financeiro.BaixaSaldoPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="BAIXA" Title="Baixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="BAIXAS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MOVIMENTACOES_BAIXA_SALDO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="BAIXA_SALDO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="BAIXAS" Title="BAIXAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MOVIMENTACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTO = 19" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="BAIXA_SALDO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    