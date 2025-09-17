<%@ Page Title="Meta" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="META" class="active"><a data-toggle="tab" href="#tabMETA">Geral</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="QUALITATIVO"><a data-toggle="tab" href="#tabQUALITATIVO">Classificações de Metas (Qualitativas)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="QUANTITATIVOQUANTIDADE"><a data-toggle="tab" href="#tabQUANTITATIVOQUANTIDADE">Classificações de Metas (Quantitativas)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORES"><a data-toggle="tab" href="#tabINDICADORES">Indicadores</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabMETA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="META" Title="Geral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_METAS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_METAS_FORM" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabQUALITATIVO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="QUALITATIVO" Title="Classificações de Metas (Qualitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="META" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOMETAS.QUALITATIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.META = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoMetas/Qualitativo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_METAS_FORM" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabQUANTITATIVOQUANTIDADE">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="QUANTITATIVOQUANTIDADE" Title="Classificações de Metas (Quantitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="META" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOMETAS.QUANTITATIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.META = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoMetas/QuantitativoQuantidade.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_METAS_FORM" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabINDICADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDICADORES" Title="Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="META" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_METASINDICADORES.INDICADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.META = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/Metas/MetaIndicadores.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_METAS_FORM" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    