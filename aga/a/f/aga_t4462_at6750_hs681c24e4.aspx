<%@ Page Title="Alíquota por Origem x Destino" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Alíquota" Subtitle="por Origem x Destino" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GTESTADOTRIBUTOSALIQUOTAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACOESORIGEMDESTINO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7137" class="active"><a data-toggle="tab" href="#tabWIDGET_7137"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6753"><a data-toggle="tab" href="#tabWIDGET_6753"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7135"><a data-toggle="tab" href="#tabWIDGET_7135"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta do produto")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7137">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7137" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_GTESTADOTRIBUTOSMARGEM.ORIGEMDESTINO2.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4463_at7137_hs1bb188fd.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACOESORIGEMDESTINO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6753">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6753" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_GTESTADOTRIBUTOSMARGEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4463_at6753_hse1f788fd.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACOESORIGEMDESTINO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7135">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7135" Title="Valor da pauta do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_GTESTADOTRIBUTOSVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOSALIQUOTAS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4730_at7135_hs95053b6.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACOESORIGEMDESTINO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    