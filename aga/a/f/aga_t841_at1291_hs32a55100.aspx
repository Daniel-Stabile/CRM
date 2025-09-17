<%@ Page Title="Almoxarifados" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Almoxarifados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALMOXARIFES" class="active"><a data-toggle="tab" href="#tabALMOXARIFES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Almoxarifes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5394"><a data-toggle="tab" href="#tabWIDGET_5394"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Estoque terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3284"><a data-toggle="tab" href="#tabWIDGET_3284"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de controle de reposição")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1343"><a data-toggle="tab" href="#tabWIDGET_1343"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1314"><a data-toggle="tab" href="#tabWIDGET_1314"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Localizações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDENSDECONTAGEM"><a data-toggle="tab" href="#tabORDENSDECONTAGEM"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de contagem")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIESDOALMOXARIFADO"><a data-toggle="tab" href="#tabREQUISIESDOALMOXARIFADO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições do almoxarifado")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5395"><a data-toggle="tab" href="#tabWIDGET_5395"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Saldo inicial estoque terceiros")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabALMOXARIFES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ALMOXARIFES" Title="Almoxarifes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ALMOXARIFES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ALMOXARIFADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/almoxarifados/AlmoxarifesForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5394">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5394" Title="Estoque terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_MOVIMENTACAOTERCEIROTOTAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPO = 'R' AND A.ALMOXARIFADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3307_at5394_hs17469ac0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3284">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3284" Title="Histórico de controle de reposição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_STATUS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_ALMOXARIFADOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(PD_ALMOXARIFADOS))" FormUrl="~/aga/a/f/aga_t1951_at3284_hs9972f88d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1343">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1343" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOPRODUTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1527_at1343_hsbe27b9b8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1314">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1314" Title="Localizações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_ALMOXARIFADOLOCALIZACOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ALMOXARIFADO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1495_at1314_hsd3490529.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabORDENSDECONTAGEM">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORDENSDECONTAGEM" Title="Ordens de contagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_ORDENSCONTAGEM.GRID" DefaultFilterName="Cadastradas" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ALMOXARIFADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/almoxarifados/OrdensDeContagemForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISIESDOALMOXARIFADO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISIESDOALMOXARIFADO" Title="Requisições do almoxarifado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.ALMOXARIFADO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TIPO = 'T' OR A.TIPO = 'O') AND A.STATUS IN (2, 4, 5, 8) AND A.ALMOXARIFADO = @CAMPO(HANDLE)
AND (@USUARIO IN (SELECT RESPONSAVEL
                   FROM PD_ALMOXARIFADOS
                   WHERE HANDLE = @CAMPO(HANDLE))
          OR @USUARIO IN (SELECT ALMOXARIFE
                   FROM PD_ALMOXARIFES
                   WHERE ALMOXARIFADO = @CAMPO(HANDLE)))" FormUrl="~/aga/a/materiais/almoxarifados/RequisicoesDoAlmoxarifadoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5395">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5395" Title="Saldo inicial estoque terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_MOVIMENTACAOTERCEIROTOTAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPO = 'C' AND A.ALMOXARIFADO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3307_at5395_hs61cc11d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__ALMOXARIFADOS_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    