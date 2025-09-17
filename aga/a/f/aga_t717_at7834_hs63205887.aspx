<%@ Page Title="Clientes" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cliente" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2463" class="active"><a data-toggle="tab" href="#tabWIDGET_2463"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consulta de correspondências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1113"><a data-toggle="tab" href="#tabWIDGET_1113"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consultas de crédito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5861"><a data-toggle="tab" href="#tabWIDGET_5861"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas bancárias")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5215"><a data-toggle="tab" href="#tabWIDGET_5215"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas financeiras válidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1498"><a data-toggle="tab" href="#tabWIDGET_1498"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas/Faturamento")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_592"><a data-toggle="tab" href="#tabWIDGET_592"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3564"><a data-toggle="tab" href="#tabWIDGET_3564"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contratos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6584"><a data-toggle="tab" href="#tabWIDGET_6584"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"DIRF - Beneficiário residente exterior")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6047"><a data-toggle="tab" href="#tabWIDGET_6047"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Declaração de quitação de débito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6037"><a data-toggle="tab" href="#tabWIDGET_6037"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Gestão de cobrança")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6038"><a data-toggle="tab" href="#tabWIDGET_6038"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Gestão de cobrança")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6655"><a data-toggle="tab" href="#tabWIDGET_6655"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Historico SERASA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2328"><a data-toggle="tab" href="#tabWIDGET_2328"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6261"><a data-toggle="tab" href="#tabWIDGET_6261"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos benefício")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3693"><a data-toggle="tab" href="#tabWIDGET_3693"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos que não agrupam CNPJ")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4395"><a data-toggle="tab" href="#tabWIDGET_4395"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Limite de crédito")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_594"><a data-toggle="tab" href="#tabWIDGET_594"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Locais de entrega")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_694"><a data-toggle="tab" href="#tabWIDGET_694"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ocorrências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3565"><a data-toggle="tab" href="#tabWIDGET_3565"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Ordens de venda")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4635"><a data-toggle="tab" href="#tabWIDGET_4635"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6737"><a data-toggle="tab" href="#tabWIDGET_6737"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_2304"><a data-toggle="tab" href="#tabWIDGET_205_2304"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Canceladas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_2347"><a data-toggle="tab" href="#tabWIDGET_205_2347"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Confirmar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_2348"><a data-toggle="tab" href="#tabWIDGET_205_2348"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Em elaboração")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_2303"><a data-toggle="tab" href="#tabWIDGET_205_2303"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Emitidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_2305"><a data-toggle="tab" href="#tabWIDGET_205_2305"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Fechadas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_205_3793"><a data-toggle="tab" href="#tabWIDGET_205_3793"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Propostas comerciais&gt;Todas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_612"><a data-toggle="tab" href="#tabWIDGET_612"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Referências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7333"><a data-toggle="tab" href="#tabWIDGET_7333"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regimes especiais de tributação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1986"><a data-toggle="tab" href="#tabWIDGET_1986"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regiões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5287"><a data-toggle="tab" href="#tabWIDGET_5287"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Relacionamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_921"><a data-toggle="tab" href="#tabWIDGET_921"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sócios")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1985"><a data-toggle="tab" href="#tabWIDGET_1985"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_682"><a data-toggle="tab" href="#tabWIDGET_682"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Transportadoras preferenciais")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2463">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2463" Title="Consulta de correspondências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_ROTINASCORRESPONDENCIA.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2057_at2463_hs74626d17.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1113">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1113" Title="Consultas de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_CLIENTEOCORCREDITO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1387_at1113_hsaa20ca90.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5861">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5861" Title="Contas bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASCONTASBANCARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1371_at5861_hscbd93297.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5215">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5215" Title="Contas financeiras válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTASVALIDAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3100_at5215_hsc130fd3c.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1498">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1498" Title="Contas/Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_592">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_592" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at592_hs6fd4b49.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3564">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3564" Title="Contratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="EHCONTRATO = 'S' AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at3564_hs9efd8db9.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6584">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6584" Title="DIRF - Beneficiário residente exterior" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASNATUREZABENEFICIARIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4274_at6584_hs13d0d603.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6047">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6047" Title="Declaração de quitação de débito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DECLARACAOQUITDEBPESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3832_at6047_hs5411153a.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6037">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6037" Title="Gestão de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GC_CLIENTES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FILIAL IN @FILIAIS AND (A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3811_at6037_hsd1c195b0.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6038">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_6038" Title="Gestão de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GC_CLIENTES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.FILIAL IS NULL AND (A.CLIENTE = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6655">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6655" Title="Historico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6655_hsc78ca18b.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2328">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2328" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2024_at2328_hs12587ec4.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6261">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6261" Title="Impostos benefício" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOSBENEFICIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4039_at6261_hs7fb69eb7.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3693">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3693" Title="Impostos que não agrupam CNPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOSNAOAGRUPACNPJ.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(CLIENTEFORNECEDOR = 1) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2507_at3693_hsac302352.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4395">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4395" Title="Limite de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASLIMITESCREDITO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2738_at4395_hs5fa8550a.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_594">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_594" Title="Locais de entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAENDERECOSENTREGA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1372_at594_hs795d2441.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_694">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_694" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAOCORRENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t867_at694_hs9fbdc32d.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3565">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3565" Title="Ordens de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_ORDENSVENDA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1757_at3565_hs4e8915d5.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4635">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_4635" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAPARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="TIPO = 'C' AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6737">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6737" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6737_hs9569ec56.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_2304">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_2304" Title="Propostas comerciais&gt;Canceladas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL AND A.STATUSPROPOSTA =3) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at2304_hs97d91e2b.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="115"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_2347">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_2347" Title="Propostas comerciais&gt;Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL ) AND 
((A.LIBERADOCONFIRMACAO = 'S' OR A.LIBERADOCONFIRMACAO IS NULL) AND 
(A.STATUSPROPOSTA = 1) AND ((A.GRUPOASSINATURAS IS NULL AND A.CONFIRMANTE = @USUARIO) OR
 (A.GRUPOASSINATURAS IN(SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,
CP_GRUPOALCADAS C WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA = 'S' 
AND B.SEQUENCIA &gt;= A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S') OR 
(A.GRUPOASSINATURAS IN
 (SELECT C.HANDLE FROM CP_GRUPOALCADASINTEGRANTES B,CP_GRUPOALCADAS C 
WHERE B.GRUPO = C.HANDLE AND C.EHHIERARQUIA &lt;&gt; 'S' AND
 B.SEQUENCIA = A.SEQUENCIAALCADA AND B.USUARIO = @USUARIO AND B.ATIVO = 'S'))))) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at2347_hs502f0ab9.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_2348">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_2348" Title="Propostas comerciais&gt;Em elaboração" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL AND A.STATUSPROPOSTA = 1
 AND A.LIBERADOCONFIRMACAO &lt;&gt; 'S') AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at2348_hsccbbfad7.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="125"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_2303">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_2303" Title="Propostas comerciais&gt;Emitidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL AND A.STATUSPROPOSTA =2) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at2303_hs661a8e39.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_2305">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_2305" Title="Propostas comerciais&gt;Fechadas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL AND A.STATUSPROPOSTA =4) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at2305_hsd88adbd.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="135"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_205_3793">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_205_3793" Title="Propostas comerciais&gt;Todas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_CONTRATOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.EHCONTRATO = 'N'  AND A.ORIGINAL IS NULL ) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2035_at3793_hsa94a074c.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_612">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_612" Title="Referências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_REFERENCIASCLIENTE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1389_at612_hs66971f6f.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7333">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7333" Title="Regimes especiais de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASREGIMESESPECIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4970_at7333_hs6099e7c2.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1986">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1986" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1986_hsb0ba2f77.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5287">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5287" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5287_hs3575509d.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_921">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_921" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SOCIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t901_at921_hs28ac4391.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1985">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1985" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1985_hsa53dd4f.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="170"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_682">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_682" Title="Transportadoras preferenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_CLIENTETRANSPORTADORAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t845_at682_hscc126f7e.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL__CLIENTES_FORM" Level="20" Order="175"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    