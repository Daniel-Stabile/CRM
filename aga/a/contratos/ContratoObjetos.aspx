<%@ Page Title="Itens/objetos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.ContratoObjetos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="ITENSOBJETOS" Title="Itens/objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="COMISSES" class="active"><a data-toggle="tab" href="#tabCOMISSES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Comissões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSFINANCEIROS"><a data-toggle="tab" href="#tabDOCUMENTOSFINANCEIROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos financeiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FAIXADEVALORES"><a data-toggle="tab" href="#tabFAIXADEVALORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Faixa de valores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSDOPATRIMNIO"><a data-toggle="tab" href="#tabITENSDOPATRIMNIO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do patrimônio")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="LIBERAESFATURAMENTO"><a data-toggle="tab" href="#tabLIBERAESFATURAMENTO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Liberações faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PERODOS"><a data-toggle="tab" href="#tabPERODOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Períodos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREVISODEAPONTAMENTOS"><a data-toggle="tab" href="#tabPREVISODEAPONTAMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de apontamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PREVISODEENTREGAS"><a data-toggle="tab" href="#tabPREVISODEENTREGAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Previsão de entregas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REAJUSTES"><a data-toggle="tab" href="#tabREAJUSTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reajustes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECEBIMENTOSFSICOS"><a data-toggle="tab" href="#tabRECEBIMENTOSFSICOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recebimentos físicos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REQUISIESDECOMPRA"><a data-toggle="tab" href="#tabREQUISIESDECOMPRA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Requisições de compra")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EXTRATOMOVIMENTAES"><a data-toggle="tab" href="#tabEXTRATOMOVIMENTAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Extrato Movimentações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCOMISSES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="COMISSES" Title="Comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOCOMISSOES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3712_at5941_hsb7c8239d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSFINANCEIROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSFINANCEIROS" Title="Documentos financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_DOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT DOCUMENTOCONVENIO FROM  CN_APONTAMENTOOBJETOS  
 WHERE APONTAMENTO IN ( SELECT HANDLE FROM  CN_APONTAMENTOS  WHERE CONTRATO = @RASTRO(CN_CONTRATOS) AND HANDLE IN (SELECT APONTAMENTO FROM CN_APONTAMENTOOBJETOS WHERE OBJETO = @RASTRO(CN_CONTRATOOBJETOS)  )
))
" FormUrl="~/aga/a/f/aga_t1216_at4399_hs1f4b0010.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabFAIXADEVALORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FAIXADEVALORES" Title="Faixa de valores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_CONTRATOOBJETOFAIXAVALOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OBJETOCONTRATO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4448_at6727_hsf3861720.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSDOPATRIMNIO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSDOPATRIMNIO" Title="Itens do patrimônio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOPATRIMONIO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="REDUZIDO IS NULL OR REDUZIDO = 'N' AND (A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2728_at4373_hs775271a4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabLIBERAESFATURAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="LIBERAESFATURAMENTO" Title="Liberações faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_LIBERACOESFATURAMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CONTRATOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2557_at3796_hsd6fdc444.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabPERODOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PERODOS" Title="Períodos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_CONTRATOITEMPERIODOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.CNITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2068_at6741_hsed0c00c9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabPREVISODEAPONTAMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREVISODEAPONTAMENTOS" Title="Previsão de apontamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOENTREGAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2217_at3340_hscd8115ef.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabPREVISODEENTREGAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PREVISODEENTREGAS" Title="Previsão de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOENTREGAS_PREVENTREGAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2217_at2810_hs509037a4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabREAJUSTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REAJUSTES" Title="Reajustes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CN_OBJETOREAJUSTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.OBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2154_at2807_hsdddf970b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabRECEBIMENTOSFSICOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECEBIMENTOSFSICOS" Title="Recebimentos físicos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.ITEM.RECEBIMENTOFISICO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @TABELA(CN_CONTRATOS) AND A.CONTRATOOBJETO = @TABELA(CN_CONTRATOOBJETOS) AND (A.CONTRATOOBJETO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1584_at3746_hs519231d8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabREQUISIESDECOMPRA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="REQUISIESDECOMPRA" Title="Requisições de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CP_REQUISICOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT REQITEM.ITEMREQUISICAO FROM CN_ITEMREQUISICAOITEMCONTRATO REQITEM WHERE REQITEM.STATUS = 2 AND REQITEM.HANDLE IN (SELECT ITENSREQ.ITEMREQUISICAOITEMCONTRATO FROM CN_ITENSCONTRATOREQUISICAO ITENSREQ WHERE ITENSREQ.ITEMCONTRATO = @RASTRO(CN_CONTRATOOBJETOS) ) )" FormUrl="~/aga/a/f/aga_t868_at7911_hsff8059de.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabEXTRATOMOVIMENTAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EXTRATOMOVIMENTAES" Title="Extrato Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ITENSOBJETOS" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_EXTRATOMOVIMENTACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_CN_CONTRATOOBJETOS" Level="20" Order="130"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    