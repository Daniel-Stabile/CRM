<%@ Page Title="Contas a Pagar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
   
<div class="row">
   <wes:SimpleGrid runat="server" ID="GRIDCONTASAPAGAR"  Title="Contas a Pagar" BootstrapCols="12" UserDefinedDisableRowSelection="False" FormUrl="~/Erp/Financeiro/CPA/Editar.aspx" UserDefinedCriteriaWhereClause="" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="True" SystemFilterOnly="False" UserDefinedPageSize="100" UserDefinedSelectColumnVisible="False" Mode="Fixed" DefaultFilterName="Filtro" CanInsert="False" CanUpdate="False" CanDelete="False" ChromeState="Normal" EntityViewName="CLOUD_CONTASAPAGAR.GRID" ShowTitle="True" PageWidgetHandle="270"  />
</div>
      
<script runat="server">
 protected override void LoadWebPartConnections()
 {
 }
</script>
</asp:Content>
   