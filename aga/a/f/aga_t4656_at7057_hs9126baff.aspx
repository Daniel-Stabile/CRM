<%@ Page Title="Comboios" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Comboios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_UNIDADEABASTECIMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_COMBOIOS__COMBOIOS_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6980" class="active"><a data-toggle="tab" href="#tabWIDGET_6980"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Operadores")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7055"><a data-toggle="tab" href="#tabWIDGET_7055"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico de abertura/fechamento")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_6980">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6980" Title="Operadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_UNIDADEABASTECIMENTOPESSOAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.UNIDADEABASTECIMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4661_at6980_hs4b709403.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_COMBOIOS__COMBOIOS_FORM" Level="20" Order="9"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7055">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7055" Title="Histórico de abertura/fechamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_MF_CONTROLEABASTECIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.STATUS IN (2,3)) AND (A.UNIDADEABASTECIMENTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4678_at7055_hs83842f84.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_COMBOIOS__COMBOIOS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    