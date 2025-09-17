<%@ Page Title="Editar contas a pagar" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FORMEDITARCONTASAPAGAR" Title="Editar contas a pagar" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_EDITARCONTASPAGAR.FORM" CanDelete="True" CanUpdate="True" CanInsert="True" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="ERP_FINANCEIRO_CPA_EDITAR" Level="20" Order="100"  />
        <wes:AmCharts runat="server" ID="ANALISEDELANCAMENTOSFINANCEIROS" Title="Análise de Lançamentos Financeiros" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="FORMEDITARCONTASAPAGAR" ChromeState="Normal" EntityViewName="CLOUD_LANCAMENTOSFINANCEIROS.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" ValueFieldName="VALOR" LabelFieldName="CATEGORIA" CriteriaWhereClause="A.PARCELA = @CAMPO(HANDLEPARCELA)" ChartType="Doughnut" TypeDefinition="1" ChartHeight="400" ChartDefinition="CnsKCSd0eXBlJzogJ3BpZScsCgkndGl0bGVGaWVsZCc6ICdjYXRlZ29yaWEnLAoJJ3ZhbHVlRmllbGQnOiAndmFsb3InLAoJJ2JhbGxvb25UZXh0JzogJ1tbdGl0bGVdXTxicj48c3BhbiBzdHlsZT1cJ2ZvbnQtc2l6ZToxNHB4XCc+PGI+W1t2YWx1ZV1dPC9iPiAoW1twZXJjZW50c11dJSk8L3NwYW4+JywKCSdsZWdlbmQnOiB7CgkJJ2VuYWJsZWQnOiB0cnVlLAoJCSdhbGlnbic6ICdjZW50ZXInLAoJCSdtYXJrZXJUeXBlJzogJ2NpcmNsZScKCX0sCgknaW5uZXJSYWRpdXMnOiAnNDAlJwp9" PageId="ERP_FINANCEIRO_CPA_EDITAR" Level="20" Order="200"  />
        </div>
    
      </asp:Content>
    