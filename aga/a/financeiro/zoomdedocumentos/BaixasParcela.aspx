<%@ Page Title="Baixas" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.BaixasParcela" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="BAIXAS" Title="Baixas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_MOVIMENTACOES.BAIXAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="5"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BAIXA" class="active"><a data-toggle="tab" href="#tabBAIXA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Baixa")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IMPOSTOSRETIDOS"><a data-toggle="tab" href="#tabIMPOSTOSRETIDOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos Retidos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabBAIXA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="BAIXA" Title="Baixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXAS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_MOVIMENTACOES_BAIXASPARCELAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="10"  />
    <wes:AjaxForm runat="server" ID="DADOSDATESOURARIA" Title="Dados da tesouraria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="BAIXA" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="LANCAMENTO_TEROUSARIA_BAIXADIRETA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(LANCAMENTOTESOURARIA)" UserDefinedCommandsVisible="True" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabIMPOSTOSRETIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPOSTOSRETIDOS" Title="Impostos Retidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="BAIXAS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOSPARCELAS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.MOVIMENTACAO=  @CAMPO(HANDLE) AND A.TIPO IN(4,3)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="40"  />
    <wes:SimpleGrid runat="server" ID="DOCUMENTOGERADO" Title="Documento Gerado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="IMPOSTOSRETIDOS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="Q_DOCGERADOIMPOSTOSPARCELAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT RETIDONABAIXA.DOCUMENTOGERADO
                          FROM FN_DOCUMENTOIMPOSTOSPARCELAS RETIDONABAIXA
                         WHERE RETIDONABAIXA.HANDLE = @CAMPO(HANDLE)
                         UNION ALL
                        SELECT RETIDOPORTERCEIRO.DOCUMENTOGERADO
                          FROM FN_RETENCAOTERCEIROPARCELA RETIDOPORTERCEIRO
                         WHERE RETIDOPORTERCEIRO.RETIDONABAIXA = @CAMPO(HANDLE))
" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    