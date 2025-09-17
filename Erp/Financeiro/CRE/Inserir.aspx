<%@ Page Title="Novo contas a receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
   
<div class="row">
   <wes:AjaxForm runat="server" ID="FORMNOVOCONTASARECEBER"  Title="Novo contas a receber" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_INSERIRCONTASRECEBER.FORM" ShowTitle="True" PageWidgetHandle="260"  />
</div>
   

   
<script runat="server">
 protected override void LoadWebPartConnections()
 {
     
 }
</script>
</asp:Content>
   