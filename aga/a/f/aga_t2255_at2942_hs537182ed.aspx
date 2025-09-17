<%@ Page Title="Requisições de contratos - Cadastradas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisições de contratos - Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3004" class="active"><a data-toggle="tab" href="#tabWIDGET_3004"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3684"><a data-toggle="tab" href="#tabWIDGET_3684"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3268"><a data-toggle="tab" href="#tabWIDGET_3268"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2935"><a data-toggle="tab" href="#tabWIDGET_2935"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Eventos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2936"><a data-toggle="tab" href="#tabWIDGET_2936"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2934"><a data-toggle="tab" href="#tabWIDGET_2934"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4492"><a data-toggle="tab" href="#tabWIDGET_4492"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2937"><a data-toggle="tab" href="#tabWIDGET_2937"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3004">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3004" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICAOANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2286_at3004_hs84d9c8d2.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3684">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3684" Title="Assinantes convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2498_at3684_hsd22f0f22.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3268">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3268" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at3268_hs76185d28.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2935">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2935" Title="Eventos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOEVENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2015_at2935_hs1a36744.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2936">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2936" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_REQUISICOES') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_REQUISICOES))" FormUrl="~/aga/a/f/aga_t1951_at2936_hsff34643f.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2934">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2934" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICAOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2256_at2934_hsaccc389b.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4492">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4492" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_REQUISICAOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2256_at4492_hs149aba74.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2937">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2937" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2135_at2937_hs74b3c700.aspx" UserDefinedDisableRowSelection="False" PageId="CN_REQUISICOES__CADASTRADAS_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    