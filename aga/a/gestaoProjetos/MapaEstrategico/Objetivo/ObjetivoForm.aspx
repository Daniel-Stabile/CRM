<%@ Page Title="Objetivo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OBJETIVO" class="active"><a data-toggle="tab" href="#tabOBJETIVO">Objetivo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="INDICADORES"><a data-toggle="tab" href="#tabINDICADORES">Indicadores</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="OBJETIVOSFILHOS"><a data-toggle="tab" href="#tabOBJETIVOSFILHOS">Objetivos filhos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="AESORAMENTRIAS"><a data-toggle="tab" href="#tabAESORAMENTRIAS">Ações Orçamentárias</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabOBJETIVO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="OBJETIVO" Title="Objetivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_CICLOOBJETIVOS.OBJETIVOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="GP_OBJETIVO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabINDICADORES">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="INDICADORES" Title="Indicadores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="OBJETIVO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_OBJETIVOINDICADORES.OBJETIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OBJETIVO = @CAMPO(HANDLE) AND A.PLANEJAMENTOESTRATEGICO = @CAMPO(PLANEJAMENTOESTRATEGICO) AND A.CICLO = @CAMPO(CICLO)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Indicadores/IndicadoresForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVO_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="OBJETIVO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_PLANEJAMENTOANEXOS.OBJETIVO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OBJETIVO = @CAMPO(HANDLE) AND A.CICLO = @CAMPO(CICLO) AND A.PLANEJAMENTOESTRATEGICO = @CAMPO(PLANEJAMENTOESTRATEGICO)" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Objetivo/AnexosForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVO_FORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabOBJETIVOSFILHOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="OBJETIVOSFILHOS" Title="Objetivos filhos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="OBJETIVO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="OBJETIVOSFILHOS.DATASOURCE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OBJETIVOPAI = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="GP_OBJETIVO_FORM" Level="20" Order="50"  /></div>
        </div>
        <div class="tab-pane" id="tabAESORAMENTRIAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="AESORAMENTRIAS" Title="Ações Orçamentárias" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="OBJETIVO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="OP_PERIODOGESTESTRATEGICA_EM_GP_CICLOOBJETIVOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.OBJETIVO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVO_FORM" Level="20" Order="60"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    