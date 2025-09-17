<%@ Page Title="Por produtos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSALIQUOTAS.PRODUTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORPRODUTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6140" class="active"><a data-toggle="tab" href="#tabWIDGET_6140"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro do produto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5193"><a data-toggle="tab" href="#tabWIDGET_5193"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro do produto")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5194"><a data-toggle="tab" href="#tabWIDGET_5194"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta do produto")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6140">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6140" Title="Margem de lucro do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_ESTADOTRIBUTOSMARGEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at6140_hs895ca11e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORPRODUTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5193">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5193" Title="Margem de lucro do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSMARGEM.VARIAVEL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at5193_hs7bc3c8b6.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORPRODUTOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5194">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5194" Title="Valor da pauta do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_ESTADOTRIBUTOSVALOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2371_at5194_hs6515ef4c.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORPRODUTOS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    