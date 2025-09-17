<%@ Page Title="Monitor de geração Financeiro/Fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.faturamento.FaturamentoMonitorGeracaoFinaceiroFiscalPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="MONITORGERAOFINACEIROFISCAL" Title="Monitor geração Finaceiro/Fiscal com inconsistências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TQ_GERACAOFINANCEIROFISCAL.MONITORGERACAOFINANCEIROFISCAL.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 3" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CM_MONITORFINANCEIROFISCAL" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="STATUSPROCESSAMENTO" Title="Status Processamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="MONITORGERAOFINACEIROFISCAL" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TQ_GERACAOFINANCEIROFISCAL.MONITORFINANCEIROFISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CM_MONITORFINANCEIROFISCAL" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    