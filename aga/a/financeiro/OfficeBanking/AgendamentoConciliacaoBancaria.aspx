<%@ Page Title="Agendamento Extrato bancário" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.OfficeBanking.AgendamentoConciliacaoBancaria" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AGENDAMENTOCONCILIAOBANCRIA" class="active"><a data-toggle="tab" href="#tabAGENDAMENTOCONCILIAOBANCRIA">Agendamento Importação extrato bancário</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOGS"><a data-toggle="tab" href="#tabLOGS">Logs</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EXTRATOS"><a data-toggle="tab" href="#tabEXTRATOS">Extratos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabAGENDAMENTOCONCILIAOBANCRIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AGENDAMENTOCONCILIAOBANCRIA" Title="Agendamento Importação extrato bancário" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_FN_CONCBANCAGENDAMENTO.PROCESSO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_AGENDAMENTOCONCILIACAOBANCARIA" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabLOGS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOGS" Title="Logs" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="AGENDAMENTOCONCILIAOBANCRIA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="Z_AGENDAMENTOLOG.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/SiteSettings/Schedules/Logs.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_AGENDAMENTOCONCILIACAOBANCARIA" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabEXTRATOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EXTRATOS" Title="Extratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_IMPORTAREXTRATO.GRID" DefaultFilterName="Filtro padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/financeiro/OfficeBanking/ImportarExtrato.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_AGENDAMENTOCONCILIACAOBANCARIA" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    