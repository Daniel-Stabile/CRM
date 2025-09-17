<%@ Page Title="Retornos de pagamento automatizado" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.GridRetorno,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDRETORNOSDEPAGAMENTOAUTOMATIZADO" Title="Retornos de pagamento automatizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="AGA_GN_HBRETORNOS_PGTOAUTO.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.TIPO = 'P' AND A.CONTA IN (SELECT B.HANDLE FROM FN_CONTASTESOURARIA B WHERE B.FILIAL IN @FILIAIS)" FormUrl="~/aga/a/financeiro/RetornoPagtoAuto/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="WEB_A_FINANCEIRO_RETORNOPGTOAUTO_GRID" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              function download(filename, text) {
  var element = document.createElement('a');
  element.setAttribute('href', 'data:text/plain;charset=utf-8,' + encodeURIComponent(text));
  element.setAttribute('download', filename);

  element.style.display = 'none';
  document.body.appendChild(element);

  element.click();

  document.body.removeChild(element);
}
              </script>
      </asp:Content>
    