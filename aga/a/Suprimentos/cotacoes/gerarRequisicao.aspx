<%@ Page Title="Gerar Requisição para aquisição" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.GerarRequisicaoAquisicao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="FILTRO" Title="Filtro" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_FILTROGERARREQUISICAO.GERARREQAQUI.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="1=1" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARREQUISICAO" Level="20" Order="5"  />
        <wes:AjaxForm runat="server" ID="OPESPARAREQUISIO" Title="Opções para Requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_VTGERARREQAQUISICAO.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARREQUISICAO" Level="20" Order="8"  />
        <wes:SimpleGrid runat="server" ID="GERARREQUISIOPARAAQUISIO" Title="Gerar Requisição para Aquisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="REQUISICOES.DATASOURCE.GERARREQAQUISICOES.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.STATUS NOT IN (4,5) AND A.HANDLE IN ( SELECT B.REQUISICAOHANDLE
                    FROM CP_REQUISICAOAGRUPADAS B
                    JOIN CP_REQUISICAOCOTACOES C ON C.COTACAO = B.REQUISICAOPRODUTO
                    WHERE C.STATUS &lt;&gt; 4 )" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARREQUISICAO" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="COTAES" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GERARREQUISIOPARAAQUISIO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="COTACOES.DATASOURCE.GERARREQAQUISICOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAOITEM = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_GERARREQUISICAO" Level="20" Order="20"  />
        </div>
    
      </asp:Content>
    