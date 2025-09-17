<%@ Page Title="CIAP - Movimentações CIAP" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOFISCAL" Title="Documento fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_ITEMCIAPMOVDOCFISCAIS.DOCUMENTOSFISCAIS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/ativo/BemDoImobilizado/DocumentosFiscais/DocumentoFiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO_CIAP__MOVIMENTACOESCIAP_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSDODOCUMENTOFISCAL" class="active"><a data-toggle="tab" href="#tabITENSDODOCUMENTOFISCAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do documento fiscal")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENSDODOCUMENTOFISCAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSDODOCUMENTOFISCAL" Title="Itens do documento fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="DOCUMENTOFISCAL" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_ITEMCIAPMOVDOCFISCALITENS.ITENSDOCUMENTOFISCAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ITEMCIAPMOVDOCFISCAIS = @CAMPO(HANDLE)" FormUrl="~/aga/a/ativo/BemDoImobilizado/DocumentosFiscais/ItemForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO_CIAP__MOVIMENTACOESCIAP_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <style>
            #DOCUMENTOFISCAL th, td {
    white-space:nowrap !important;
}

#ITENSDODOCUMENTOFISCAL th, td {
    white-space:nowrap !important;
}
            </style>
      </asp:Content>
    