<%@ Page Title="Reabrir período - R-2098" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:HtmlPanel runat="server" ID="REABRIRPERODOR2098" Title="Reabrir período - R2098" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGgxIGNsYXNzPSJwYWdlLXRpdGxlIj4gUmVhYnJpciBQZXLDrW9kbyAtIFItMjA5OCA8L2gxPg0KPHN0eWxlPg0KICAgIC5jb21tYW5kLWFjdGlvbiB7DQogICAgICAgIG1hcmdpbi1ib3R0b206IDE1cHg7DQogICAgfQ0KPC9zdHlsZT4NCg==" PageId="PORTAL_REINF_REABERTURA" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FECHADO" class="active"><a data-toggle="tab" href="#tabFECHADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Fechado")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMABERTO"><a data-toggle="tab" href="#tabEMABERTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Em aberto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ENVIADOAGUARDANDOAPROVAO"><a data-toggle="tab" href="#tabENVIADOAGUARDANDOAPROVAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Enviado - Aguardando aprovação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TODAS"><a data-toggle="tab" href="#tabTODAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Todas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabFECHADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FECHADO" Title="Fechado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS.REABERTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAO = 3)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTAL_REINF_REABERTURA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabEMABERTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EMABERTO" Title="Em aberto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS.REABERTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAO = 1)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_REABERTURA" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabENVIADOAGUARDANDOAPROVAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ENVIADOAGUARDANDOAPROVAO" Title="Enviado - Aguardando aprovação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS.REABERTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.SITUACAO = 2)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_REABERTURA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTODAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TODAS" Title="Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_COMPETENCIAS.REABERTURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="PORTAL_REINF_REABERTURA" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    