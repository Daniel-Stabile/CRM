<%@ Page Title="Extratos" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.DigitarExtrato,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_FILTRODIGITAREXTRATO.FILTRO.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_DIGITAREXTRATO" Level="20" Order="5"  />
        <wes:Tile runat="server" ID="SALDOATUALCONTA" Title="Saldo Atual Conta" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TS_EXTRATOBANCARIO.DIGITAREXTRATO.GRID" CompanyFilterMode="OnlyCompany" Value="Filtrar" Prefix="Necessário" Description="Saldo Atual Conta" Icon="fa fa-user" Color="grey-cascade" ValueAggregation="None" TileType="Flat" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_DIGITAREXTRATO" Level="20" Order="7"  />
        <wes:Tile runat="server" ID="SALDOATUALEXTRATO" Title="Saldo Atual Extrato" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TS_EXTRATOBANCARIO.DIGITAREXTRATO.GRID" CompanyFilterMode="OnlyCompany" Value="Filtrar" Prefix="Necessário" Description="Saldo Atual Extrato" Icon="fa fa-file-text" Color="grey-cascade" ValueAggregation="None" TileType="Flat" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_DIGITAREXTRATO" Level="20" Order="9"  />
        <wes:SimpleGrid runat="server" ID="EXTRATOS" Title="Extratos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FILTRO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TS_EXTRATOBANCARIO.DIGITAREXTRATO.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.CONTA = @CAMPO(CONTACORRENTE) AND 
A.DATAEMISSAO &gt;= @CAMPO(DATAINICIAL) AND 
A.DATAEMISSAO &lt;= @CAMPO(DATAFINAL)" FormUrl="~/aga/a/financeiro/OfficeBanking/EditarExtrato.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_DIGITAREXTRATO" Level="20" Order="10"  />
        </div>
    
        <style>
              .widget-thumb .widget-thumb-body .widget-thumb-body-stat {
    font-size: 25px;
}

              </style>
      </asp:Content>
    