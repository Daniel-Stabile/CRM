<%@ Page Title="Nova rodada de cotações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.GerarNovaRodadaCotacao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="NOVARODADADECOTAES" Title="Nova rodada de cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOS.NOVARODADACOTACAO.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARNOVARODADACOTACAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="PRODUTOS" Title="Produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOVARODADADECOTAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_PRODUTOVARIACOESMESTRE.NOVARODADACOTACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN 
(
SELECT REQ.VARIACAO FROM CP_COTACOESCAPAITENS CAPAITENS 
JOIN CP_COTACOESCAPA CAPA ON CAPAITENS.COTACAOCAPA = CAPA.HANDLE 
JOIN CP_REQUISICOES REQ ON CAPAITENS.REQUISICAO = REQ.HANDLE 
JOIN CP_REQUISICAOPRODUTOS REQPRODUTO ON CAPAITENS.REQUISICAOPRODUTO = REQPRODUTO.HANDLE 
WHERE CAPA.HANDLE IN (SELECT COTACAOCAPA FROM CP_COTACOESCAPAITENS WHERE REQUISICAOPRODUTO = @CAMPO(HANDLE)) 
AND REQPRODUTO.STATUS = 1
)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARNOVARODADACOTACAO" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="FORNECEDORES" Title="Fornecedores" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOVARODADADECOTAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.NOVARODADACOTACAO.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN
(
SELECT CAPAITENS.FORNECEDOR FROM CP_COTACOESCAPAITENS CAPAITENS 
JOIN CP_COTACOESCAPA CAPA ON CAPAITENS.COTACAOCAPA = CAPA.HANDLE 
JOIN CP_REQUISICAOPRODUTOS REQPRODUTOS ON CAPAITENS.REQUISICAOPRODUTO = REQPRODUTOS.HANDLE WHERE CAPA.HANDLE IN (SELECT COTACAOCAPA FROM CP_COTACOESCAPAITENS WHERE REQUISICAOPRODUTO = @CAMPO(HANDLE))
)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARNOVARODADACOTACAO" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="ANEXOSGRID" Title="Anexos do motivo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_MOTIVORODADAANEXOS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="1000" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="None" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARNOVARODADACOTACAO" Level="20" Order="40"  />
        <wes:AjaxForm runat="server" ID="ANEXOSFORM" Title="Adicionar anexo" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CP_VT_ANEXOMOTIVORODADA.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARNOVARODADACOTACAO" Level="20" Order="50"  />
        </div>
    
      </asp:Content>
    