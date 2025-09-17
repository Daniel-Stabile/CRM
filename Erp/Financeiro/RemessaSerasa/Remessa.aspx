<%@ Page Title="Remessa" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.Remessa" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REMESSA" Title="Remessa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_SERASAREMESSAS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPOPROCESSAMENTO = 2" UserDefinedCommandsVisible="True" PageId="ERP_FINANCEIRO_REMESSASERASA_REMESSA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TTULOSPARAINCLUSO" class="active"><a data-toggle="tab" href="#tabTTULOSPARAINCLUSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Títulos para inclusão")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TTULOSPARAEXCLUSO"><a data-toggle="tab" href="#tabTTULOSPARAEXCLUSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Títulos para exclusão")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabTTULOSPARAINCLUSO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TTULOSPARAINCLUSO" Title="Títulos para inclusão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REMESSA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_SERASAPARCELAS.REMESSASERASA.TITULOSINCLUSAO.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CODIGOOPERACAO = 1 AND A.REMESSA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_REMESSASERASA_REMESSA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTTULOSPARAEXCLUSO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TTULOSPARAEXCLUSO" Title="Títulos para exclusão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REMESSA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_SERASAPARCELAS.REMESSASERASA.TITULOSEXCLUSAO.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CODIGOOPERACAO = 2 AND A.REMESSA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_REMESSASERASA_REMESSA" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    