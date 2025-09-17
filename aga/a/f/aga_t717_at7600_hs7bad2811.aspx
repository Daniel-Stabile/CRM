<%@ Page Title="Configurações comerciais - Agentes de venda" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Configurações comerciais - Agentes de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_PESSOAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__AGENTES_DE_VENDAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3028" class="active"><a data-toggle="tab" href="#tabWIDGET_3028"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Abrangência CEPs")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3029"><a data-toggle="tab" href="#tabWIDGET_3029"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Clientes")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_3028">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3028" Title="Abrangência CEPs" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_PESSOAAGENTECEPS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2306_at3028_hs650054c7.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__AGENTES_DE_VENDAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3029">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3029" Title="Clientes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_PESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.EHCLIENTE = 'S' AND (A.AGENTEVENDAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t717_at3029_hs4598c1f4.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESCOMERCIAIS__AGENTES_DE_VENDAS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    