<%@ Page Title="Importações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_LOTEDEIMPORTAO" Title="Lote de importação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_IMPORTACAOLOTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/Pages/K_CRM_IMPORTACAOLOTE/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_IMPORTALOTE_IMPORTACOES" Level="50" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_IMPORTAODECONTAS" class="active"><a data-toggle="tab" href="#tabK_IMPORTAODECONTAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Importação de Contas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="K_IMPORTAODECONTATOS"><a data-toggle="tab" href="#tabK_IMPORTAODECONTATOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Importação de Contatos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabK_IMPORTAODECONTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_IMPORTAODECONTAS" Title="Importação de Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="K_LOTEDEIMPORTAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_IMPORTACAOLOTEPESSOA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LOTE = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_IMPORTACAOLOTEPESSOA/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_IMPORTALOTE_IMPORTACOES" Level="50" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabK_IMPORTAODECONTATOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="K_IMPORTAODECONTATOS" Title="Importação de Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="K_LOTEDEIMPORTAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="K_CRM_IMPORTACAOLOTECONTATO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LOTE = @CAMPO(HANDLE)" FormUrl="~/Pages/K_CRM_IMPORTACAOLOTECONTATO/form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="K_PAGES_K_CRM_IMPORTALOTE_IMPORTACOES" Level="50" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    