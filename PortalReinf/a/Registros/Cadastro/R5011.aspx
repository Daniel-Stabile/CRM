<%@ Page Title="R-5011 - Informações de bases e tributos consolidadas por período de apuração" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO" Title="R-5011 - Informações de bases e tributos consolidadas por período de apuração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_R5011.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R5011_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TOTALIZADORESDEBASESETRIBUTOS" class="active"><a data-toggle="tab" href="#tabTOTALIZADORESDEBASESETRIBUTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totalizadores de bases e tributos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OCORRNCIA"><a data-toggle="tab" href="#tabOCORRNCIA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrência")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTOTALIZADORESDEBASESETRIBUTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TOTALIZADORESDEBASESETRIBUTOS" Title="Totalizadores de bases e tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INFORMACOESBASETRIBUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R5011 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/InformacaoBaseTributo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R5011_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabOCORRNCIA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OCORRNCIA" Title="Ocorrência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R5011INFORMAESDEBASESETRIBUTOSCONSOLIDADASPORPERODODEAPURAO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_OCORRENCIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R5011 = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R5011_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    