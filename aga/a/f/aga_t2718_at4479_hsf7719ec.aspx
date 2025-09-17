<%@ Page Title="Por família" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSALIQUOTAS.FAMILIA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORFAMILIA_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6139" class="active"><a data-toggle="tab" href="#tabWIDGET_6139"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro da família")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5190"><a data-toggle="tab" href="#tabWIDGET_5190"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro da família")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5191"><a data-toggle="tab" href="#tabWIDGET_5191"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta da família")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6139">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6139" Title="Margem de lucro da família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_ESTADOTRIBUTOSMARGEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at6139_hsd4cdf1eb.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORFAMILIA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5190">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5190" Title="Margem de lucro da família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_ESTADOTRIBUTOSMARGEM.VARIAVEL.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2372_at5190_hs3f6b2ea8.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORFAMILIA_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_5191">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5191" Title="Valor da pauta da família" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_ESTADOTRIBUTOSVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2371_at5191_hs4a7c8ec8.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ALIQUOTAS_ORIGEM_DESTINOS__PORFAMILIA_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    