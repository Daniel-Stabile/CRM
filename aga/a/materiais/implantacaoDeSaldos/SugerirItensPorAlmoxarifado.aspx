<%@ Page Title="Selecionar produtos por almoxarifado" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.implantacaoDeSaldos.SugerirItensPorAlmoxarifado" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Geração de itens por almoxarifado" Subtitle="Selecione abaixo os itens a serem associados à implantação." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_ALMOXARIFADOVARIACOES.IMPLANTACAODESALDOS.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.EMINVENTARIO = 'N') AND (A.PRODUTO IN (SELECT HANDLE FROM PD_PRODUTOS WHERE EMPRESA = @EMPRESA AND FILIAL IN @FILIAIS AND ATIVO = 'S' AND TIPO IN (1, 2, 4, 5))) AND (A.ESTOQUETOTAL &lt;= 0) AND A.ALMOXARIFADO = :ALMOXARIFADO" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_IMPLANTACAODESALDOS_SUGERIRITENSPORALMOXARIFADO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    