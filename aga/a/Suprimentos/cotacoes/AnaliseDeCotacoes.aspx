<%@ Page Title="Análise de Cotações" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.AnaliseDeCotacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="CRITRIOSDESUGESTO" Title="Análise de cotações" Subtitle="Após preencher os critérios de seleção clique em Sugerir para prosseguir com a análise." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="CP_VT_CRITERIOSANALISECOTACOES.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_ANALISEDECOTACOES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CRITRIOSDESUGESTO" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.ANALISECOTACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="3" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT DISTINCT MIN(REQAGRUPADA.REQUISICAOHANDLE) HANDLE
                                 FROM CP_REQUISICAOAGRUPADAS REQAGRUPADA
                                 JOIN CP_REQUISICAOPRODUTOS REQPRODUTO ON REQAGRUPADA.REQUISICAOPRODUTO = REQPRODUTO.HANDLE
                                 JOIN CP_REQUISICAOCOTACOES REQCOTACOES ON REQPRODUTO.HANDLE = REQCOTACOES.COTACAO
                                WHERE REQPRODUTO.TIPO = 'C'
                                      AND REQPRODUTO.EMPRESA = @EMPRESA
                                      AND REQPRODUTO.STATUS = 1 
                                      AND REQPRODUTO.COMPRADOR = @CAMPO(COMPRADOR)
                                      AND REQPRODUTO.FORNECEDOR IS NOT NULL 
                                      AND REQCOTACOES.STATUS = 1
                                      AND REQCOTACOES.COMPRADOR = @CAMPO(COMPRADOR) 
                                      AND REQCOTACOES.DATAVALIDADE &gt;= @HOJE
                             GROUP BY REQPRODUTO.PRODUTO, REQPRODUTO.VARIACAO, REQPRODUTO.EHAGRUPAMENTO, REQPRODUTO.HANDLE)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ANALISEDECOTACOES" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="COTAES" Title="Cotações" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="ITENS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOCOTACOES.ANALISECOTACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.COTACAO IN (SELECT REQUISICAOPRODUTO FROM CP_REQUISICAOAGRUPADAS REQAGRUPADA JOIN CP_REQUISICAOPRODUTOS REQPRODUTO ON REQAGRUPADA.REQUISICAOPRODUTO = REQPRODUTO.HANDLE
WHERE REQPRODUTO.STATUS = 1 AND REQPRODUTO.TIPO = 'C' AND REQUISICAOHANDLE = @CAMPO(HANDLE)) AND A.STATUS = 1 AND A.DATAVALIDADE &gt;= @HOJE" FormUrl="~/aga/a/suprimentos/cotacoes/DetalheDaCotacao.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ANALISEDECOTACOES" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="PROPOSTAS" Title="Propostas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="CRITRIOSDESUGESTO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_COTACOESCAPAITENS.ANALISE_COTACAO_PROPOSTA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN ( SELECT MIN(COTACAOCAPAITENS.HANDLE) FROM CP_COTACOESCAPAITENS COTACAOCAPAITENS
JOIN CP_REQUISICAOPRODUTOS REQPRODUTO ON COTACAOCAPAITENS.REQUISICAOPRODUTO = REQPRODUTO.HANDLE
JOIN CP_REQUISICAOCOTACOES REQCOTACOES ON REQPRODUTO.HANDLE = REQCOTACOES.COTACAO
WHERE (COTACAOCAPAITENS.COTACAOCAPA IN (@CAMPO(COTACOESCAPA)) OR -1 IN (@CAMPO(COTACOESCAPA)))
AND REQPRODUTO.TIPO = 'C'
AND REQPRODUTO.STATUS = 1
AND REQPRODUTO.COMPRADOR = @CAMPO(COMPRADOR)
AND REQPRODUTO.FORNECEDOR IS NOT NULL
AND REQCOTACOES.STATUS = 1
AND REQCOTACOES.COMPRADOR = @CAMPO(COMPRADOR)
AND REQCOTACOES.DATAVALIDADE &gt;= @HOJE
GROUP BY COTACAOCAPAITENS.FORNECEDOR, COTACAOCAPAITENS.COTACAOCAPA)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_ANALISEDECOTACOES" Level="20" Order="40"  />
        <wes:SimpleGrid runat="server" ID="ITENSNAPROPOSTA" Title="Itens na proposta" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="PROPOSTAS" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOCOTACOES.ANALISE_COTACAO_PROPOSTA.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT COTACOES.HANDLE
FROM CP_COTACOESCAPAITENS COTACAOCAPAITENS
JOIN CP_REQUISICAOCOTACOES COTACOES ON COTACAOCAPAITENS.REQUISICAOPRODUTO = COTACOES.COTACAO
WHERE COTACAOCAPAITENS.FORNECEDOR = @CAMPO(FORNECEDOR) AND COTACAOCAPAITENS.COTACAOCAPA = @CAMPO(COTACAOCAPA) AND COTACOES.STATUS = 1 AND COTACOES.DATAVALIDADE &gt;= @HOJE)" FormUrl="~/aga/a/suprimentos/cotacoes/DetalheDaCotacao.aspx" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_SUPRIMENTOS_COTACOES_ANALISEDECOTACOES" Level="20" Order="50"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(incluirLegendaBotoesItens);
        pagina.add_endRequest(incluirLegendaBotoesPropostas);
    }
      
    incluirLegendaBotoesItens(); 
    incluirLegendaBotoesPropostas();
});


const incluirLegendaBotoesItens = () => {
    $("#ctl00_Main_ITENS_toolbar, #ctl00_Main_ITENS_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando;
        if (comando.id == "top-CMD_ALTERARCRITERIOS") {
            descricaoComando = "Alterar critérios de sugestão";
        }
        else if (comando.id == "top-CMD_SELECIONARCOTACOESSUGERIDA") {
            descricaoComando = "Selecionar todas as cotações sugeridass";
        }
        else if (comando.id == "top-MAPA_ANALISE_COTACOES") {
            descricaoComando = "Mapa de analise de cotações";
        }
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};

const incluirLegendaBotoesPropostas = () => {
    $("#ctl00_Main_PROPOSTAS_toolbar, #ctl00_Main_PROPOSTAS_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando;
        if (comando.id == "top-CMD_ALTERARCRITERIOS") {
            descricaoComando = "Alterar critérios de sugestão";
        }
        else if (comando.id == "top-MAPA_ANALISE_COTACOES") {
            descricaoComando = "Mapa de analise de cotações";
        }
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};
              </script>
        <style>
              #ITENS th, td, #COTAES th, td, #PROPOSTAS th, td, #ITENSNAPROPOSTA th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    