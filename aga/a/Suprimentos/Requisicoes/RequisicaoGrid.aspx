<%@ Page Title="Requisições" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.suprimentos.requisicao.RequisicaoGrid" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQUISICES" Title="Requisicões" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICOESPAI.REQUISICAO.GRID" DefaultFilterName="Padrão" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.FILIAL IN @FILIAIS AND (A.USUARIOINCLUIU = @USUARIO OR (SELECT HANDLE FROM Z_TAREFAS WHERE NOME = 'VISUALIZARREQUISICAOTODOSUSUARIOS') IN @TAREFAS)" FormUrl="~/aga/a/Suprimentos/Requisicoes/Requisicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAOGRID" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="ITENSDAREQUISIO" Title="Itens da requisição" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISICES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.GRPACOES.ITENSDAREQUISICAO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAOGRID" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISICES" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOPAIANEXOS.GRPACOES.ANEXOS.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAOPAI = @CAMPO(HANDLE)" FormUrl="~/aga/a/Suprimentos/Requisicoes/Anexos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAOGRID" Level="20" Order="30"  />
        <wes:SimpleGrid runat="server" ID="HISTRICO" Title="Histórico" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISICES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="PD_STATUS.REQUISICOES.GRPACOES.HISTORICO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.HANDLETABELAORIGEM IN (SELECT B.HANDLE FROM Z_TABELAS B WHERE B.NOME = 'CP_REQUISICOESPAI') AND A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAOGRID" Level="20" Order="40"  />
        <wes:AjaxForm runat="server" ID="HISTRICODEASSINATURAS" Title="Histórico de assinaturas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISICES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOESPAI.GRPACOES.HISTORICODEASSINATURAS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="False" PageId="AGA_A_SUPRIMENTOS_REQUISICOES_REQUISICAOGRID" Level="20" Order="50"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_REQUISICES .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltroRequisicoes"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label style="margin-left: 3px;" class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroRequisicoes"><input type="radio" id="toggleOcultarFiltroRequisicoes" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');

    $('#ctl00_Main_ITENSDAREQUISIO .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarItensRequisicao" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridItensRequisicao()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
	
    $('#ctl00_Main_ANEXOS .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarAnexos" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridAnexos()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
	
    $('#ctl00_Main_HISTRICO .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarHistorico" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridHistorico()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
	
    $('#ctl00_Main_HISTRICODEASSINATURAS .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarHistoricoDeAssinaturas" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarFormHistoricoDeAssinaturas()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');	
    
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeFiltro);
        pagina.add_endRequest(desfazerBotaoMaisTec);
        pagina.add_endRequest(processarVisibilidadeGridItensRequisicao);
		pagina.add_endRequest(processarVisibilidadeGridAnexos);
		pagina.add_endRequest(processarVisibilidadeGridHistorico);
		pagina.add_endRequest(processarVisibilidadeFormHistoricoDeAssinaturas);
        pagina.add_endRequest(ocultarPainelComandosInferior);
		pagina.add_endRequest(redimencionarGridRequisicoes);
    }
    
    processarVisibilidadeFiltro();
    processarVisibilidadeGridItensRequisicao();
	processarVisibilidadeGridAnexos();
	processarVisibilidadeGridHistorico();
	processarVisibilidadeFormHistoricoDeAssinaturas();
    ocultarPainelComandosInferior();
	redimencionarGridRequisicoes();
});

const ocultarPainelComandosInferior = () => Benner.Page.REQUISICES.hideFooterCommandsBar();

//A barra de comandos da tec possui javascript que implementa controle de largura automático por baixo dos panos, acionando o comando "Mais" e ocultando os comandos quando os mesmos forem sobrepassar a largura do widget. Nesta tela, porém, os comandos estão sendo diminuidos manualmente após a renderização, não sendo necessário esse comportamento. Este código oculta o botão mais caso a tec tenha inserido em seu JS por falso positivo e reexibe os comandos que foram ocultados.
const desfazerBotaoMaisTec = () => {
    $("#ctl00_Main_REQUISICES_toolbar a[style*='display: none']").show()
    $("#ctl00_Main_REQUISICES_toolbar .more-menu-item").hide()  
};

const diminuirComandosTabela = () => {
    $("#ctl00_Main_REQUISICES_toolbar, #ctl00_Main_REQUISICES_footerCommands").find("> a").each((index, comando) => {
        var descricaoComando = $(comando).text();
        $(comando).html($(comando).html().replace(descricaoComando, ""));
        $(comando).find("i").css("padding-left", "8px");
        
        if (!$(comando).attr("title"))
            $(comando).attr("title", descricaoComando);
    });  
};

const ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_REQUISICES_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_REQUISICES_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltroRequisicoes').prop('checked', true);
    $('#labelOcultarFiltroRequisicoes').addClass('active');
    $('#labelExibirFiltroRequisicoes').removeClass('active');
    
    sessionStorage.setItem('TOGGLE_FILTRO_REQUISICES', "Oculto");
};

const exibirFiltro = () => {
    $('#ctl00_Main_REQUISICES_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_REQUISICES', "Visivel");
    $("#HasFilterApplied_Requisicoes").val("False");
};

const processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_REQUISICES');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_Requisicoes").val() == "True")
        ocultarFiltro();  
};

const redimencionarGridRequisicoes = () => {
	if ($("#VisibilidadeGridItensRequisicao").val() == "True" || $("#VisibilidadeGridAnexos").val() == "True" || $("#VisibilidadeGridHistorico").val() == "True" || $("#VisibilidadeFormHistoricoDeAssinaturas").val() == "True") {
		$('#REQUISICES').removeClass('col-md-12');
		$('#REQUISICES').addClass('col-md-6');
	} else {
		$('#REQUISICES').removeClass('col-md-6');
		$('#REQUISICES').addClass('col-md-12');
	}
}

const exibirGridItensRequisicao = () => {
	$("#ITENSDAREQUISIO").fadeIn();
	$("#VisibilidadeGridItensRequisicao").val("True");
	$("#VisibilidadeGridAnexos").val("False");
	$("#VisibilidadeGridHistorico").val("False");
	$("#VisibilidadeFormHistoricoDeAssinaturas").val("False");	
};

const ocultarGridItensRequisicao = () => {
	$("#ITENSDAREQUISIO").hide();
	$("#VisibilidadeGridItensRequisicao").val("False");
	redimencionarGridRequisicoes();
};

const exibirGridAnexos = () => {
	$("#ANEXOS").fadeIn();
	$("#VisibilidadeGridItensRequisicao").val("False");
	$("#VisibilidadeGridAnexos").val("True");	
	$("#VisibilidadeGridHistorico").val("False");
	$("#VisibilidadeFormHistoricoDeAssinaturas").val("False");
};

const ocultarGridAnexos = () => {
	$("#ANEXOS").hide();
	$("#VisibilidadeGridAnexos").val("False");
	redimencionarGridRequisicoes();
};

const exibirGridHistorico = () => {
	$("#HISTRICO").fadeIn();
	$("#VisibilidadeGridItensRequisicao").val("False");
	$("#VisibilidadeGridAnexos").val("False");
	$("#VisibilidadeGridHistorico").val("True");		
	$("#VisibilidadeFormHistoricoDeAssinaturas").val("False");
};

const ocultarGridHistorico = () => {
	$("#HISTRICO").hide();
	$("#VisibilidadeGridHistorico").val("False");
	redimencionarGridRequisicoes();
};

const exibirFormHistoricoDeAssinaturas = () => {
	$("#HISTRICODEASSINATURAS").fadeIn();
	$("#VisibilidadeGridItensRequisicao").val("False");
	$("#VisibilidadeGridAnexos").val("False");
	$("#VisibilidadeGridHistorico").val("False");
	$("#VisibilidadeFormHistoricoDeAssinaturas").val("True");
};

const ocultarFormHistoricoDeAssinaturas = () => {
	$("#HISTRICODEASSINATURAS").hide();
	$("#VisibilidadeFormHistoricoDeAssinaturas").val("False");
	redimencionarGridRequisicoes();
};

const processarVisibilidadeGridItensRequisicao = () => {
    if ($("#VisibilidadeGridItensRequisicao").val() == "False")
        ocultarGridItensRequisicao();
    else {
        exibirGridItensRequisicao();
		ocultarGridAnexos();
		ocultarGridHistorico();
		ocultarFormHistoricoDeAssinaturas();
	}
};

const processarVisibilidadeGridAnexos = () => {
    if ($("#VisibilidadeGridAnexos").val() == "False")
        ocultarGridAnexos();
    else {
        exibirGridAnexos();
		ocultarGridItensRequisicao();
		ocultarGridHistorico();
		ocultarFormHistoricoDeAssinaturas();
	}
};

const processarVisibilidadeGridHistorico = () => {
    if ($("#VisibilidadeGridHistorico").val() == "False")
        ocultarGridHistorico();
    else {
        exibirGridHistorico();
		ocultarGridItensRequisicao();
		ocultarGridAnexos();
		ocultarFormHistoricoDeAssinaturas();
	}
};

const processarVisibilidadeFormHistoricoDeAssinaturas = () => {
    if ($("#VisibilidadeFormHistoricoDeAssinaturas").val() == "False")
        ocultarFormHistoricoDeAssinaturas();
    else {
        exibirFormHistoricoDeAssinaturas();
		ocultarGridItensRequisicao();
		ocultarGridAnexos();
		ocultarGridHistorico();
	}
};
              </script>
        <style>
              #REQUISICES th, td {
    white-space:nowrap !important;
}

#ANEXOS th, td {
    white-space:nowrap !important;
}
              </style>
      </asp:Content>
    