<%@ Page Title="Requisição" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REQUISIO" Title="Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.ATENDIMENTOREQUISICAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_REQUISICOES_DETALHEREQUISICAO_REQUISICAO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALMOXARIFADO" class="active"><a data-toggle="tab" href="#tabALMOXARIFADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Almoxarifado")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIESGERADAS"><a data-toggle="tab" href="#tabREQUISIESGERADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições geradas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabALMOXARIFADO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ALMOXARIFADO" Title="Almoxarifado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ALMOXARIFADOVARIACOES.ATENDIMENTO_REQUISICOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(PRODUTO) AND A.ALMOXARIFADO = @CAMPO(ALMOXARIFADO) AND A.VARIACAO = @CAMPO(VARIACAO)" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_REQUISICOES_DETALHEREQUISICAO_REQUISICAO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISIESGERADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISIESGERADAS" Title="Requisições geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REQUISIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICOES.ATENDIMENTOREQUISICOES.REQUISICOESGERADAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORIGEM = 16 AND A.HANDLEREQUISICAOORIGEM = @RASTRO(CP_REQUISICOES)" FormUrl="~/aga/a/Suprimentos/Requisicoes/Requisicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_REQUISICOES_DETALHEREQUISICAO_REQUISICAO" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    