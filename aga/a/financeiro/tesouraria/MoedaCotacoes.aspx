<%@ Page Title="Índice Financeiro" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="MOEDA" Title="Moeda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="GN_MOEDAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FINANCEIRO_INDICES_FINANCEIRO_MODAL_MOEDA" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="MOEDADA" Title="Cotação da moeda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="MOEDA" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_MOEDACOTACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MOEDA = @CAMPO(HANDLE)" ShowExport="True" PageId="FINANCEIRO_INDICES_FINANCEIRO_MODAL_MOEDA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    