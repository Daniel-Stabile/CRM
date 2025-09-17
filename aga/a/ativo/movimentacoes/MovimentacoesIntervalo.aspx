<%@ Page Title="Movimentações por intervalo" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.Ativo.Movimentacoes.MovimentacoesIntervaloPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="MOVIMENTAESPORINTERVALO" Title="Movimentações por intervalo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AT_ITENS_MOV_INTERVALO.GRID" DefaultFilterName="FILTRO_ATIVO_MOVINTERVALO" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="True" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/ativo/movimentacoes/MovimentacoesIntervalo.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AT_MOVIMENTACOES_INTERVALO" Level="20" Order="30"  />
        </div>
    
      </asp:Content>
    