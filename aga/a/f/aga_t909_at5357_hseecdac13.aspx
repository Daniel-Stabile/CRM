<%@ Page Title="Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL__CONTAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6426" class="active"><a data-toggle="tab" href="#tabWIDGET_6426"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas gerenciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_777"><a data-toggle="tab" href="#tabWIDGET_777"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6387"><a data-toggle="tab" href="#tabWIDGET_6387"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros da conta")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7862"><a data-toggle="tab" href="#tabWIDGET_7862"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Subcontas Correlatas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6426">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6426" Title="Contas gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_CONTASGERENCIAIS.CONTABEIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT CONTAGERENCIAL FROM CT_CONTAGERENCIALCONTAS WHERE CONTACONTABIL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t916_at6426_hs5d763610.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL__CONTAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_777">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_777" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_LANCAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t923_at777_hse62f3329.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL__CONTAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6387">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6387" Title="Parâmetros da conta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAPARAMETROS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4150_at6387_hsaf4d6b7c.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL__CONTAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7862">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7862" Title="Subcontas Correlatas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_SUBCONTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5377_at7862_hs8ccc1bef.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_VERSAO_CONTA_CONTABIL__CONTAS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    