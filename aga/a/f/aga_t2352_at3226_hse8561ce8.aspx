<%@ Page Title="Fases" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fases" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MA_ROTEIROMANUTENCAOETAPAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_MA_ETAPAS__TB_MA_ETAPAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3503" class="active"><a data-toggle="tab" href="#tabWIDGET_3503"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Material previsto para reparo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7578"><a data-toggle="tab" href="#tabWIDGET_7578"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Serviço desativado p/ veículo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3953"><a data-toggle="tab" href="#tabWIDGET_3953"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Situações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3503">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3503" Title="Material previsto para reparo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_MA_ROTEIROETAPAMATERIAL.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ETAPA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2436_at3503_hsb84ca154.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_MA_ETAPAS__TB_MA_ETAPAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7578">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7578" Title="Serviço desativado p/ veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_ETAPAINTERNAVEICULOINATIVO.GRID" CanDelete="True" CanUpdate="False" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SERVICO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5210_at7578_hs13de0499.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_MA_ETAPAS__TB_MA_ETAPAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3953">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3953" Title="Situações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_ITEMROTEIROSITUACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMROTEIRO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2626_at3953_hs73779ddd.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_MA_ETAPAS__TB_MA_ETAPAS_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    