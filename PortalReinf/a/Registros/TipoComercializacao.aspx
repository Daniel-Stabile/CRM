<%@ Page Title="Tipo de comercialização e valores do estabelecimento do evento R2050" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="TIPODECOMERCIALIZAOEVALORESDOESTABELECIMENTODOEVENTOR2050" Title="Tipo de comercialização e valores do estabelecimento do evento R2050" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_TIPOCOMERCIALIZACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_TIPOCOMERCIALIZACAO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS" class="active"><a data-toggle="tab" href="#tabINFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Processos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabINFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS" Title="Informações de Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="TIPODECOMERCIALIZAOEVALORESDOESTABELECIMENTODOEVENTOR2050" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFORMACOESPROCESSOSFULL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.TIPOCOMERCIALIZACAO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/InformacoesProcessosFull.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_TIPOCOMERCIALIZACAO" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    