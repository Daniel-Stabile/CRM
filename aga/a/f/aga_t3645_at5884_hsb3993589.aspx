<%@ Page Title="Integração de documento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Integração de documento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_ESTRUTURAINTEGRACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_FINANCEIRO__INTEGRACAO_DOCUMENTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5880" class="active"><a data-toggle="tab" href="#tabWIDGET_5880"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5881"><a data-toggle="tab" href="#tabWIDGET_5881"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lançamentos financeiros - ativo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5880">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5880" Title="Lançamentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_FN_ESTRUTURAINTEGRACAOLAN.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTRUTURAINTEGRACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3646_at5880_hs4e29d7d5.aspx" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__INTEGRACAO_DOCUMENTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5881">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5881" Title="Lançamentos financeiros - ativo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_ESTRUTURAINTEGRACAOLAN.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTRUTURAINTEGRACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3646_at5881_hs97183aa1.aspx" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_FINANCEIRO__INTEGRACAO_DOCUMENTOS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    