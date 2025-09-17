<%@ Page Title="Ordem compra" Language="C#" Inherits="aga.a.orcamento.ConfirmarPedidosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Ordem compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRA.PEDIDO.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT B.ORDEMCOMPRA FROM CP_ORDENSCOMPRAITENS B WHERE B.HANDLE IN (
SELECT C.ORDEMCOMPRAITEM FROM CP_ITEMPEDIDOSEMPENHOS C WHERE C.PEDIDOEMPENHO IN (
SELECT D.HANDLE FROM CT_PEDIDOSEMPENHOS D WHERE D.ORIGEM = 4 AND D.STATUS = 6 AND ((D.GRUPOALCADA IS NULL AND D.CONFIRMANTE = @USUARIO) OR (D.GRUPOALCADA IN(SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E, CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA = 'S' AND E.SEQUENCIA &gt;=D.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S') OR (D.GRUPOALCADA IN (SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E,CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA &lt;&gt; 'S' AND E.SEQUENCIA = D.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S')))))))
" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_ORCAMENTO_PROCESSOS_CONFIRMARPEDIDOS_ORDEMCOMPRA" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="PEDIDOSSELECIONADOS" Title="Pedidos selecionados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="CT_PEDIDOSEMPENHOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT B.PEDIDOEMPENHO FROM CP_ITEMPEDIDOSEMPENHOS B WHERE B.ORDEMCOMPRAITEM IN (
SELECT C.HANDLE FROM CP_ORDENSCOMPRAITENS C WHERE C.ORDEMCOMPRA IN @SELECIONADOS))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_ORCAMENTO_PROCESSOS_CONFIRMARPEDIDOS_ORDEMCOMPRA" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    