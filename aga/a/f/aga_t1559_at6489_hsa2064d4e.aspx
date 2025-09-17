<%@ Page Title="Tabelas auxiliares - Motivos da baixa" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Motivos da baixa" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_MOTIVOSBAIXA.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="TABELAS_AUXILIARES_ATIVO__MOTIVO_BAIXA_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="CONTAS" Title="CONTAS" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AT_CONTASMOTIVOBAIXA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="(A.MOTIVOBAIXA = @CAMPO(HANDLE))" FormUrl="~/aga/a/f/formContasMotivoBaixa.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TABELAS_AUXILIARES_ATIVO__MOTIVO_BAIXA_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    