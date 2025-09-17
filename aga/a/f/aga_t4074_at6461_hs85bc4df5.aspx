<%@ Page Title="CIAP - Outros créditos de ICMS" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="CIAP - Outros créditos de ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMCIAPOUTROSCREDITOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO_CIAP__OUTROSCREDITOSICMS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6299" class="active"><a data-toggle="tab" href="#tabWIDGET_6299"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Movimentações CIAP p/ outros créditos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6294"><a data-toggle="tab" href="#tabWIDGET_6294"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parcelas de rec. outros créditos ICMS")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6299">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6299" Title="Movimentações CIAP p/ outros créditos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_AT_ITEMCIAPMOVIMENTACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTACAOCIAP = 6 AND (A.OUTROSCREDITOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3995_at6299_hsa0bdb7c8.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO_CIAP__OUTROSCREDITOSICMS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6294">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6294" Title="Parcelas de rec. outros créditos ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_AT_ITEMCIAPOUTROSCREDPARCELAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMCIAPOUTROSCREDITOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4075_at6294_hs20205681.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO_CIAP__OUTROSCREDITOSICMS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    