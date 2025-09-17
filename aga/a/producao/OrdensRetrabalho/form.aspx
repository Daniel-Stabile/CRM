<%@ Page Title="Ordem Retrabalho" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ORDEMRETRABALHO" Title="Ordem Retrabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDENSRETRABALHO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_ORDENSRETRABALHO_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSCONSUMO" class="active"><a data-toggle="tab" href="#tabITENSCONSUMO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens Consumo")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITEMRETORNO"><a data-toggle="tab" href="#tabITEMRETORNO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Item Retorno")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TAREFAS"><a data-toggle="tab" href="#tabTAREFAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tarefas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOTES"><a data-toggle="tab" href="#tabLOTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lotes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENSCONSUMO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSCONSUMO" Title="Itens Consumo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMRETRABALHO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_A_PR_ORDEMRETRABALHOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMRETRABALHO = @CAMPO(HANDLE) AND A.TIPOITEM = 1" FormUrl="~/aga/a/producao/OrdemRetrabalhoItens/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDENSRETRABALHO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabITEMRETORNO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITEMRETORNO" Title="Item Retorno" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMRETRABALHO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_A_PR_ORDEMRETRABALHOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMRETRABALHO = @CAMPO(HANDLE) AND A.TIPOITEM = 2" FormUrl="~/aga/a/producao/OrdemRetrabalhoItens/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDENSRETRABALHO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTAREFAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TAREFAS" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMRETRABALHO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_A_PR_ORDEMRETRABALHOTAREFAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMRETRABALHO = @CAMPO(HANDLE)" FormUrl="~/aga/a/producao/PrOrdemretrabalhotarefas/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDENSRETRABALHO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabLOTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMRETRABALHO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_ORDEMRETRABALHOLOTES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMRETRABALHO = @CAMPO(HANDLE)" FormUrl="~/aga/a/producao/OrdemRetrabalhoLote/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_ORDENSRETRABALHO_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    