<%@ Page Title="Exclusão de previsões financeiras - Entrada de nota fiscal" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.entradaDeNotaFiscal.ExclusaoPrevisoesFinanceiras" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="PAINEL_EXCLUSAO_PREVISOES" Title="Painel exclusão previsões financeiras" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="PD_VTENTRADANOTAFISCAL.EXCLUSAO_PREVISOES_FINANCEIRAS.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="A.FORNECEDOR = 98 AND A.NUMERONOTAFISCAL = 4321 AND A.VALORLIQUIDOFISCAL = 30" UserDefinedCommandsVisible="False" PageId="AGA_A_MATERIAIS_ENTRADADENOTAFISCAL_EXCLUSAOPREVISOESFINANCEIRAS" Level="20" Order="5"  />
        <wes:SimpleGrid runat="server" ID="PREVISOES" Title="Previsões financeiras" Subtitle="Abaixo, previsões financeiras manuais cadastradas para o fornecedor. Selecione para excluir." PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.EXCLUIR_PREVISOES_NOTA_FISCAL.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" ShowExport="False" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_ENTRADADENOTAFISCAL_EXCLUSAOPREVISOESFINANCEIRAS" Level="20" Order="10"  />
        </div>
    
        <script type="text/javascript">
              const AssociarEventoSelecao = () => $('input[type="checkbox"]').on('click', () => Benner.Page.PREVISOES.command("ProcessarSelecao"));

const SetarValoresTiles = () => {
    var jsonValoresTiles = JSON.parse($("#JsonValoresTiles").val());

	$("#tileTotalPrevisoesSelecionadas .details .number").text(jsonValoresTiles.TotalPrevisoesSelecionadas);
	$("#tileDiferencaTotalSelecionadoNf .details .number").text(jsonValoresTiles.DiferencaTotalSelecionado);
	$("#tileTotalPrevisoesDisponiveis .details .number").text(jsonValoresTiles.TotalPrevisoesDisponiveis);
	$("#tileValorTotalNf .details .number").text(jsonValoresTiles.TotalNotaFiscal);
	
	var classeCorRemover = jsonValoresTiles.ValorDivergente ? "green-jungle" : "red";
    var classeCorAdicionar = jsonValoresTiles.ValorDivergente ? "red" : "green-jungle";
	$("#tileDiferencaTotalSelecionadoNf .dashboard-stat").toggleClass(classeCorRemover, false);
	$("#tileDiferencaTotalSelecionadoNf .dashboard-stat").toggleClass(classeCorAdicionar, true);
};

$(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack()) {
        pagina.add_endRequest(AssociarEventoSelecao);
        pagina.add_endRequest(SetarValoresTiles);
    }
    
    AssociarEventoSelecao();
    SetarValoresTiles();
});

              </script>
      </asp:Content>
    