<%@ Page Title="Informações das Atividades" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESDASATIVIDADES" Title="Informações das Atividades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFORMACOESATIVIDADE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_INFORMACOESATIVIDADES" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AJUSTES" class="active"><a data-toggle="tab" href="#tabAJUSTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ajustes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS"><a data-toggle="tab" href="#tabINFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Processos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabAJUSTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AJUSTES" Title="Ajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESDASATIVIDADES" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_AJUSTEATIVIDADE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.INFORMACAOATIVIDADE = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/AjusteAtividade.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_INFORMACOESATIVIDADES" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEPROCESSOSADMINISTRATIVOSJUDICIAIS" Title="Informações de Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESDASATIVIDADES" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFORMACOESPROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.ATIVIDADE = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/InformacoesProcessos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_INFORMACOESATIVIDADES" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    