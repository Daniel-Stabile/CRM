<%@ Page Title="Configurações contábeis - Regras de conciliação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configurações contábeis - Regras de conciliação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRASCONCILIACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8155" class="active"><a data-toggle="tab" href="#tabWIDGET_8155"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Categorias de clientes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8156"><a data-toggle="tab" href="#tabWIDGET_8156"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Categorias fornecedores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8159"><a data-toggle="tab" href="#tabWIDGET_8159"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8157"><a data-toggle="tab" href="#tabWIDGET_8157"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8160"><a data-toggle="tab" href="#tabWIDGET_8160"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8161"><a data-toggle="tab" href="#tabWIDGET_8161"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Quebra por contas financeiras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8158"><a data-toggle="tab" href="#tabWIDGET_8158"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8154"><a data-toggle="tab" href="#tabWIDGET_8154"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de movimentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8155">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8155" Title="Categorias de clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_REGRACATEGORIACLIENTE.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5654_at8155_hse1a86359.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8156">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8156" Title="Categorias fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRACATEGORIAFORNECEDOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5655_at8156_hse536010a.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8159">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8159" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRAFILIAL.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5658_at8159_hs5df07800.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8157">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8157" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRAOPERACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5656_at8157_hs576dd9d6.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8160">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8160" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRAPESSOA.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5659_at8160_hs40659f33.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8161">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8161" Title="Quebra por contas financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRACONTASCONCILIACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5660_at8161_hs4b64e4f0.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="35"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8158">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8158" Title="Tipos de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRATIPODOCUMENTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5657_at8158_hs8499efd2.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8154">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8154" Title="Tipos de movimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_REGRATIPOMOVIMENTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REGRACONCILIACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5653_at8154_hs340d2a6e.aspx" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_CONFIGURACOES_CONTABEIS__REGRAS_CONCILIACAO_FORM" Level="20" Order="45"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    