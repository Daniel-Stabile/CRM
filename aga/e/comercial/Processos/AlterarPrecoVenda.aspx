<%@ Page Title="Alterar pre&ccedil;o produtos" Language="C#" CodeFile="~/aga/e/comercial/Processos/AlterarPrecoVenda.aspx.cs" Inherits="AlterarPrecoProdutosPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div id="Filtros">
            <wes:FilterWidget runat="server" ID="CLCULODEPREODOSPRODUTOS" Title="Alterar pre&ccedil;o dos produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_LISTAPRECOPRODUTOS.GRID" DefaultFilterName="padrao" Mode="Fixed" Level="20" Order="10" />
        </div>
        <wes:SimpleGrid OnCommandExecuted="ITENS_CommandExecuted" UserDefinedCriteriaWhereClause="@CRITERIOSELECAO" ProviderWidgetUniqueId="CLCULODEPREODOSPRODUTOS" runat="server" ID="ITENS" Title="Itens" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="AGA_CM_LISTAPRECOPRODUTOS.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" ShowExport="True" UserDefinedDisableRowSelection="True" Level="20" Order="20" />
    
    
    </div>

    <script type="text/javascript">
        //Aviso caso não selecionar lista destino
        const AvisoAlterarPrecosNaTabelaOrigem = () => {
            alert("Quando você não seleciona uma lista destino, voce está prestes a alterar os preços na tabela origem! ");
        };

        /*----------------------------------- INICIO SCRIPT PARA MAPEAR ITENS EDITÁVEIS ------------------------------*/
        const LimparJsonListaItens = () => {
            $("#JsonListaItens").val("[]");
        }
        const conversorDecimal = value => currency(value, { separator: '.', decimal: ',', precision: 4 });
        const AtualizarPrecoMaximoConsumidorJSONItens = (item) => {
            var listaItens = JSON.parse($("#JsonListaItens").val());

            var handleItem = $(item).attr('name').split('$')[1];
            var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);
            listaItens[indexItemJSON].PrecoMaximoConsumidor = conversorDecimal($(item).val()).value;

            $("#JsonListaItens").val(JSON.stringify(listaItens));
        };
        const AtualizarPrecoJSONItens = (item) => {
            var listaItens = JSON.parse($("#JsonListaItens").val());

            var handleItem = $(item).attr('name').split('$')[1];
            var indexItemJSON = listaItens.findIndex(item => item.Handle === handleItem);
            listaItens[indexItemJSON].Preco = conversorDecimal($(item).val()).value;

            $("#JsonListaItens").val(JSON.stringify(listaItens));
        };
        const MapearItensParaJSON = () => {
            //Eventos para invocar o código para mapear os itens.
            $("#ITENS input[name*='PRECOMAXCONSUMIDOR_NOVO']").blur(function () { AtualizarPrecoMaximoConsumidorJSONItens(this); });
            $("#ITENS input[name*='PRECO_NOVO']").blur(function () { AtualizarPrecoJSONItens(this); });

            //Obtem valor atual da listaItens
            var listaItens = JSON.parse($("#JsonListaItens").val());

            //Adiciona os campos editáveis ao Json listaItens
            $("#ITENS input[name*='PRECOMAXCONSUMIDOR_NOVO']").map(function () {
                var handleItem = $(this).attr('name').split('$')[1];
                var handleJaNaLista = false;
                $(listaItens).each(function (index) {
                    if (listaItens[index].Handle == handleItem) {
                        handleJaNaLista = true;
                    }
                });

                if (!handleJaNaLista)
                {
                    listaItens.push({
                        Handle: handleItem,
                        PrecoMaximoConsumidor: conversorDecimal($(this).val()).value,
                        Preco: conversorDecimal($("#ITENS input[name='PRECO_NOVO$" + handleItem + "']").val()).value
                    });
                }
            });

            //Aplica novo valor dos valores na listaItens
            $("#JsonListaItens").val(JSON.stringify(listaItens));
        };
        $(Sys.WebForms.PageRequestManager.getInstance().add_endRequest(MapearItensParaJSON));
        /*----------------------------------- FIM SCRIPT PARA MAPEAR ITENS EDITÁVEIS ------------------------------*/

        /*----------------------------------- INICIO SCRIPT PARA OCULTAR/MOSTRAR GRID------------------------------*/
        //controle de visibilidade dos filtros.
        const OcultarFiltros = () => {
            Benner.Widget.changeServerChromeState('ctl00_Main_CLCULODEPREODOSPRODUTOS');
            $("#labelExibirFiltro").removeClass("active")
            $("#labelOcultarFiltro").addClass("active")
        };
        const MostrarFiltros = () => {
            $("#Filtros").focus();
            $("#labelExibirFiltro").addClass("active")
            $("#labelOcultarFiltro").removeClass("active")
            Benner.Widget.changeServerChromeState('ctl00_Main_CLCULODEPREODOSPRODUTOS');
        };

        //Insere botoes de visibilidade do filtro no DOM
        const InserirBotoesOcultarExibirFiltro = () => {
            var portletTitle = $('#portlet_CLCULODEPREODOSPRODUTOS').children()[0];
            var portletActions = $(portletTitle).children()[2];
            var botoesJaInseridos = $(portletActions).has("#DivBotoesVisibilidadeFiltro").length > 0;

            if (!botoesJaInseridos)
                $(portletActions).append('<div id="DivBotoesVisibilidadeFiltro" style="float: right;margin-right: 15px;" class="btn-group" data-toggle="buttons"><label class="btn blue active" onclick="MostrarFiltros();" id="labelExibirFiltro"><input type="radio" id="toggleExibirFiltro" name="toggleFiltro" value="Visivel" class="toggle"> Exibir filtro </label><label style="margin-left: 3px;" class="btn blue" onclick="OcultarFiltros();" id="labelOcultarFiltro"><input type="radio" id="toggleOcultarFiltro" name="toggleFiltro" value="Oculto" class="toggle"> Ocultar filtro </label></div>');
        };
         /*----------------------------------- INICIO SCRIPT PARA OCULTAR/MOSTRAR GRID ------------------------------*/
    </script>
</asp:Content>
