<%@ Page Title="Variações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Variações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PD_ALMOXARIFADOVARIACOES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALMOXARIFADO__ITENS__VARIACAO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1560" class="active"><a data-toggle="tab" href="#tabWIDGET_1560"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consumo no mês")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5385"><a data-toggle="tab" href="#tabWIDGET_5385"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Estoque terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3446"><a data-toggle="tab" href="#tabWIDGET_3446"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de alteração de reposição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3447"><a data-toggle="tab" href="#tabWIDGET_3447"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Localizações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1560">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1560" Title="Consumo no mês" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_PD_CONSUMOMESVARIACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t1549_at1560_hs5aea781d.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADO__ITENS__VARIACAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5385">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5385" Title="Estoque terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_MOVIMENTACAOTERCEIROTOTAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = (SELECT ALMOXARIFADO FROM PD_ALMOXARIFADOPRODUTOS WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOPRODUTOS))) 
AND (A.VARIACAO = (SELECT VARIACAO FROM PD_ALMOXARIFADOVARIACOES WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOVARIACOES)))" FormUrl="~/aga/a/f/aga_t3307_at5385_hs730456a4.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADO__ITENS__VARIACAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3446">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3446" Title="Histórico de alteração de reposição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_ALMOXARIFADOVARIACOES') AND A.HANDLEREGISTROORIGEM = @RASTRO(PD_ALMOXARIFADOVARIACOES))" FormUrl="~/aga/a/f/aga_t1951_at3446_hse1010eaa.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADO__ITENS__VARIACAO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3447">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3447" Title="Localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOLOCALIZA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(ALMOXARIFADOPRODUTO IS NULL AND ALMOXARIFADOVARIACAO = @RASTRO(PD_ALMOXARIFADOVARIACOES))" FormUrl="~/aga/a/f/aga_t1516_at3447_hs8cf21186.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADO__ITENS__VARIACAO_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    