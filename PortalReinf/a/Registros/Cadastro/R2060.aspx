<%@ Page Title="R-2060 - Contribuição Previdenciária sobre Rec. Bruta - CPRB" Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R2060Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2060CONTRIBUIOPREVIDENCIRIASOBRERECBRUTACPRB" Title="R-2060 - Contribuição Previdenciária sobre Rec. Bruta - CPRB" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2060.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R2060_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEATIVIDADES" class="active"><a data-toggle="tab" href="#tabINFORMAESDEATIVIDADES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações das Atividades")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabINFORMAESDEATIVIDADES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEATIVIDADES" Title="Informações das Atividades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2060CONTRIBUIOPREVIDENCIRIASOBRERECBRUTACPRB" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFORMACOESATIVIDADE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2060 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/InformacaoAtividade.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2060_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    