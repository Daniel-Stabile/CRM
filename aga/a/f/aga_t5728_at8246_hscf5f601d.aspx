<%@ Page Title="Ordens desmontagem - Canceladas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ordens desmontagem - Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PR_ORDENSDESMONTAGEM.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ORDENS_DESMONTAGEM__CANCELADAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8247" class="active"><a data-toggle="tab" href="#tabWIDGET_8247"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8242"><a data-toggle="tab" href="#tabWIDGET_8242"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Historico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8240"><a data-toggle="tab" href="#tabWIDGET_8240"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8241"><a data-toggle="tab" href="#tabWIDGET_8241"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lotes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8247">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8247" Title="Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_PR_ORDEMDESMONTAGEMAPONTAMENTO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORDEMDESMONTAGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5732_at8247_hs4dad0b43.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_DESMONTAGEM__CANCELADAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8242">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8242" Title="Historico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PR_ORDENSDESMONTAGEM') AND A.HANDLEREGISTROORIGEM = @RASTRO(PR_ORDENSDESMONTAGEM))" FormUrl="~/aga/a/f/aga_t1951_at8242_hs66d4dc30.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_DESMONTAGEM__CANCELADAS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8240">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8240" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PR_ORDEMDESMONTAGEMITENS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORDEMDESMONTAGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5730_at8240_hs7803ee44.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_DESMONTAGEM__CANCELADAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8241">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8241" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PR_ORDEMDESMONTAGEMLOTES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ORDEMDESMONTAGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5729_at8241_hse2473a96.aspx" UserDefinedDisableRowSelection="False" PageId="ORDENS_DESMONTAGEM__CANCELADAS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    