<%@ Page Title="Fechamento/reabertura dos eventos da série R-4000" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:HtmlPanel runat="server" ID="FECHAMENTOREABERTURAR4099" Title="Fechamento/reabertura - R-4099" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGgxIGNsYXNzPSJwYWdlLXRpdGxlIj4gRmVjaGFtZW50by9SZWFiZXJ0dXJhIGRvIFBlcsOtb2RvIC0gUi00MDk5IDwvaDE+DQo8c3R5bGU+DQogICAgLmNvbW1hbmQtYWN0aW9uIHsNCiAgICAgICAgbWFyZ2luLWJvdHRvbTogMTVweDsNCiAgICB9DQo8L3N0eWxlPg0K" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="20"  />
    <wes:CommandsPanel runat="server" ID="COMANDOS" Title="Comandos" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS.GRID" VerticalOrientation="False" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="25"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMABERTO" class="active"><a data-toggle="tab" href="#tabEMABERTO">Em aberto</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FECHADO"><a data-toggle="tab" href="#tabFECHADO">Fechado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ENVIADOAGUARDANDOAPROVAO"><a data-toggle="tab" href="#tabENVIADOAGUARDANDOAPROVAO">Enviado - Aguardando aprovação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TODAS"><a data-toggle="tab" href="#tabTODAS">Todas</a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabEMABERTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EMABERTO" Title="Em aberto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS_FECHARPERIODO_R4099.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAOR4000 = 1 AND A.COMPETENCIA IS NOT NULL AND A.EMPRESA = @EMPRESA)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabFECHADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FECHADO" Title="Fechado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS_REABERTURA_R4099.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAOR4000 = 3)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabENVIADOAGUARDANDOAPROVAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ENVIADOAGUARDANDOAPROVAO" Title="Enviado - Aguardando aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS_FECHARPERIODO_R4099.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAOR4000 = 2)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabTODAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TODAS" Title="Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS_FECHARPERIODO_R4099.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_FECHAMENTO_REABERTURA_R4099" Level="20" Order="65"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    