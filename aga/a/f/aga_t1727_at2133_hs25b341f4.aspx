<%@ Page Title="Tarefas" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tarefas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_PR_TAREFAS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PRODUCAO__CADASTROTAREFAS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RECURSOS" class="active"><a data-toggle="tab" href="#tabRECURSOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Recursos")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TRIBUTOS"><a data-toggle="tab" href="#tabTRIBUTOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Atributos")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabRECURSOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="RECURSOS" Title="Recursos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_PR_TAREFARECURSOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TAREFA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t3583_at5843_hse505781f.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="PRODUCAO__CADASTROTAREFAS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTRIBUTOS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="TRIBUTOS" Title="Atributos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PR_TAREFAATRIBUTOS.CUSTOM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.TAREFA = @CAMPO(HANDLE))" PageId="PRODUCAO__CADASTROTAREFAS_FORM" Level="20" Order="30"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    