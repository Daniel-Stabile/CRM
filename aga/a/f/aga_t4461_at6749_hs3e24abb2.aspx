<%@ Page Title="Por estado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Por estado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GTESTADOTRIBUTOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACAOESTADOTRIBUTOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7138" class="active"><a data-toggle="tab" href="#tabWIDGET_7138"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6751"><a data-toggle="tab" href="#tabWIDGET_6751"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Margem de lucro")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="REDUES"><a data-toggle="tab" href="#tabREDUES"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Reduções")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7136"><a data-toggle="tab" href="#tabWIDGET_7136"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Valor da pauta do produto")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_7138">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7138" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_GTESTADOTRIBUTOSMARGEM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4463_at7138_hs13af1f4b.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACAOESTADOTRIBUTOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6751">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6751" Title="Margem de lucro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_GTESTADOTRIBUTOSMARGEM.MARGEM2.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4463_at6751_hs13a11f4b.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACAOESTADOTRIBUTOS_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabREDUES">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="REDUES" Title="Reduções" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_GTESTADOTRIBUTOSREDUCOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACAOESTADOTRIBUTOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7136">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7136" Title="Valor da pauta do produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_GTESTADOTRIBUTOSVALOR.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ESTADOTRIBUTOS = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4730_at7136_hs83a90493.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_GT_ESTADOTRIBUTOS__GRUPOTRIBUTACAOESTADOTRIBUTOS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    