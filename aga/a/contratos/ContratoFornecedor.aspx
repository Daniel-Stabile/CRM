<%@ Page Title="Contrato" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.contratos.ContratoFornecedor" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="portlet light">
  <div class="row">
    <div class="col-md-3 col-sm-3 col-xs-3">
      <ul class="nav nav-tabs tabs-left">
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="CONTRATO" class="active"><a data-toggle="tab" href="#tabCONTRATO">Contrato</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ITENSOBJETOS"><a data-toggle="tab" href="#tabITENSOBJETOS">Itens/Objetos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TERCEIRIZADOS"><a data-toggle="tab" href="#tabTERCEIRIZADOS">Terceirizados</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="DOCUMENTOS"><a data-toggle="tab" href="#tabDOCUMENTOS">Documentos</a></li>
        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ACIDENTESDETRABALHO"><a data-toggle="tab" href="#tabACIDENTESDETRABALHO">Acidentes de Trabalho</a></li>
      </ul>
    </div>
    <div class="col-md-9 col-sm-9 col-xs-9">
      <div class="tab-content">
        <div class="tab-pane active" id="tabCONTRATO">
                    <div class="row">
    <wes:AjaxForm runat="server" ID="CONTRATO" Title="Contrato" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOS.FORNECEDOR.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CONTRATO_FORNECEDOR" Level="20" Order="10"  /></div>
        </div>
        <div class="tab-pane" id="tabITENSOBJETOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ITENSOBJETOS" Title="Itens/Objetos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATOOBJETOS.FORNECEDOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/ItensObjetosFornecedor.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONTRATO_FORNECEDOR" Level="20" Order="20"  /></div>
        </div>
        <div class="tab-pane" id="tabTERCEIRIZADOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="TERCEIRIZADOS" Title="Terceirizados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_FUNCIONARIOSTERCEIROS.CONTRATOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/Terceirizados.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONTRATO_FORNECEDOR" Level="20" Order="30"  /></div>
        </div>
        <div class="tab-pane" id="tabDOCUMENTOS">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CN_CONTRATODOCUMENTOS.FORNECEDOR.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE) AND A.FUNCIONARIOTERCEIRO is NULL" FormUrl="~/aga/a/contratos/DocumentoFornecedor.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONTRATO_FORNECEDOR" Level="20" Order="40"  /></div>
        </div>
        <div class="tab-pane" id="tabACIDENTESDETRABALHO">
                    <div class="row">
    <wes:SimpleGrid runat="server" ID="ACIDENTESDETRABALHO" Title="Acidentes de Trabalho" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="CONTRATO" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CN_ACIDENTESTRABALHO.ACIDENTE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.CONTRATO = @CAMPO(HANDLE)" FormUrl="~/aga/a/contratos/acidenteTrabalho.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CONTRATO_FORNECEDOR" Level="20" Order="50"  /></div>
        </div>
      </div>
    </div>
  </div>
</div>
      
      </asp:Content>
    