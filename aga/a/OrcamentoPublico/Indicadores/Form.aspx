<%@ Page Title="Indicadores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GERAL" class="active"><a data-toggle="tab" href="#tabGERAL">Geral</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICACOESQUALITATIVAS"><a data-toggle="tab" href="#tabCLASSIFICACOESQUALITATIVAS">Classificacoes (Qualitativas)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLASSIFICACOESQUANTITATIVAS"><a data-toggle="tab" href="#tabCLASSIFICACOESQUANTITATIVAS">Classificacoes (Quantitativas)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="METAS"><a data-toggle="tab" href="#tabMETAS">Metas</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabGERAL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="GERAL" Title="Geral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_INDICADORES.ESFORCO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_FORM" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICACOESQUALITATIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICACOESQUALITATIVAS" Title="Classificacoes (Qualitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="GERAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOINDICADORES.QUALITATIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoIndicadores/Qualitativo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_FORM" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabCLASSIFICACOESQUANTITATIVAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLASSIFICACOESQUANTITATIVAS" Title="Classificacoes (Quantitativas)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="GERAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_CLASSIFICACAOINDICADORES.QUANTITATIVA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/ClassificacaoIndicadores/Quantitativo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_FORM" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabMETAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="METAS" Title="Metas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="GERAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_METASINDICADORES.METAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.INDICADOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/OrcamentoPublico/Metas/MetaIndicadores.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_INDICADORES_FORM" Level="20" Order="40"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    