<%@ Page Title="Configurações comerciais - Famílias de itens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Família de itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="fa fa-users" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_FAMILIASPRODUTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1346" class="active"><a data-toggle="tab" href="#tabWIDGET_1346"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Clientes")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6632"><a data-toggle="tab" href="#tabWIDGET_6632"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Códigos de atividade")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_705"><a data-toggle="tab" href="#tabWIDGET_705"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Itens da empresa")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6739"><a data-toggle="tab" href="#tabWIDGET_6739"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Políticas comerciais")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7522"><a data-toggle="tab" href="#tabWIDGET_7522"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de documento habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1278"><a data-toggle="tab" href="#tabWIDGET_1278"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipos de variação da família")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1346">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1346" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_GN_PESSOAS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S' AND A.HANDLE IN (SELECT CLIENTE FROM PD_VARIACAOCLIENTES WHERE FAMILIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t717_at1346_hs3e0e3a67.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6632">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6632" Title="Códigos de atividade" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_FAMILIACODIGOATIVIDADE.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FAMILIA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t4312_at6632_hs19cbb7b7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_705">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_705" Title="Itens da empresa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_PRODUTOSPAI.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(STATUS = 3) AND (A.FAMILIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1772_at705_hs3a9e9af0.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6739">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6739" Title="Políticas comerciais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_POLITICASCOMERCIAIS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.FAMILIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4453_at6739_hs47c2a186.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="25"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7522">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7522" Title="Tipos de documento habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_DOCUMENTOHABILITACAOITEM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FAMILIA = @TABELA(PD_FAMILIASPRODUTOS) AND (A.FAMILIA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5169_at7522_hsa7d91583.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1278">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1278" Title="Tipos de variação da família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_FAMILIATIPOSVARIACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.FAMILIA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t1484_at1278_hs8323b7ff.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__FAMILIAS_DE_ITENS_FORM" Level="20" Order="35"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    