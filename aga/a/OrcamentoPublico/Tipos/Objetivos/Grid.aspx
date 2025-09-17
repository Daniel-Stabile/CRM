<%@ Page Title="Tipos de Objetivos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OBJETIVOESTRATGICO" class="active"><a data-toggle="tab" href="#tabOBJETIVOESTRATGICO">Tipos de Objetivo Estratégico</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDEOBJETIVOSESPECIFICOS"><a data-toggle="tab" href="#tabTIPOSDEOBJETIVOSESPECIFICOS">Tipos de Objetivos Especificos</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabOBJETIVOESTRATGICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OBJETIVOESTRATGICO" Title="Tipos de Objetivo Estratégico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_TIPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 6" FormUrl="~/aga/a/OrcamentoPublico/TipoProjeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_TIPOS_OBJETIVOS_GRID" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabTIPOSDEOBJETIVOSESPECIFICOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDEOBJETIVOSESPECIFICOS" Title="Tipos de Objetivos Especificos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_TIPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 7" FormUrl="~/aga/a/OrcamentoPublico/TipoProjeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_TIPOS_OBJETIVOS_GRID" Level="20" Order="20"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    