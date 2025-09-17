<%@ Page Title="Cadastro de cobrança bancária" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
   
<div class="row">
   <wes:AjaxForm runat="server" ID="FORMFORMULARIODECOBRANCABANCARIA" FormMode="View" Title="Remessa Bancária" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="False" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_GN_HBREMESSAS.FORM" ShowTitle="True" PageWidgetHandle="272"  />
</div>
   
<div class="row">
   <wes:SimpleGrid runat="server" ID="GRIDPARCELASINCLUIDAS"  Title="Parcelas incluídas" BootstrapCols="6" UserDefinedDisableRowSelection="False" FormUrl="" UserDefinedCriteriaWhereClause="" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="True" SystemFilterOnly="False" UserDefinedPageSize="10" UserDefinedSelectColumnVisible="False" Mode="None" DefaultFilterName="" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_FN_PARCELAREMESSAS.GRID" ShowTitle="True" PageWidgetHandle="292"  />
</div>
   
<script runat="server">
 protected override void LoadWebPartConnections()
 {
   AddWebPartStaticConnection("FORMFORMULARIODECOBRANCABANCARIAGRIDPARCELASINCLUIDAS", "FORMFORMULARIODECOBRANCABANCARIA", "GRIDPARCELASINCLUIDAS");
 }
</script>
</asp:Content>
   