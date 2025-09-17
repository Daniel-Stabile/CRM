<%@ Page Title="Tabelas auxiliares - Tipos de veículo" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMULARIO" Title="Tabelas auxiliares - Tipos de veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="AGA_MF_VEICULOTIPOS.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="MF_CONFIGURACOES__TIPOVEICULOS_FORM" Level="20" Order="1"  />
        <wes:SimpleGrid runat="server" ID="MODELOS" Title="Modelos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOMODELOS.VEICULOSTIPOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOVEICULO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TiposVeiculos/Modelos/ModeloCadastro.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOVEICULOS_FORM" Level="20" Order="11"  />
        <wes:SimpleGrid runat="server" ID="SUBTIPOS" Title="Subtipos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMULARIO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_VEICULOSUBTIPOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPOVEICULO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Frotas/TiposVeiculos/Subtipo/SubtipoVeiculo.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="MF_CONFIGURACOES__TIPOVEICULOS_FORM" Level="20" Order="21"  />
        </div>
    
      </asp:Content>
    