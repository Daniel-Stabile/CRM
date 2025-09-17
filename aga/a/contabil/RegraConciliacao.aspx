<%@ Page Title="Regra de Conciliação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="REGRADECONCILIAO" Title="Regra de Conciliação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRASCONCILIACAO.FORM" FormMode="ReadOnly" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="10"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CATEGORIASFORNECEDORES" class="active"><a data-toggle="tab" href="#tabCATEGORIASFORNECEDORES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Categorias (fornecedores)")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CATEGORIASCLIENTES"><a data-toggle="tab" href="#tabCATEGORIASCLIENTES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Categorias (clientes)")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FILIAIS"><a data-toggle="tab" href="#tabFILIAIS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Filiais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OPERAES"><a data-toggle="tab" href="#tabOPERAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="PESSOAS"><a data-toggle="tab" href="#tabPESSOAS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pessoas")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDEDOCUMENTOS"><a data-toggle="tab" href="#tabTIPOSDEDOCUMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de documentos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TIPOSDEMOVIMENTOS"><a data-toggle="tab" href="#tabTIPOSDEMOVIMENTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de movimentos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabCATEGORIASFORNECEDORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CATEGORIASFORNECEDORES" Title="Categorias (fornecedores)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_REGRACATEGORIAFORNECEDOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5655_at8156_hse536010a.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabCATEGORIASCLIENTES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="CATEGORIASCLIENTES" Title="Categorias (clientes)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRACATEGORIACLIENTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5654_at8155_hse1a86359.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabFILIAIS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="FILIAIS" Title="Filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRAFILIAL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5658_at8159_hs5df07800.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabOPERAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OPERAES" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRAOPERACAO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5656_at8157_hs576dd9d6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabPESSOAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="PESSOAS" Title="Pessoas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRAPESSOA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5659_at8160_hs40659f33.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="60"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPOSDEDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDEDOCUMENTOS" Title="Tipos de documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRATIPODOCUMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5657_at8158_hs8499efd2.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="70"  /></div>
        </div>
        <div class="tab-pane" id="tabTIPOSDEMOVIMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TIPOSDEMOVIMENTOS" Title="Tipos de movimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="REGRADECONCILIAO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_REGRATIPOMOVIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REGRACONCILIACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t5653_at8154_hs340d2a6e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_REGRACONCILIACAO" Level="20" Order="80"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    