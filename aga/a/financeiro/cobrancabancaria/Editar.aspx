<%@ Page Title="Editar cobrança bancária" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Financeiro.cobrancabancaria.cobrancabancariaFormPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMEDITARCOBRANCABANCARIA" Title="Cobrança bancária" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GN_HBREMESSAS.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_FINANCEIRO_COBRANCABANCARIA_EDITAR" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="TTULOS" Title="Títulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMEDITARCOBRANCABANCARIA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CONSULTA_TITULOS_REMESSA.DATASOURCE.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMESSA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_COBRANCABANCARIA_EDITAR" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    