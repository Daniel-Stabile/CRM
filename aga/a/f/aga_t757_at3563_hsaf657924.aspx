<%@ Page Title="Tabelas auxiliares - Centros de custo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="tabbable-line">
    <ul class="nav nav-tabs">
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="FORMULARIO" class="active"><a data-toggle="tab" href="#tabFORMULARIO">Centro de custo</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDFILIAISVALIDAS"><a data-toggle="tab" href="#tabGRIDFILIAISVALIDAS">Filiais válidas</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDPROJETOSVALIDOS"><a data-toggle="tab" href="#tabGRIDPROJETOSVALIDOS">Projetos válidos</a></li>
      <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="WIDGET_4636"><a data-toggle="tab" href="#tabWIDGET_4636">Localizações válidas</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tabFORMULARIO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Centro de custo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CC.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__CENTROSCUSTO_FORM" Level="20" Order="1"  /></div>
      </div>
      <div class="tab-pane" id="tabGRIDFILIAISVALIDAS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="GRIDFILIAISVALIDAS" Title="Filiais válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="CT_CCFILIALVALIDAS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__CENTROSCUSTO_FORM" Level="20" Order="20"  /></div>
      </div>
      <div class="tab-pane" id="tabGRIDPROJETOSVALIDOS">
                    <div class="row">
    <wes:EditableGrid runat="server" ID="GRIDPROJETOSVALIDOS" Title="Projetos válidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="FN_CCPROJETOSVALIDOS.CUSTOM.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__CENTROSCUSTO_FORM" Level="20" Order="30"  /></div>
      </div>
      <div class="tab-pane" id="tabWIDGET_4636">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="WIDGET_4636" Title="Localizações válidas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Minimized" EntityViewName="AGA_CT_CCLOCALIZACOESVALIDAS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.CENTROCUSTO = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/aga_t2848_at4636_hsa3adb7fc.aspx" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_CONTRATOS_COMPRA__CENTROSCUSTO_FORM" Level="20" Order="100"  /></div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    