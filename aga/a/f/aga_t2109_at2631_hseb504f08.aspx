<%@ Page Title="Pedidos de empenho - Confirmar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Pedidos de empenho - Confirmar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="PEDIDOSEMPENHOS__ACONFIRMAR_FORM" Level="20" Order="1"  />
      <div class="col-md-12"><div class="portlet light">
    <div class="tabbable-line">
      <ul class="nav nav-tabs">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2655" class="active"><a data-toggle="tab" href="#tabWIDGET_2655"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Empenhos gerados")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2632"><a data-toggle="tab" href="#tabWIDGET_2632"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Histórico")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_3703"><a data-toggle="tab" href="#tabWIDGET_3703"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Movimentações")%></a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_2990"><a data-toggle="tab" href="#tabWIDGET_2990"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Pedidos complementares")%></a></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane active" id="tabWIDGET_2655">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2655" Title="Empenhos gerados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Fixed" EntityViewName="AGA_CT_EMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/f/aga_t2107_at2655_hs3483978f.aspx" UserDefinedDisableRowSelection="False" PageId="PEDIDOSEMPENHOS__ACONFIRMAR_FORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2632">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2632" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_PD_STATUS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CT_PEDIDOSEMPENHOS') AND A.HANDLEREGISTROORIGEM = @RASTRO(CT_PEDIDOSEMPENHOS))" FormUrl="~/aga/a/f/aga_t1951_at2632_hsdc58ff1.aspx" UserDefinedDisableRowSelection="False" PageId="PEDIDOSEMPENHOS__ACONFIRMAR_FORM" Level="20" Order="15"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_3703">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_3703" Title="Movimentações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOMOVIMENTACOES.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PEDIDO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2513_at3703_hs4392ad9b.aspx" UserDefinedDisableRowSelection="False" PageId="PEDIDOSEMPENHOS__ACONFIRMAR_FORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabWIDGET_2990">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_2990" Title="Pedidos complementares" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_PEDIDOSEMPENHOS.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.PEDIDOORIGINAL = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2109_at2990_hsc8215cf6.aspx" UserDefinedDisableRowSelection="False" PageId="PEDIDOSEMPENHOS__ACONFIRMAR_FORM" Level="20" Order="25"  /></div>
        </div>
      </div>
    </div>
  </div>
</div></div>
      </asp:Content>
    