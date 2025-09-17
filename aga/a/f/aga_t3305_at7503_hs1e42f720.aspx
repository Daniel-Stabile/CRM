<%@ Page Title="Planos - Contas contábeis" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Plano contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="4" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_PLANOVERSOES.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CT_CARGA_PLANOS__CONTAS_CONTABIL_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="WIDGET_5357" Title="Contas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAS.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.VERSAO = @CAMPO(HANDLE))" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CT_CARGA_PLANOS__CONTAS_CONTABIL_FORM" Level="20" Order="10"  />
        <wes:AjaxForm runat="server" ID="CONTACONTBIL" Title="Conta contábil" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="WIDGET_5357" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CT_CONTAS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="CT_CARGA_PLANOS__CONTAS_CONTABIL_FORM" Level="20" Order="20"  />
        </div>
    
        <style>
              #ctl00_Main_FORMULARIO {
    display: none;
}

              </style>
      </asp:Content>
    