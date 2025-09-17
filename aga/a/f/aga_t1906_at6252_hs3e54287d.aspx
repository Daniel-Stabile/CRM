<%@ Page Title="Perfis Contratos - Faturamento" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.perfisdecontrato.PerfisDeContratoFaturamento" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Perfis Contratos - Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOSCONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPO = 2" UserDefinedCommandsVisible="True" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4794" class="active"><a data-toggle="tab" href="#tabWIDGET_4794"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes por parte do contratante")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4793"><a data-toggle="tab" href="#tabWIDGET_4793"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6762"><a data-toggle="tab" href="#tabWIDGET_6762"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREMISSAS"><a data-toggle="tab" href="#tabPREMISSAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SITUAES"><a data-toggle="tab" href="#tabSITUAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Situações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_4794">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4794" Title="Assinantes por parte do contratante" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOCONTRATOASSINANTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2458_at4794_hs7edfa407.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4793">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4793" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at4793_hsa19045a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6762">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6762" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOCONTRATOIMPOSTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4470_at6762_hs5edb9818.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabPREMISSAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREMISSAS" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATOPREMISSAS.PREMISSAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/g/PerfisContrato/Premissas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATODOCUMENTOS.DOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/g/PerfisContrato/Documentos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabSITUAES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="SITUAES" Title="Situações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATOSITUACOES.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" PageId="CN_PERFIS_CONTRATO__FATURAMENTO_FORM" Level="20" Order="110"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    