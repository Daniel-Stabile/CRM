<%@ Page Title="Contas a Receber" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AmCharts runat="server" ID="GRAFICO" Title="Análise de Recebimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_CONTASARECEBER.RELATORIO.GRID" CanDelete="True" CanUpdate="True" CanInsert="True" Mode="None" ValueFieldName="VALOR" LabelFieldName="CLIENTE" ChartType="Doughnut" TypeDefinition="2" ChartHeight="600" ChartDefinition="DQp7DQoJJ3R5cGUnOiAncGllJywNCgkndGl0bGVGaWVsZCc6ICdjbGllbnRlJywNCgkndmFsdWVGaWVsZCc6ICd2YWxvcicsDQoJJ2JhbGxvb25UZXh0JzogJ1tbdGl0bGVdXTxicj48c3BhbiBzdHlsZT1cJ2ZvbnQtc2l6ZToxNHB4XCc+PGI+W1t2YWx1ZV1dPC9iPiAoW1twZXJjZW50c11dJSk8L3NwYW4+JywNCgknbGVnZW5kJzogew0KCQknZW5hYmxlZCc6IGZhbHNlLA0KCQknYWxpZ24nOiAnY2VudGVyJywNCgkJJ21hcmtlclR5cGUnOiAnY2lyY2xlJw0KCX0sDQoJJ2lubmVyUmFkaXVzJzogJzQwJScNCn0NCg==" PageId="ERP_FINANCEIRO_RELATORIOS_CRE" Level="20" Order="50"  />
        <wes:SimpleGrid runat="server" ID="GRIDCONTASARECEBER" Title="Recebimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" EntityViewName="CLOUD_CONTASARECEBER.RELATORIO.GRID" CanDelete="False" CanUpdate="False" CanInsert="False" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="100" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedDisableRowSelection="False" PageId="ERP_FINANCEIRO_RELATORIOS_CRE" Level="20" Order="100"  />
        </div>
    
      </asp:Content>
    