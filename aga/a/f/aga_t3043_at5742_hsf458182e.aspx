<%@ Page Title="Financeiro - Trimestral" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="DIOPS - Financeiro - Trimestral" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_CT_ANSPERIODOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5819" class="active"><a data-toggle="tab" href="#tabWIDGET_5819"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros - Balancete")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_5402"><a data-toggle="tab" href="#tabWIDGET_1674_5402"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ativos Vinculados - Investimentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_5749"><a data-toggle="tab" href="#tabWIDGET_1674_5749"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ativos Vinculados - Imobiliários")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_5405"><a data-toggle="tab" href="#tabWIDGET_1674_5405"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Idade de saldos ativos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_5406"><a data-toggle="tab" href="#tabWIDGET_1674_5406"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Idade de saldos passivos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5741"><a data-toggle="tab" href="#tabWIDGET_5741"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros - Lucros/Prejuizos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5760"><a data-toggle="tab" href="#tabWIDGET_5760"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Solvência")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_6067"><a data-toggle="tab" href="#tabWIDGET_1674_6067"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Intercâmbio - A pagar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_6066"><a data-toggle="tab" href="#tabWIDGET_1674_6066"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Intercâmbio - A receber")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_7350"><a data-toggle="tab" href="#tabWIDGET_1674_7350"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Intercâmbio eventual - A faturar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_7110"><a data-toggle="tab" href="#tabWIDGET_1674_7110"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Intercâmbio eventual - A pagar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_7111"><a data-toggle="tab" href="#tabWIDGET_1674_7111"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Intercâmbio eventual - A receber")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7109"><a data-toggle="tab" href="#tabWIDGET_7109"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Cobertura assistencial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_6419"><a data-toggle="tab" href="#tabWIDGET_1674_6419"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Corresponsabilidade - Assumidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1674_6420"><a data-toggle="tab" href="#tabWIDGET_1674_6420"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Corresponsabilidade - Transferidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6421"><a data-toggle="tab" href="#tabWIDGET_6421"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Evento/Sinistros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8110"><a data-toggle="tab" href="#tabWIDGET_8110"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contraprestações a receber")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6657"><a data-toggle="tab" href="#tabWIDGET_6657"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contratos estipulados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5824"><a data-toggle="tab" href="#tabWIDGET_5824"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Log das validações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8118"><a data-toggle="tab" href="#tabWIDGET_8118"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Mov. Prov. Eventos/Sinistros a Liquidar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8296"><a data-toggle="tab" href="#tabWIDGET_8296"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histório de envio")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5819">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_5819" Title="Parâmetros - Balancete" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSBALANCETES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="10"  />
    <wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGET_5819" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_ANSBALANCETELANCAMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.BALANCETE = @cAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3536_at5819_hse22887d1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="12"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_5402">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_5402" Title="Ativos Vinculados - Investimentos" Subtitle="Parâmetros" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSATIVOSVINCINV.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3362_at5402_hs429a9331.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_5749">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_5749" Title="Ativos Vinculados - Imobiliários" Subtitle="Parâmetros" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSATIVOSVINCIMOB.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3448_at5749_hs58b16675.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_5405">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1674_5405" Title="Idade de saldos ativos" Subtitle="Parâmetros" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSIDADESALDOSATIVO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_5406">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1674_5406" Title="Idade de saldos passivos" Subtitle="Parâmetros" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSIDADESALDOSPASSIVO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5741">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_5741" Title="Parâmetros - Lucros/Prejuizos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSLUCROSPREJUIZOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5760">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_5760" Title="Solvência" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSSOLVENCIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="40"  />
    <wes:SimpleGrid runat="server" ID="PARTICIPAES" Title="Participações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGET_5760" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSSOLVENCIAPARTICIPACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.SOLVENCIA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t3464_at5760_hs4d176520.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="42"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_6067">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_6067" Title="Intercâmbio - A pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSINTERCAMBIOPAGAR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3856_at6067_hse5a607f3.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_6066">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_6066" Title="Intercâmbio - A receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSINTERCAMBIORECEBER.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3855_at6066_hsdc2e8471.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_7350">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1674_7350" Title="Intercâmbio eventual - A faturar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSINTERCAMBIOEVENTFATURAR.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_7110">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_7110" Title="Intercâmbio eventual - A pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSINTERCAMBIOEVENTPAGAR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4718_at7110_hsf8b634a8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_7111">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_7111" Title="Intercâmbio eventual - A receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSINTERCAMBIOEVENTRECEBER.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4719_at7111_hsb4863fd2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7109">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7109" Title="Cobertura assistencial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSCOBERTURAASSISTENCIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4717_at7109_hs5b43b2a1.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_6419">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_6419" Title="Corresponsabilidade - Assumidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSCORRESPASSUMIDA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4176_at6419_hs56291108.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1674_6420">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1674_6420" Title="Corresponsabilidade - Transferidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSCORRESPTRANSFERIDA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4177_at6420_hsa1a1ac54.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6421">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_6421" Title="Evento/Sinistros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSEVENTOSINISTRO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8110">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_8110" Title="Contraprestações a receber" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_CT_ANSCONTRAPRESRECEBER.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6657">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6657" Title="Contratos estipulados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_ANSCONTRATOSESTIPULADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4351_at6657_hsb13dfe0c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5824">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5824" Title="Log das validações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_GRUPOLOGS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.IDENTIFICADOR = 'CT_ANSPERIODOS' AND A.CHAVE = (@RASTRO(CT_ANSPERIODOS))" FormUrl="~/aga/a/f/aga_t3487_at5824_hse74fe7b2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8118">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8118" Title="Mov. Prov. Eventos/Sinistros a Liquidar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="AGA_CT_ANSPROVEVENTSINISTLIQ.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5634_at8118_hs2f05e54c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8296">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8296" Title="Histório de envio" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_CT_LOG.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PERIODO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5758_at8296_hs9b7c1e30.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ANS_TIPO_PERIODO__TRIMESTRAL_FORM" Level="20" Order="120"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <script type="text/javascript">
            $(function(){

var cmp = $('input[type="radio"][value="'+getParameterByName('tipo')+'"]');
if (cmp.length > 0) {
 cmp.trigger('click');
 setTimeout(function() {$('[data-field="TIPO"]').find(':input[type="radio"]').attr('disabled', true)}, 1000);
}

})

function getParameterByName(name, url) {
        if (!url) url = window.location.href;
        name = name.replace(/[\[\]]/g, "\\$&");
        var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
            results = regex.exec(url);
        if (!results) return null;
        if (!results[2]) return '';
        return decodeURIComponent(results[2].replace(/\+/g, " "));
    }

            </script>
      </asp:Content>
    