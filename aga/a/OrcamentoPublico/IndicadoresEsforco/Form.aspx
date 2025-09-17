<%@ Page Title="Indicadores de esforço" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORDEESFORO" class="active"><a data-toggle="tab" href="#tabINDICADORDEESFORO">Indicador de Esforço</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAOESQUALITATIVAS"><a data-toggle="tab" href="#tabCLASSIFICAOESQUALITATIVAS">Classificaçoes (Qualitativas)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICAESQUANTITATIVAS"><a data-toggle="tab" href="#tabCLASSIFICAESQUANTITATIVAS">Classificações (Quantitativas)</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabINDICADORDEESFORO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="INDICADORDEESFORO" Title="Indicador de Esforço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_INDICADORES.ESFORCO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_ESFORCO_FORM" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICAOESQUALITATIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICAOESQUALITATIVAS" Title="Classificaçoes (Qualitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADORDEESFORO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOINDICADORES.QUALITATIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoIndicadores/Qualitativo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_ESFORCO_FORM" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICAESQUANTITATIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICAESQUANTITATIVAS" Title="Classificações (Quantitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INDICADORDEESFORO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOINDICADORES.QUANTITATIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoIndicadores/Quantitativo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_ESFORCO_FORM" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    