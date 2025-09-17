<%@ Page Title="ECF - Escrituração Contábil Fiscal - X390 - Origem e Aplicação de Recursos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="X390ORIGEMEAPLICAODERECURSOS" Title="X390 - Origem e Aplicação de Recursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_PLANOSGERENCIAIS.X390.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_ABAIXO_TABELAS_AUX_ECF__EDCF_ORIGEM_APLICACAO_RECURSOS_FORM" Level="20" Order="20"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ORIGENSEAPLICAES" class="active"><a data-toggle="tab" href="#tabORIGENSEAPLICAES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Origens e Aplicações")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabORIGENSEAPLICAES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ORIGENSEAPLICAES" Title="Origens e Aplicações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="X390ORIGEMEAPLICAODERECURSOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTASGERENCIAIS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.PLANO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t916_at7640_hsa65906.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_ABAIXO_TABELAS_AUX_ECF__EDCF_ORIGEM_APLICACAO_RECURSOS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    