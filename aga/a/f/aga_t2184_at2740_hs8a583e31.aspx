<%@ Page Title="Apontamentos/medições - Cadastrados/em medição" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Apontamentos/medições - Cadastrados/em medição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CN_APONTAMENTOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_APONTAMENTOS__CADASTRADOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2888" class="active"><a data-toggle="tab" href="#tabWIDGET_2888"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2828"><a data-toggle="tab" href="#tabWIDGET_2828"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3907"><a data-toggle="tab" href="#tabWIDGET_3907"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Municípios")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2888">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2888" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_APONTAMENTOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_APONTAMENTOS))" FormUrl="~/aga/a/f/aga_t1951_at2888_hsa1fac1cc.aspx" UserDefinedDisableRowSelection="False" PageId="CN_APONTAMENTOS__CADASTRADOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2828">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2828" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOOBJETOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.APONTAMENTO  IN (@RASTRO(CN_APONTAMENTOS))" FormUrl="~/aga/a/f/aga_t2226_at2828_hsf72f1aec.aspx" UserDefinedDisableRowSelection="False" PageId="CN_APONTAMENTOS__CADASTRADOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3907">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3907" Title="Municípios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CN_APONTAMENTOMUNICIPIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.APONTAMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2601_at3907_hsbf19cb1a.aspx" UserDefinedDisableRowSelection="False" PageId="CN_APONTAMENTOS__CADASTRADOS_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    