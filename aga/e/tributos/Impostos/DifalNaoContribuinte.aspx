<%@ Page Title="DIFAL - Não Contribuinte" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="DIFALNOCONTRIBUINTE" Title="DIFAL - Não Contribuinte" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_TR_IMPOSTODIFAL.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="'forcar_carga_form'='forcar_carga_form'" UserDefinedCommandsVisible="True" PageId="AGA_E_TRIBUTOS_IMPOSTOS_DIFALNAOCONTRIBUINTE" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ESTADOSDESTINO_5" Title="ESTADOS -DESTINO" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DIFALNOCONTRIBUINTE" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="TR_IMPOSTODIFALESTADOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.IMPOSTODIFAL = @TABELA(TR_IMPOSTODIFAL)" FormUrl="~/aga/e/tributos/Impostos/Estados_Destino.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_E_TRIBUTOS_IMPOSTOS_DIFALNAOCONTRIBUINTE" Level="20" Order="70"  />
        </div>
    
      </asp:Content>
    