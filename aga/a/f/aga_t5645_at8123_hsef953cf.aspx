<%@ Page Title="Glosas e Multas - Cadastradas" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.compra.GlosaMultaForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Glosas e Multas - Cadastradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CN_CONTRATO_GLOSASMULTAS__GLOSASMULTASCADASTRADAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="STATUS" class="active"><a data-toggle="tab" href="#tabSTATUS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8134"><a data-toggle="tab" href="#tabWIDGET_8134"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parcelas baixadas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabSTATUS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="STATUS" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_STATUS.CONTRATOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOGLOSASMULTAS') AND  A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t1951_at7984_hse399f4b4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_GLOSASMULTAS__GLOSASMULTASCADASTRADAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8134">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8134" Title="Parcelas baixadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.GLOSAMULTA.FN_PARCELAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT PARCELA FROM FN_MOVIMENTACOES WHERE  CONTRATOGLOSAMULTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1218_at8134_hsc4ecb2e2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATO_GLOSASMULTAS__GLOSASMULTASCADASTRADAS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    