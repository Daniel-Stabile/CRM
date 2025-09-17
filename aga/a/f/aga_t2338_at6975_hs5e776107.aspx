<%@ Page Title="Centros de manutenção - Abastecimento" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Centros de manutenção - Abastecimento</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6978"><a data-toggle="tab" href="#tabWIDGET_6978">Bombas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6979"><a data-toggle="tab" href="#tabWIDGET_6979">Comboios</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6973"><a data-toggle="tab" href="#tabWIDGET_6973">Unidades de abastecimento</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Centros de manutenção - Abastecimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MA_CENTROSMANUTENCAO.ABASTECIMENTO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CENTROSDEMANUTENCAO__ABASTECIMENTO_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6978">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6978" Title="Bombas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_UNIDADEABASTECIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="TIPO = 1 AND (A.CENTRODEMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4656_at6978_hsa7394189.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CENTROSDEMANUTENCAO__ABASTECIMENTO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6979">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6979" Title="Comboios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_UNIDADEABASTECIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="TIPO = 2 AND (A.CENTRODEMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4656_at6979_hs4d9d7732.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CENTROSDEMANUTENCAO__ABASTECIMENTO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6973">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6973" Title="Unidades de abastecimento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_UNIDADEABASTECIMENTO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTRODEMANUTENCAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t4656_at6973_hs78545daf.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CENTROSDEMANUTENCAO__ABASTECIMENTO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    