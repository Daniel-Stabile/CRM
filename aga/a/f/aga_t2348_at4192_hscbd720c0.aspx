<%@ Page Title="Tabelas auxiliares - Tipos de pneu" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Tabelas auxiliares - Tipos de pneu</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7015"><a data-toggle="tab" href="#tabWIDGET_7015">Campos adicionais</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Tipos de pneu" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_MA_PARTESEQUIPAMENTO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__TIPOS_DE_PNEUS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7015">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7015" Title="Campos adicionais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_PARTEEQUIPAMENTOCONTROLES.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPOPARTE = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2635_at7015_hsfbf2479f.aspx" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOS_DE_PNEUS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    