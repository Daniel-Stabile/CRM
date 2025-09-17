<%@ Page Title="Contratos" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.AprovarContratoUnico" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTRATO" class="active"><a data-toggle="tab" href="#tabCONTRATO">Contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENS"><a data-toggle="tab" href="#tabITENS">Itens/Objetos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOSEMITIDOS"><a data-toggle="tab" href="#tabDOCUMENTOSEMITIDOS">Documentos emitidos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ANEXOS"><a data-toggle="tab" href="#tabANEXOS">Anexos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ASSINATURAS"><a data-toggle="tab" href="#tabASSINATURAS">Assinaturas</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONTRATO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTRATO" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.APROVACAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOSFORM" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOOBJETOS.APROVACAO.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/contratos/aprovacoes/ItensContrato.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOSFORM" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOSEMITIDOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOSEMITIDOS" Title="Documentos emitidos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_MODELODOCUMENTOS_CONTRATO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.INATIVO &lt;&gt; 'S') AND (A.ADITIVO IS NULL) AND A.CONTRATO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOSFORM" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabANEXOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOANEXOS_ANEXOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOSFORM" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabASSINATURAS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ASSINATURAS" Title="Assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_ASSINATURAS_TODOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTRATOS_APROVACOES_CONTRATOSFORM" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
        <style>
            #ASSINATURAS th, td, #ITENS th, td {
    white-space:nowrap !important;
}
            </style>
      </asp:Content>
    