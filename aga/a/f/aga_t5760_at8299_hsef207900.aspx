<%@ Page Title="Log comprovantes de rendimentos agendado" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Log comprovantes de rendimentos agendado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_TR_DIRFLOGS.FORM" CanDelete="False" CanUpdate="False" CanInsert="False" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TR_DIRF__LOGCOMPROVANTEAGENDADO_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8297" class="active"><a data-toggle="tab" href="#tabWIDGET_8297"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processamento OK")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8298"><a data-toggle="tab" href="#tabWIDGET_8298"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Processamento com erro")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_8297">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8297" Title="Processamento OK" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_TR_DIRFLOGPESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS =1) AND (A.DIRFLOG = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5761_at8297_hs85f245e3.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DIRF__LOGCOMPROVANTEAGENDADO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8298">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8298" Title="Processamento com erro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_TR_DIRFLOGPESSOAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS=2) AND (A.DIRFLOG = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5761_at8298_hs45c3f31f.aspx" UserDefinedDisableRowSelection="False" PageId="TR_DIRF__LOGCOMPROVANTEAGENDADO_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    