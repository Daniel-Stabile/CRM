<%@ Page Title="Atendimento de requisição" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.materiais.AtendimentoDeRequisicao" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="REQUISIO" Title="Atendimento de requisições" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICOES.ATENDIMENTOREQUISICAO.GRID" DefaultFilterName="Pesquisar por" Mode="Selectable" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.STATUS IN (2, 4, 6, 9, 10, 11) AND (A.TIPO IN ('O', 'T', 'P', 'R')))" FormUrl="~/aga/a/materiais/requisicoes/detalhe-requisicao/requisicao.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_MATERIAIS_REQUISICOES_ATENDIMENTODEREQUISICAO" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISIO" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CP_REQUISICAOATENDIMENTOLOTES.INSERIR_LOTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" PageId="AGA_A_MATERIAIS_REQUISICOES_ATENDIMENTODEREQUISICAO" Level="20" Order="20"  />
        <wes:SimpleGrid runat="server" ID="LOTESRECLASSIFICACAOESTOQUE" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="REQUISIO" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="CP_REQUISICAOATENDIMENTOLOTES.RECLASSIFICACAO_ESTOQUE.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.REQUISICAO = @CAMPO(HANDLE)" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_MATERIAIS_REQUISICOES_ATENDIMENTODEREQUISICAO" Level="20" Order="30"  />
        </div>
    
        <script type="text/javascript">
              $(() => {
    $('#ctl00_Main_REQUISIO .tools').prepend('<div class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="exibirFiltro();" id="labelExibirFiltroAtendimentoRequisicoes"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" class="toggle"> Exibir filtro </label><label style="margin-left: 3px;" class="btn blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltroAtendimentoRequisicoes"><input type="radio" id="toggleOcultarFiltroAtendimentoRequisicoes" name="toggleFiltro" class="toggle"> Ocultar filtro </label></div>');

    $('#ctl00_Main_LOTES .tools, #ctl00_Main_LOTESRECLASSIFICACAOESTOQUE .tools').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarLotes" class="btn command-action custom-action btn command-action blue" style="" onclick="ocultarGridLotes()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');

    var pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack())
    {
        pagina.add_endRequest(processarVisibilidadeFiltro);
        pagina.add_endRequest(processarVisibilidadeGridLotes);
        pagina.add_endRequest(inicializarQuantidades);
    }
    
    processarVisibilidadeFiltro();
    processarVisibilidadeGridLotes();
    inicializarQuantidades();
});

const ocultarFiltro = (fadeOut) => {
    if (fadeOut)
        $('#ctl00_Main_REQUISIO_FilterControl_FilterContainer').fadeOut(500);
    else
        $('#ctl00_Main_REQUISIO_FilterControl_FilterContainer').hide();
    
    $('#toggleOcultarFiltroAtendimentoRequisicoes').prop('checked', true);
    $('#labelOcultarFiltroAtendimentoRequisicoes').addClass('active');
    $('#labelExibirFiltroAtendimentoRequisicoes').removeClass('active');
    
    sessionStorage.setItem('TOGGLE_FILTRO_REQUISIO', "Oculto");
};

const exibirFiltro = () => {
    $('#ctl00_Main_REQUISIO_FilterControl_FilterContainer').fadeIn(500);
    sessionStorage.setItem('TOGGLE_FILTRO_REQUISIO', "Visivel");
    $("#HasFilterApplied_AtendimentoRequisicoes").val("False");
};

const processarVisibilidadeFiltro = () => {
    var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_REQUISIO');
    
    if (estadoFiltro === "Oculto" || $("#HasFilterApplied_AtendimentoRequisicoes").val() == "True")
        ocultarFiltro();  
};

const processarVisibilidadeGridLotes = () => {
    if ($("#VisibilidadeGridLotes").val() == "False" && $("#VisibilidadeGridLotesReclassificacao").val() == "False")
        ocultarGridLotes();
    else
        exibirGridLotes();
};

const exibirGridLotes = () => {
    var gridAExibir = $("#VisibilidadeGridLotesReclassificacao").val() == "True" ? "#LOTESRECLASSIFICACAOESTOQUE" : "#LOTES";
    var gridAOcultar = $("#VisibilidadeGridLotesReclassificacao").val() == "True" ? "#LOTES" : "#LOTESRECLASSIFICACAOESTOQUE";
	$(gridAExibir).show();
	$(gridAOcultar).hide();
	$('#REQUISIO').removeClass('col-md-12');
	$('#REQUISIO').addClass('col-md-6');
};

const ocultarGridLotes = () => {
	$("#LOTES, #LOTESRECLASSIFICACAOESTOQUE").hide();
	$('#REQUISIO').removeClass('col-md-6');
	$('#REQUISIO').addClass('col-md-12');
	$("#VisibilidadeGridLotes").val("False");
	$("#VisibilidadeGridLotesReclassificacao").val("False");
};

const conversorDecimal = value => currency(value, { separator: '.', decimal: ',', precision: 4 });

const inicializarQuantidades = () => {
    if (!$("#JsonDadosItens").val())
        return;
            
    $("#REQUISIO tbody tr").each((index, linha) => {
        var handle = $(linha).attr("handle");
        
        if (!handle)
            return;
        
        var jsonItens = JSON.parse($("#JsonDadosItens").val());
        
        var campoQuantidade = "QTDEATENDER_" + handle;
        
        $('#' + campoQuantidade).on("blur", function() {
            var jsonItens = JSON.parse($("#JsonDadosItens").val());
            jsonItens[campoQuantidade].Quantidade = conversorDecimal($(this).val()).value;
            $("#JsonDadosItens").val(JSON.stringify(jsonItens));
        });
        
        $('#' + campoQuantidade).val(conversorDecimal(jsonItens[campoQuantidade].Quantidade).format());
        $('#' + campoQuantidade).attr("readonly", jsonItens[campoQuantidade].ReadOnly);
    });
};
              </script>
        <style>
              #LOTES th, td, #REQUISIO th, td, #LOTESRECLASSIFICACAOESTOQUE th, td {
    white-space:nowrap !important;
}

.customQuantidadeReservar {
    min-width: 160px;
}
              </style>
      </asp:Content>
    