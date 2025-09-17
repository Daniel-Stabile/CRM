<%@ Page Title="Banco" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Banco" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_656" class="active"><a data-toggle="tab" href="#tabWIDGET_656"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Agências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_753"><a data-toggle="tab" href="#tabWIDGET_753"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2183"><a data-toggle="tab" href="#tabWIDGET_2183"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_846"><a data-toggle="tab" href="#tabWIDGET_211_846"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Carteiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_1115"><a data-toggle="tab" href="#tabWIDGET_211_1115"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Críticas de retorno")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_848"><a data-toggle="tab" href="#tabWIDGET_211_848"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Espécies")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_851"><a data-toggle="tab" href="#tabWIDGET_211_851"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Formatos CNAB")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_847"><a data-toggle="tab" href="#tabWIDGET_211_847"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Instruções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_849"><a data-toggle="tab" href="#tabWIDGET_211_849"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Ocorrências de remessa")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_211_850"><a data-toggle="tab" href="#tabWIDGET_211_850"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Ocorrências de retorno")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1840"><a data-toggle="tab" href="#tabWIDGET_1840"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Home banking - Finalidades")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1095"><a data-toggle="tab" href="#tabWIDGET_1095"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Relatórios de bancos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_656">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_656" Title="Agências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_BANCOAGENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t739_at656_hs609cdf8c.aspx" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_753">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_753" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_BANCOCONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1313_at753_hs3816a65.aspx" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2183">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_2183" Title="Convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="10" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOCONVENIOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_846">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_846" Title="Home banking - Carteiras" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBCARTEIRAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1192_at846_hsdd5a0f94.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_1115">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_1115" Title="Home banking - Críticas de retorno" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBCRITICASRETORNO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ENTIDADE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1384_at1115_hs26392cb5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_848">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_848" Title="Home banking - Espécies" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBESPECIETITULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1194_at848_hs228c90ab.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_851">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_851" Title="Home banking - Formatos CNAB" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOTIPOARQUIVOCNAB.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1198_at851_hsaee688b3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_847">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_847" Title="Home banking - Instruções" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBINSTRUCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1193_at847_hscea5e38b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_849">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_849" Title="Home banking - Ocorrências de remessa" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBOCORRENCIASREMESSA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1195_at849_hs75a6bd36.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_211_850">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_211_850" Title="Home banking - Ocorrências de retorno" Subtitle="Cobrança" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBOCORRENCIARETORNO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1196_at850_hs656d32a8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1840">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1840" Title="Home banking - Finalidades" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCOHBFINALIDADES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1777_at1840_hsa3b5b6b5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1095">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1095" Title="Relatórios de bancos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_BANCORELATORIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.BANCO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1359_at1095_hs4f1b7bc0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FINANCEIRO__BANCOS_FORM" Level="20" Order="65"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    