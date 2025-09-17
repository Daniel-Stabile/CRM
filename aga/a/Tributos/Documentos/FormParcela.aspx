<%@ Page Title="Parcelas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARCELA" class="active"><a data-toggle="tab" href="#tabPARCELA">Parcela</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INFORMAESBANCRIAS"><a data-toggle="tab" href="#tabINFORMAESBANCRIAS">Informações bancárias</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="BAIXAS"><a data-toggle="tab" href="#tabBAIXAS">Baixas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OCORRNCIAS"><a data-toggle="tab" href="#tabOCORRNCIAS">Ocorrências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTASFINANCEIRAS"><a data-toggle="tab" href="#tabCONTASFINANCEIRAS">Contas Financeiras</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REMESSAELETRNICA"><a data-toggle="tab" href="#tabREMESSAELETRNICA">Remessa eletrônica</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabPARCELA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PARCELA" Title="Parcela" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_PARCELAS.FISCAL.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabINFORMAESBANCRIAS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="INFORMAESBANCRIAS" Title="Informações bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARCELA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.FISCAL.INFORMACOESBANCARIAS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabBAIXAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="BAIXAS" Title="Baixas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARCELA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_MOVIMENTACOES.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN (1,2,3,4,5,6,8,9,14,15,17,18,19,20,22,23)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabOCORRNCIAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OCORRNCIAS" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARCELA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_MOVIMENTACOES.FISCAL.OCORRENCIAS.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO NOT IN (1,2,3,4,5,6,8,9,14,15,17,18,19,20,22,23)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTASFINANCEIRAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTASFINANCEIRAS" Title="Contas Financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARCELA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOS.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="50"  />
    <wes:SimpleGrid runat="server" ID="CENTRODECUSTO" Title="Centro de Custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CONTASFINANCEIRAS" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_LANCAMENTOCC.FISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabREMESSAELETRNICA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="REMESSAELETRNICA" Title="Remessa eletrônica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="PARCELA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.FISCAL.INFOREMESSA.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_TRIBUTOS_DOCUMENTOS_FORMPARCELA" Level="20" Order="70"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    