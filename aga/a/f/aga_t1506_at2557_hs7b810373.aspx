<%@ Page Title="Fornecedores" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_VARIACAOFORNECEDORES.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7525" class="active"><a data-toggle="tab" href="#tabWIDGET_7525"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Documentos de habilitação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7134"><a data-toggle="tab" href="#tabWIDGET_7134"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"FCI")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7300"><a data-toggle="tab" href="#tabWIDGET_7300"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tipo inspeção fornecedor")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="MARGEMDELUCRO"><a data-toggle="tab" href="#tabMARGEMDELUCRO"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMBALAGENS"><a data-toggle="tab" href="#tabEMBALAGENS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Embalagens")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OUTROSCDIGOS"><a data-toggle="tab" href="#tabOUTROSCDIGOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Outros códigos no fornecedor")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7525">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7525" Title="Documentos de habilitação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_PESSOADOCUMENTOSHABILITACAO.GRID" CanDelete="True" CanUpdate="True" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAOFORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4756_at7525_hsc640e211.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7134">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7134" Title="FCI" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_VARIACAOFORNECEDORFCI.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VARIACAOFORNECEDOR = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4728_at7134_hs76819dc1.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7300">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7300" Title="Tipo inspeção fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_QL_TIPOINSPECAOPRODUTO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t4883_at7300_hs1fbf6ee2.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabMARGEMDELUCRO">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="MARGEMDELUCRO" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_MARGEMDELUCRO.MARGENSDELUCRO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE)" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabEMBALAGENS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="EMBALAGENS" Title="Embalagens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDOREMBALAGEM.EMBALAGENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE) AND A.FORNECEDOR = @CAMPO(FORNECEDOR)" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabOUTROSCDIGOS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="OUTROSCDIGOS" Title="Outros códigos no fornecedor" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_VARIACAOFORNECEDORESCODIGOS.CODIGOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.VARIACAOFORNECEDOR = @CAMPO(HANDLE)" PageId="CARGA_DE_PRODUTOS__VARIACOES_NAO_UNICAS__VARIFORNECEDOR2_FORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    