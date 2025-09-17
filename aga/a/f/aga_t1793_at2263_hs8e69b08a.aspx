<%@ Page Title="Tipos de requisição" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Tipos de requisição</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1930"><a data-toggle="tab" href="#tabWIDGET_1930">Parâmetros do tipo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1914"><a data-toggle="tab" href="#tabWIDGET_1914">Requisições</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2299"><a data-toggle="tab" href="#tabWIDGET_2299">Usuários</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tipos de requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_LC_REQUISICAOTIPOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="AQUISICOES__TIPOSDEREQUISICAO_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1930">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1930" Title="Parâmetros do tipo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_REQUISICAOTIPOALCADAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAOTIPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1821_at1930_hs37b4b901.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AQUISICOES__TIPOSDEREQUISICAO_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1914">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1914" Title="Requisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.TIPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1792_at1914_hs891acec4.aspx" UserDefinedDisableRowSelection="False" PageId="AQUISICOES__TIPOSDEREQUISICAO_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2299">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2299" Title="Usuários" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_LC_REQUISICAOTIPOUSUARIOS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.REQUISICAOTIPO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2014_at2299_hs77ba424b.aspx" UserDefinedDisableRowSelection="False" PageId="AQUISICOES__TIPOSDEREQUISICAO_FORM" Level="20" Order="20"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    