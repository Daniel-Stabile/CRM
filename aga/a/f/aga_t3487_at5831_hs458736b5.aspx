<%@ Page Title="Log das validações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Log das validações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_GRUPOLOGS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_CONTABIL_VALIDACOES__LOGVALIDACOES_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_5830" class="active"><a data-toggle="tab" href="#tabWIDGET_5830"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Logs (com sucesso)")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6068"><a data-toggle="tab" href="#tabWIDGET_6068"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Logs (demais situações)")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_5830">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_5830" Title="Logs (com sucesso)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_GRUPOLOGITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.RESULTADO = 1 AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3488_at5830_hs346279b5.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_CONTABIL_VALIDACOES__LOGVALIDACOES_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6068">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6068" Title="Logs (demais situações)" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_GRUPOLOGITENS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.RESULTADO &lt;&gt; 1 AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3488_at6068_hscc363989.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_CONTABIL_VALIDACOES__LOGVALIDACOES_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    