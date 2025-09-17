<%@ Page Title="Ítens" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Ítens</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3634"><a data-toggle="tab" href="#tabWIDGET_3634">Ordens de compra</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Ítens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_VENCEDORES_ITENS__ITENS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3634">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3634" Title="Ordens de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CP_ORDENSCOMPRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FORNECEDOR=@RASTRO(GN_PESSOAS) AND A.HANDLE IN (SELECT ORDEMCOMPRA FROM 

CP_ORDENSCOMPRAITENS WHERE HANDLE IN (SELECT ORDEMCOMPRAITEM FROM 

LC_AQUISICAOITENS WHERE HANDLE=@RASTRO(LC_AQUISICAOITENS)))" FormUrl="~/aga/a/f/aga_t1529_at3634_hs7a05edad.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_VENCEDORES_ITENS__ITENS_FORM" Level="20" Order="10"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    