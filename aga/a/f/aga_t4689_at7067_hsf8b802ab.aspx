<%@ Page Title="Materiais/Serviços externos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Materiais/Serviços externos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7579"><a data-toggle="tab" href="#tabWIDGET_7579">Serviço desativado p/ veículo</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_7066"><a data-toggle="tab" href="#tabWIDGET_7066">Variações nas filiais</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Materiais/Serviços externos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" EntityViewName="AGA_MF_ROTEIROETAPAEXTERNA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MA_ROTEIROMANUTENCAOETAPA__ITENS_DO_ROTEIRO_EXTERNA_FORM" Level="20" Order="1"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7579">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7579" Title="Serviço desativado p/ veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_MF_ETAPAEXTERNAVEICULOINATIVO.GRID" CanDelete="True" CanUpdate="False" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.SERVICO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t5211_at7579_hsb052183e.aspx" UserDefinedDisableRowSelection="False" PageId="MA_ROTEIROMANUTENCAOETAPA__ITENS_DO_ROTEIRO_EXTERNA_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_7066">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_7066" Title="Variações nas filiais" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_MF_ROTEIROEXTERNAVARIACOES.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.ETAPAEXTERNA = @CAMPO(HANDLE)) AND (A.PRODUTOPAI = @CAMPO(PRODUTOPAI))" FormUrl="~/aga/a/f/aga_t4690_at7066_hs1605f155.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MA_ROTEIROMANUTENCAOETAPA__ITENS_DO_ROTEIRO_EXTERNA_FORM" Level="20" Order="15"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    