<%@ Page Title="Cotações" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Cotações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1878"><a data-toggle="tab" href="#tabWIDGET_1878">Entregas</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1877"><a data-toggle="tab" href="#tabWIDGET_1877">Vencimentos</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOCOTACOESITEM.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO_LEITURA__COTACAOTECNICA_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1878">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1878" Title="Entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_COTACAOITEMENTREGAS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.COTACAOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1809_at1878_hse5f98979.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO_LEITURA__COTACAOTECNICA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1877">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1877" Title="Vencimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_COTACAOITEMVENCIMENTOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.COTACAOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1807_at1877_hs353e966.aspx" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_DO_ITEM_DA_AQUISICAO_LEITURA__COTACAOTECNICA_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    