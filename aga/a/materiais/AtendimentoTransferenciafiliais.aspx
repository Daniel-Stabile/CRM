<%@ Page Title="Atendimento transferência filiais" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.materiaisAtendimentoTransferenciafiliaisPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="ATENDIMENTOTRANSFERNCIAFILIAIS" Title="Atendimento transferência filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICOES.ATENDIMENTOFILIAIS.CUSTOM.GRID" DefaultFilterName="Padr" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 'F'
  AND A.STATUS IN (2,
                   9)
  AND A.ALMOXARIFADOORIGEM IN
    (SELECT I.HANDLE
     FROM PD_ALMOXARIFADOS I
     WHERE I.FILIAL = @FILIAL)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_ATENDIMENTOTRANSFERENCIAFILIAIS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LOTES" class="active"><a data-toggle="tab" href="#tabLOTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lotes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESTOQUE"><a data-toggle="tab" href="#tabESTOQUE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Estoque")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabLOTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATENDIMENTOTRANSFERNCIAFILIAIS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOATENDIMENTOLOTES.TRANSFERENCIAFILIASCUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/AtendimentoTransferenciafiliais/Lotes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_ATENDIMENTOTRANSFERENCIAFILIAIS" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabESTOQUE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ESTOQUE" Title="Estoque" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ATENDIMENTOTRANSFERNCIAFILIAIS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ALMOXARIFADOPRODUTOS.TRANSFERENCIAFILIAS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(PRODUTO)" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_ATENDIMENTOTRANSFERENCIAFILIAIS" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    