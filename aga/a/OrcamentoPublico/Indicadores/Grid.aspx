<%@ Page Title="Indicadores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORESDEESFORO" class="active"><a data-toggle="tab" href="#tabINDICADORESDEESFORO">Indicadores de Esforço</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORESDEIMPACTO"><a data-toggle="tab" href="#tabINDICADORESDEIMPACTO">Indicadores de Impacto</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabINDICADORESDEESFORO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDICADORESDEESFORO" Title="Indicadores de Esforço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_INDICADORES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1" FormUrl="~/aga/a/OrcamentoPublico/Indicadores/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_GRID" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabINDICADORESDEIMPACTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDICADORESDEIMPACTO" Title="Indicadores de Impacto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_INDICADORES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 2" FormUrl="~/aga/a/OrcamentoPublico/Indicadores/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_GRID" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    