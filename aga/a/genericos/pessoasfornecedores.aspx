<%@ Page Title="Fornecedor" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORNECEDOR" Title="Fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAS.CUSTOM.FORNECEDOR.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="5"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1988" class="active"><a data-toggle="tab" href="#tabWIDGET_1988"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="METASDEVENDAS"><a data-toggle="tab" href="#tabMETASDEVENDAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Metas de vendas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRANPORTADORES"><a data-toggle="tab" href="#tabTRANPORTADORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Transportadores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinaturas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTAS"><a data-toggle="tab" href="#tabCONTAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2459"><a data-toggle="tab" href="#tabWIDGET_2459"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Consulta de correspondências")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1106"><a data-toggle="tab" href="#tabWIDGET_1106"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas Bancárias")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_936"><a data-toggle="tab" href="#tabWIDGET_936"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas a pagar")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5216"><a data-toggle="tab" href="#tabWIDGET_5216"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas financeiras válidas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_754"><a data-toggle="tab" href="#tabWIDGET_754"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4554"><a data-toggle="tab" href="#tabWIDGET_4554"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Declarações INSS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6627"><a data-toggle="tab" href="#tabWIDGET_6627"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico SERASA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2329"><a data-toggle="tab" href="#tabWIDGET_2329"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3694"><a data-toggle="tab" href="#tabWIDGET_3694"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Impostos que não agrupam CNPJ")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1936"><a data-toggle="tab" href="#tabWIDGET_1936"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6735"><a data-toggle="tab" href="#tabWIDGET_6735"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_692"><a data-toggle="tab" href="#tabWIDGET_692"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2971"><a data-toggle="tab" href="#tabWIDGET_2971"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recibo de Pagamento Aut. (RPA) Terceiros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1989"><a data-toggle="tab" href="#tabWIDGET_1989"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regiões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5288"><a data-toggle="tab" href="#tabWIDGET_5288"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Relacionamentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1987"><a data-toggle="tab" href="#tabWIDGET_1987"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sócios")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSDOFORNECEDOR"><a data-toggle="tab" href="#tabITENSDOFORNECEDOR"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do fornecedor")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSREQUISITADOS"><a data-toggle="tab" href="#tabITENSREQUISITADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens requisitados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALQUOTAESPECFICA"><a data-toggle="tab" href="#tabALQUOTAESPECFICA"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alíquota específica")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CHAVEPIX"><a data-toggle="tab" href="#tabCHAVEPIX"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Chave PIX")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RETENODETERCEIROS"><a data-toggle="tab" href="#tabRETENODETERCEIROS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Retenção de terceiros")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1988">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1988" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at1979_hs5cbbe887.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="6"  /></div>
        </div>
        <div class="tab-pane" id="tabMETASDEVENDAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="METASDEVENDAS" Title="Metas de vendas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOAMETAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/metasVendas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="7"  /></div>
        </div>
        <div class="tab-pane" id="tabTRANPORTADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TRANPORTADORES" Title="Transportadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOATRANSPORTADORAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/Transportadores.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="8"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ASSINATURAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/adm/pessoas/assinaturas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="9"  /></div>
        </div>
        <div class="tab-pane" id="tabCONTAS">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTAS" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOACONTAS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))
" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2459">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2459" Title="Consulta de correspondências" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="False" EntityViewName="AGA_GN_ROTINASCORRESPONDENCIA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2057_at2459_hsb1ff4952.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="18"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1106">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1106" Title="Contas Bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASCONTASBANCARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1371_at1106_hsb8b3ecd4.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_936">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_936" Title="Contas a pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.CONTASPAGAR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA=@CAMPO(HANDLE)) AND (A.ENTRADASAIDA='E') AND (A.TIPODEMOVIMENTO&lt;&gt;4)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5216">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5216" Title="Contas financeiras válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOACONTASVALIDAS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3100_at5216_hsd1e47a39.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_754">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_754" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at754_hs2596e2d6.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_4554">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4554" Title="Declarações INSS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOADECLARACOESINSS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2793_at4554_hs511df53e.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6627">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6627" Title="Histórico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6627_hs8749ee51.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2329">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2329" Title="Impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAIMPOSTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2024_at2329_hs5a05edcb.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3694">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3694" Title="Impostos que não agrupam CNPJ" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAIMPOSTOSNAOAGRUPACNPJ.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.CLIENTEFORNECEDOR = 2 AND A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2507_at3694_hsd2ab2caa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1936">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_1936" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAPARAMETROS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.TIPO = 'F' AND A.PESSOA = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6735">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6735" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6735_hs5975a696.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_692">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_692" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_FORNECEDORPRODUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t858_at692_hse146dc65.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2971">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2971" Title="Recibo de Pagamento Aut. (RPA) Terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARPAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2266_at2971_hsc5663235.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1989">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1989" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at1989_hs6ab027.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5288">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5288" Title="Relacionamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOARELACIONAMENTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3256_at5288_hs39dbe35e.aspx" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="95"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1987">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1987" Title="Sócios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOASOCIOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PESSOA= @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t901_at1987_hs411d4823.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSDOFORNECEDOR">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSDOFORNECEDOR" Title="Itens do fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDORES.ITENSDOFORNECEDOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FORNECEDOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/ItensDoFornecedor.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="120"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSREQUISITADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSREQUISITADOS" Title="Itens requisitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOS.ITENSREQUISITADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FORNECEDOR = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/ItensRequisitados.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="130"  /></div>
        </div>
        <div class="tab-pane" id="tabALQUOTAESPECFICA">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ALQUOTAESPECFICA" Title="Alíquota específica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAIMPOSTOS.IMPOSTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/AliquotasEspecificas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="140"  /></div>
        </div>
        <div class="tab-pane" id="tabCHAVEPIX">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CHAVEPIX" Title="Chave PIX" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_PESSOACHAVEPIXCADASTRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/ChavePIX.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="150"  /></div>
        </div>
        <div class="tab-pane" id="tabRETENODETERCEIROS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RETENODETERCEIROS" Title="Retenção de terceiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORNECEDOR" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOARETENCAOVIGENCIAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/RetencaoTerceiros.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_GENERICOS_PESSOASFORNECEDORES" Level="20" Order="160"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
        <style>
            #ITENSDOFORNECEDOR th, td {
    white-space:nowrap !important;
}
#ITENSREQUISITADOS th, td {
    white-space:nowrap !important;
}
#ALQUOTAESPECFICA th, td {
    white-space:nowrap !important;
}
            </style>
      </asp:Content>
    