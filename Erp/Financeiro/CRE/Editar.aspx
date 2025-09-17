<%@ Page Title="Editar contas a receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
   
<div class="row">
   <wes:AjaxForm runat="server" ID="FORMEDITARCONTASARECEBER"  Title="Editar contas a receber" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="True" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_EDITARCONTASRECEBER.FORM" ShowTitle="True" PageWidgetHandle="290"  />
</div>
   
<div class="row">
   <wes:AmCharts runat="server" ID="ANALISEDELANCAMENTOSFINANCEIROS"  Title="Análise de Lançamentos Financeiros" BootstrapCols="12" ChartDefinition="CnsKCSd0eXBlJzogJ3BpZScsCgkndGl0bGVGaWVsZCc6ICdjYXRlZ29yaWEnLAoJJ3ZhbHVlRmllbGQnOiAndmFsb3InLAoJJ2JhbGxvb25UZXh0JzogJ1tbdGl0bGVdXTxicj48c3BhbiBzdHlsZT1cJ2ZvbnQtc2l6ZToxNHB4XCc+PGI+W1t2YWx1ZV1dPC9iPiAoW1twZXJjZW50c11dJSk8L3NwYW4+JywKCSdsZWdlbmQnOiB7CgkJJ2VuYWJsZWQnOiB0cnVlLAoJCSdhbGlnbic6ICdjZW50ZXInLAoJCSdtYXJrZXJUeXBlJzogJ2NpcmNsZScKCX0sCgknaW5uZXJSYWRpdXMnOiAnNDAlJwp9" ChartHeight="400" TypeDefinition="Simple" ChartType="Doughnut" CriteriaWhereClause="A.PARCELA = @CAMPO(HANDLEPARCELA)" LabelFieldName="CATEGORIA" ValueFieldName="VALOR" Mode="None" DefaultFilterName="" CanInsert="True" CanUpdate="True" CanDelete="True" ChromeState="Normal" EntityViewName="CLOUD_LANCAMENTOSFINANCEIROS.GRID" ShowTitle="True" PageWidgetHandle="302"  />
</div>
   
<script runat="server">
 protected override void LoadWebPartConnections()
 {
   AddWebPartStaticConnection("FORMEDITARCONTASARECEBERANALISEDELANCAMENTOSFINANCEIROS", "FORMEDITARCONTASARECEBER", "ANALISEDELANCAMENTOSFINANCEIROS");
 }
</script>
</asp:Content>
   