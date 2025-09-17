<%@ Page Title="Imposto" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Imposto</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7566"><a data-toggle="tab" href="#tabWIDGET_7566">Alíquotas por classificações de origem</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4370"><a data-toggle="tab" href="#tabWIDGET_4370">Alíquotas por Origem x Destino</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2435"><a data-toggle="tab" href="#tabWIDGET_2435">Vigência / Alíquotas por tipo de pessoa</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1127"><a data-toggle="tab" href="#tabWIDGET_1127">Apurações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8468"><a data-toggle="tab" href="#tabWIDGET_8468">Carga média por CNAE - MT</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3863"><a data-toggle="tab" href="#tabWIDGET_3863">Classes</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6374"><a data-toggle="tab" href="#tabWIDGET_6374">Composição dos impostos consolidados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_311_8057"><a data-toggle="tab" href="#tabWIDGET_311_8057">Configurações apuração DIFAL/FCP &gt; Estados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_311_8058"><a data-toggle="tab" href="#tabWIDGET_311_8058">Configurações apuração DIFAL/FCP &gt; Vencimentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_311_6018"><a data-toggle="tab" href="#tabWIDGET_311_6018">Configurações apuração ST - Campos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_311_6019"><a data-toggle="tab" href="#tabWIDGET_311_6019">Configurações apuração ST - Estados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_311_6020"><a data-toggle="tab" href="#tabWIDGET_311_6020">Configurações apuração ST - Vencimentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6634"><a data-toggle="tab" href="#tabWIDGET_6634">Configurações de código da receita</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6040"><a data-toggle="tab" href="#tabWIDGET_6040">Configurações de vencimento para ICMS</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7341"><a data-toggle="tab" href="#tabWIDGET_7341">Cooperativas - Composição da Base Cálculo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6583"><a data-toggle="tab" href="#tabWIDGET_6583">DIRF - Forma tributação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6582"><a data-toggle="tab" href="#tabWIDGET_6582">DIRF - Tipo rendimento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8441"><a data-toggle="tab" href="#tabWIDGET_8441">Diferencial de alíquota</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1128"><a data-toggle="tab" href="#tabWIDGET_1128">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1129"><a data-toggle="tab" href="#tabWIDGET_1129">Enquadramentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8036"><a data-toggle="tab" href="#tabWIDGET_8036">Fundo de Combate à Pobreza</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6721"><a data-toggle="tab" href="#tabWIDGET_6721">Fórmulas da apuração PIS/COFINS</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6600"><a data-toggle="tab" href="#tabWIDGET_6600">ICMS - Alíquotas simples nacional</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6088"><a data-toggle="tab" href="#tabWIDGET_6088">ISS - Alíquotas simples nacional</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3890"><a data-toggle="tab" href="#tabWIDGET_3890">Incentivos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7293"><a data-toggle="tab" href="#tabWIDGET_7293">Parâmetros Registro - I100</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6797"><a data-toggle="tab" href="#tabWIDGET_6797">Parâmetros apuração contribuição previdenciária</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2297"><a data-toggle="tab" href="#tabWIDGET_2297">Por estado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2327"><a data-toggle="tab" href="#tabWIDGET_2327">Por município</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3902"><a data-toggle="tab" href="#tabWIDGET_3902">Por município prestado</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2221"><a data-toggle="tab" href="#tabWIDGET_2221">Tabela de classificação das alíquotas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2970"><a data-toggle="tab" href="#tabWIDGET_2970">Vigência para teto do INSS (RPA)</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DIFERIMENTOICMSFATURAMENTO"><a data-toggle="tab" href="#tabDIFERIMENTOICMSFATURAMENTO">Diferimento ICMS - Faturamento</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Imposto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7566">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7566" Title="Alíquotas por classificações de origem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOPARAMICMS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5198_at7566_hs38bf5237.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4370">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4370" Title="Alíquotas por Origem x Destino" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_ESTADOTRIBUTOSALIQUOTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FAMILIA IS NULL) AND (A.PRODUTO IS NULL) AND (A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2718_at4370_hs9ec41134.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2435">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2435" Title="Vigência / Alíquotas por tipo de pessoa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOALIQUOTASESPECIFICAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2055_at2435_hs5ff2dcf5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1127">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1127" Title="Apurações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOAPURACOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t957_at1127_hs149457cb.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8468">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8468" Title="Carga média por CNAE - MT" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOCNAEMTVIGENCIA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5878_at8468_hsb3d28923.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3863">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3863" Title="Classes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOCLASSES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1829_at3863_hsa0d0a93.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6374">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6374" Title="Composição dos impostos consolidados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOCOMPOSICOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4140_at6374_hs1d09eee0.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_311_8057">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_311_8057" Title="Configurações apuração DIFAL/FCP &gt; Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOESTADOSDIFAFCP.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5539_at8057_hse5f09972.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_311_8058">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_311_8058" Title="Configurações apuração DIFAL/FCP &gt; Vencimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOVENCIMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3783_at8058_hsc5e77cc0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_311_6018">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_311_6018" Title="Configurações apuração ST - Campos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOCAMPOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3782_at6018_hscad3b0a4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_311_6019">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_311_6019" Title="Configurações apuração ST - Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOESTADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3780_at6019_hs28a0c57.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_311_6020">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_311_6020" Title="Configurações apuração ST - Vencimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOVENCIMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3783_at6020_hsca3913b1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6634">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6634" Title="Configurações de código da receita" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOCODIGOSRECEITA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4313_at6634_hsf2c33bde.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6040">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6040" Title="Configurações de vencimento para ICMS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOVENCIMENTOSESTADOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3824_at6040_hsbf5d8c65.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7341">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7341" Title="Cooperativas - Composição da Base Cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_PCCOOPERATIVAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4988_at7341_hsf9a9e06d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6583">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6583" Title="DIRF - Forma tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOSFORMATRIBUTACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4276_at6583_hsc5984913.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6582">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6582" Title="DIRF - Tipo rendimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOSTIPORENDIMENTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4275_at6582_hsc07052d8.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8441">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8441" Title="Diferencial de alíquota" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOICMSDIFA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5828_at8441_hs6d8a67e8.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1128">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1128" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_TIPODOCUMENTOIMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1215_at1128_hsc2867123.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1129">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1129" Title="Enquadramentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOENQUADRAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t956_at1129_hs870f234b.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8036">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8036" Title="Fundo de Combate à Pobreza" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOICMSFCP.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5511_at8036_hse46c7617.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6721">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6721" Title="Fórmulas da apuração PIS/COFINS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_PCIMPOSTOCALCULO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4428_at6721_hs994ad55d.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6600">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6600" Title="ICMS - Alíquotas simples nacional" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_SIMPLESNACIONALALIQUOTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3903_at6600_hs19cc68b8.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6088">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6088" Title="ISS - Alíquotas simples nacional" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_SIMPLESNACIONALALIQUOTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3903_at6088_hsec4ee615.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3890">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3890" Title="Incentivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_INCENTIVOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1831_at3890_hsd62c9e53.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7293">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7293" Title="Parâmetros Registro - I100" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_PCIFPARAMETROSI100.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4914_at7293_hs1accd15b.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="135"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6797">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6797" Title="Parâmetros apuração contribuição previdenciária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOCONTRPREV.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4510_at6797_hs11588c99.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2297">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2297" Title="Por estado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FAMILIA IS NULL) AND (A.PRODUTO IS NULL)  AND (A.VARIACAO IS NULL) AND (A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t829_at2297_hsd7d4a02.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2327">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2327" Title="Por município" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOMUNICIPIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2023_at2327_hs54514400.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3902">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3902" Title="Por município prestado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_MUNICIPIOALIQUOTAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2597_at3902_hs23bc6489.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2221">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2221" Title="Tabela de classificação das alíquotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOTABELAVIGENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1967_at2221_hsa9b1a43e.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2970">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2970" Title="Vigência para teto do INSS (RPA)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_IMPOSTOVIGENCIAINSS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.IMPOSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2267_at2970_hsd0a599d.aspx" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabDIFERIMENTOICMSFATURAMENTO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DIFERIMENTOICMSFATURAMENTO" Title="Diferimento ICMS - Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTODIFERIMENTOICMS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.IMPOSTO = @CAMPO(HANDLE)" FormUrl="~/aga/e/tributos/Impostos/DiferimentoICMS.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PASTA_DE_IMPOSTOS__IMPOSTOS_MUNICIPAIS_FORM" Level="20" Order="175"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    