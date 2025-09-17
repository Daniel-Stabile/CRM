<%@ Page Title="Tabelas auxiliares - Itens da empresa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Itens da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOSPAI.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6756" class="active"><a data-toggle="tab" href="#tabWIDGET_6756"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alternativos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6725"><a data-toggle="tab" href="#tabWIDGET_6725"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Aplicações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3567"><a data-toggle="tab" href="#tabWIDGET_3567"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Imagens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1836"><a data-toggle="tab" href="#tabWIDGET_1836"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Na filial")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6410"><a data-toggle="tab" href="#tabWIDGET_6410"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Produtos sinônimos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3905"><a data-toggle="tab" href="#tabWIDGET_3905"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reduções INSS")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6746"><a data-toggle="tab" href="#tabWIDGET_6746"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Substitutos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6756">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6756" Title="Alternativos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_PD_PRODUTOALTERNATIVOPRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4468_at6756_hs1d842fab.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6725">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6725" Title="Aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="AGA_PD_PRODUTOPAIAPLICACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4446_at6725_hs141bfe70.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3567">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3567" Title="Imagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_IMAGENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'PD_PRODUTOSPAI') AND A.HANDLEORIGEM = @RASTRO(PD_PRODUTOSPAI))" FormUrl="~/aga/a/f/aga_t2464_at3567_hs56fbf359.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1836">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1836" Title="Na filial" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="AGA_PD_PRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t807_at1836_hsd655c67e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6410">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6410" Title="Produtos sinônimos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOSINONIMOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4154_at6410_hs7a58bb09.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3905">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3905" Title="Reduções INSS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_PRODUTOPAIREDUCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAI = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2600_at3905_hsd9090896.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6746">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6746" Title="Substitutos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="AGA_PD_PRODUTOPAISUBSTITUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PRODUTOPAIORIGEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4458_at6746_hs5ad9b8f9.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__ITENS_DA_EMPRESA_FORM" Level="20" Order="40"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    