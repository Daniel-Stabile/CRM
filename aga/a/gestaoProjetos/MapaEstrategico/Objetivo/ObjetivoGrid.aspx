<%@ Page Title="Objetivo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.GestaoProjetos.Objetivos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="OBJETIVOS" Title="Objetivos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="GP_CICLOOBJETIVOS.OBJETIVOS.GRID" DefaultFilterName="FILTRO_GP_CICLOOBJETIVOS" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/gestaoProjetos/MapaEstrategico/Objetivo/ObjetivoForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="GP_OBJETIVO_GRID" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    