<%@ Page Title="Itens Aquisição - Todos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Itens Aquisição - Todos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_1884"><a data-toggle="tab" href="#tabWIDGET_1884">Cotações</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_6511"><a data-toggle="tab" href="#tabWIDGET_6511">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_8180"><a data-toggle="tab" href="#tabWIDGET_8180">Pesquisa de preço</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Itens Aquisição - Todos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOITENS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="LC_CARGA_AQUISICAO_ITENS_LEITURA__TODOS_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_1884">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_1884" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOCOTACOESITEM.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.AQUISICAOITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1805_at1884_hsa13a0fe0.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_AQUISICAO_ITENS_LEITURA__TODOS_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_6511">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_6511" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAODOCUMENTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEM = @RASTRO(LC_AQUISICAOITENS)) AND (A.ITEM = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t1799_at6511_hs2116bc2e.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_AQUISICAO_ITENS_LEITURA__TODOS_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_8180">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_8180" Title="Pesquisa de preço" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_LC_AQUISICAOITEMPESQUISAPRECOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ITEMAQUISICAO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5677_at8180_hsf4703d0d.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="LC_CARGA_AQUISICAO_ITENS_LEITURA__TODOS_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    