<%@ Page Title="Atendimento de ordens de venda" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.a.comercial.atendimentoOrdensVenda.AtendimentoDeOrdensDeVenda" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="ATENDIMENTOORDENSDEVENDA" Title="Atendimento de ordens de venda" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CM_ORDEMVENDAENTREGAS.GRID" DefaultFilterName="Filtro" Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="None" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT A.HANDLE FROM CM_ORDEMVENDAENTREGAS A
                                  LEFT JOIN CM_ORDEMVENDAITENS F ON A.ITEM = F.HANDLE
                                  LEFT JOIN CM_ORDENSVENDA B ON B.HANDLE = F.ORDEMVENDA
                                  LEFT JOIN PD_PRODUTOS C ON C.HANDLE = F.PRODUTO
                                  WHERE (C.TIPO = 1 OR C.TIPO = 2 OR C.TIPO = 5)
                                  AND C.ATIVO = 'S'
                                  AND (
                                        (
                                            (B.ENTREGAFUTURA = 'S') 
                                            AND (F.QUANTIDADEFATURADAENTFUT &gt; 0) 
                                            AND ( (SELECT COUNT(*) FROM CM_ORDEMVENDAENTREGAS WHERE CM_ORDEMVENDAENTREGAS.ITEM = F.HANDLE) = 1)
                                        )
                                        OR (B.ENTREGAFUTURA = 'N' OR B.ENTREGAFUTURA IS NULL)
                                      ) 
                                  AND F.STATUS &lt;&gt; 7 
                                  AND B.EMPRESA = @EMPRESA 
                                  AND B.FILIAL IN  @FILIAIS 
                                  AND B.STATUS IN (2, 3))" FormUrl="~/aga/a/comercial/ordensDeVenda/InformacoesOrdemDeVenda.aspx" ShowExport="True" UserDefinedDisableRowSelection="True" PageId="AGA_A_COMERCIAL_ORDENSDEVENDA_ATENDIMENTODEORDENSDEVENDA" Level="20" Order="10"  />
        <wes:EditableGrid runat="server" ID="LOTES" Title="Lotes" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_ORDEMVENDAITEMLOTES.GRID" Mode="Search" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" PageId="AGA_A_COMERCIAL_ORDENSDEVENDA_ATENDIMENTODEORDENSDEVENDA" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              // Módulo para manipulação de filtros
const filtroModule = (() => {
    const ocultarFiltro = (fadeOut) => {
        if (fadeOut)
            $('#ctl00_Main_ATENDIMENTOORDENSDEVENDA_FilterControl_FilterContainer').fadeOut(500);
        else
            $('#ctl00_Main_ATENDIMENTOORDENSDEVENDA_FilterControl_FilterContainer').hide();
        
        $('#labelOcultarFiltroAtendimentoOrdensDeVenda').css('display', 'none');
        $('#labelExibirFiltroAtendimentoOrdensDeVenda').css('display', '');
        
        sessionStorage.setItem('TOGGLE_FILTRO_ATENDIMENTOORDENSDEVENDA', "Oculto");
    };

    const exibirFiltro = () => {
        $('#ctl00_Main_ATENDIMENTOORDENSDEVENDA_FilterControl_FilterContainer').fadeIn(500);
        $("#HasFilterApplied_AtendimentoOrdensDeVenda").val("False");
        
        $('#labelOcultarFiltroAtendimentoOrdensDeVenda').css('display', '');
        $('#labelExibirFiltroAtendimentoOrdensDeVenda').css('display', 'none');
        
        sessionStorage.setItem('TOGGLE_FILTRO_ATENDIMENTOORDENSDEVENDA', "Visivel");
    };

    const processarVisibilidadeFiltro = () => {
        const estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_ATENDIMENTOORDENSDEVENDA');
        
        if (estadoFiltro === "Oculto" || $("#HasFilterApplied_AtendimentoOrdensDeVenda").val() == "True")
            ocultarFiltro();
    };
    
    // Função para alternar entre exibir e ocultar o filtro
    function toggleFiltro() {
        const filtroVisivel = $('#ctl00_Main_ATENDIMENTOORDENSDEVENDA_FilterControl_FilterContainer').is(':visible');
        
        if (filtroVisivel) {
            filtroModule.ocultarFiltro(true);
            $('#toggleFiltroButton').text('Exibir filtro');
        } else {
            filtroModule.exibirFiltro();
            $('#toggleFiltroButton').text('Ocultar filtro');
        }
    }

    return {
        toggleFiltro,
        ocultarFiltro,
        exibirFiltro,
        processarVisibilidadeFiltro
    };
})();

// Módulo para manipulação de grid de lotes
const gridLotesModule = (() => {
    const ocultarGridLotes = () => {
        $("#LOTES").hide();
        $("#VisibilidadeGridLotes").val("False");
    };

    const exibirGridLotes = () => {
        $("#LOTES").fadeIn();
        $("#VisibilidadeGridLotes").val("True");
    };

    const processarVisibilidadeGridLotes = () => {
        if ($("#VisibilidadeGridLotes").val() == "False")
            ocultarGridLotes();
        else
            exibirGridLotes();
    };

    return {
        ocultarGridLotes,
        exibirGridLotes,
        processarVisibilidadeGridLotes
    };
})();

// Módulo para inicialização de campos
const camposModule = (() => {
    const conversorDecimal = value => currency(value, { separator: '.', decimal: ',', precision: 4 });

    const inicializarLookup = (nomeCampo, infoCampo) => {
        new Vue({
            el: '#' + nomeCampo,
            mounted: function() { 
                if (infoCampo.Handle)
                    $('#' + nomeCampo + " select").append(new Option(infoCampo.Texto, infoCampo.Handle, true, true)); 
                
                $('#' + nomeCampo + " select").attr("disabled", infoCampo.ReadOnly); 
                $('#' + nomeCampo + " select").on("change", function () {
                    const jsonItens = JSON.parse($("#JsonDadosItens").val());
                    jsonItens[nomeCampo].Handle = Number(this.value);
                    jsonItens[nomeCampo].Texto = this.options[this.selectedIndex].text;
                    $("#JsonDadosItens").val(JSON.stringify(jsonItens));
                }); 
            }
        });
    };

    const inicializarCampos = () => {
        if (!$("#JsonDadosItens").val())
            return;
                
        $("#ATENDIMENTOORDENSDEVENDA tbody tr").each((index, linha) => {
            const handle = $(linha).attr("handle");
            
            if (!handle)
                return;
            
            const jsonItens = JSON.parse($("#JsonDadosItens").val());
            
            const campoAlmoxarifado = "ALMOXARIFADO_" + handle;
            const campoQuantidade = "QUANTIDADERESERVAR_" + handle;
            
            if ($('#' + campoAlmoxarifado + ' wes-lookup').length)
                inicializarLookup(campoAlmoxarifado, jsonItens[campoAlmoxarifado]);
            
            $('#' + campoQuantidade).on("blur", function() {
                const jsonItens = JSON.parse($("#JsonDadosItens").val());
                jsonItens[campoQuantidade].Quantidade = conversorDecimal($(this).val()).value;
                $("#JsonDadosItens").val(JSON.stringify(jsonItens));
            });
            
            $('#' + campoQuantidade).val(conversorDecimal(jsonItens[campoQuantidade].Quantidade).format());
            $('#' + campoQuantidade).attr("readonly", jsonItens[campoQuantidade].ReadOnly);
        });
    };

    return {
        inicializarCampos
    };
})();

// Módulo para manipulação de DOM
const domModule = (() => {
    const botoesControle = () => {
        $('#ctl00_Main_ATENDIMENTOORDENSDEVENDA_toolbar').append('<a class="btn custom-action command-action blue active" onclick="filtroModule.toggleFiltro();" id="toggleFiltroButton"> Exibir/Ocultar filtro </a>');
        
        $('#ctl00_Main_LOTES_toolbar').prepend('<div class="btn-group" data-toggle="buttons"><a id="top-OcultarLotes" class="btn command-action custom-action btn command-action yellow-lemon" style="" onclick="gridLotesModule.ocultarGridLotes()"><i class="fa fa-arrow-left btn-action"></i> Ocultar</a></div>');
    };

    return {
        botoesControle
    };
})();

// Inicialização
$(() => {
    const pagina = Sys.WebForms.PageRequestManager.getInstance();
    
    if (!pagina.get_isInAsyncPostBack()) {
        pagina.add_endRequest(filtroModule.processarVisibilidadeFiltro);
        pagina.add_endRequest(gridLotesModule.processarVisibilidadeGridLotes);
        pagina.add_endRequest(camposModule.inicializarCampos);
        pagina.add_endRequest(domModule.botoesControle);
    }
    
    filtroModule.processarVisibilidadeFiltro();
    gridLotesModule.processarVisibilidadeGridLotes();
    camposModule.inicializarCampos();
    domModule.botoesControle();
});

              </script>
        <style>
              #ATENDIMENTOORDENSDEVENDA th, td, #LOTES th, td {
    white-space:nowrap !important;
}

#top-OcultarLotes {
    margin-right: 5px;
    float: left;
}

.customAlmoxarifado {
    min-width: 400px;
}

.customQuantidadeReservar {
    min-width: 160px;
}
              </style>
      </asp:Content>
    