<%@ Page Title="Conta financeira" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_FN_CONTAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_VERSAO_CONTA_FINANCEIRA_AUX__CONTASFINANCEIRAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_982" class="active"><a data-toggle="tab" href="#tabWIDGET_982"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas contábeis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4560"><a data-toggle="tab" href="#tabWIDGET_4560"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas gerenciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CENTRODECUSTOS"><a data-toggle="tab" href="#tabCENTRODECUSTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Centro de custos válido")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_982">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_982" Title="Contas contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_CONTACONTASCONTABEIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTAFINANCEIRA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t1273_at982_hsa6828146.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_FINANCEIRA_AUX__CONTASFINANCEIRAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4560">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4560" Title="Contas gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CT_CONTASGERENCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTAGERENCIAL FROM CT_CONTAGERENCIALFINANCEIRAS WHERE CONTAFINANCEIRA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t916_at4560_hsdf85aa39.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_FINANCEIRA_AUX__CONTASFINANCEIRAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabCENTRODECUSTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CENTRODECUSTOS" Title="Centro de custos válido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="FN_CONTACCVALIDOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/contaccfinanceiro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_FINANCEIRA_AUX__CONTASFINANCEIRAS_FORM" Level="20" Order="35"  />
    <wes:AjaxForm runat="server" ID="CENTROCUSTO" Title="Centro Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CENTRODECUSTOS" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="FN_CONTACCVALIDOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_DE_VERSAO_CONTA_FINANCEIRA_AUX__CONTASFINANCEIRAS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    