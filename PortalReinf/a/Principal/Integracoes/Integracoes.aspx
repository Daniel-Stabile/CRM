<%@ Page Title="Integrações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:HtmlPanel runat="server" ID="INTEGRAES" Title="Integrações" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" HtmlBase64="PGgxIGNsYXNzPSJwYWdlLXRpdGxlIj4gSW50ZWdyYcOnw7VlcyA8L2gxPg0KPHN0eWxlPg0KICAgIC5jb21tYW5kLWFjdGlvbiB7DQogICAgICAgIG1hcmdpbi1ib3R0b206IDE1cHg7DQogICAgfQ0KPC9zdHlsZT4NCg==" PageId="PORTALREINF_A_PRINCIPAL_INTEGRACOES" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ERRONAGERAO" class="active"><a data-toggle="tab" href="#tabERRONAGERAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Erro na geração")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AGUARDANDOGERAO"><a data-toggle="tab" href="#tabAGUARDANDOGERAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aguardando geração")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LEIAUTEGERADO"><a data-toggle="tab" href="#tabLEIAUTEGERADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Leiaute gerado")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabERRONAGERAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ERRONAGERAO" Title="Erro na geração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INTEGRACAOXML.ERROGERACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="20" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.STATUS= 3)" FormUrl="~/PortalReinf/a/Principal/Integracoes/IntegracaoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALREINF_A_PRINCIPAL_INTEGRACOES" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabAGUARDANDOGERAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AGUARDANDOGERAO" Title="Aguardando geração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INTEGRACAOXML.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.STATUS = 1)" FormUrl="~/PortalReinf/a/Principal/Integracoes/IntegracaoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALREINF_A_PRINCIPAL_INTEGRACOES" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabLEIAUTEGERADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LEIAUTEGERADO" Title="Leiaute gerado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="REINF_INTEGRACAOXML.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.STATUS = 4)" FormUrl="~/PortalReinf/a/Principal/Integracoes/IntegracaoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PORTALREINF_A_PRINCIPAL_INTEGRACOES" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    