<%@ Page Title="Entregas especificas" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.EntregasEspecifica" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ENTREGASESPECFICAS" Title="Entregas específicas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.ENTREGAESPECIFICA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ENTREGASESPECIFICASAGRUPADA" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ENTREGASESPECFICAS_1" Title="Datas de entregas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ENTREGASESPECFICAS" ChromeState="Normal" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CP_COTACAOENTREGA.ENTREGAESPECIFICAAGRUPADA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.COTACAO = @RASTRO(CP_REQUISICAOCOTACOES) AND A.REQUISICAO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ENTREGASESPECIFICASAGRUPADA" Level="20" Order="20"  />
        </div>
    
        <style>
              #ENTREGASESPECFICAS_1 th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    