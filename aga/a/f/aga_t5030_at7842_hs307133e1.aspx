<%@ Page Title="Ajustes de exercícios anteriores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ajustes de exercícios anteriores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_PAPEISTRABALHOAJUSTES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CT_PAPEISTRABALHOAJUSTES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7379" class="active"><a data-toggle="tab" href="#tabWIDGET_7379"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos contábeis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7379">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7379" Title="Lançamentos contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_LANCAMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT RELACIONAMENTO.LANCAMENTO FROM CT_RELACAOLANCAMENTOAJUSTE RELACIONAMENTO WHERE RELACIONAMENTO.AJUSTE = @TABELA(CT_PAPEISTRABALHOAJUSTES))" FormUrl="~/aga/a/f/aga_t923_at7379_hsab30501a.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_PLANO_GERENCIAL_DEMONSTRATIVO__CT_PAPEISTRABALHOAJUSTES_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    