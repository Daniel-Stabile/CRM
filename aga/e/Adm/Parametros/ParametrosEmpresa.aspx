<%@ Page Title="Parâmetros da empresa" Language="C#" Inherits="aga.a.administracao.ParametrosPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
        <div class="row">
            <div class="col-md-3 col-sm-3 col-xs-3">
                <ul class="nav nav-tabs tabs-left">
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Parâmetros</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_585"><a data-toggle="tab" href="#tabWIDGET_585">Filiais</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6287"><a data-toggle="tab" href="#tabWIDGET_6287">Grupo de estabelecimentos fiscais</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4775"><a data-toggle="tab" href="#tabWIDGET_4775">Impostos somente leitura (form retenções)</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_854"><a data-toggle="tab" href="#tabWIDGET_854">Instruções de cobrança</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7181"><a data-toggle="tab" href="#tabWIDGET_7181">Log de Alterações</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8443"><a data-toggle="tab" href="#tabWIDGET_8443">Parâmetros ERP web</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARMETROSDOMDULOGESTOESTRATGICA"><a data-toggle="tab" href="#tabPARMETROSDOMDULOGESTOESTRATGICA">Parâmetros do Módulo Gestão Estratégica</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8294"><a data-toggle="tab" href="#tabWIDGET_8294">Parâmetros de Integração FR</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1681"><a data-toggle="tab" href="#tabWIDGET_1681">Parâmetros do módulo IN68/95</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4605"><a data-toggle="tab" href="#tabWIDGET_4605">Parâmetros do módulo LALUR</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_845"><a data-toggle="tab" href="#tabWIDGET_845">Parâmetros do módulo ativo</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2336"><a data-toggle="tab" href="#tabWIDGET_2336">Parâmetros do módulo comercial</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1258"><a data-toggle="tab" href="#tabWIDGET_1258">Parâmetros do módulo comissões</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2911"><a data-toggle="tab" href="#tabWIDGET_2911">Parâmetros do módulo contrato corrigido</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_842"><a data-toggle="tab" href="#tabWIDGET_842">Parâmetros do módulo contábil</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5065"><a data-toggle="tab" href="#tabWIDGET_5065">Parâmetros do módulo exportação</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_925"><a data-toggle="tab" href="#tabWIDGET_925">Parâmetros do módulo factoring</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_841"><a data-toggle="tab" href="#tabWIDGET_841">Parâmetros do módulo financeiro</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3288"><a data-toggle="tab" href="#tabWIDGET_3288">Parâmetros do módulo financeiro 2</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3026"><a data-toggle="tab" href="#tabWIDGET_3026">Parâmetros do módulo financiamentos</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6119"><a data-toggle="tab" href="#tabWIDGET_6119">Parâmetros do módulo frente de loja</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4335"><a data-toggle="tab" href="#tabWIDGET_4335">Parâmetros do módulo frotas</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5251"><a data-toggle="tab" href="#tabWIDGET_5251">Parâmetros do módulo importação</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2769"><a data-toggle="tab" href="#tabWIDGET_2769">Parâmetros do módulo leilões</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3458"><a data-toggle="tab" href="#tabWIDGET_3458">Parâmetros do módulo materiais</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORCAMENTO"><a data-toggle="tab" href="#tabPARMETROSDOMDULOORCAMENTO">Parâmetros do módulo orçamento</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1166"><a data-toggle="tab" href="#tabWIDGET_1166">Parâmetros do módulo ordem de viagem</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5846"><a data-toggle="tab" href="#tabWIDGET_5846">Parâmetros do módulo SPED - ECD</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5837"><a data-toggle="tab" href="#tabWIDGET_5837">Parâmetros do módulo SPED - EFD</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6507"><a data-toggle="tab" href="#tabWIDGET_6507">Parâmetros do módulo SPED - FCont</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PARMETROSDOMDULOSPEDREINF"><a data-toggle="tab" href="#tabPARMETROSDOMDULOSPEDREINF">Parâmetros do módulo SPED - REINF</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3558"><a data-toggle="tab" href="#tabWIDGET_3558">Parâmetros do módulo suprimentos</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_843"><a data-toggle="tab" href="#tabWIDGET_843">Parâmetros do módulo tributos</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_173_7394"><a data-toggle="tab" href="#tabWIDGET_173_7394">Parâmetros dos portais Web &gt; Parâmetros gerais</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_173_7391"><a data-toggle="tab" href="#tabWIDGET_173_7391">Parâmetros dos portais Web &gt; Portal do cliente</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_173_7392"><a data-toggle="tab" href="#tabWIDGET_173_7392">Parâmetros dos portais Web &gt; Portal do fornecedor</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_173_7393"><a data-toggle="tab" href="#tabWIDGET_173_7393">Parâmetros dos portais Web &gt; Portal do representante</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_844"><a data-toggle="tab" href="#tabWIDGET_844">Parâmetros genéricos</a></li>
                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4834"><a data-toggle="tab" href="#tabWIDGET_4834">Sócios</a></li>
                </ul>
            </div>
            <div class="col-md-9 col-sm-9 col-xs-9">
                <div class="tab-content">
                    <div class="tab-pane active" id="tabFORMULARIO">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_EMPRESAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True"  Level="20" Order="1"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_585">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_585" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FILIAIS.EMPRESA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t720_at585_hs47c3872b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False"  Level="20" Order="10"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_6287">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_6287" Title="Grupo de estabelecimentos fiscais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTABELECIMENTOSMATRIZ.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4069_at6287_hsb1d0f8e.aspx" UserDefinedDisableRowSelection="False"  Level="20" Order="15"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_4775">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_4775" Title="Impostos somente leitura (form retenções)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTOSSOMENTELEITURA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2860_at4775_hs141f7cbb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False"  Level="20" Order="20"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_854">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_854" Title="Instruções de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_INSTRUCOESCOBRANCA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1199_at854_hsea7b8beb.aspx" UserDefinedDisableRowSelection="False"  Level="20" Order="25"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_7181">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_7181" Title="Log de Alterações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_TR_AUDITORIATABELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="1 = 1" FormUrl="~/aga/a/f/aga_t4213_at7181_hsb17a7c5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False"  Level="20" Order="30"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_8443">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_8443" Title="Parâmetros ERP web" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PARAMETROSCLOUD.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="35"  /></div>
                    </div>
                    <div class="tab-pane" id="tabPARMETROSDOMDULOGESTOESTRATGICA">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="PARMETROSDOMDULOGESTOESTRATGICA" Title="Parâmetros do Módulo Gestão Estratégica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="36"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_8294">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_8294" Title="Parâmetros de Integração FR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_FRPARAMETROINTEGRACOES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="40"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_1681">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_1681" Title="Parâmetros do módulo IN68/95" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_IN_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="45"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_4605">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_4605" Title="Parâmetros do módulo LALUR" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LA_PARAMETROS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2813_at4605_hs97a795.aspx" UserDefinedDisableRowSelection="False"  Level="20" Order="50"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_845">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_845" Title="Parâmetros do módulo ativo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_AT_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="70"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_2336">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_2336" Title="Parâmetros do módulo comercial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="75"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_1258">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_1258" Title="Parâmetros do módulo comissões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_DOCUMENTOCOMISSOESPRAMETRO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="80"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_2911">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_2911" Title="Parâmetros do módulo contrato corrigido" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CO_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="85"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_842">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_842" Title="Parâmetros do módulo contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="90"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_5065">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_5065" Title="Parâmetros do módulo exportação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_IE_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="95"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_925">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_925" Title="Parâmetros do módulo factoring" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FC_PARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="100"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_841">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_841" Title="Parâmetros do módulo financeiro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="105"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_3288">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_3288" Title="Parâmetros do módulo financeiro 2" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FN_PARAMETROS2.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="110"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_3026">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_3026" Title="Parâmetros do módulo financiamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CO_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="115"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_6119">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_6119" Title="Parâmetros do módulo frente de loja" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_FL_PARAMETROSEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" Level="20" Order="120"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_4335">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_4335" Title="Parâmetros do módulo frotas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="125"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_5251">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_5251" Title="Parâmetros do módulo importação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_IE_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" Level="20" Order="135"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_2769">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_2769" Title="Parâmetros do módulo leilões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LL_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" Level="20" Order="140"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_3458">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_3458" Title="Parâmetros do módulo materiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PARAMETROSESTOQUEEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="145"  /></div>
                    </div>
                    <div class="tab-pane" id="tabPARMETROSDOMDULOORCAMENTO">
                        <div class="row">
                            <div class="tabbable-line">
                                <ul id="MODULOORCAMENTO" class="nav nav-tabs">
                                    <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORCAMENTO" class="active"><a data-toggle="tab" href="#tabORCAMENTO">Orçamento</a></li>
                                    <li runat="server" id="TABEMPENHO" onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALCADASEMPENHO"><a data-toggle="tab" href="#tabALCADASEMPENHO">Alçadas empenho</a></li>
                                    <li runat="server" id="TABAUDITORIA" onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALCADASAUDITORIA"><a data-toggle="tab" href="#tabALCADASAUDITORIA">Alçadas auditoria</a></li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane active" id="tabORCAMENTO">
                                        <div class="row">
                                        <wes:AjaxForm runat="server" ID="ORCAMENTO" Title="Parâmetros do módulo orçamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="FN_PARAMETROS.ORCAMENTO.FORM" FormMode="Edit" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True"  Level="20" Order="146"  /></div>
                                    </div>
                                    <div class="tab-pane" id="tabALCADASEMPENHO">
                                        <div class="row">
                                        <wes:EditableGrid runat="server" ID="ALCADASEMPENHO" Title="Alçadas empenho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORCAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_EMPENHOSALCADAS.ORCAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(EMPRESA) AND A.LIGACAOPARAMETROS = @CAMPO(HANDLE)" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" Level="20" Order="20"  /></div>
                                    </div>
                                    <div class="tab-pane" id="tabALCADASAUDITORIA">
                                        <div class="row">
                                        <wes:EditableGrid runat="server" ID="ALCADASAUDITORIA" Title="Alçadas auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORCAMENTO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_EMPENHOAUDITORIAALCADAS.ORCAMENTO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(EMPRESA) AND A.LIGACAOPARAMETRO = @CAMPO(HANDLE)" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" Level="20" Order="30"  /></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_1166">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_1166" Title="Parâmetros do módulo ordem de viagem" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_OV_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="150"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_5846">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_5846" Title="Parâmetros do módulo SPED - ECD" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_ED_PARAMETROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3423_at5846_hsd76bc6d9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False"  Level="20" Order="156"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_5837">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_5837" Title="Parâmetros do módulo SPED - EFD" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_ED_PARAMETROSEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="157"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_6507">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_6507" Title="Parâmetros do módulo SPED - FCont" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_ED_PARAMETROSFCONT.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4231_at6507_hs2cb5efda.aspx" ShowExport="True" UserDefinedDisableRowSelection="False"  Level="20" Order="158"  /></div>
                    </div>
                    <div class="tab-pane" id="tabPARMETROSDOMDULOSPEDREINF">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="PARMETROSDOMDULOSPEDREINF" Title="Parâmetros do módulo SPED - REINF" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REINF_PARAMETROS.ADM.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.EMPRESA = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True"  Level="20" Order="159"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_3558">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_3558" Title="Parâmetros do módulo suprimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PARAMETROSCOMPRASEMPRESA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="160"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_843">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_843" Title="Parâmetros do módulo tributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="165"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_173_7394">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_173_7394" Title="Parâmetros dos portais Web &gt; Parâmetros gerais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PARAMETROSPORTAL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="170"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_173_7391">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_173_7391" Title="Parâmetros dos portais Web &gt; Portal do cliente" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSPORTALCLIEMPRESA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="175"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_173_7392">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_173_7392" Title="Parâmetros dos portais Web &gt; Portal do fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_PARAMETROSPORTALCOMPEMPRESA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="180"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_173_7393">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_173_7393" Title="Parâmetros dos portais Web &gt; Portal do representante" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_PARAMETROSPORTALREPEMPRESA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="185"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_844">
                        <div class="row">
                        <wes:AjaxForm runat="server" ID="WIDGET_844" Title="Parâmetros genéricos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True"  Level="20" Order="190"  /></div>
                    </div>
                    <div class="tab-pane" id="tabWIDGET_4834">
                        <div class="row">
                        <wes:SimpleGrid runat="server" ID="WIDGET_4834" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EMPRESA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t901_at4834_hsca7de334.aspx" UserDefinedDisableRowSelection="False"  Level="20" Order="195"  /></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).click(function () {
            if (document.getElementById("ctl00_Main_ORCAMENTO_PageControl_ORCAMENTO_ORCAMENTO_ORCAMENTOPUBLICO_CHECKBOX").checked) {
                document.getElementById("MODULOORCAMENTO").children[1].style.display = "block";
                document.getElementById("MODULOORCAMENTO").children[2].style.display = "block";
            }
            else {
                document.getElementById("MODULOORCAMENTO").children[1].style.display = "none";
                document.getElementById("MODULOORCAMENTO").children[2].style.display = "none";
            }
        });
    </script>
</asp:Content>
    