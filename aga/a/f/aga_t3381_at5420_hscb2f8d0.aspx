<%@ Page Title="Modelo de análise de crédito" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Modelo de análise de crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="8" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_GN_CLIENTECREDITOMODELOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_FINANCEIRO__MODELOS_ANALISE_CREDITO_FORM" Level="20" Order="1"  />
        <wes:EditableGrid runat="server" ID="CATEGORIASQUENOBLOQUEIAMCRDITO" Title="Categorias que não bloqueiam crédito" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_CLIENTECREDITOCATEGORIASCLI.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.MODELOANALISE = @CAMPO(HANDLE)" PageId="TABELAS_AUXILIARES_FINANCEIRO__MODELOS_ANALISE_CREDITO_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    