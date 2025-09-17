<%@ Page Title="Itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5384" class="active"><a data-toggle="tab" href="#tabWIDGET_5384"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Estoque terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3283"><a data-toggle="tab" href="#tabWIDGET_3283"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de alterações de reposição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3445"><a data-toggle="tab" href="#tabWIDGET_3445"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Localizações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1503"><a data-toggle="tab" href="#tabWIDGET_1503"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lotes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1710"><a data-toggle="tab" href="#tabWIDGET_1710"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão Consumo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2233"><a data-toggle="tab" href="#tabWIDGET_2233"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de movimentações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1559"><a data-toggle="tab" href="#tabWIDGET_1559"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Variações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5384">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5384" Title="Estoque terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_MOVIMENTACAOTERCEIROTOTAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS)
AND (A.PRODUTO = (SELECT PRODUTO FROM PD_ALMOXARIFADOPRODUTOS WHERE HANDLE = @RASTRO(PD_ALMOXARIFADOPRODUTOS))))" FormUrl="~/aga/a/f/aga_t3307_at5384_hsa708f709.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3283">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3283" Title="Histórico de alterações de reposição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_STATUS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_ALMOXARIFADOPRODUTOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(PD_ALMOXARIFADOPRODUTOS))" FormUrl="~/aga/a/f/aga_t1951_at3283_hs881a428b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3445">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3445" Title="Localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOLOCALIZA.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(ALMOXARIFADOVARIACAO IS NULL AND ALMOXARIFADOPRODUTO = @RASTRO(PD_ALMOXARIFADOPRODUTOS)) AND (A.ALMOXARIFADOPRODUTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1516_at3445_hsa28446f8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1503">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1503" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_TANQUELOTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND A.PRODUTO = (SELECT B.PRODUTO FROM PD_ALMOXARIFADOPRODUTOS B WHERE B.HANDLE = @RASTRO(PD_ALMOXARIFADOPRODUTOS))" FormUrl="~/aga/a/f/aga_t1548_at1503_hsce34dbee.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1710">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1710" Title="Previsão Consumo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_CONSUMOMESVARIACAO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS)" FormUrl="~/aga/a/f/aga_t1549_at1710_hs48495f7c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2233">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2233" Title="Previsão de movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_MOVIMENTACAOMESVARIACAO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.ALMOXARIFADO = @RASTRO(PD_ALMOXARIFADOS) AND A.PRODUTO = @CAMPO(PRODUTO) AND A.FAMILIA = @CAMPO(FAMILIA)" FormUrl="~/aga/a/f/aga_t1970_at2233_hsb8461f98.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1559">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1559" Title="Variações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOVARIACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.FAMILIA = @CAMPO(FAMILIA) AND A.PRODUTO = @CAMPO(PRODUTO) AND A.ALMOXARIFADO = (SELECT HANDLE FROM PD_ALMOXARIFADOS WHERE HANDLE = @CAMPO(ALMOXARIFADO))" FormUrl="~/aga/a/f/aga_t1511_at1559_hs239d2b4b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALMOXARIFADOS__ITENS_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    