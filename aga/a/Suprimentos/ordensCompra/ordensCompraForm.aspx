<%@ Page Title="Ordens de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.ordensCompra.OrdensCompraForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDEMDECOMPRA" class="active"><a data-toggle="tab" href="#tabORDEMDECOMPRA">Ordem de Compra</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSDAOC"><a data-toggle="tab" href="#tabITENSDAOC">Itens da O.C.</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONDIESDEPAGAMENTO"><a data-toggle="tab" href="#tabCONDIESDEPAGAMENTO">Condições de pagamento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DADOSADICIONAIS"><a data-toggle="tab" href="#tabDADOSADICIONAIS">Dados adicionais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASFISCAIS"><a data-toggle="tab" href="#tabNOTASFISCAIS">Notas fiscais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO">Histórico</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabORDEMDECOMPRA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ORDEMDECOMPRA" Title="Ordem de Compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.CAPALANCAMENTOOC.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSDAOC">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSDAOC" Title="Itens da O.C." Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAITENS.ITENSOC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)" FormUrl="~/aga/a/suprimentos/ordensCompra/ItensOC.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCONDIESDEPAGAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONDIESDEPAGAMENTO" Title="Condições de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRAPAGAMENTO.CONDICAOPAGAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDENSCOMPRA = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/OrdensCompra/CondicoesPagamento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabDADOSADICIONAIS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DADOSADICIONAIS" Title="Dados adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.DADOSADICIONAIS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabNOTASFISCAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASFISCAIS" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDECOMPRA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRA.NOTASFISCAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="((A.ABRANGENCIA = 'O') AND (A.HANDLE IN
(SELECT B.DOCUMENTOFINANCEIRO FROM CP_ORDENSCOMPRAENTREGA B,
CP_ORDENSCOMPRAITENS C, CP_ORDENSCOMPRA D
WHERE B.ORDENSCOMPRAITENS = C.HANDLE AND C.ORDEMCOMPRA = D.HANDLE
AND D.HANDLE = @CAMPO(HANDLE)) OR A.HANDLE IN (SELECT D.DOCUMENTOFINANCEIRO
FROM CP_ORDENSCOMPRA D WHERE D.HANDLE = @CAMPO(HANDLE))))
OR
(A.ABRANGENCIA = 'R' AND A.HANDLE IN (SELECT  B.DOCUMENTO FROM CM_ITENS B, CP_ORDENSCOMPRAITENS C  WHERE B.ORDEMCOMPRAITEM = C.HANDLE AND C.ORDEMCOMPRA = @CAMPO(HANDLE)))" FormUrl="~/aga/a/suprimentos/ordensCompra/NotasFiscais.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORDEMDECOMPRA" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRA.HISTORICOOC.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CP_ORDENSCOMPRA') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/suprimentos/ordensCompra/statusHistorico.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_FORM" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
        <style>
            #ITENSDAOC th, td {
    white-space:nowrap !important;
}

#CONDIESDEPAGAMENTO th, td {
    white-space:nowrap !important;
}
            </style>
      </asp:Content>
    