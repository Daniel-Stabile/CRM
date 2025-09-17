<%@ Page Title="Identificação da Operadora do Plano Privado Coletivo Empresarial de Assistência à Saúde" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="IDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE" Title="Identificação da Operadora do Plano Privado Empresarial de Assistência à Saúde" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010IDEPLANOSAUDE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R4010_IDEPLANOSAUDE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAODEREEMBOLSODOTITULARDOPLANODESADEEMPRESARIAL" class="active"><a data-toggle="tab" href="#tabINFORMAODEREEMBOLSODOTITULARDOPLANODESADEEMPRESARIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informação de Reembolso do Titular do Plano de Saúde Empresarial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL"><a data-toggle="tab" href="#tabINFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Informações de Dependente do Plano de Saúde Empresarial")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabINFORMAODEREEMBOLSODOTITULARDOPLANODESADEEMPRESARIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAODEREEMBOLSODOTITULARDOPLANODESADEEMPRESARIAL" Title="Informação de Reembolso do Titular do Plano de Saúde Empresarial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="IDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFOREEMBTITULAR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010IDEPLANOSAUDE = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/InfoReembolsoTitular.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_IDEPLANOSAUDE" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INFORMAESDEDEPENDENTEDOPLANODESADEEMPRESARIAL" Title="Informações de Dependente do Plano de Saúde Empresarial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="IDENTIFICAODAOPERADORADOPLANOPRIVADOEMPRESARIALDEASSISTNCIASADE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R4010INFODEPENDENTEPLANO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.R4010IDEPLANOSAUDE = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/R4010/InfoDependentePlano.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R4010_IDEPLANOSAUDE" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    