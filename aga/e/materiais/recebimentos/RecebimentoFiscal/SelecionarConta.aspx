<%@ Page Title="Selecionar Conta" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Tributos.RecebimentoFiscal.SelecionarConta" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="SELECIONEACONTACONTBIL" Title="Selecione as Contas Contábeis" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_SELECAOCONTASCONTABEIS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="TMP_TR_CONTAFINANCONT" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    