<%@ Page Title="Detalhamento do ajuste" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="DETALHAMENTODEAJUSTE" Title="Detalhamento de ajuste" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOAJUSTEDETALHES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.AJUSTE=@TABELA(TR_PCAPURACAOAJUSTES)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="DETALHAMENTODOAJUSTEM110M510" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DETALHAMENTODOAJUSTE" class="active"><a data-toggle="tab" href="#tabDETALHAMENTODOAJUSTE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Detalhamento do ajuste")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabDETALHAMENTODOAJUSTE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DETALHAMENTODOAJUSTE" Title="Detalhamento do ajuste" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DETALHAMENTODEAJUSTE" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_PCAPURACAOAJUSTEDETALHES.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="DETALHAMENTODOAJUSTEM110M510" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    