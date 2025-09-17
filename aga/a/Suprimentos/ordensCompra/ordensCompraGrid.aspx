<%@ Page Title="Ordens de compra" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.ordensCompra.OrdensCompraGrid" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="GRIDCP_ORDENSCOMPRA" Title="Movimentações Ordens de Compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_ORDENSCOMPRA.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" FormUrl="~/aga/a/suprimentos/ordensCompra/ordensCompraForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_GRID" Level="20" Order="100"  />
        <wes:SimpleGrid runat="server" ID="ITENSDAORDEMDECOMPRA" Title="Itens da ordem de compra" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="GRIDCP_ORDENSCOMPRA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_ORDENSCOMPRAITENS.VISUALIZARITENS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.ORDEMCOMPRA = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_ORDENSCOMPRA_GRID" Level="20" Order="130"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_GRIDCP_ORDENSCOMPRA .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltroOrdensDeCompra"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label style="margin-left: 3px;" class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroOrdensDeCompra"><input type="radio" id="toggleOcultarFiltroOrdensDeCompra" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');

    $('#ctl00_Main_ITENSDAORDEMDECOMPRA .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarLotes" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridItensOrdemCompra()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
    
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeFiltro);
        pagina.add_endRequest(desfazerBotaoMaisTec);
        pagina.add_endRequest(processarVisibilidadeGridItensOrdemCompra);
        pagina.add_endRequest(ocultarPainelComandosInferior);
    }
        
    processarVisibilidadeFiltro();
    processarVisibilidadeGridItensOrdemCompra();
    ocultarPainelComandosInferior();
});

const ocultarPainelComandosInferior = () => Benner.Page.GRIDCP_ORDENSCOMPRA.hideFooterCommandsBar();

//A barra de comandos da tec possui javascript que implementa controle de largura automático por baixo dos panos, acionando o comando "Mais" e ocultando os comandos quando os mesmos forem sobrepassar a largura do widget. Nesta tela, porém, os comandos estão sendo diminuidos manualmente após a renderização, não sendo necessário esse comportamento. Este código oculta o botão mais caso a tec tenha inserido em seu JS por falso positivo e reexibe os comandos que foram ocultados.
const desfazerBotaoMaisTec = () => {
    $("#ctl00_Main_GRIDCP_ORDENSCOMPRA_toolbar a[style*='display: none']").show()
    $("#ctl00_Main_GRIDCP_ORDENSCOMPRA_toolbar .more-menu-item").hide()  
};

const diminuirComandosTabela = () => {
    $("#ctl00_Main_GRIDCP_ORDENSCOMPRA_toolbar, #ctl00_Main_GRIDCP_ORDENSCOMPRA_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando = $(comando).text();
        $(comando).html($(comando).html().replace(descricaoComando, ""));
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};

const ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_GRIDCP_ORDENSCOMPRA_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_GRIDCP_ORDENSCOMPRA_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltroOrdensDeCompra').prop('checked', true);
    $('#labelOcultarFiltroOrdensDeCompra').addClass('active');
    $('#labelExibirFiltroOrdensDeCompra').removeClass('active');
    
    sessionStorage.setItem('TOGGLE_FILTRO_GRIDCP_ORDENSCOMPRA', "Oculto");
};

const exibirFiltro = () => {
    $('#ctl00_Main_GRIDCP_ORDENSCOMPRA_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_GRIDCP_ORDENSCOMPRA', "Visivel");
    $("#HasFilterApplied_GRIDCP_ORDENSCOMPRA").val("False");
};

const processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_GRIDCP_ORDENSCOMPRA');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_GRIDCP_ORDENSCOMPRA").val() == "True")
        ocultarFiltro();  
};

const processarVisibilidadeGridItensOrdemCompra = () => {
    if ($("#VisibilidadeGridItensOrdemCompra").val() == "False")
        ocultarGridItensOrdemCompra();
    else
        exibirGridItensOrdemCompra();
};

const exibirGridItensOrdemCompra = () => {
	$("#ITENSDAORDEMDECOMPRA").fadeIn();
	$('#GRIDCP_ORDENSCOMPRA').removeClass('col-md-12');
	$('#GRIDCP_ORDENSCOMPRA').addClass('col-md-6');
	$("#VisibilidadeGridItensOrdemCompra").val("True");
};

const ocultarGridItensOrdemCompra = () => {
	$("#ITENSDAORDEMDECOMPRA").hide();
	$('#GRIDCP_ORDENSCOMPRA').removeClass('col-md-6');
	$('#GRIDCP_ORDENSCOMPRA').addClass('col-md-12');
	$("#VisibilidadeGridItensOrdemCompra").val("False");
};
              </script>
        <style>
              #GRIDCP_ORDENSCOMPRA th, td {
    white-space:nowrap !important;
}
#ITENSDAREQUISIO th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    