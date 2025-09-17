<%@ Page Title="Por variação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOS.VARIACAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__VARIACAO__POR_VARIACAO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3302" class="active"><a data-toggle="tab" href="#tabWIDGET_3302"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro da variação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3298"><a data-toggle="tab" href="#tabWIDGET_3298"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro da variação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3627"><a data-toggle="tab" href="#tabWIDGET_3627"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Redução interna por variação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3299"><a data-toggle="tab" href="#tabWIDGET_3299"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta da variação")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3302">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3302" Title="Margem de lucro da variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_ESTADOTRIBUTOSMARGEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at3302_hsacb4a956.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__VARIACAO__POR_VARIACAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3298">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3298" Title="Margem de lucro da variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSMARGEM.VARIAVEL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at3298_hsf260952c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__VARIACAO__POR_VARIACAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3627">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3627" Title="Redução interna por variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOSREDUCOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2491_at3627_hs77a8c3c7.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__VARIACAO__POR_VARIACAO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3299">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3299" Title="Valor da pauta da variação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOSVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2371_at3299_hsc798d95c.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_IMPOSTOS_ESTADUAIS__VARIACAO__POR_VARIACAO_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    