<%@ Page Title="Apuração de impostos" Language="C#" Inherits="aga.e.Tributos.Apuracoes.ApuracaoImpostos,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="CONSULTA" OnCommandExecute="CONSULTA_CommandExecute" Title="Apuração de impostos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="TR_APURACOES.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" ShowExport="True" UserDefinedDisableRowSelection="False" PageWidgetHandle="58450" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    