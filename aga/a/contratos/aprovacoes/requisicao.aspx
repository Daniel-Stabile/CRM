<%@ Page Title="Requisição" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REQUISIO" Title="Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_REQUISICOES.APROVACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="REQUISICAOCONTRATO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSOBJETOS" class="active"><a data-toggle="tab" href="#tabITENSOBJETOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/Objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EVENTOS"><a data-toggle="tab" href="#tabEVENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Eventos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENSOBJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_REQUISICAOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/aprovacoes/requisicaoItens.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICAOCONTRATO" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_REQUISICAOANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICAOCONTRATO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/aprovacoes/requisicaoPessoa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICAOCONTRATO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabEVENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EVENTOS" Title="Eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOEVENTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/aprovacoes/requisicaoEvento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICAOCONTRATO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_STATUS.CNREQUISICAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_REQUISICOES') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="REQUISICAOCONTRATO" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    