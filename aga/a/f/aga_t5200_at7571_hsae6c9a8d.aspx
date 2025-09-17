<%@ Page Title="Parâmetros - Financeiro - Mensal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Parâmetros - Financeiro - Mensal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSPARAMETROSPERIODODFC.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form' AND (A.PERIODODFC = @CAMPOHANDLE)" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_PARAMETROS__CT_ANSPARAMENTROSPERIODODFC_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7574" class="active"><a data-toggle="tab" href="#tabWIDGET_7574"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades de financiamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7573"><a data-toggle="tab" href="#tabWIDGET_7573"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades de investimento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7572"><a data-toggle="tab" href="#tabWIDGET_7572"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atividades operacionais")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7574">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_7574" Title="Atividades de financiamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_ANSATIVIDADEFINANCIAMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODODFC = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_PARAMETROS__CT_ANSPARAMENTROSPERIODODFC_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7573">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_7573" Title="Atividades de investimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSATIVIDADEINVESTIMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODODFC = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_PARAMETROS__CT_ANSPARAMENTROSPERIODODFC_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7572">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_7572" Title="Atividades operacionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_ANSATIVIDADEOPERACIONAIS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODODFC = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_PARAMETROS__CT_ANSPARAMENTROSPERIODODFC_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    