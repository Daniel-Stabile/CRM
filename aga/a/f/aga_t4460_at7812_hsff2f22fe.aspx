<%@ Page Title="Grupo de tributação" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Grupo de tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PD_GTPRODUTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__GRUPO_DE_TRIBUTACAO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6750" class="active"><a data-toggle="tab" href="#tabWIDGET_6750"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Alíquotas por Origem x Destino")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6764"><a data-toggle="tab" href="#tabWIDGET_6764"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empresa tributação")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6749"><a data-toggle="tab" href="#tabWIDGET_6749"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Por estado")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6750">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6750" Title="Alíquotas por Origem x Destino" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GTESTADOTRIBUTOSALIQUOTAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPOTRIBUTACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4462_at6750_hs681c24e4.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__GRUPO_DE_TRIBUTACAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6764">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6764" Title="Empresa tributação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_GTPRODUTOEMPRESAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPOTRIBUTACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4471_at6764_hs2ad38e02.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__GRUPO_DE_TRIBUTACAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6749">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6749" Title="Por estado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_GTESTADOTRIBUTOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.GRUPOTRIBUTACAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4461_at6749_hs3e24abb2.aspx" UserDefinedDisableRowSelection="False" PageId="COMERCIAL_CONFIGURACOESTRIBUTARIAS__GRUPO_DE_TRIBUTACAO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    