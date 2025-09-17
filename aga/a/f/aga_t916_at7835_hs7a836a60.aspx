<%@ Page Title="Contas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_CONTASGERENCIAIS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2192" class="active"><a data-toggle="tab" href="#tabWIDGET_2192"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas calculadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_747"><a data-toggle="tab" href="#tabWIDGET_747"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas contábeis")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1029"><a data-toggle="tab" href="#tabWIDGET_1029"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas financeiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6053"><a data-toggle="tab" href="#tabWIDGET_6053"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas gerenciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5939"><a data-toggle="tab" href="#tabWIDGET_5939"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamento manual")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6051"><a data-toggle="tab" href="#tabWIDGET_6051"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos de papeis de trabalho")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6050"><a data-toggle="tab" href="#tabWIDGET_6050"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Papeis de Trabalho")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2708"><a data-toggle="tab" href="#tabWIDGET_2708"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Prazo de emissão")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_917"><a data-toggle="tab" href="#tabWIDGET_917"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Prazos de realização")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8179"><a data-toggle="tab" href="#tabWIDGET_8179"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Subcontas Correlatas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASEXPLICATIVAS"><a data-toggle="tab" href="#tabNOTASEXPLICATIVAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas explicativas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2192">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2192" Title="Contas calculadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_CONTAGERENCIALFORMULAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAINFORMADA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1957_at2192_hsace42200.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_747">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_747" Title="Contas contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAGERENCIALCONTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t917_at747_hs35e70fc9.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1029">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1029" Title="Contas financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAGERENCIALFINANCEIRAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1298_at1029_hsabf1c84a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6053">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6053" Title="Contas gerenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAGERENCIALORCAMENTARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2025_at6053_hs1a1775e1.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5939">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5939" Title="Lançamento manual" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAGERENCIALDIGITADA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3699_at5939_hs2c21d246.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6051">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6051" Title="Lançamentos de papeis de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_TOTAISDEMONSTRACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3835_at6051_hs418b9d69.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6050">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6050" Title="Papeis de Trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CONTAGERENCIALSUBITEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="ITEMSUPERIOR IS NULL AND (A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3834_at6050_hscc1b6555.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2708">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_2708" Title="Prazo de emissão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PRAZOSEMISSAO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_917">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_917" Title="Prazos de realização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PRAZOSREALIZACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1236_at917_hs99e55d1e.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8179">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8179" Title="Subcontas Correlatas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_SUBCONTASGERENCIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5644_at8179_hsde6bb23.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabNOTASEXPLICATIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASEXPLICATIVAS" Title="Notas explicativas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_NOTAEXPLICATIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTAGERENCIAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t917_at747_hs35e70fb1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CONTAS_FORM" Level="20" Order="65"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            var tabPrazoEmissao = $('li[data-widget-id="WIDGET_2708"]');
var widgetPrazoEmissao = $('#ctl00_Main_WIDGET_2708_ctl04');

$( document ).ready(function() {
    var analitico = $('#ctl00_Main_FORMULARIO_formView_PageControl_GERAL_GERAL_ULTIMONIVEL_CHECKBOX').is(':checked');
    var calculado = $('#ctl00_Main_FORMULARIO_formView_PageControl_GERAL_GERAL_GRUPODEMONSTRATIVOCONTABIL_6_GroupRadioButton_ORCAMENTO_C').is(':checked');
    
    if (!(analitico && calculado)) {
        $(widgetPrazoEmissao).hide();
        $(tabPrazoEmissao).hide();
    }
    else {
        $(widgetPrazoEmissao).show();
        $(tabPrazoEmissao).show();
    }
});

            </script>
      </asp:Content>
    