<%@ Page Title="Documento Fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Tributos.DocumentosFiscalFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="DOCUMENTO" Title="Documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOS.FISCAL.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="10"  />
      <div class="col-md-8"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NFE" class="active"><a data-toggle="tab" href="#tabNFE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"NF-e")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARCELAS"><a data-toggle="tab" href="#tabPARCELAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parcelas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTASFINANCEIRAS"><a data-toggle="tab" href="#tabCONTASFINANCEIRAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas financeiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRIBUTAES"><a data-toggle="tab" href="#tabTRIBUTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tributaçôes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTRASINFORMAES"><a data-toggle="tab" href="#tabOUTRASINFORMAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outras Informações")%></a></li>
		<li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REINF"><a data-toggle="tab" href="#tabREINF"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"REINF")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTABILIZAO"><a data-toggle="tab" href="#tabCONTABILIZAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contabilização")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RETENES"><a data-toggle="tab" href="#tabRETENES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Retenções")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabNFE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="NFE" Title="NF-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTONFE.FISCAL.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.DOCUMENTO  IN (SELECT HANDLE FROM FN_DOCUMENTOS WHERE HANDLE = @CAMPO(HANDLE) OR DOCUMENTOORIGEM = @CAMPO(HANDLE))" UserDefinedCommandsVisible="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabPARCELAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_PARCELAS.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx?hdl=@CAMPO(HANDLE)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTASFINANCEIRAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTASFINANCEIRAS" Title="Contas financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOS.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA IS NULL AND A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/Documentos/FormLancamento.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="30"  />
    <wes:SimpleGrid runat="server" ID="CENTROSDECUSTO" Title="Centros de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONTASFINANCEIRAS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_LANCAMENTOCC.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Tributos/Documentos/FormLancamentoCC.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTRIBUTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRIBUTAES" Title="Tributaçôes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOTRIBUTOS.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabOUTRASINFORMAES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="OUTRASINFORMAES" Title="Outras Informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_DOCUMENTOS.OUTRASINFORMACOES.FISCAL.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="50"  /></div>
        </div>
		<div class="tab-pane" id="tabREINF">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="REINF" Title="REINF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.REINF.FISCAL.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTABILIZAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTABILIZAO" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOS.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(HANDLE)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="60"  />
    <wes:SimpleGrid runat="server" ID="CENTRODECUSTO" Title="Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONTABILIZAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_LANCAMENTOCC.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabRETENES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RETENES" Title="Retenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_DOCUMENTOIMPOSTOS.FISCALENTRADASAIDA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_FORM_FISCALSAIDA" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    