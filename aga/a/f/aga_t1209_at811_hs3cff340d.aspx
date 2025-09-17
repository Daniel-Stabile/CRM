<%@ Page Title="Operações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Operações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESTOQUE"><a data-toggle="tab" href="#tabESTOQUE">Estoque</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FISCAL"><a data-toggle="tab" href="#tabFISCAL">Fiscal</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="RENEGOCIAOCAUO"><a data-toggle="tab" href="#tabRENEGOCIAOCAUO">Renegociação caução</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALADAENTRADACPA"><a data-toggle="tab" href="#tabALADAENTRADACPA">Alçada entrada CPA</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ALADALIBERAOAP"><a data-toggle="tab" href="#tabALADALIBERAOAP">Alçada liberação AP</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AUDITORIA"><a data-toggle="tab" href="#tabAUDITORIA">Auditoria</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="EMPENHOS"><a data-toggle="tab" href="#tabEMPENHOS">Empenhos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Operações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_GN_OPERACOES.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="ADM__OPERACOES_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabESTOQUE">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="ESTOQUE" Title="Estoque" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACOES.ESTOQUE.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM__OPERACOES_FORM" Level="20" Order="21"  /></div>
        </div>
        <div class="tab-pane" id="tabFISCAL">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FISCAL" Title="Fiscal" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACOES.FISCAL.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM__OPERACOES_FORM" Level="20" Order="31"  /></div>
        </div>
        <div class="tab-pane" id="tabRENEGOCIAOCAUO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="RENEGOCIAOCAUO" Title="Renegociação caução" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACOES.RENEGOCIACAOCAUCAO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ADM__OPERACOES_FORM" Level="20" Order="41"  /></div>
        </div>
        <div class="tab-pane" id="tabALADAENTRADACPA">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="ALADAENTRADACPA" Title="Alçada entrada CPA" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACAOALCADAS.PARAMETROS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAO = @CAMPO(HANDLE)" PageId="ADM__OPERACOES_FORM" Level="20" Order="61"  /></div>
        </div>
        <div class="tab-pane" id="tabALADALIBERAOAP">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="ALADALIBERAOAP" Title="Alçada liberação AP" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACAOALCADASPARCELA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAO = @CAMPO(HANDLE)" PageId="ADM__OPERACOES_FORM" Level="20" Order="71"  /></div>
        </div>
        <div class="tab-pane" id="tabAUDITORIA">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="AUDITORIA" Title="Auditoria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACOES.AUDITORIA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="ADM__OPERACOES_FORM" Level="20" Order="81"  /></div>
        </div>
        <div class="tab-pane" id="tabEMPENHOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="EMPENHOS" Title="Empenhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="GN_OPERACOESEMPENHOS.ADM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OPERACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/adm/operacoes/empenhos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ADM__OPERACOES_FORM" Level="20" Order="91"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    