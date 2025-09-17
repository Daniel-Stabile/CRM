<%@ Page Title="Cálculo de depreciação - Múltiplos critérios de cálculo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Ativo.MultiplosCriteriosCalculo.MultiplosCriteriosCalculoPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Cálculo de depreciação - Múltiplos critérios de cálculo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_AT_ITEMCRITERIOSCALCULO.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="CARGA_DE_ITENS_DO_ATIVO_CALCDEPREC__MULTIPLOSCRITERIOSCALCULO_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="CLCULOS" Title="Cálculos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_AT_ITEMCALCULOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(ITEM) AND A.CRITERIOCALCULO = @CAMPO(CRITERIOCALCULO)" FormUrl="~/aga/a/f/aga_t1292_at6465_hs7aae37cc.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="CARGA_DE_ITENS_DO_ATIVO_CALCDEPREC__MULTIPLOSCRITERIOSCALCULO_FORM" Level="20" Order="11"  />
        </div>
    
      </asp:Content>
    