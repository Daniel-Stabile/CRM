<%@ Page Title="Informações adicionais" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESADICIONAIS" Title="Informações adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.INFORMACOESADICIONAIS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_INFORMACOESADICIONAIS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO" class="active"><a data-toggle="tab" href="#tabHISTRICO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASFISCAIS"><a data-toggle="tab" href="#tabNOTASFISCAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas fiscais")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESADICIONAIS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.HISTORICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CP_ORDENSCOMPRA') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_INFORMACOESADICIONAIS" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabNOTASFISCAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASFISCAIS" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAESADICIONAIS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_ORDEMCOMPRA_NOTASFISCAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ABRANGENCIA = 'R' AND A.HANDLE IN (SELECT  B.DOCUMENTO FROM CM_ITENS B, CP_ORDENSCOMPRAITENS C  WHERE B.ORDEMCOMPRAITEM = C.HANDLE AND C.ORDEMCOMPRA = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_INFORMACOESADICIONAIS" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    