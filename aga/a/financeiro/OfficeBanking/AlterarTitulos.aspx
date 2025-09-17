<%@ Page Title="Alteração de títulos" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.AlteracaoTitulos,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="REMESSA" Title="Remessa" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_HBREMESSAS.HANDLE.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_ALTERARTITULOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="TTULOS" Title="Títulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REMESSA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAREMESSAS.ALTERACAOTITULOS.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REMESSA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_ALTERARTITULOS" Level="20" Order="10"  />
        </div>
    
        <style>
              .left{
    text-align: left!important;
    width: 120px !important
}

              </style>
      </asp:Content>
    