<%@ Page Title="Estruturas Onde Se Utiliza" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PRODUTO_1" Title="Produto" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="PD_PRODUTOVARIACOESMESTRE_ESTRUTURA.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_PRODUCAO_ESTRUTURAONDESEUSA" Level="20" Order="16"  />
        <wes:SimpleGrid runat="server" ID="ESTRUTURASONDEUTILIZADO" Title="Estruturas Onde é Utilizado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PRODUTO_1" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PR_ESTRUTURASONDESEUSA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT A1.HANDLE FROM PR_ESTRUTURAS A1,PD_PRODUTOS B
WHERE (A1.PRODUTO = @CAMPO(CODIGOREFERENCIA)) AND
A1.VARIACAOPRODUTO = @CAMPO(HANDLE) AND
(A1.DATAFINAL &gt; @AGORA) AND
(B.HANDLE = A1.PRODUTO) AND B.TIPO &lt;&gt; 3)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_PRODUCAO_ESTRUTURAONDESEUSA" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    