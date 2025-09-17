<%@ Page Title="Serviço de Técnicos Externos" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="SERVIODETCNICOEXTERNO" Title="Serviço de Técnico Externo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOINTERNOS.NOVAORDEMTECNICOSINTERNOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_SERVICOTECNICIOINTERNO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="UTILIZAODESERVIONOVECULO" Title="Utilização de Serviço no Veículo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="SERVIODETCNICOEXTERNO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="MF_ORDEMSERVICOINTERNOS.UTILIZASERVICOVEICULO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMSERVICO = @CAMPO(ORDEMSERVICO)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="FROTAS_ORDEMSERVICOS_NOVAORDEM_SERVICOTECNICIOINTERNO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    