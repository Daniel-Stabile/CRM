<%@ Page Title="Cotações de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.cotacoes.Cotacoes" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQCOTAES" Title="Cotações de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOPRODUTOS.COTACOES.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.STATUS = 1 AND A.TIPO = 'C' AND A.FORNECEDOR IS NOT NULL AND (A.COMPRADOR =  @~SESSAO(COMPRADOR_ATUAL_COTACOES) OR @~SESSAO(COMPRADOR_ATUAL_COTACOES) = '')" FormUrl="~/aga/a/suprimentos/cotacoes/HistoricoCotacoes.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_COTACOES" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="COTAES" Title="Rodadas de cotação" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQCOTAES" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOCOTACOES.COTACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.COTACAO = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/cotacoes/cotacoesForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_COTACOES_COTACOES" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              const ocultarPainelComandosInferior = () => Benner.Page.REQCOTAES.hideFooterCommandsBar();

//A barra de comandos da tec possui javascript que implementa controle de largura automático por baixo dos panos, acionando o comando "Mais" e ocultando os comandos quando os mesmos forem sobrepassar a largura do widget. Nesta tela, porém, os comandos estão sendo diminuidos manualmente após a renderização, não sendo necessário esse comportamento. Este código oculta o botão mais caso a tec tenha inserido em seu JS por falso positivo e reexibe os comandos que foram ocultados.
const desfazerBotaoMaisTec = () => {
    $("#ctl00_Main_REQCOTAES_toolbar a[style*='display: none']").show()
    $("#ctl00_Main_REQCOTAES_toolbar .more-menu-item").hide()  
};

const incluirLegendaBotoes = () => {
    $("#ctl00_Main_REQCOTAES_toolbar, #ctl00_Main_REQCOTAES_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando;
        if (comando.id == "top-CMD_ALTERARDATAFORNECEDOR") {
            descricaoComando = "Alterar data validade no portal";
        }
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};

const ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_REQCOTAES_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_REQCOTAES_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltroCotacoesDeCompra').prop('checked', true);
    $('#labelOcultarFiltroCotacoesDeCompra').addClass('active');
    $('#labelExibirFiltroCotacoesDeCompra').removeClass('active');
    $('#labelOcultarFiltroReqCotacoes').css('display', 'none');
    $('#labelExibirFiltroReqCotacoes').css('display', '')    
    
    sessionStorage.setItem('TOGGLE_FILTRO_REQCOTAES', "Oculto");
};

const exibirFiltro = () => {
    $('#ctl00_Main_REQCOTAES_FilterControl_FilterContainer').fadeIn(500);
    $("#HasFilterApplied_CotacoesDeCompra").val("False");
    
    $('#labelOcultarFiltroReqCotacoes').css('display', '');
    $('#labelExibirFiltroReqCotacoes').css('display', 'none');
    
    sessionStorage.setItem('TOGGLE_FILTRO_REQCOTAES', "Visivel");
};

const processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_REQCOTAES');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_CotacoesDeCompra").val() == "True")
        ocultarFiltro();  
};

const processarVisibilidadeGridRodadas = () => {
    if ($("#VisibilidadeGridRodadas").val() == "False")
        ocultarGridRodadas();
    else
        exibirGridRodadas();
};

const exibirGridRodadas = () => {
	$("#COTAES").fadeIn();
	$('#REQCOTAES').removeClass('col-md-12');
	$('#REQCOTAES').addClass('col-md-6');
	$("#VisibilidadeGridRodadas").val("True");
};

const ocultarGridRodadas = () => {
	$("#COTAES").hide();
	$('#REQCOTAES').removeClass('col-md-6');
	$('#REQCOTAES').addClass('col-md-12');
	$("#VisibilidadeGridRodadas").val("False");
};

const botoesControle = () => {
    $('#ctl00_Main_REQCOTAES_toolbar').append('<a class="btn custom-action command-action blue active" style="display: none" onclick="exibirFiltro();" id="labelExibirFiltroReqCotacoes"> Exibir filtro </a><a class="btn custom-action command-action blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroReqCotacoes"> Ocultar filtro </a>');
    
    $('#ctl00_Main_COTAES_toolbar').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarLotes" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridRodadas()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
};

$(() => {
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeFiltro);
        pagina.add_endRequest(incluirLegendaBotoes);
        pagina.add_endRequest(desfazerBotaoMaisTec);
        pagina.add_endRequest(processarVisibilidadeGridRodadas);
        pagina.add_endRequest(ocultarPainelComandosInferior);
        pagina.add_endRequest(botoesControle);
    }
      
    incluirLegendaBotoes(); 
    processarVisibilidadeFiltro();
    processarVisibilidadeGridRodadas();
    ocultarPainelComandosInferior();
    botoesControle();
});

              </script>
        <style>
              #COTAES th, td, #REQCOTAES th, td {
    white-space: nowrap !important;
}
              </style>
      </asp:Content>
    