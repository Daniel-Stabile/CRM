<%@ Page Title="Suprimentos" Language="C#" Inherits="aga.a.orcamento.ConfirmarPedidosPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Suprimentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="CP_REQUISICOESPAI.PEDIDO.GRID" DefaultFilterName="Suprimentos" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (
SELECT B.REQUISICAOPAI FROM CP_REQUISICOES B WHERE B.HANDLE IN (
SELECT D.HANDLEREQUISICAO FROM CT_PEDIDOSEMPENHOS D WHERE D.ORIGEM = 2 AND D.STATUS = 6 AND ((D.GRUPOALCADA IS NULL AND D.CONFIRMANTE = @USUARIO) OR (D.GRUPOALCADA IN(SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E, CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA = 'S' AND E.SEQUENCIA &gt;=D.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S') OR (D.GRUPOALCADA IN (SELECT F.HANDLE FROM CP_GRUPOALCADASINTEGRANTES E,CP_GRUPOALCADAS F WHERE E.GRUPO = F.HANDLE AND F.EHHIERARQUIA &lt;&gt; 'S' AND E.SEQUENCIA = D.SEQUENCIAALCADA AND E.USUARIO = @USUARIO AND E.ATIVO = 'S'))))))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_ORCAMENTO_PROCESSOS_CONFIRMARPEDIDOS_SUPRIMENTOS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="PEDIDOSSELECIONADOS" Title="Pedidos selecionados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="DOCUMENTOS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CT_PEDIDOSEMPENHOS.PADRAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLEREQUISICAO IN (
SELECT B.HANDLE FROM CP_REQUISICOES B WHERE B.REQUISICAOPAI IN (
SELECT C.HANDLE FROM CP_REQUISICOESPAI C WHERE C.HANDLE IN @SELECIONADOS))" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_ORCAMENTO_PROCESSOS_CONFIRMARPEDIDOS_SUPRIMENTOS" Level="20" Order="10"  />
        </div>
    
      </asp:Content>
    