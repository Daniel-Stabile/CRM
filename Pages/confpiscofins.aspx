<%@ Page Title="Configurações para PIS/COFINS ST" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="CONFIGURAESPARAPISCOFINSST" Title="Configurações para PIS/COFINS ST" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCSTCONFIGURACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_CONFPISCOFINS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DESTINATRIOSTIPOS" class="active"><a data-toggle="tab" href="#tabDESTINATRIOSTIPOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Destinatários - Tipos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDESTINATRIOSTIPOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DESTINATRIOSTIPOS" Title="Destinatários - Tipos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONFIGURAESPARAPISCOFINSST" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCSTCONFIGURACAOCATEGORIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONFIGURACAO = @CAMPO(HANDLE)" FormUrl="~/Pages/destinatariostipos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_CONFPISCOFINS" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    