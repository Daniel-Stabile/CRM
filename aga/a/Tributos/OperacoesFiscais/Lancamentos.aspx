<%@ Page Title="Lançamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LANAMENTO_2" class="active"><a data-toggle="tab" href="#tabLANAMENTO_2">Lançamento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTABILIZAO"><a data-toggle="tab" href="#tabCONTABILIZAO">Contabilização</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOSREFERENCIADOS"><a data-toggle="tab" href="#tabPROCESSOSREFERENCIADOS">Processos Referenciados</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabLANAMENTO_2">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="LANAMENTO_2" Title="Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCOPERACOESFISCAIS.OPERACOESFISCAIS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_OPERACOESFISCAIS_LANCAMENTOS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTABILIZAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTABILIZAO" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LANAMENTO_2" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.OPERACOESFISCAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTOOPERACAOFISCAL = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_OPERACOESFISCAIS_LANCAMENTOS" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabPROCESSOSREFERENCIADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOSREFERENCIADOS" Title="Processos Referenciados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LANAMENTO_2" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_PCPROCESSOSREFERENCIADOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAOFISCAL = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/OperacoesFiscais/ProcessosReferenciados/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_OPERACOESFISCAIS_LANCAMENTOS" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    