<%@ Page Title="NFSe" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="NFSE" Title="NFSe" Subtitle="informações do documento" PortletCssClass="" PortletLayout="Custom" BootstrapCols="12" FontIcon="fa fa-file" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFE.FATURAMENTO.NFSE.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFSE" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOG" class="active"><a data-toggle="tab" href="#tabLOG"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Log")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabLOG">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOG" Title="Log" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="NFSE" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFELOGS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTONFE = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_COMERCIAL_FATURAMENTO_FORM_NFSE" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    