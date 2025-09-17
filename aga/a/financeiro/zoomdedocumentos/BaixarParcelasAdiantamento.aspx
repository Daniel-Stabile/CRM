<%@ Page Title="Baixar parcelas Adiantamento" Language="C#" Inherits="aga.a.Financeiro.BaixarParcelasAdiantamentoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BAIXA" class="active"><a data-toggle="tab" href="#tabBAIXA">Baixa</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTASGERENCIAIS"><a data-toggle="tab" href="#tabCONTASGERENCIAIS">Contas gerenciais</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CENTROCUSTO"><a data-toggle="tab" href="#tabCENTROCUSTO">Centro custo</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LANAMENTO"><a data-toggle="tab" href="#tabLANAMENTO">Lançamento</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IMPOSTOSRETIDOS"><a data-toggle="tab" href="#tabIMPOSTOSRETIDOS">Impostos retidos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabBAIXA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="BAIXA" Title="Baixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="TV_COMPESANCAODOCUMENTO_ADIANTAMENTO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_BAIXARPARCELASADIANTAMENTO" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabCONTASGERENCIAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTASGERENCIAIS" Title="Contas gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.PARCELA IS NULL" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_BAIXARPARCELASADIANTAMENTO" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabCENTROCUSTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CENTROCUSTO" Title="Centro custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOCC.ZOOMDEDOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = 0" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_BAIXARPARCELASADIANTAMENTO" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabLANAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LANAMENTO" Title="Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTODIMENSOES.CONTAFINANCEIRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = 0" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_BAIXARPARCELASADIANTAMENTO" Level="20" Order="40"  /></div>
      </div>
      <div class="tab-pane" id="tabIMPOSTOSRETIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPOSTOSRETIDOS" Title="Impostos retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOS.ZOOMDEDOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_ZOOMDEDOCUMENTOS_BAIXARPARCELASADIANTAMENTO" Level="20" Order="50"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    