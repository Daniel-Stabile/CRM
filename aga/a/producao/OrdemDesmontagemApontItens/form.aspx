<%@ Page Title="Item" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ITEM" Title="Item" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PR_ORDEMDESMONTAGEMAPONTITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORDEMDESMONTAGEMAPONTITENS_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOTES" class="active"><a data-toggle="tab" href="#tabLOTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lotes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabLOTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITEM" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PR_DESMONTAGEMAPONTITEMLOTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.APONTAMENTOITEM = @CAMPO(HANDLE)" FormUrl="~/aga/a/producao/OrdemDesmontagemApontItensLotes/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDEMDESMONTAGEMAPONTITENS_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    