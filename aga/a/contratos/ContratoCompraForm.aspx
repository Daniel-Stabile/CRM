<%@ Page Title="Contrato de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.ContratosForm" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTRATO" class="active"><a data-toggle="tab" href="#tabCONTRATO">Contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSOBJETOS"><a data-toggle="tab" href="#tabITENSOBJETOS">Itens/Objetos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DADOSFINANCEIROS"><a data-toggle="tab" href="#tabDADOSFINANCEIROS">Dados financeiros</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CRONOGRAMA"><a data-toggle="tab" href="#tabCRONOGRAMA">Cronograma</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TERCEIRIZADOS"><a data-toggle="tab" href="#tabTERCEIRIZADOS">Terceirizados/Subcontratados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ACIDENTESDETRABALHO"><a data-toggle="tab" href="#tabACIDENTESDETRABALHO">Acidentes de trabalho</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OBSERVAES"><a data-toggle="tab" href="#tabOBSERVAES">Observações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DIRIODOCONTRATO"><a data-toggle="tab" href="#tabDIRIODOCONTRATO">Diário do contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALERTAS"><a data-toggle="tab" href="#tabALERTAS">Alertas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECEBIMENTOSIMPLES"><a data-toggle="tab" href="#tabRECEBIMENTOSIMPLES">Recebimento físico</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILIAL"><a data-toggle="tab" href="#tabFILIAL">Filiais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREMISSAS"><a data-toggle="tab" href="#tabPREMISSAS">Premissas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLUSULAS"><a data-toggle="tab" href="#tabCLUSULAS">Cláusulas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS">Responsáveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS">Pessoas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSEMITIDOS"><a data-toggle="tab" href="#tabDOCUMENTOSEMITIDOS">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RENOVAES"><a data-toggle="tab" href="#tabRENOVAES">Renovações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTRATOPORPERODOS"><a data-toggle="tab" href="#tabCONTRATOPORPERODOS">Contrato por períodos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESDOCONTRATO"><a data-toggle="tab" href="#tabASSINANTESDOCONTRATO">Assinantes do contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO">Histórico</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORDENSCOMPRAGERADAS"><a data-toggle="tab" href="#tabORDENSCOMPRAGERADAS">Ordens compra geradas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSMESTRES"><a data-toggle="tab" href="#tabITENSMESTRES">Itens mestres</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CN_CONTRATOSCONDICOES_PAGAMENTO"><a data-toggle="tab" href="#tabCN_CONTRATOSCONDICOES_PAGAMENTO">Condições de pagamento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GLOSASEMULTAS"><a data-toggle="tab" href="#tabGLOSASEMULTAS">Glosas e Multas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PEDIDOSDEEMPENHO_1"><a data-toggle="tab" href="#tabPEDIDOSDEEMPENHO_1">Pedidos de Empenho</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONTRATO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTRATO" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOS_COMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSOBJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/ContratoObjetos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="12"  /></div>
        </div>
        <div class="tab-pane" id="tabDADOSFINANCEIROS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DADOSFINANCEIROS" Title="Dados financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.DADOSFINANCEIROS_COMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="13"  /></div>
        </div>
        <div class="tab-pane" id="tabCRONOGRAMA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CRONOGRAMA" Title="Cronograma" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.CRONOGRAMA_COMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="14"  /></div>
        </div>
        <div class="tab-pane" id="tabTERCEIRIZADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TERCEIRIZADOS" Title="Terceirizados/Subcontratados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_FUNCIONARIOSTERCEIROS.CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/Terceirizados.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabACIDENTESDETRABALHO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ACIDENTESDETRABALHO" Title="Acidentes de trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ACIDENTESTRABALHO.ACIDENTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/acidenteTrabalho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="18"  /></div>
        </div>
        <div class="tab-pane" id="tabOBSERVAES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="OBSERVAES" Title="Observações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.OBSERVACOES_COMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="19"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.AUDITORIA_COMPRA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabDIRIODOCONTRATO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DIRIODOCONTRATO" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2495_at7998_hs2d2a8fb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="21"  /></div>
        </div>
        <div class="tab-pane" id="tabALERTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ALERTAS" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2272_at4673_hsac0db2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="22"  /></div>
        </div>
        <div class="tab-pane" id="tabRECEBIMENTOSIMPLES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECEBIMENTOSIMPLES" Title="Recebimento físico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_RECEBIMENTOFISICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t1584_at8001_hs845dd722.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2493_at4678_hs3264fc3b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="33"  /></div>
        </div>
        <div class="tab-pane" id="tabFILIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAL" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2182_at7987_hs7017fef7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" DefaultFilterName="Classificação documento" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE) AND A.FUNCIONARIOTERCEIRO is NULL" FormUrl="~/aga/a/f/aga_t2218_at7988_hsf3846e7f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabPREMISSAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREMISSAS" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at8004_hs83d7a947.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabCLUSULAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLUSULAS" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CLAUSULA IS NULL) AND (A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2111_at7985_hs809a3af7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8091_hs4a387a50.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at7986_hsb5097a15.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSEMITIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSEMITIDOS" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.ADITIVO IS NULL) AND A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2499_at8340_hse9282dc6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabRENOVAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RENOVAES" Title="Renovações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at7994_hscfc6953a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTRATOPORPERODOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CONTRATOPORPERODOS" Title="Contrato por períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOVERSOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/contratos/compra/ContratoVersoesForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTESDOCONTRATO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESDOCONTRATO" Title="Assinantes do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOASSINANTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE) AND A.ADITIVO IS NULL" FormUrl="~/aga/a/f/aga_t2151_at8006_hsc9f90e69.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_STATUS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1951_at7984_hse399f4b4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabORDENSCOMPRAGERADAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORDENSCOMPRAGERADAS" Title="Ordens compra geradas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATOGERADOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1529_at7993_hs5238a698.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="180"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSMESTRES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSMESTRES" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2496_at7999_hsf80ed7a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="190"  /></div>
        </div>
        <div class="tab-pane" id="tabCN_CONTRATOSCONDICOES_PAGAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CN_CONTRATOSCONDICOES_PAGAMENTO" Title="Condições de pagamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.CONDICOES_PAGAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/contratos/compra/CondicaoPagamentoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="200"  /></div>
        </div>
        <div class="tab-pane" id="tabGLOSASEMULTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="GLOSASEMULTAS" Title="Glosas e Multas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOGLOSASMULTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5645_at8123_hsef953cf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="210"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ASSINATURAS_TODOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="220"  /></div>
        </div>
        <div class="tab-pane" id="tabPEDIDOSDEEMPENHO_1">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="PEDIDOSDEEMPENHO_1" Title="Pedidos de Empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS_ABA_PEDIDOSEMPENHO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="240"  />
    <wes:SimpleGrid runat="server" ID="PEDIDOSDEEMPENHOPARAENCERRAR" Title="Pedidos de Empenho para encerrar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PEDIDOSDEEMPENHO_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PEDIDOSEMPENHOS_EM_CN_CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN(SELECT B.PEDIDOEMPENHO FROM CN_CONTRATOPEDIDOSEMPENHO B WHERE B.CONTRATO = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="250"  />
    <wes:SimpleGrid runat="server" ID="PEDIDOSDEEMPENHO" Title="Pedidos de Empenho Gerados pelo contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PEDIDOSDEEMPENHO_1" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PEDIDOSEMPENHOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATOOBJETO IN ( SELECT B.HANDLE FROM CN_CONTRATOOBJETOS  B
 WHERE B.CONTRATO = @CAMPO(HANDLE) ) 
" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_COMPRA_FORM" Level="20" Order="260"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    