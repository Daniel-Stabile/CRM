<%@ Page Title="Fórmulas de apurações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMTR_FILTROS" Title="Fórmulas de apurações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_FILTROS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PAGES_FORMULADEAPURACOES_FORM" Level="20" Order="100"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESTRIESDOCAMPO" class="active"><a data-toggle="tab" href="#tabRESTRIESDOCAMPO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Restrições do campo")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRESTRIESDOCAMPO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESTRIESDOCAMPO" Title="Restrições do campo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMTR_FILTROS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_FILTROCONDICOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FILTRO = @CAMPO(HANDLE) AND A.TABELA = @CAMPO(TABELA)" FormUrl="~/aga/a/Tributos/FiltroCondicoes/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PAGES_FORMULADEAPURACOES_FORM" Level="20" Order="110"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    