<%@ Page Title="Estabelecimento que comercializou a produção" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ESTABELECIMENTO" Title="Estabelecimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_ESTABELECIMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_ESTABELECIMENTO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BOLETIMDOESPETCULODESPORTIVO" class="active"><a data-toggle="tab" href="#tabBOLETIMDOESPETCULODESPORTIVO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Boletim do Espetáculo Desportivo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEPROCESSOS"><a data-toggle="tab" href="#tabINFORMAESDEPROCESSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Processos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabBOLETIMDOESPETCULODESPORTIVO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="BOLETIMDOESPETCULODESPORTIVO" Title="Boletim do Espetáculo Desportivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ESTABELECIMENTO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_BOLETIMESPETACULO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.ESTABELECIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/BoletimEspetaculo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_ESTABELECIMENTO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESDEPROCESSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEPROCESSOS" Title="Informações de Processos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ESTABELECIMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_INFORMACOESPROCESSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.ESTABELECIMENTO = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/InformacoesProcessos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_ESTABELECIMENTO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    