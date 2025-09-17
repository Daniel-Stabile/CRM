<%@ Page Title="Tipos de movimentação - Recebimento fiscal" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tipo de movimentação" Subtitle="Recebimento fiscal" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_OPERACOESFATURAMENTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOSMOVIMENTACAORECFISCAL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAES" class="active"><a data-toggle="tab" href="#tabOPERAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAESVLIDASITENS"><a data-toggle="tab" href="#tabOPERAESVLIDASITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações válidas itens")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabOPERAES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAES" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_OPERACAODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OPERACAOCOMERCIAL = @CAMPO(HANDLE))" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOSMOVIMENTACAORECFISCAL_FORM" Level="20" Order="11"  /></div>
        </div>
        <div class="tab-pane" id="tabOPERAESVLIDASITENS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OPERAESVLIDASITENS" Title="Operações válidas itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_OPERACAOITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OPERACAOCOMERCIAL = @CAMPO(HANDLE))" PageId="TABELAS_AUXILIARES_FINANCEIRO__TIPOSMOVIMENTACAORECFISCAL_FORM" Level="20" Order="21"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    