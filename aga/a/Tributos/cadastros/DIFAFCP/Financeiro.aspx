<%@ Page Title="Financeiro" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FINANCEIRO" Title="Financeiro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTOFINANCDIFALFCP.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TR_IMPOSTOS_FINANCEIRO" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="CONFIGURAOFINANCEIRAPORFILIAL" Title="Configuração financeira por filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FINANCEIRO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTOFINANCDIFALFCPFILIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FINANCDIFALFCP = @CAMPO(HANDLE)" FormUrl="~/aga/a/tributos/Cadastros/DIFAFCP/ConfigFinancFilial.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TR_IMPOSTOS_FINANCEIRO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    