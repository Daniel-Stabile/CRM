<%@ Page Language="C#" Title="Início" AutoEventWireup="true" CodeFile="Indicadores.aspx.cs" Inherits="CorporativoPortalGerencialIndicadoresPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wesControl" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wesWidget" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.WebControls" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBar.ascx" TagName="TopBar" TagPrefix="wes" %>
<%@ Register Src="~/uc/TopBarMainContent.ascx" TagName="TopBarMainContent" TagPrefix="wes" %>
<%@ Register Src="~/uc/HeadSection.ascx" TagName="HeadSection" TagPrefix="wes" %>
<%@ Register Src="~/uc/SidePanel.ascx" TagName="SidePanel" TagPrefix="wes" %>
<%@ Register Src="~/uc/WesManager.ascx" TagName="WesManager" TagPrefix="wes" %>
<%@ Register TagPrefix="wes" Namespace="Benner.Tecnologia.Wes.Components.WebApp" Assembly="Benner.Tecnologia.Wes.Components.WebApp, Version=2008.0.0.0, Culture=neutral, PublicKeyToken=f2db26731026fd37" %>

<asp:Content IdashD="Head" ContentPlaceHolderID="AposHead" runat="Server">
    <!-- <script type="text/javascript" src="<%# ResolveUrl("~/Content/js/pace/pace.min.js") %>"></script> -->
<style>
    /* Pace */
    .pace {
    -webkit-pointer-events: none;
    pointer-events: none;

    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
    }

    .pace-inactive {
    display: none;
    }

    .pace {
        position: relative;
        z-index: 9999;
        height: 0px;
    }
    .pace .pace-progress {
        background: #ff4246;
        top: 100px;
        right: 100%;
        width: 100%;
        height: 2px;
    }

    [v-cloak] {
        display: none;
    }

    .fade-enter-active {
        transition: all 0.05s ease-out;
    }

    .fade-leave-active {
        display: none;
    }

    .fade-enter,
    .fade-leave-active {
        opacity: 0;
    }

    .sidebar-toggler {
        margin-bottom: 10px;
    }

    .page-content-wrapper .page-content {
        margin-left: 175px;
        background-color: #e9ecf3;
    }

    @keyframes test {
        0% {
            height: 0px;
        }
        50% {
            height: 200px;
        }
        100% {
            height: 0px;
        }
    }

    @keyframes fade {
        0% {
            opacity: 100;
        }
        50% {
            opacity: 0;
        }
        100% {
            opacity: 95;
        }
    }

    .abar {
        height: 0px;
        width: 2px;
        background-color: #494949;
        display: inline-block;
        position: absolute;
        bottom: 0;
    }

    #testea .abar:nth-child(1) {
        animation: test 10s linear infinite, fade 13s ease-in-out infinite;
    }

    #testea .abar:nth-child(2) {
        animation: test 15s linear infinite, fade 8s ease-in-out infinite;
        margin-left: 10px;
    }

    #testea .abar:nth-child(3) {
        animation: test 17s linear infinite, fade 27s ease-in-out infinite;
        margin-left: 20px;
    }

    #testea .abar:nth-child(4) {
        animation: test 9s linear infinite, fade 30s ease-in-out infinite;
        margin-left: 30px;
    }

    #testea {
        padding-left: 10px;
        padding-right: 10px;
        position: relative;
        height: 300px;
    }

    @media (max-width: 991px) {
        .page-sidebar {
            width: 100%;
            margin: 0;
        }
        #testea {
            display: none;
        }
    }

    @media (min-width: 992px) {
        .page-sidebar {
            width: 175px;
        }
    }

    @media (max-width: 768px) {
        #container-indicadores {
            padding: 0 10px 0 10px;
        }
    }

    .opcoes-exibicao-indicador {
        margin-bottom: 10px;
    }

    .opcoes-exibicao-indicador label {
        font-size: 16px;
    }

    .container-indicadores {
        width: 100%;
        float: left;
        margin: 0;
    }

    #ctl00_SidebarMenu {
        display: none;
    }

    td,
    th {
        border: 0px !important;
    }

    .progress,
    .progressbar {
        position: relative;
    }

    .progress-goal-indicator {
        position: absolute;
        top: 0;
        border-left: thin dotted black;
        height: 100%;
    }

    .progress-percent {
        position: absolute;
        left: 50%;
        color: #3b3939;
    }

    #container-filtros {
        margin-left: -20px;
        margin-right: -20px;
        margin-top: -10px;
    }

    .portlet>.portlet-title>.caption {
        float: initial;
    }

    .container-indicador .portlet-title {
        text-align: center;
    }

    .container-indicador span.caption {
        font-size: 19px;
    }

    .tab-content {
        background-color: initial !important;
    }

    .indicador-dre-abreviado-1 table > tbody > tr > td:last-child {
        text-align: right;
    }

    .indicador-meta .progress {
        margin-bottom: 2px;
    }

    .indicador-dre-descricao {
        text-align: left;
    }

    .indicador {
        text-align: center;
    }

    .indicador-titulo {
        font-size: 24px;
        font-weight: 600;
        text-align: center;
        margin-bottom: 10px;
        color: #45B6AF;
    }
    .tabbable-line>.nav-tabs>li.active {
        border-color: #45B6AF;
    }

    .indicador-cabecalho {
        text-align: center;
        -webkit-border-radius: 10px !important;
        -moz-border-radius: 10px !important;
        border-radius: 10px !important;
        padding-bottom: 2px;
        padding-top: 2px;
        font-weight: 800;
        font-size: 15px;
        background-color: #DDD;
    }

    .indicador .table-responsive {
        padding-left: 1px;
        padding-right: 1px;
    }

    .indicador .table-responsive td,
    .indicador .table-responsive th {
        overflow: hidden;
    }

    .indicador.balanco-resumido td ,
    .indicador.fluxo-caixa td {
        white-space: nowrap;
    }

    .indicador.balanco-resumido td:first-child {
        text-align:left;
    }       
    
    .indicador.balanco-resumido tr.subitem td:first-child {
        padding-left: 25px;
    }   

    /* .indicador.balanco-resumido tr td:nth-child(1) { */
    /* width: 40%; */
    /* } */
    /* .indicador.balanco-resumido tr td:nth-child(4) { */
    /* width: 10%; */
    /* } */

    .indicador .fluxo-caixa-grafico {
        width: 100%;
        height: 300px;
    }

    td.interpretacao-delta span.badge {
        min-width: 14px;
        max-height: 14px;
        margin-bottom: 1px;
    }

    td.destacar,
    th.destacar {
        background-color: #DDD;
        width: 10%;
    }

    .balanco-resumido .coluna-valor {
        width: 20%;
    }

    .balanco-resumido table>tbody>tr.total {
        border-top: 1px solid black;
        border-bottom: 1px solid black;
        font-weight: 800;
    }

    tr.destacar {
        border-width: 2px;
        border-color:     #DDD;
        border-style: solid;
        font-weight: 800;
    }

    tr.destacar td:first-child {
        padding-left: 3px;
    }

    tr.destacar td:last-child {
        padding-right: 3px;
    }
    /* tr:not(.destacar) td {
               padding-left: 2px;
               padding-right: 2px;
               }
             */

    tr.destacar>td {
        color: black !important;
        background-color: white !important;
    }

    td.valor-negativo:not(.destacar):not(.destacar) {
        color: #d64635 !important;
    }

    .fluxo-caixa tr.saldo {
        border-top: 1px solid dimgrey;
        border-bottom: 1px solid dimgrey;
    }

    .tabela-saldos>table {
        table-layout: fixed;
        /* margin-bottom:0; */
    }

    .tabela-saldos th:first-child,
    .tabela-saldos td:first-child {
        width: 25%;
    }

    .tabela-saldos .indicador-cabecalho {
        font-weight: 600;
    }

    .tabela-saldos>table>tfoot,
    .tabela-saldos>table.totalizacao>tbody {
        font-weight: 800;
        font-size: 12px;
        border-top: 1px solid #696969;
        border-bottom: 1px solid #696969;
    }
    .tabela-saldos>table.totalizacao>thead {
        opacity: 0;
    }

    .indicador.tabela-saldos {
        text-align: left;
    }

    .envidracar {
        filter: blur(2px);
    }

    .indicador thead tr {
        font-weight: 700;
    }

    .table > tbody > tr > td {
        padding: 5px ;
    }


    .indicador.indicador-saldos-abreviado-1 table>thead>th,
    .tabela-saldos>table>thead>tr>th,
    .tabela-saldos>table>tbody>tr>td:not(:first-child),
    .tabela-saldos>table>tfoot>tr>td:not(:first-child) {
        text-align: center;
    }

    .tabela-saldos>table>tbody>tr>td:first-child {
        width: 25%
    }
    .indicador.indicador-saldos-abreviado,
    .indicador.indicador-saldos-abreviado table,
    .indicador.indicador-dre-abreviado-1,
    .indicador.indicador-dre-abreviado-1 table {
        width: 100%;
    }
    .indicador.indicador-dre-abreviado-1 table>tbody>tr>td:first-child,
    .indicador.indicador-saldos-abreviado table>tbody>tr>td:first-child {
        width: 50%;
    }

</style>

</asp:Content>

<asp:Content IdashD="ContentSideBar" ContentPlaceHolderID="PageSidebarContent" runat="server">
    <div id="pg-sidebar-wrapper">
        <div id="pg-sidebar" class="page-sidebar">
            <ul class="page-sidebar-menu">
                <li class="sidebar-toggler-wrapper">
                    <div class="sidebar-toggler"></div>
                </li>
                <seletor-indicadores selecao="geral" titulo="Visão geral" icone="fa fa-area-chart"></seletor-indicadores>
                <seletor-indicadores selecao="dre" titulo="DRE" icone="fa fa-calculator"></seletor-indicadores>
                <seletor-indicadores selecao="balanco" titulo="Balanço" icone="fa fa-leaf"></seletor-indicadores>
                <seletor-indicadores selecao="fluxo-caixa" titulo="Fluxo de caixa" icone="fa fa-money"></seletor-indicadores>
                <seletor-indicadores selecao="saldoscontas" titulo="Saldos de contas" icone="fa fa-institution"></seletor-indicadores>
            </ul>

            <!-- <div id="testea"> -->
            <!-- <div class="abar"></div> -->
            <!-- <div class="abar"></div> -->
            <!-- <div class="abar"></div> -->
            <!-- <div class="abar"></div> -->
            <!-- <div class="abar"></div> -->
            <!-- </div> -->
        </div>
    </div>
</asp:Content>

<asp:Content IdashD="Content1" ContentPlaceHolderID="Main" runat="Server">
    <!-- Página -->
    <div id="container-filtros">
        <!-- <div class="row"> -->
        <div class="portlet light" >
            <div class="portlet-body" >
                <div class="col-md-9">
                    <seletor-empresa id="seletor-empresa" :definicao="definicaoEmpresas" :filtros="filtros" legenda="Empresas/grupos"></seletor-empresa>
                </div>
                <div class="col-md-3">
                    <seletor-competencia :filtros="filtros" :data-inicial="definicaoGeral.DataInicial" :data-final="definicaoGeral.DataFinal" legenda="Competência"></seletor-competencia>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- </div> -->
    </div>

    <div id="container-indicadores" v-cloak :class="{envidracar: carregando}" style="width: 100%">
        <!-- <transition-group name="fade" mode="out-in"> -->
            <div v-show="exibir=='geral'" key="geral">
                <div class="row container-indicador">
                    <div class="col-sm-6">
                        <div class="portlet light">
                            <div class="portlet-title" >
                                <span class="sub-caption bold font-green uppercase">Metas do ano x realizado até {{filtros.toMoment().format('MMMM').toLowerCase()}}</span>
                            </div>
                            <div class="portlet-body" >
                                <div class="indicador indicador-meta">
                                    <indicador-metas :conteudo="dados.Metas" :filtros="filtros"></indicador-metas>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="portlet light container-indicador">
                                <div class="portlet-title" >
                                    <span class="sub-caption bold font-green uppercase">Resumo de saldos de contas</span>
                                </div>
                                <div class="portlet-body" >
                                    <div class="tabbable-line tabbable-tabdrop">
                                        <ul class="nav nav-tabs tabs-reversed" >
                                            <li v-for="indicador, i in definicao.IndicadoresSaldosMesesInverso" :class="{active: i == definicao.IndicadoresSaldosMesesInverso.length -1}">
                                                <a :href="'#saldo-abreviado-' + i" data-toggle="tab">{{indicador.Identificacao}}</a>
                                            </li>
                                        </ul>
                                        <div class="tab-content">
                                            <div v-for="indicador, i in definicao.IndicadoresSaldosMesesInverso" :id="'saldo-abreviado-' + i" :class="['tab-pane', {active: i == definicao.IndicadoresSaldosMesesInverso.length -1}]">
                                                <indicador-saldos-abreviado-1 :indicador="indicador.Handle" :conteudo="dados.Saldos[indicador.Handle]" :filtros="filtros">
                                                </indicador-saldos-abreviado-1>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="pull-right mais-info" ><a href="#saldoscontas" >+ info</a></div>
                                    <div class="clearfix" ></div>
                                </div>
                        </div>
                    </div>
                </div>
                <div class="row container-indicador">
                    <div style="text-align: center;" class="indicador col-sm-6">
                        <div class="portlet light">
                            <div class="portlet-title" >
                                <span class="sub-caption bold font-green uppercase">Fluxo de caixa na competência</span>
                            </div>
                            <div class="portlet-body" >
                                <indicador-fluxo-caixa-grafico style="margin-top: -20px;" id="fluxo-caixa-grafico-geral-1" :conteudo="dados.FluxoCaixa" origem-valores="ValoresCompetencia" titulo="" height="300px"></indicador-fluxo-caixa-grafico>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6" >
                        <indicador-dre-abreviado-1 :filtros="filtros" :conteudo="dadosLegado.DRE" >
                        </indicador-dre-abreviado-1>
                    </div>
                </div>
            </div>
            <div class="row container-indicador" v-show="exibir=='dre'" key="dre">
                <div class="portlet light" >
                    <div class="portlet-title" >
                        <span class="caption bold font-green uppercase">Demonstrativo de resultado</span>
                    </div>
                    <div class="portlet-body" >

                        <seletor-exibicao-indicador :opcoes="[ {legenda:'Realizado x orçado', id: 'periodo'}, {legenda: 'Comparativo anual', id: 'anual'} ]">
                            <div slot="periodo">
                                <div id="indicador-dre-atual"></div>
                            </div>
                            <div slot="anual">
                                <div id="indicador-dre-anual"></div>
                            </div>
                        </seletor-exibicao-indicador>
                    </div>
                </div>
            </div>
            <div class="row container-indicador" v-show="exibir=='balanco'" key="balanco">
                <div class="portlet light" >
                    <div class="portlet-title" >
                        <span class="caption bold font-green uppercase">Balanço resumido</span>
                    </div>
                    <div class="portlet-body" >
                        <seletor-exibicao-indicador :opcoes="[ {legenda:'Realizado x orçado', id: 'periodo'}, {legenda: 'Comparativo anual', id: 'anual'} ]">
                            <div slot="periodo">
                                <div id="indicador-balanco-periodo"></div>
                            </div>
                            <div slot="anual">
                                <div id="indicador-balanco-anual"></div>
                            </div>
                        </seletor-exibicao-indicador>
                        <div class="clearfix" ></div>
                    </div>
                </div>
            </div>
            <div class="row container-indicador" v-show="exibir=='fluxo-caixa'" key="fluxo-caixa">
                <div class="portlet light" >
                    <div class="portlet-title" >
                        <span class="caption bold font-green uppercase">Fluxo de caixa</span>
                    </div>
                    <div class="portlet-body" >
                        <seletor-exibicao-indicador :opcoes="[ {legenda:'Realizado x orçado', id: 'periodo'}, {legenda: 'Comparativo anual', id: 'anual'} ]">
                            <div slot="periodo">
                                <indicador-fluxo-caixa class="fluxo-caixa-periodo" :conteudo="dados.FluxoCaixa" :filtros="filtros" titulo="Fluxo de caixa"></indicador-fluxo-caixa>
                            </div>
                            <div slot="anual">
                                <indicador-fluxo-caixa-anual class="fluxo-caixa-anual" :conteudo="dados.FluxoCaixa" :filtros="filtros" titulo="Fluxo de caixa"></indicador-fluxo-caixa-anual>
                            </div>
                        </seletor-exibicao-indicador>
                    </div>
                    <div class="col-md-6">
                        <indicador-fluxo-caixa-grafico id="fluxo-caixa-grafico-1" :conteudo="dados.FluxoCaixa" origem-valores="ValoresCompetencia" titulo="Na competência" height="300px"></indicador-fluxo-caixa-grafico>
                    </div>
                    <div class="col-md-6">
                        <indicador-fluxo-caixa-grafico id="fluxo-caixa-grafico-2" :conteudo="dados.FluxoCaixa" origem-valores="ValoresAnoAte" titulo="No ano" height="300px"></indicador-fluxo-caixa-grafico>
                    </div>
                    <div class="clearfix" ></div>
                </div>
            </div>
            <div class="row container-indicador" v-show="exibir=='saldoscontas'" key="saldoscontas">
                <div class="portlet light" >
                    <div class="portlet-title" >
                        <span class="caption bold font-green uppercase">Saldos de contas</span>
                    </div>
                    <div class="portlet-body" >
                        <seletor-exibicao-indicador :opcoes="definicao.SeletorIndicadoresSaldosMeses">
                            <div v-for="indicador in definicao.IndicadoresSaldosMeses" :slot="indicador.Handle">
                                <indicador-tabelas-saldos-1 :indicador="indicador.Handle" :titulo="indicador.Identificacao" :conteudo="dados.Saldos[indicador.Handle]" :filtros="filtros">
                                </indicador-tabelas-saldos-1>
                            </div>
                        </seletor-exibicao-indicador>
                    </div>
                </div>
            </div>
            <!-- </transition-group> -->
    </div>

    <!-- Templates -->
    <script type="text/x-template" id="template-indicador-dre-abreviado-1">
        <div v-if="dadosDisponiveis" class="indicador indicador-dre-abreviado-1">
            <div class="portlet light" >
                <div class="portlet-title" >
                    <span class="sub-caption bold font-green uppercase">DRE últimos 12 meses</span>
                </div>
                <div class="portlet-body" >
                    <table>
                        <tbody>
                            <tr v-for="registro in registros" class="tabela-saldos table-responsive">
                                <td>{{registro.NomeConta}}</td>
                                <celulaValor :valor="registro.Valores12meses.ValorRealizado"></celulaValor>
                            </tr>
                        </tbody>
                    </table>
                    <div class="pull-right mais-info" ><a href="#dre" >+ info</a></div>
                    <div class="clearfix" ></div>
                </div>
            </div>
        </div>
        <div v-else>
            Dados indisponíveis
        </div>
    </script>
    <script type="text/x-template" id="template-indicador-saldos-abreviado-1">
        <div v-if="dadosDisponiveis" class="indicador indicador-saldos-abreviado-1">
            <table style="width: 100%">
                <thead>
                    <th>&nbsp;</th>
                    <th>{{filtros.toMoment().format('MM/YYYY')}}</th>
                    <th>{{filtros.toMoment().subtract(1, 'year').format('MM/YYYY')}}</th>
                </thead>
                <tbody>
                    <tr v-for="conta in conteudo.dados.Contas" class="tabela-saldos table-responsive">
                        <td> {{conta.Nome}} </td>
                        <celulaValor :valor="contaValoresRealizado(conta, competenciasAnoAtual)"></celulaValor>
                        <celulaValor :valor="contaValoresRealizado(conta, competenciasAnoAnterior)"></celulaValor>
                    </tr>
                </tbody>
            </table>
        </div>
    </script>
    <script type="text/x-template" id="template-indicador-tabela-saldos">
        <span>
            <div v-if="dadosDisponiveis" class="indicador tabela-saldos">
            <div v-for="conta in conteudo.dados.Contas" class="tabela-saldos table-responsive">
                <div class="indicador-cabecalho" >{{conta.Nome}}</div>
                <table class="table table-condensed">
                    <thead>
                        <tr>
                            <th>Descrição</th>
                            <th v-if="competenciasEsquerda.length > 0" :colspan="competenciasEsquerda.length">Último{{competenciasEsquerda.length > 1 ? 's ' + competenciasEsquerda.length + ' mêses' : ' mês'}}</th>
                            <th class="destacar" colspan="2">Mês</th>
                            <th class="destacar" colspan="2">Ano</th>
                            <th colspan="2">Ano anterior</th>
                        </tr>
                        <tr>
                            <th>&nbsp;</th>
                            <th v-for="competencia in competenciasEsquerda">{{competencia.Descricao}}</th>
                            <th class="destacar">Real</th><th class="destacar">Orçado</th><th class="destacar">Real</th><th class="destacar">Orçado</th>
                            <th>Mês</th><th>Ano</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr><td>{{conta.Nome}}</td>
                            <celulaValor
                                v-for="competencia in competenciasEsquerda"
                                :valor="valoresOuZero(conta, competencia.Indice).ValorRealizado">
                            </celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresRealizado(conta, competenciaAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresOrcado(conta, competenciaAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresRealizado(conta, competenciasAnoAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresOrcado(conta, competenciasAnoAtual)"></celulaValor>
                            <celulaValor :valor="contaValoresRealizado(conta, competenciasAnoAnterior)"></celulaValor>
                            <celulaValor :valor="contaValoresOrcado(conta, competenciasAnoAnterior)"></celulaValor>
                        </tr>
        <!-- <tr><td :colspan="competenciasEsquerda.length+1"></td><td class="destacar" colspan="4">&nbsp;</td><td colspan="2" ></td></tr> -->
                    </tfoot>
                    <tbody>
                        <tr v-for="subconta in conta.Subitens"><td>{{subconta.Nome}}</td>
                            <celulaValor
                                v-for="competencia in competenciasEsquerda"
                                :valor="valoresOuZero(subconta, competencia.Indice).ValorRealizado">
                            </celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresRealizado(subconta, competenciaAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresOrcado(subconta, competenciaAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresRealizado(subconta, competenciasAnoAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contaValoresOrcado(subconta, competenciasAnoAtual)"></celulaValor>
                            <celulaValor :valor="contaValoresRealizado(subconta, competenciaAtualAnoAnterior)"></celulaValor>
                            <celulaValor :valor="contaValoresRealizado(subconta, competenciasAnoAnterior)"></celulaValor>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="tabela-saldos table-responsive">
                <table class="table table-condensed totalizacao">
                    <thead><tr>
                        <th></th>
                        <th :colspan="competenciasEsquerda.length"></th>
                        <th colspan="2" class="destacar"></th>
                        <th colspan="2" class="destacar"></th>
                        <th colspan="2"></th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Total {{titulo}}</td>
                                <celulaValor
                                    v-for="competencia in competenciasEsquerda"
                                    :valor="contasSomaRealizado(conteudo.dados.Contas, [competencia])">
                            </celulaValor>
                            <celulaValor class="destacar" :valor="contasSomaRealizado(conteudo.dados.Contas, competenciaAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contasSomaOrcado(conteudo.dados.Contas, competenciaAtual, true)"></celulaValor>
                            <celulaValor class="destacar" :valor="contasSomaRealizado(conteudo.dados.Contas, competenciasAnoAtual)"></celulaValor>
                            <celulaValor class="destacar" :valor="contasSomaOrcado(conteudo.dados.Contas, competenciasAnoAtual)"></celulaValor>
                            <celulaValor :valor="contasSomaRealizado(conteudo.dados.Contas, competenciasAnoAnterior)"></celulaValor>
                            <celulaValor :valor="contasSomaOrcado(conteudo.dados.Contas, competenciasAnoAnterior)"></celulaValor>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div></span>
    </script>
    <script type="text/x-template" id="template-indicador-tabela-contas">
        <div v-if="dadosDisponiveis" class="indicador indicador-tabela-contas">
          <div class="indicador-cabecalho">&nbsp;</div>
          <div class="table-responsive"> 
            <table class="table table-hover table-condensed">
              <thead><tr><coluna v-for="coluna in $options.colunas" :coluna="coluna" ></coluna></tr></thead>
              <tbody>
                <conta v-for="conta, i in conteudo.dados.Contas" :key="i" :eh-saldo="i == 0 || i == (conteudo.dados.Contas.length-1)" :conta="conta"></conta>
              </tbody>
            </table>
          </div>
        </div>
    </script>

    <!-- Script -->
    <script>
        var definicaoGeral = <%= DefinicaoGeral %>;
        var definicaoIndicadores = <%= DefinicaoIndicadores %>;
        var definicaoEmpresas = <%= DefinicaoEmpresas %>;

        /* Pace.options.elements = false;*/
        /* Pace.options.eventLag = false;*/
        /* Pace.options.ajax.trackWebSockets = false;*/
    </script>

    <script src="<%= ResolveUrl("~/PortalGerencial/indicadores.js") %>"></script>
</asp:Content>
