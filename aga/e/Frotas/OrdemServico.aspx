<%@ Page Title="Ordem de Serviço" Language="C#" Inherits="Benner.Corporativo.Frotas.WebApp.aga.e.OrdemServico.GerenciamentoOrdensServicos" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GERENCIAMENTODEORDEMDESERVIO" Title="Gerenciamento de Ordem de Servico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="MF_ORDEMSERVICOS.GRID" DefaultFilterName="Geral" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/a/Frotas/OrdemServicosInternas.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="ORDEM_SERVICO" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    