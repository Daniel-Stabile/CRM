<%@ Page Title="Julgamentos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTO" class="active"><a data-toggle="tab" href="#tabJULGAMENTO">Julgamentos (PPA)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PLANEJAMENTOSLDO"><a data-toggle="tab" href="#tabPLANEJAMENTOSLDO">Julgamentos (LDO)</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="JULGAMENTOSLOA"><a data-toggle="tab" href="#tabJULGAMENTOSLOA">Julgamentos (LOA)</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabJULGAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTO" Title="Julgamentos (PPA)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_JULGAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 1" FormUrl="~/aga/a/OrcamentoPublico/Julgamentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_JULGAMENTOS_GRID" Level="20" Order="10"  /></div>
      </div>
      <div class="tab-pane" id="tabPLANEJAMENTOSLDO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PLANEJAMENTOSLDO" Title="Julgamentos (LDO)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_JULGAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 2" FormUrl="~/aga/a/OrcamentoPublico/Julgamentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_JULGAMENTOS_GRID" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabJULGAMENTOSLOA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="JULGAMENTOSLOA" Title="Julgamentos (LOA)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_JULGAMENTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CATEGORIA = 3" FormUrl="~/aga/a/OrcamentoPublico/Julgamentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_ORCAMENTOPUBLICO_JULGAMENTOS_GRID" Level="20" Order="30"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    