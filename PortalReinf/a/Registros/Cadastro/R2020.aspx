<%@ Page Title="R-2020 - Retenções Contrib. Previd. - Prest. Serviços" Language="C#" Inherits="PortalReinf.a.Registro.Cadastro.R2020Page,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="R2020RETENESCONTRIBPREVIDPRESTSERVIOS" Title="R-2020 - Retenções Contrib. Previd. - Prest. Serviços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_R2020.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REINF_REGISTRO_R2020_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASFISCAISDESERVIOS" class="active"><a data-toggle="tab" href="#tabNOTASFISCAISDESERVIOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas Fiscais de Serviços")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOSSEMRETENES"><a data-toggle="tab" href="#tabPROCESSOSSEMRETENES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processos sem Retenções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROCESSOSSEMRETENESADICIONAIS"><a data-toggle="tab" href="#tabPROCESSOSSEMRETENESADICIONAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processos sem Retenções Adicionais")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabNOTASFISCAISDESERVIOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASFISCAISDESERVIOS" Title="Notas Fiscais de Serviços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2020RETENESCONTRIBPREVIDPRESTSERVIOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_DETALHENOTAFISCAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2020 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/Cadastro/DetalheNotaFiscal.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2020_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPROCESSOSSEMRETENES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOSSEMRETENES" Title="Processos sem Retenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2020RETENESCONTRIBPREVIDPRESTSERVIOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_PROCESSOSSEMRETENCAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2020 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/ProcessoSemRetencao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2020_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabPROCESSOSSEMRETENESADICIONAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROCESSOSSEMRETENESADICIONAIS" Title="Processos sem Retenções Adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="R2020RETENESCONTRIBPREVIDPRESTSERVIOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_PROCESSOSSEMRETENCAOADI.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.R2020 = @CAMPO(HANDLE)" FormUrl="~/PortalReinf/a/Registros/ProcessoSemRetencaoAdi.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REINF_REGISTRO_R2020_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    