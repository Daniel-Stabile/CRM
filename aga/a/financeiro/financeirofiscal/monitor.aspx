<%@ Page Title="Monitor de inconsistências Financeiro/Fiscal" Language="C#" Inherits="aga.a.Financeiro.MonitorFinanceiroFiscal,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="MONITORINCONSISTENCIASFINANCEIROFISCAL" Title="Monitor inconsistências Financeiro/Fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="WEB_TQ_GERACAOFINANCEIROFISCAL.FINANCEIRO.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 3" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_FINANCEIROFISCAL_MONITOR" Level="20" Order="10"  />
        </div>
    
        <style>
                .popover {
    max-width:600px !important;
    }

              </style>
      </asp:Content>
    