<%@ Page Title="Tipos de programas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROGRAMASTEMTICOS" class="active"><a data-toggle="tab" href="#tabPROGRAMASTEMTICOS">Programas Temáticos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROGRAMASDEOPERAO"><a data-toggle="tab" href="#tabPROGRAMASDEOPERAO">Programas de Operação</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PROGRAMASDEGESTO"><a data-toggle="tab" href="#tabPROGRAMASDEGESTO">Programas de Gestão</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabPROGRAMASTEMTICOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROGRAMASTEMTICOS" Title="Programas Temáticos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_TIPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 3" FormUrl="~/aga/a/OrcamentoPublico/TipoProjeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_TIPOS_PROGRAMAS_GRID" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabPROGRAMASDEOPERAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROGRAMASDEOPERAO" Title="Programas de Operação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_TIPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 4" FormUrl="~/aga/a/OrcamentoPublico/TipoProjeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_TIPOS_PROGRAMAS_GRID" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabPROGRAMASDEGESTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PROGRAMASDEGESTO" Title="Programas de Gestão" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_TIPO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 5" FormUrl="~/aga/a/OrcamentoPublico/TipoProjeto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_TIPOS_PROGRAMAS_GRID" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    