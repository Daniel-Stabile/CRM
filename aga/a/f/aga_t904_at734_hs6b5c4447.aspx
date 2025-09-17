<%@ Page Title="Agenda" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Agenda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_AGENDAS.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="ADM__ADM_AGENDAS_FORM" Level="20" Order="1"  />
      <div class="col-md-6"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1167" class="active"><a data-toggle="tab" href="#tabWIDGET_1167"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Campos a bloquear/esconder")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_735"><a data-toggle="tab" href="#tabWIDGET_735"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Usuários")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_1167">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1167" Title="Campos a bloquear/esconder" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_Z_AGENDACAMPOPERMISSOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AGENDA = @CAMPO(HANDLE) AND A.TABELA = @CAMPO(TABELA))" FormUrl="~/aga/a/f/aga_t1417_at1167_hsc09d79eb.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_AGENDAS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_735">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_735" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_Z_AGENDAUSUARIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AGENDA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t905_at735_hs11107f62.aspx" UserDefinedDisableRowSelection="False" PageId="ADM__ADM_AGENDAS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    