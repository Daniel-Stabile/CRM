<%@ Page Title="Perfis Contratos - Permuta" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="PERFISCONTRATOSPERMUTA" Title="Perfis Contratos - Permuta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOSCONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPO = 4" UserDefinedCommandsVisible="True" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESPORPARTEDOCONTRATANTE" class="active"><a data-toggle="tab" href="#tabASSINANTESPORPARTEDOCONTRATANTE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes por parte do contratante")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLUSULAS"><a data-toggle="tab" href="#tabCLUSULAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IMPOSTOSINCLUSOS"><a data-toggle="tab" href="#tabIMPOSTOSINCLUSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREMISSAS"><a data-toggle="tab" href="#tabPREMISSAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="SITUAES"><a data-toggle="tab" href="#tabSITUAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Situações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabASSINANTESPORPARTEDOCONTRATANTE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESPORPARTEDOCONTRATANTE" Title="Assinantes por parte do contratante" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOCONTRATOASSINANTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2458_at4794_hs7edfa407.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCLUSULAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLUSULAS" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at4793_hsa19045a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabIMPOSTOSINCLUSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPOSTOSINCLUSOS" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_TIPOCONTRATOIMPOSTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4470_at6762_hs5edb9818.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabPREMISSAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREMISSAS" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATOPREMISSAS.PREMISSAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/g/PerfisContrato/Premissas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATODOCUMENTOS.DOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/g/PerfisContrato/Documentos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabSITUAES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="SITUAES" Title="Situações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PERFISCONTRATOSPERMUTA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_TIPOCONTRATOSITUACOES.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOCONTRATO = @CAMPO(HANDLE)" PageId="CN_PERFIS_CONTRATO_PERMUTA_FORM" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    