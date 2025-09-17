<%@ Page Title="Informações Relativas ao Recebimento do Rendimento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESRELATIVASAORECEBIMENTODORENDIMENTO" Title="Informações Relativas ao Recebimento do Rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4080INFORECEBIMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4080_INFORECEBIMENTO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO" class="active"><a data-toggle="tab" href="#tabINFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Processos Relacionados a não Retenção de Tributos ou a Depósito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabINFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEPROCESSOSRELACIONADOSANORETENODETRIBUTOSOUADEPSITO" Title="Informações de Processos Relacionados a não Retenção de Tributos ou a Depósito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAORECEBIMENTODORENDIMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4080PROCESSOSEMRETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4080INFORECEBIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4080/ProcessoSemRetencao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4080_INFORECEBIMENTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESRELATIVASAORECEBIMENTODORENDIMENTO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R4080INFORECEBIMENTODOC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4080INFORECEBIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4080/InfoRecebimentoDoc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4080_INFORECEBIMENTO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    