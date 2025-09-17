<%@ Page Title="Tabelas auxiliares - Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2459" class="active"><a data-toggle="tab" href="#tabWIDGET_2459"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consulta de correspondências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1443"><a data-toggle="tab" href="#tabWIDGET_1443"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1106"><a data-toggle="tab" href="#tabWIDGET_1106"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas Bancárias")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_936"><a data-toggle="tab" href="#tabWIDGET_936"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas a pagar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5216"><a data-toggle="tab" href="#tabWIDGET_5216"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas financeiras válidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_754"><a data-toggle="tab" href="#tabWIDGET_754"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6586"><a data-toggle="tab" href="#tabWIDGET_6586"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"DIRF - Beneficiário residente exterior")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4554"><a data-toggle="tab" href="#tabWIDGET_4554"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Declarações INSS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7167"><a data-toggle="tab" href="#tabWIDGET_7167"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos de habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6627"><a data-toggle="tab" href="#tabWIDGET_6627"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico SERASA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2329"><a data-toggle="tab" href="#tabWIDGET_2329"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3694"><a data-toggle="tab" href="#tabWIDGET_3694"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos que não agrupam CNPJ")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1936"><a data-toggle="tab" href="#tabWIDGET_1936"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6735"><a data-toggle="tab" href="#tabWIDGET_6735"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_692"><a data-toggle="tab" href="#tabWIDGET_692"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2971"><a data-toggle="tab" href="#tabWIDGET_2971"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recibo de Pagamento Aut. (RPA) Terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1989"><a data-toggle="tab" href="#tabWIDGET_1989"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regiões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5288"><a data-toggle="tab" href="#tabWIDGET_5288"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Relacionamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7176"><a data-toggle="tab" href="#tabWIDGET_7176"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Retenção de terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8055"><a data-toggle="tab" href="#tabWIDGET_8055"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sanções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1987"><a data-toggle="tab" href="#tabWIDGET_1987"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sócios")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1988"><a data-toggle="tab" href="#tabWIDGET_1988"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2459">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2459" Title="Consulta de correspondências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_ROTINASCORRESPONDENCIA.GRID" CanDelete="False" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2057_at2459_hsb1ff4952.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1443">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1443" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1106">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1106" Title="Contas Bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASCONTASBANCARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1371_at1106_hsb8b3ecd4.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_936">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_936" Title="Contas a pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_FN_DOCUMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA=@RASTRO(GN_PESSOAS)) AND (A.ENTRADASAIDA='E') AND (A.TIPODEMOVIMENTO&lt;&gt;4)" FormUrl="~/aga/a/f/aga_t1216_at936_hsbd32e822.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5216">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5216" Title="Contas financeiras válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTASVALIDAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3100_at5216_hsd1e47a39.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_754">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_754" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at754_hs2596e2d6.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6586">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6586" Title="DIRF - Beneficiário residente exterior" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASNATUREZABENEFICIARIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4274_at6586_hs6bbf7846.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4554">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4554" Title="Declarações INSS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOADECLARACOESINSS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2793_at4554_hs511df53e.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7167">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7167" Title="Documentos de habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOADOCUMENTOSHABILITACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4756_at7167_hs1d13d8f3.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6627">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6627" Title="Histórico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6627_hs8749ee51.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2329">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2329" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAIMPOSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2024_at2329_hs5a05edcb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3694">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3694" Title="Impostos que não agrupam CNPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOSNAOAGRUPACNPJ.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(CLIENTEFORNECEDOR = 2) AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2507_at3694_hsd2ab2caa.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1936">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1936" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAPARAMETROS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="TIPO = 'F' AND (A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6735">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6735" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t4453_at6735_hs5975a696.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_692">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_692" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FORNECEDORPRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t858_at692_hse146dc65.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2971">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2971" Title="Recibo de Pagamento Aut. (RPA) Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARPAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2266_at2971_hsc5663235.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1989">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1989" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1989_hs6ab027.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5288">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5288" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5288_hs39dbe35e.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7176">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7176" Title="Retenção de terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARETENCAOVIGENCIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4775_at7176_hs39ea8201.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8055">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8055" Title="Sanções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FORNECEDORSANCOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5534_at8055_hs3eb9163e.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="105"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1987">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1987" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PESSOA=@RASTRO(GN_PESSOAS)" FormUrl="~/aga/a/f/aga_t901_at1987_hs411d4823.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1988">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1988" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1988_hse3275d36.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__FROTAS_FORNECEDORES_FORM" Level="20" Order="115"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    