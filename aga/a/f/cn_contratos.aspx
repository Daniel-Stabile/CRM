<%@ Page Title="Contrato" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTRATODECOMPRA" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_FORM" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ADITIVOS" class="active"><a data-toggle="tab" href="#tabADITIVOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aditivos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALERTAS"><a data-toggle="tab" href="#tabALERTAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alertas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Anexos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="APONTAMENTOS"><a data-toggle="tab" href="#tabAPONTAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESDOCONTRATO"><a data-toggle="tab" href="#tabASSINANTESDOCONTRATO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes do contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESCONVNIO"><a data-toggle="tab" href="#tabASSINANTESCONVNIO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinantes convênio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLUSULAS"><a data-toggle="tab" href="#tabCLUSULAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cláusulas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONDIESDEPAGAMENTO"><a data-toggle="tab" href="#tabCONDIESDEPAGAMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Condições de pagamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DIRIODOCONTRATO"><a data-toggle="tab" href="#tabDIRIODOCONTRATO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Diário do contrato")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSEMITIDOS"><a data-toggle="tab" href="#tabDOCUMENTOSEMITIDOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos emitidos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSFINANCEIROS"><a data-toggle="tab" href="#tabDOCUMENTOSFINANCEIROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILIAL"><a data-toggle="tab" href="#tabFILIAL"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GLOSASEMULTAS"><a data-toggle="tab" href="#tabGLOSASEMULTAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Glosas e multas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="IMPOSTOSINCLUSOS"><a data-toggle="tab" href="#tabIMPOSTOSINCLUSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos inclusos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSMESTRES"><a data-toggle="tab" href="#tabITENSMESTRES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens mestres")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSOBJETOS"><a data-toggle="tab" href="#tabITENSOBJETOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens/Objetos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIBERAESFATURAMENTO"><a data-toggle="tab" href="#tabLIBERAESFATURAMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="NOTASFISCAIS"><a data-toggle="tab" href="#tabNOTASFISCAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Notas fiscais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDENSCOMPRAGERADAS"><a data-toggle="tab" href="#tabORDENSCOMPRAGERADAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens compra geradas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREMISSAS"><a data-toggle="tab" href="#tabPREMISSAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Premissas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECEBIMENTOSIMPLES"><a data-toggle="tab" href="#tabRECEBIMENTOSIMPLES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimento simples")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RENOVAES"><a data-toggle="tab" href="#tabRENOVAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Renovações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Responsáveis")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabADITIVOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ADITIVOS" Title="Aditivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOADITIVOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1910_at2814_hsb96ecffa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabALERTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ALERTAS" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2272_at4673_hsac0db2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PRESTACAOCONTA IS NULL) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2493_at4678_hs3264fc3b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabAPONTAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="APONTAMENTOS" Title="Apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_APONTAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2184_at4731_hsfb4b8b3e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTESDOCONTRATO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESDOCONTRATO" Title="Assinantes do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="ADITIVO IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2151_at8006_hsc9f90e69.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTESCONVNIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESCONVNIO" Title="Assinantes convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2498_at8000_hsb3bbcd39.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabCLUSULAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLUSULAS" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="CLAUSULA IS NULL AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at7985_hs809a3af7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabCONDIESDEPAGAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONDIESDEPAGAMENTO" Title="Condições de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOENTREGAPARCELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2246_at7996_hs94ffbb15.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabDIRIODOCONTRATO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DIRIODOCONTRATO" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2495_at7998_hs2d2a8fb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2218_at7988_hsf3846e7f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSEMITIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSEMITIDOS" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2499_at8340_hse9282dc6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSFINANCEIROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSFINANCEIROS" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_DOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO IN ( SELECT HANDLE FROM  CN_APONTAMENTOS  WHERE CONTRATO = @RASTRO(CN_CONTRATOS)))
" FormUrl="~/aga/a/f/aga_t1216_at8007_hscecd5037.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabFILIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAL" Title="Filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2182_at7987_hs7017fef7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabGLOSASEMULTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="GLOSASEMULTAS" Title="Glosas e multas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5645_at8123_hsef953cf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CN_CONTRATOS))" FormUrl="~/aga/a/f/aga_t1951_at7984_hse399f4b4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabIMPOSTOSINCLUSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="IMPOSTOSINCLUSOS" Title="Impostos inclusos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOIMPOSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4449_at8009_hscd8dbd0d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSMESTRES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSMESTRES" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2496_at7999_hsf80ed7a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="180"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSOBJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1911_at8008_hs2cd45d99.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="190"  /></div>
        </div>
        <div class="tab-pane" id="tabLIBERAESFATURAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LIBERAESFATURAMENTO" Title="Liberações faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_LIBERACOESFATURAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2557_at8002_hsb15b325e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="200"  /></div>
        </div>
        <div class="tab-pane" id="tabNOTASFISCAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="NOTASFISCAIS" Title="Notas fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_DOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DOCUMENTO FROM CM_ITENS 
WHERE HANDLE IN (SELECT ITEMNF FROM CN_LIBERACOESFATURAMENTO WHERE
CONTRATO = @RASTRO(CN_CONTRATOS)))
" FormUrl="~/aga/a/f/aga_t1216_at8003_hs1e066cbd.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="210"  /></div>
        </div>
        <div class="tab-pane" id="tabORDENSCOMPRAGERADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORDENSCOMPRAGERADAS" Title="Ordens compra geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATOGERADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1529_at7993_hs5238a698.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="220"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at7986_hsb5097a15.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="230"  /></div>
        </div>
        <div class="tab-pane" id="tabPREMISSAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREMISSAS" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at8004_hs83d7a947.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="240"  /></div>
        </div>
        <div class="tab-pane" id="tabRECEBIMENTOSIMPLES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECEBIMENTOSIMPLES" Title="Recebimento simples" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t1584_at8001_hs845dd722.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="250"  /></div>
        </div>
        <div class="tab-pane" id="tabRENOVAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RENOVAES" Title="Renovações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at7994_hscfc6953a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="260"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATODECOMPRA" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8091_hs4a387a50.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_FORM" Level="20" Order="270"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    