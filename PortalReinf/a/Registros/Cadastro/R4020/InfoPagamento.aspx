<%@ Page Title="Informações relativas ao Pagamento Efetuado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESRELATIVASAOPAGAMENTOEFETUADO" Title="Informações Relativas ao Pagamento Efetuado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4020INFOPAGAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4020_INFOPAGAMENTO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO" class="active"><a data-toggle="tab" href="#tabINFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Processos Relacionados a não Retenção de Tributos ou a Depósito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESCOMPLEMENTARESDECORRENTESDEDECISOJUDICIAL"><a data-toggle="tab" href="#tabINFORMAESCOMPLEMENTARESDECORRENTESDEDECISOJUDICIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações Complementares Decorrentes de Decisão Judicial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESRELATIVASAPAGAMENTOSARESIDENTEFISCALNOEXTERIOR"><a data-toggle="tab" href="#tabINFORMAESRELATIVASAPAGAMENTOSARESIDENTEFISCALNOEXTERIOR"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações Relativas a Pagamentos a Residente Fiscal no Exterior")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabINFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO" Title="Informações de Processos Relacionados a não Retenção de Tributos ou a Depósito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAOPAGAMENTOEFETUADO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4020PROCESSOSEMRETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4020INFOPAGAMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4020/ProcessoSemRetencao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4020_INFOPAGAMENTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESCOMPLEMENTARESDECORRENTESDEDECISOJUDICIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESCOMPLEMENTARESDECORRENTESDEDECISOJUDICIAL" Title="Informações Complementares Decorrentes de Decisão Judicial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAOPAGAMENTOEFETUADO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFOPROCESSOJUDICIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4020INFOPAGAMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/InfoProcessoJudicial.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4020_INFOPAGAMENTO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESRELATIVASAPAGAMENTOSARESIDENTEFISCALNOEXTERIOR">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESRELATIVASAPAGAMENTOSARESIDENTEFISCALNOEXTERIOR" Title="Informações Relativas a Pagamentos a Residente Fiscal no Exterior" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAOPAGAMENTOEFETUADO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4020PAGAMENTOEXTERIOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4020INFOPAGAMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4020/PagamentoExterior.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4020_INFOPAGAMENTO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAOPAGAMENTOEFETUADO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R4020INFOPAGAMENTODOC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4020INFOPAGAMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4020/InfoPagamentoDoc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4020_INFOPAGAMENTO" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    