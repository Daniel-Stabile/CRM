<%@ Page Title="Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2591" class="active"><a data-toggle="tab" href="#tabWIDGET_2591"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alíquota específica")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2586"><a data-toggle="tab" href="#tabWIDGET_2586"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2585"><a data-toggle="tab" href="#tabWIDGET_2585"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contas Bancárias")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2583"><a data-toggle="tab" href="#tabWIDGET_2583"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Contatos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7169"><a data-toggle="tab" href="#tabWIDGET_7169"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos de habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6623"><a data-toggle="tab" href="#tabWIDGET_6623"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico SERASA")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3422"><a data-toggle="tab" href="#tabWIDGET_3422"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens do fornecedor")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2593"><a data-toggle="tab" href="#tabWIDGET_2593"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens requisitados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_821_3525"><a data-toggle="tab" href="#tabWIDGET_821_3525"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lista de preços&gt;Estados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_821_3505"><a data-toggle="tab" href="#tabWIDGET_821_3505"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Lista de preços&gt;Lista de preços")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2587"><a data-toggle="tab" href="#tabWIDGET_2587"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Parâmetros")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6736"><a data-toggle="tab" href="#tabWIDGET_6736"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7334"><a data-toggle="tab" href="#tabWIDGET_7334"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regimes especiais de tributação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2590"><a data-toggle="tab" href="#tabWIDGET_2590"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regiões")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8056"><a data-toggle="tab" href="#tabWIDGET_8056"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Sanções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2589"><a data-toggle="tab" href="#tabWIDGET_2589"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Telefones")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7628"><a data-toggle="tab" href="#tabWIDGET_7628"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de documento habilitação de itens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3285"><a data-toggle="tab" href="#tabWIDGET_3285"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Totais de compras/ano")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2591">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2591" Title="Alíquota específica" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_PESSOAIMPOSTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2024_at2591_hs9a6baf27.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2586">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_2586" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTAS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2585">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2585" Title="Contas Bancárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASCONTASBANCARIAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1371_at2585_hs253f9f2.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2583">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2583" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOACONTATOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t728_at2583_hsceb75521.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7169">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7169" Title="Documentos de habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOADOCUMENTOSHABILITACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4756_at7169_hsd2b8fd99.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6623">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6623" Title="Histórico SERASA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAHISTORICOSERASA.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4305_at6623_hsf80aa13d.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3422">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3422" Title="Itens do fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_VARIACAOFORNECEDORES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1506_at3422_hs92180e2f.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2593">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2593" Title="Itens requisitados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_REQUISICAOPRODUTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1316_at2593_hs902be1e5.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="45"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_821_3525">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_821_3525" Title="Lista de preços&gt;Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_ESTADOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t714_at3525_hsb2c8de1b.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_821_3505">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_821_3505" Title="Lista de preços&gt;Lista de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CM_LISTASPRECOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(TIPO = 'C') AND (A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2026_at3505_hsd9e010d.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="55"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2587">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="WIDGET_2587" Title="Parâmetros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAPARAMETROS.FORM" CanDelete="False" CanUpdate="False" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" UserDefinedCommandsVisible="True" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6736">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6736" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6736_hsf560b694.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="65"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7334">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7334" Title="Regimes especiais de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOASREGIMESESPECIAIS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4970_at7334_hsfa3d9c1c.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2590">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2590" Title="Regiões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAREGIOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1770_at2590_hs77e9ea4.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="75"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8056">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8056" Title="Sanções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_FORNECEDORSANCOES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5534_at8056_hs1ea4ad00.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2589">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2589" Title="Telefones" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOATELEFONES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PESSOA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1206_at2589_hsf39c19c3.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="85"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7628">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7628" Title="Tipos de documento habilitação de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_DOCUMENTOHABILITACAOITEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FORNECEDOR = @RASTRO(GN_PESSOAS) AND (A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5169_at7628_hsae4b1858.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3285">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3285" Title="Totais de compras/ano" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CP_FORNECEDORTOTALCOMPRAANO.GRID" CanDelete="False" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2361_at3285_hs54cc2742.aspx" UserDefinedDisableRowSelection="False" PageId="MATERIAIS__FORNECEDORES_MATERIAIS_FORM" Level="20" Order="95"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    