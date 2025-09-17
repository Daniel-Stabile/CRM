<%@ Page Title="Validações - Grupo de regras" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Validações - Grupo de regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_GN_GRUPOREGRAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_CONTABIL_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6248" class="active"><a data-toggle="tab" href="#tabWIDGET_6248"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Condições para regras")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6246"><a data-toggle="tab" href="#tabWIDGET_6246"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Regras")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6248">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6248" Title="Condições para regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_GN_REGRAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = 'P') AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3486_at6248_hsbf9ccf52.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_CONTABIL_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6246">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6246" Title="Regras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_GN_REGRAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO IN ('V','A')) AND (A.GRUPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3486_at6246_hsd640d497.aspx" UserDefinedDisableRowSelection="False" PageId="CARGA_CONTABIL_VALIDACOES__GRUPOREGRAS_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    