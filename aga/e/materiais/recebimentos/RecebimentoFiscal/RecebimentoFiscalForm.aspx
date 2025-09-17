<%@ Page Title="Recebimento fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Materiais.RecebimentoFiscalPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="RECEBIMENTOFISCAL" Title="Recebimento fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS_RECEBIMENTOFISCAL.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="10"  />
      <div class="col-md-7"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS" class="active"><a data-toggle="tab" href="#tabITENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTRASINFORMES"><a data-toggle="tab" href="#tabOUTRASINFORMES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outras informações")%></a></li>
		<li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REINF"><a data-toggle="tab" href="#tabREINF"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"REINF")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANSPORTADORA"><a data-toggle="tab" href="#tabTRANSPORTADORA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Transportadora")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRIBUTAES"><a data-toggle="tab" href="#tabTRIBUTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tributações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FRETENOINCLUSO"><a data-toggle="tab" href="#tabFRETENOINCLUSO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Frete não incluso")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RETENES"><a data-toggle="tab" href="#tabRETENES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Retenções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTABILIZAO"><a data-toggle="tab" href="#tabCONTABILIZAO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contabilização")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTASFINANCEIRAS"><a data-toggle="tab" href="#tabCONTASFINANCEIRAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas Financeiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARCELAS"><a data-toggle="tab" href="#tabPARCELAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parcelas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NFE"><a data-toggle="tab" href="#tabNFE"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"NF-e")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CM_ITENS_RECEBIMENTOFISCAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/recebimentoFiscal/itensdorecebimento.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabOUTRASINFORMES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="OUTRASINFORMES" Title="Outras informações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.OUTRASINFORMACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="30"  /></div>
        </div>
		<div class="tab-pane" id="tabREINF">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="REINF" Title="REINF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.REINF.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabTRANSPORTADORA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="TRANSPORTADORA" Title="Transportadora" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.TRANSPORTADORA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabTRIBUTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRIBUTAES" Title="Tributações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_FN_DOCUMENTOTRIBUTOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/a/materiais/recebimentoFiscal/tributacoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabFRETENOINCLUSO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FRETENOINCLUSO" Title="Frete não incluso" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOTRANSPORTE.FRETENAOINCLUSO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.DOCUMENTO = @CAMPO(HANDLE)) OR (A.HANDLE IN(SELECT B.DOCUMENTOTRANSPORTE FROM FN_DOCUMENTOTRANSPORTENOTAS B WHERE B.NOTAFISCAL = @CAMPO(HANDLE)) )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabRETENES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RETENES" Title="Retenções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOIMPOSTOS.RECFISCAL.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTABILIZAO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTABILIZAO" Title="Contabilização" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CONTABILIZACAOFATURAMENTOCOMERCIAL.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.LANCAMENTOFINANCEIRO = @CAMPO(DOCUMENTOORIGEM))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTASFINANCEIRAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTASFINANCEIRAS" Title="Contas Financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONTASFINANCEIRASFATURAMENTOCOMERCIAL.DATASOURCE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" FormUrl="~/aga/e/financeiro/ContasFinanceiras/ContasFinanceiras.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabPARCELAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.ZOOMDEDOCUMENTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="( (A.DOCUMENTO = @CAMPO(DOCUMENTOORIGEM)) OR (A.DOCUMENTO = @CAMPO(HANDLE)) )" FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx?hdl=@CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabNFE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="NFE" Title="NF-e" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="RECEBIMENTOFISCAL" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTONFE.RECFISCAL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_MATERIAIS_RECEBIMENTOFISCAL_RECEBIMENTOFISCALFORM" Level="20" Order="120"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    