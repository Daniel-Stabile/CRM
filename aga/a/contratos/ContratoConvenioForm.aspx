<%@ Page Title="Contrato de convênio" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.ContratosForm" %>
   
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
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OBSERVAES"><a data-toggle="tab" href="#tabOBSERVAES">Observações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PRESTAODECONTAS"><a data-toggle="tab" href="#tabPRESTAODECONTAS">Prestação de contas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILIAL"><a data-toggle="tab" href="#tabFILIAL">Filiais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREMISSAS"><a data-toggle="tab" href="#tabPREMISSAS">Premissas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLUSULAS"><a data-toggle="tab" href="#tabCLUSULAS">Cláusulas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RESPONSVEIS"><a data-toggle="tab" href="#tabRESPONSVEIS">Responsáveis</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS">Pessoas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSEMITIDOS"><a data-toggle="tab" href="#tabDOCUMENTOSEMITIDOS">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RENOVAES"><a data-toggle="tab" href="#tabRENOVAES">Renovações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALERTAS"><a data-toggle="tab" href="#tabALERTAS">Alertas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DIRIODOCONTRATO"><a data-toggle="tab" href="#tabDIRIODOCONTRATO">Diário do contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINANTESDOCONVNIO"><a data-toggle="tab" href="#tabASSINANTESDOCONVNIO">Assinantes do convênio</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="HISTRICO"><a data-toggle="tab" href="#tabHISTRICO">Histórico</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSFINANCEIROS"><a data-toggle="tab" href="#tabDOCUMENTOSFINANCEIROS">Documentos financeiros</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSMESTRES"><a data-toggle="tab" href="#tabITENSMESTRES">Itens mestres</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONTRATO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTRATO" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_CONTRATOS_CONVENIO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSOBJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/ContratoObjetos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="12"  /></div>
        </div>
        <div class="tab-pane" id="tabDADOSFINANCEIROS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="DADOSFINANCEIROS" Title="Dados financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.DADOSFINANCEIROS_CONVENIO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="13"  /></div>
        </div>
        <div class="tab-pane" id="tabCRONOGRAMA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CRONOGRAMA" Title="Cronograma" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.CRONOGRAMA_CONVENIO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="14"  /></div>
        </div>
        <div class="tab-pane" id="tabOBSERVAES">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="OBSERVAES" Title="Observações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.OBSERVACOES_CONVENIO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CN_CONTRATOS.AUDITORIA_CONVENIO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="16"  /></div>
        </div>
        <div class="tab-pane" id="tabPRESTAODECONTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PRESTAODECONTAS" Title="Prestação de contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPRESTACAOCONTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2259_at4745_hs97a12d78.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabFILIAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAL" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOFILIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2182_at7987_hs7017fef7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2218_at7988_hsf3846e7f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabPREMISSAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREMISSAS" Title="Premissas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPREMISSAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2224_at8004_hs83d7a947.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabCLUSULAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CLUSULAS" Title="Cláusulas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCLAUSULAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2111_at7985_hs809a3af7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabRESPONSVEIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RESPONSVEIS" Title="Responsáveis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOCOORDENADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2051_at8091_hs4a387a50.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @RASTRO(CN_CONTRATOS)" FormUrl="~/aga/a/f/aga_t2135_at7986_hsb5097a15.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSEMITIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSEMITIDOS" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_MODELODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.ADITIVO IS NULL) AND A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2499_at8340_hse9282dc6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOANEXOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2493_at4678_hs3264fc3b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabRENOVAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RENOVAES" Title="Renovações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CN_CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.ORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1907_at7994_hscfc6953a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabALERTAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ALERTAS" Title="Alertas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOALERTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2272_at4673_hsac0db2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabDIRIODOCONTRATO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DIRIODOCONTRATO" Title="Diário do contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATODIARIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2495_at7998_hs2d2a8fb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINANTESDOCONVNIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINANTESDOCONVNIO" Title="Assinantes do convênio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_ASSINANTESCONVENIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2498_at4681_hs5fd12eff.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabHISTRICO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_STATUS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CN_CONTRATOS') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1951_at7984_hse399f4b4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSFINANCEIROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSFINANCEIROS" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_FN_DOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t1216_at8007_hscecd5037.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSMESTRES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSMESTRES" Title="Itens mestres" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOMESTRE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/f/aga_t2496_at7999_hsf80ed7a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ASSINATURAS_TODOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CN_CONTRATOS_CONVENIO_FORM" Level="20" Order="180"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    