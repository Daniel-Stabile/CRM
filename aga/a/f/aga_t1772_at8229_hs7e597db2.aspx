<%@ Page Title="Requisição de cadastro de itens - Todos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Requisição de cadastro de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOSPAI.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8222" class="active"><a data-toggle="tab" href="#tabWIDGET_8222"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Na filial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8223"><a data-toggle="tab" href="#tabWIDGET_8223"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Imagens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8224"><a data-toggle="tab" href="#tabWIDGET_8224"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aplicações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8225"><a data-toggle="tab" href="#tabWIDGET_8225"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos sinônimos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8226"><a data-toggle="tab" href="#tabWIDGET_8226"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reduções INSS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8227"><a data-toggle="tab" href="#tabWIDGET_8227"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alternativos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8228"><a data-toggle="tab" href="#tabWIDGET_8228"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Substitutos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Assinaturas")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8222">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8222" Title="Na filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t807_at8222_hsf5f57b27.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8223">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8223" Title="Imagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_IMAGENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_PRODUTOSPAI') AND A.HANDLEORIGEM = @RASTRO(PD_PRODUTOSPAI))" FormUrl="~/aga/a/f/aga_t2464_at8223_hs49eeb07b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8224">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8224" Title="Aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOPAIAPLICACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4446_at8224_hsf0a437e0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8225">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8225" Title="Produtos sinônimos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOSINONIMOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4154_at8225_hs8a6fa448.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="80"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8226">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8226" Title="Reduções INSS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOPAIREDUCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2600_at8226_hs1dcd7502.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="90"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8227">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8227" Title="Alternativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOALTERNATIVOPRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4468_at8227_hsb9b93632.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="100"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8228">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8228" Title="Substitutos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOPAISUBSTITUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAIORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4458_at8228_hsc71859e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="110"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ASSINATURAS.REQCADASTROITEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PRODUTOPAI = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS_EM_CADASTRO__TODOS_FORM" Level="20" Order="120"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    