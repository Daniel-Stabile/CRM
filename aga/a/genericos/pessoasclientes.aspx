<%@ Page Title="Cliente" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.genericos.pessoas.clientes.Cliente" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CLIENTE" class="active"><a data-toggle="tab" href="#tabCLIENTE">Cliente</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2463"><a data-toggle="tab" href="#tabWIDGET_2463">Consulta de correspondências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1113"><a data-toggle="tab" href="#tabWIDGET_1113">Consultas de crédito</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5861"><a data-toggle="tab" href="#tabWIDGET_5861">Contas bancárias</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5215"><a data-toggle="tab" href="#tabWIDGET_5215">Contas financeiras válidas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1498"><a data-toggle="tab" href="#tabWIDGET_1498">Contas/Faturamento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_592"><a data-toggle="tab" href="#tabWIDGET_592">Contatos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6584"><a data-toggle="tab" href="#tabWIDGET_6584">DIRF - Beneficiário residente exterior</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6047"><a data-toggle="tab" href="#tabWIDGET_6047">Declaração de quitação de débito</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GESTODECOBRANA"><a data-toggle="tab" href="#tabGESTODECOBRANA">Gestão de cobrança</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6655"><a data-toggle="tab" href="#tabWIDGET_6655">Historico SERASA</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2328"><a data-toggle="tab" href="#tabWIDGET_2328">Impostos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6261"><a data-toggle="tab" href="#tabWIDGET_6261">Impostos benefício</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3693"><a data-toggle="tab" href="#tabWIDGET_3693">Impostos que não agrupam CNPJ</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4395"><a data-toggle="tab" href="#tabWIDGET_4395">Limite de crédito</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_594"><a data-toggle="tab" href="#tabWIDGET_594">Locais de entrega</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_694"><a data-toggle="tab" href="#tabWIDGET_694">Ocorrências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3565"><a data-toggle="tab" href="#tabWIDGET_3565">Ordens de venda</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4635"><a data-toggle="tab" href="#tabWIDGET_4635">Parâmetros</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6737"><a data-toggle="tab" href="#tabWIDGET_6737">Políticas comerciais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_612"><a data-toggle="tab" href="#tabWIDGET_612">Referências</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7333"><a data-toggle="tab" href="#tabWIDGET_7333">Regimes especiais de tributação</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1986"><a data-toggle="tab" href="#tabWIDGET_1986">Regiões</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5287"><a data-toggle="tab" href="#tabWIDGET_5287">Relacionamentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_921"><a data-toggle="tab" href="#tabWIDGET_921">Sócios</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_682"><a data-toggle="tab" href="#tabWIDGET_682">Transportadoras preferenciais</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TELEFONES"><a data-toggle="tab" href="#tabTELEFONES">Telefones</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="METASDEVENDAS"><a data-toggle="tab" href="#tabMETASDEVENDAS">Metas de vendas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANSPORTADORES"><a data-toggle="tab" href="#tabTRANSPORTADORES">Transportadores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INSCRIOESTADUAL"><a data-toggle="tab" href="#tabINSCRIOESTADUAL">Inscrição estadual</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCLIENTE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CLIENTE" Title="Cliente" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.CUSTOM.CLIENTE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="5"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2463">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2463" Title="Consulta de correspondências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_ROTINASCORRESPONDENCIA.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2057_at2463_hs74626d17.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1113">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1113" Title="Consultas de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_CLIENTEOCORCREDITO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1387_at1113_hsaa20ca90.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5861">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5861" Title="Contas bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASCONTASBANCARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1371_at5861_hscbd93297.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5215">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5215" Title="Contas financeiras válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTASVALIDAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3100_at5215_hsc130fd3c.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1498">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1498" Title="Contas/Faturamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOACONTAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE) AND A.EMPRESA = @EMPRESA" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_592">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_592" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at592_hs6fd4b49.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6584">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6584" Title="DIRF - Beneficiário residente exterior" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASNATUREZABENEFICIARIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4274_at6584_hs13d0d603.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6047">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6047" Title="Declaração de quitação de débito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_FN_DECLARACAOQUITDEBPESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3832_at6047_hs5411153a.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabGESTODECOBRANA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="GESTODECOBRANA" Title="Gestão de cobrança" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GC_CLIENTES.CADASTRO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause=" A.CLIENTE= @CAMPO(HANDLE) AND A.EMPRESA = @EMPRESA AND A.FILIAL IS NULL" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="51"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6655">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6655" Title="Historico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6655_hsc78ca18b.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2328">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2328" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2024_at2328_hs12587ec4.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6261">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6261" Title="Impostos benefício" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOSBENEFICIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4039_at6261_hs7fb69eb7.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3693">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3693" Title="Impostos que não agrupam CNPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAIMPOSTOSNAOAGRUPACNPJ.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CLIENTEFORNECEDOR = 1 AND A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2507_at3693_hsac302352.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4395">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4395" Title="Limite de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASLIMITESCREDITO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2738_at4395_hs5fa8550a.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_594">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_594" Title="Locais de entrega" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAENDERECOSENTREGA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1372_at594_hs795d2441.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_694">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_694" Title="Ocorrências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAOCORRENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t867_at694_hs9fbdc32d.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3565">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3565" Title="Ordens de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_CM_ORDENSVENDA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1757_at3565_hs4e8915d5.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4635">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_4635" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAPARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="TIPO = 'C' AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6737">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6737" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6737_hs9569ec56.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_612">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_612" Title="Referências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_REFERENCIASCLIENTE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1389_at612_hs66971f6f.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="145"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7333">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7333" Title="Regimes especiais de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASREGIMESESPECIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4970_at7333_hs6099e7c2.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1986">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1986" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1986_hsb0ba2f77.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="155"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5287">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5287" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5287_hs3575509d.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="160"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_921">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_921" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SOCIO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t901_at921_hs28ac4391.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="165"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_682">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_682" Title="Transportadoras preferenciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" EntityViewName="AGA_GN_CLIENTETRANSPORTADORAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CLIENTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t845_at682_hscc126f7e.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="175"  /></div>
        </div>
        <div class="tab-pane" id="tabTELEFONES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TELEFONES" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOATELEFONES.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="195"  /></div>
        </div>
        <div class="tab-pane" id="tabMETASDEVENDAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="METASDEVENDAS" Title="Metas de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAMETAS.METASDEVENDAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="205"  /></div>
        </div>
        <div class="tab-pane" id="tabTRANSPORTADORES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TRANSPORTADORES" Title="Transportadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOATRANSPORTADORAS.TRANSPORTADORES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="215"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.PESSOA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="225"  /></div>
        </div>
        <div class="tab-pane" id="tabINSCRIOESTADUAL">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INSCRIOESTADUAL" Title="Inscrição estadual" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CLIENTE" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAINSCRICOESESTADUAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/inscricaoestadual.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASCLIENTES" Level="20" Order="235"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
        <script type="text/javascript">
            $(function(){
    ajustarTextoFiliaisCobranca();
    var prm = Sys.WebForms.PageRequestManager.getInstance();

    prm.add_endRequest(function (s, e) {
        ajustarTextoFiliaisCobranca();
    });
});

function ajustarTextoFiliaisCobranca(){
    if($("#ctl00_Main_GESTODECOBRANA_PageControl_GERAL_GERAL_ctl14_ctl01_text").val() == ""){
        $("#ctl00_Main_GESTODECOBRANA_PageControl_GERAL_GERAL_ctl14_ctl01_text").val("Todas...")
    }
}
            </script>
      </asp:Content>
    