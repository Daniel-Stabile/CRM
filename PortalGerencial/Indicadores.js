var DadosIndicador = function () {
    return {
        disponivel: false,
        carregando: false,
        comErros: false,
        dados: Object
    };
};
var IndicadoresPG = IndicadoresPG || {
    filtros: {
        // valores padrão
        empresa: (definicaoEmpresas.Grupos.length > 0) ? ('G' + definicaoEmpresas.Grupos[0].Codigo) : ('E' + definicaoEmpresas.Empresas[0].Codigo),
        ano: moment(definicaoGeral.DataFinal).year(),
        mes: moment(definicaoGeral.DataFinal).month() + 1,
        toMoment: function () {
            return moment([IndicadoresPG.filtros.ano, IndicadoresPG.filtros.mes - 1]);
        }
    },
    visualizacao: {
        indicadorAtual: window.location.hash.substr(1) || 'geral'
    },
    dados: {
        Saldos: function () {
            var r = {};
            _.each(definicaoIndicadores.IndicadoresSaldosMeses, function (x) {
                r[x.Handle] = new DadosIndicador();
            });
            return r;
        }(),
        Metas: new DadosIndicador(),
        FluxoCaixa: new DadosIndicador()
    },
    mixins: {
        PorFiltros: {
            props: ['filtros'],
            watch: {
                // observar os filtros
                filtros: {
                    // atualizar os dados se o filtro mudou
                    handler: function (a, b) {
                        this.obterDados();
                    },
                    // o que muda são propriedades internas, não o objeto de filtro em si
                    deep: true
                }
            }
        },
        Base: {
            props: ['conteudo'],
            methods: {
                obterDados: function () {
                    if (_.isUndefined(this.$options.endpoint))
                        return;
                    var component = this;
                    this.conteudo.carregando = true;
                    IndicadoresPG.carregarDadosComFiltros(this.$options.endpoint, function (dados) {
                        if (_.isNull(dados)) {
                            component.conteudoCarregado = false;
                            return;
                        }
                        component.conteudo.dados = dados;
                        component.conteudo.disponivel = true;
                        component.conteudo.carregando = false;
                    }, this.parametrosAdicionaisXHR || {});
                }
            },
            computed: {
                dadosDisponiveis: function () {
                    if (_.isNull(this.conteudo) || _.isUndefined(this.conteudo))
                        return false;
                    return this.conteudo.disponivel || false;
                }
            },
            created: function () {
                this.parametrosAdicionaisXHR = {};
                // atribuir aos parâmetros adicionais as propriedades recebidas que os compõe
                var vm = this;
                _.each(this.$options.propriedadesParametrosXHR, function (x) {
                    vm.parametrosAdicionaisXHR[x] = vm[x];
                });
                this.obterDados();
            }
        },
        DadosCompartilhados: {
            methods: {
                obterDados: function () {
                    // nada a fazer pois os dados são carregados em outro componente
                }
            }
        }
    },
    obterURLServico: function (alvo) {
        var base = window.location.href.replace('?', '');
        return base + '/' + alvo;
    },
    carregarDadosComFiltros: function (alvo, definicao, argumentos) {
        var filtro = IndicadoresPG.filtros;
        var url = Erp.URLServico('pg/indicador/' + alvo) + '?';

        argumentos = _.extend(new Object(), argumentos);
        if (filtro.empresa.length > 0) {
            if (filtro.empresa[0] == 'E')
                argumentos['cnpj'] = filtro.empresa.slice(1);
            else
                argumentos['grupoEmpresas'] = filtro.empresa.slice(1);
        }
        argumentos['ano'] = filtro.ano;
        argumentos['mes'] = filtro.mes;

        for (var i in argumentos) {
            url += '&' + i + '=' + argumentos[i];
        }

        // return Pace.track(function() {
        return $.ajax({
            url: url,
            json: true,
            converters: {
                "text json": function (j) {
                    return JSON.parse(j, function (k, v) {
                        if (k == 'Data')
                            return Erp.dateFromdotNETJSON(v);
                        return v;
                    });
                }
            }
        }).done(function (d) {
            definicao(d);
        }).fail(function (e) {
            Erp.notificacoes.erroASPNET(e);
            definicao(null);
        });
        // });
    },
    formatarValor: function (valor) {
        valor = parseFloat(valor);
        if (valor == 0)
            return '-';
        var ehValorNegativo = valor < 0;
        valor = Math.round(Math.abs(valor) / 1000);
        var textoBase = valor.toString();
        var texto = '';
        for (i = textoBase.length - 1; i >= 0; i--) {
            texto = textoBase[i] + texto;
            if (i > 0 && (textoBase.length - i) % 3 == 0 && i < textoBase.length)
                texto = '.' + texto;
        }
        if (ehValorNegativo)
            texto = '(' + texto + ')';
        return texto;
    },
    lidarComErroCargaDados: function (painel, dados) {
        if (_.isNull(dados)) {
            var el = $('<div/>').append('O painel não está sendo exibido devido a um erro na carga dos dados');
            painel.html(el.prop('outerHTML'));
            return true;
        }
        return false;
    },
    adicionarCelula: function (linha, conteudo, classe) {
        var celula = linha.insertCell();
        if (classe !== undefined && classe != '') {
            var classes = classe.split(' ');
            for (var i in classes) {
                if (classes[i] != '')
                    celula.classList.add(classes[i]);
            }
        }
        celula.innerHTML = conteudo;
        return celula;
    },
    adicionarCelulaPercentual: function (linha, valor, classe) {
        if (valor > 0)
            return IndicadoresPG.adicionarCelula(linha, valor + '%', classe);
        return IndicadoresPG.adicionarCelula(linha, '-', classe);
    },
    adicionarCelulaValor: function (linha, valor, classe) {
        var texto = IndicadoresPG.formatarValor(valor);
        var ehValorNegativo = valor < 0;
        if (ehValorNegativo)
            texto = texto;
        var celula = IndicadoresPG.adicionarCelula(
            linha, texto, (classe || '') + (ehValorNegativo ? ' valor-negativo' : ''));
    },
    calcularDeltaPadrao: function (natureza, valor1, valor2) {
        var delta = Math.round(100 - (valor1 / valor2) * 100, 2);
        if (delta < 100)
            delta *= -1;
        if (valor1 == 0 || valor2 == 0)
            return null;
        // if (Math.abs(delta) >= 1000)
        //     return null;
        return delta;
    },
    calcularDelta: function (configuracaoDelta, valor1, valor2) {
        if (valor1 == 0 || valor2 == 0)
            return 1;
        var delta = IndicadoresPG.calcularDeltaPadrao(
            'C',
            valor1,
            valor2);
        var interp = IndicadoresPG.interpretarDeltaConfigurado(configuracaoDelta, delta);
        return {
            delta: delta,
            interpretacao: interp
        };
    },
    adicionarCelulaDelta: function (linha, valor) {
        if (_.isNull(valor) || _.isNaN(valor))
            IndicadoresPG.adicionarCelula(linha, '');
        else
            IndicadoresPG.adicionarCelula(linha, valor + '%');
    },
    mesParaAbrev: function (mes) {
        switch (mes) {
            case 1:
                return 'jan';
            case 2:
                return 'fev';
            case 3:
                return 'mar';
            case 4:
                return 'abr';
            case 5:
                return 'mai';
            case 6:
                return 'jun';
            case 7:
                return 'jul';
            case 8:
                return 'ago';
            case 9:
                return 'set';
            case 10:
                return 'out';
            case 11:
                return 'nov';
            case 12:
                return 'dez';
        }
        return null;
    },
    obterDadosCompartilhados: function () {
        if (!_.isUndefined(this.dadosCompartilhados) && !_.isUndefined(this.dadosCompartilhados.dados))
            return this.dadosCompartilhados.dados;
        return this.dados;
    },
    criarGraficoColunasFlutuantes: function (configuracao, configuracaoGrafico) {
        configuracao = $.extend({
            dados: '',
            titulo: ''
        }, configuracao);

        return AmCharts.makeChart(configuracao.destino, $.extend({
            "type": "serial",
            "categoryField": "conta",
            "startDuration": 1,
            "theme": "default",
            "categoryAxis": {
                "gridPosition": "start",
                "gridThickness": 0,
                "autoWrap": "true",
            },
            "trendLines": [],
            "graphs": [{
                "balloonText": "Valor: [[valor]]",
                "closeField": "final",
                "negativeFillColors": "#FFC861",
                "fillColors": "#45B6AF",
                "lineColor": "#444444",
                "lineAlpha": 0,
                "fillAlphas": 1,
                "id": "AmGraph-1",
                "openField": "inicial",
                "title": "graph 1",
                "type": "column",
                "balloonFunction": function (item) {
                    if (item.dataContext.ehSaldo)
                        return IndicadoresPG.formatarValor(item.dataContext.valor);
                    else
                        return IndicadoresPG.formatarValor(item.dataContext.valor) +
                            ' (total ' + IndicadoresPG.formatarValor(item.dataContext.final) + ')';
                }
            }],
            "guides": [],
            "valueAxes": [{
                "id": "ValueAxis-1",
                "stackType": "regular",
                "title": "",
                "labelFunction": function (value) {
                    return IndicadoresPG.formatarValor(value);
                }
            }],
            "allLabels": [],
            "balloon": {},
            "titles": [{
                "id": "Title-1",
                "size": 15,
                "text": configuracao.titulo
            }],
            "dataProvider": configuracao.dados
        }, configuracaoGrafico));
    },
    adicionarCelulaInterpretacao: function (linha, conteudo, classe) {
        var span = $('<span/>', {
            text: ' '
        });
        if (conteudo == 1)
            span.addClass('badge badge-success');
        else if (conteudo == 2)
            span.addClass('badge badge-warning');
        else if (conteudo == 3)
            span.addClass('badge badge-danger');

        classe = (classe || '') + ' interpretacao-delta';
        return IndicadoresPG.adicionarCelula(linha, span.prop('outerHTML'), classe);
    },
    interpretarDeltaConfigurado: function (configuracao, delta) {
        if (configuracao == null || delta == 0)
            return 0;
        if (delta < configuracao.FaixaDe)
            return configuracao.AMenor;
        if (delta > configuracao.FaixaAte)
            return configuracao.AMaior;
        return configuracao.NaFaixa;
    },
    interpretarDelta: function (natureza, delta) {
        if (delta == 0)
            return 0;
        if (delta < 0)
            return (natureza == 'D' ? 1 : 3);
        if (delta <= 2)
            return (natureza == 'D' ? 1 : 2);
        return (natureza == 'D' ? 3 : 1);
    },
    obterClasseInterpretacaoDelta: function (valor) {
        if (valor == 1)
            return 'interpretacao-delta badge badge-success';
        else if (valor == 2)
            return 'interpretacao-delta badge badge-warning';
        else if (valor == 3)
            return 'interpretacao-delta badge badge-danger';
        return '';
    },
    processarDefinicoes: function () {
        definicaoIndicadores.SeletorIndicadoresSaldosMeses = [];
        definicaoIndicadores.IndicadoresSaldosMeses.forEach(function (indicador) {
            definicaoIndicadores.SeletorIndicadoresSaldosMeses.push({
                legenda: indicador.Identificacao,
                id: indicador.Handle
            });
        });
        definicaoIndicadores.IndicadoresSaldosMesesInverso = definicaoIndicadores.IndicadoresSaldosMeses.slice(0).reverse();
    }
};

IndicadoresPG.processarDefinicoes();

var filtroValor = Vue.filter('valor', function (valor) {
    var v = IndicadoresPG.formatarValor(valor);
    return v;
});

Vue.filter('delta', function (valor) {
    if (valor == null || isNaN(valor))
        return '';
    return valor + '%';
});

// Vue.component('wrapper', {
//     // functional: true,
//     render: function(create) {
//         return create('div', this.data, this.$slots);
//     }
// });
// a wrapper for <transition-group> with already set up events
// 'enter' and 'leave' happen at the same time, causing
// flicker and repositioning, so we wrap the enter process to hide the entering element
// this combined with transition-delay on enter provides a workaround for the flicker and repositioning
// Vue.component('fade-transition-group', {
//     functional: true,
//     render: function(create, context) {
//         // <div class="transition-container"> -> position: relative
//         //   <transition-group> ...
//         //     <div content1 .. when fading in, position absolute, top 0 left 0
//         //                      until starting to show, depending on -enter- delay
//         if (navigator.userAgent.indexOf("MSIE") > -1 || navigator.userAgent.indexOf("Trident/") > -1)
//             return create('div', [context.children]);

//         return create(
//             'div',
//             { class: 'transition-container' },
//             [create(
//                 Vue.options.components.TransitionGroup,
//                 _.extend(context.data, {
//                     on: {
//                         beforeEnter: function(el) {
//                             // $(el).addClass('fade-enter-hide');
//                             // $(el).addClass('fade-enter-hide');
//                             console.log('beforeEnter');
//                             console.log(el);
//                         },
//                         afterLeave: function(el) {
//                             console.log('afterLeave');
//                             // $(el.parentElement).find('.fade-enter-hide').removeClass('fade-enter-hide');
//                         }
//                     }
//                 }),
//                 context.children
//             )]
//         );
//     }
// });

Vue.component('celulaValor', {
    functional: true,
    props: ['valor'],
    render: function (create, context) {
        return create(
            'td', _.extend(context.data, {
                class: { 'valor-negativo': context.props.valor < 0 }
            }),
            IndicadoresPG.formatarValor(context.props.valor)
        );
    }
});

Vue.component('seletor-empresa', {
    props: ['definicao', 'filtros', 'legenda'],
    template:
        '<div class="">' +
        '  <label class="control-label">{{legenda}}</label>' +
        '    <select class="bs-select" style="width: 100%">' +
        '      <optgroup label="Grupos de empresas" v-if="definicao.Grupos.length > 0">' +
        '        <option v-for="grupo in definicao.Grupos" :value="\'G\'+grupo.Codigo">{{grupo.Nome}}</option>' +
        '      </optgroup>' +
        '      <optgroup label="Empresas">' +
        '        <option v-for="empresa in definicao.Empresas" :value="\'E\'+empresa.Codigo">{{empresa.Nome}}</option>' +
        '      </optgroup>' +
        '    </select>' +
        '</div>',
    mounted: function () {
        var vm = this;
        $(this.$el).find('select')
            .select2({
                containerCssClass: 'form-control'
            });
        //.on('change', function() {
        //    vm.filtros.empresa = this.value;
        //    indicadoresPG.recarregarIndicadores();
        //});
        $(document).ready(function () {
            $('#seletor-empresa > select').select2({ ajax: null })
            .on('change', function () {
                vm.filtros.empresa = this.value;
                indicadoresPG.recarregarIndicadores();
            })
            .unbind('select2:select');
        })
    }
});

Vue.component('seletor-competencia', {
    props: ['filtros', 'legenda', 'dataInicial', 'dataFinal'],
    template:
        '<div>' +
        '  <label class="control-label">{{legenda}}</label>' +
        '  <div class="form-group input-group date">' +
        '    <input type="text" class="form-control" readonly>' +
        '    <span class="input-group-btn">' +
        '      <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>' +
        '    </span>' +
        '  </div>' +
        '</div>',
    mounted: function () {
        var vm = this;
        var opcoes = {
            viewMode: 'months',
            minViewMode: 'months',
            format: 'mm/yyyy',
            autoclose: true
        };

        if (!_.isUndefined(this.dataInicial))
            opcoes.startDate = moment(this.dataInicial).toDate();
        if (!_.isUndefined(this.dataFinal)) {
            opcoes.endDate = moment(this.dataFinal).endOf('month').toDate();
        } else {
        }

        vm.picker = $(vm.$el)
            .find('.date')
            .datepicker(opcoes);

        $(vm.picker).datepicker(
            'update',
            moment.min(moment(), moment(vm.dataFinal))
                .format('MM/YYYY'));

        vm.picker.on('changeDate', function (e) {
            var date = moment(e.date);
            vm.filtros.ano = date.year();
            vm.filtros.mes = date.month() + 1;
            indicadoresPG.recarregarIndicadores();
        });
    }
});

var baseIndicadorFluxoCaixa = {
    mixins: [IndicadoresPG.mixins.Base],
    endpoint: 'fluxocaixa',
    props: ['titulo'],
    description: 'Fluxo de caixa',
    template:
        '<div v-if="dadosDisponiveis" class="indicador fluxo-caixa">' +
        '  <div class="indicador-cabecalho">&nbsp;</div>' +
        '  <div class="table-responsive"> ' +
        '    <table class="table table-hover table-condensed">' +
        '      <thead><tr><coluna v-for="coluna in $options.colunas" :coluna="coluna" ></coluna></tr></thead>' +
        '      <tbody>' +
        '        <conta v-for="conta, i in conteudo.dados.Contas" :key="i" :eh-saldo="i == 0 || i == (conteudo.dados.Contas.length-1)" :conta="conta"></conta>' +
        '      </tbody>' +
        '    </table>' +
        '  </div>' +
        '</div>',
    methods: {
        destacar: function (coluna) {
            return this.$options.colunasDestacar.includes(coluna);
        },
        valoresEsquerda: function (conta) {
            return null;
        },
        valoresDireita: function (conta) {
            return null;
        }
    },
    components: {
        'conta': {
            props: ['conta', 'ehSaldo'],
            template: '<tr :class="{saldo: ehSaldo}"><td>{{conta.Nome}}</td>' +
                '<celulaValor class="destacar" :valor="valores[0]"></celulaValor>' +
                '<celulaValor :valor="valores[1]"></celulaValor>' +
                '<td>{{delta.esquerda.delta | delta}}</td>' +
                '<td v-if="$parent.$options.interpretarDelta" class="interpretacao-delta">' +
                '  <span :class="interp(delta.esquerda.interpretacao)">&nbsp;</span>' +
                '</td>' +
                '<td></td>' +
                '<td>{{conta.Nome}}</td>' +
                '<celulaValor class="destacar" :valor="valores[2]"></celulaValor>' +
                '<celulaValor :valor="valores[3]"></celulaValor>' +
                '<td>{{delta.direita.delta | delta}}</td>' +
                '<td v-if="$parent.$options.interpretarDelta" class="interpretacao-delta">' +
                '  <span :class="interp(delta.direita.interpretacao)">&nbsp;</span>' +
                '</td>' +
                '</tr>',
            computed: {
                valores: function () {
                    return this.$parent.extrairValoresConta(this.conta);
                },
                delta: function () {
                    return {
                        esquerda: IndicadoresPG.calcularDelta(this.conta.ConfiguracaoDelta, this.valores[0], this.valores[1]),
                        direita: IndicadoresPG.calcularDelta(this.conta.ConfiguracaoDelta, this.valores[2], this.valores[3])
                    };
                }
            },
            methods: {
                interp: function (valor) {
                    return IndicadoresPG.obterClasseInterpretacaoDelta(valor);
                }
            }
        },
        coluna: {
            functional: true,
            render: function (create, context) {
                var coluna = context.data.attrs.coluna;
                if (_.isArray(coluna))
                    return create(
                        'td', {
                            class: coluna[1] || '',
                            domProps: {
                                innerHTML: coluna[0]
                            }
                        }, '');

                return create('td', { domProps: { innerHTML: coluna } });
            }
        }
    }
};

Vue.component('indicador-fluxo-caixa', {
    extends: baseIndicadorFluxoCaixa,
    mixins: [IndicadoresPG.mixins.PorFiltros],
    interpretarDelta: true,
    colunas: ['', ['Realizado competência', 'destacar'], 'Orçado competência', '&Delta; %', '', '', '', ['Realizado ano', 'destacar'], 'Orçado ano', '&Delta; %', ''],
    methods: {
        extrairValoresConta: function (conta) {
            return [
                conta.ValoresCompetencia.ValorRealizado,
                conta.ValoresCompetencia.ValorMeta,
                conta.ValoresAnoAte.ValorRealizado,
                conta.ValoresAnoAte.ValorMeta
            ];
        }
    }
});

Vue.component('indicador-fluxo-caixa-anual', {
    extends: baseIndicadorFluxoCaixa,
    mixins: [IndicadoresPG.mixins.DadosCompartilhados],
    interpretarDelta: true,
    colunas: ['', ['Realizado competência', 'destacar'], 'No ano anterior', '&Delta; %', '', '', '', ['Acumulado ano atual', 'destacar'], 'Do ano anterior', '&Delta; %', ''],
    methods: {
        extrairValoresConta: function (conta) {
            return [
                conta.ValoresCompetencia.ValorRealizado,
                conta.ValoresCompetenciaAnoAnterior.ValorRealizado,
                conta.ValoresAnoAte.ValorRealizado,
                conta.ValoresAnoAnteriorAte.ValorRealizado
            ];
        }
    }
});

Vue.component('indicador-fluxo-caixa-grafico', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.DadosCompartilhados],
    props: ['height', 'origemValores', 'titulo'],
    template:
        '<div v-if="dadosDisponiveis">' +
        '  <grafico-fluxo-caixa :titulo="titulo" :height="height" :valores="valores"></grafico-fluxo-caixa>' +
        '</div>',
    methods: {
        ajustarValoresPorSaldo: function (valores, saldo) {
            if (!valores.ehSaldo) {
                var delta = saldo.final - valores.inicial;
                valores.inicial += delta;
                valores.final += delta;
            }
            return valores;
        }
    },
    computed: {
        valores: function () {
            var resultado = [];
            var saldoAtual = null;
            var contas = this.conteudo.dados.Contas;
            for (var i in contas) {
                var conta = contas[i];
                var valor = conta[this.origemValores].ValorRealizado;
                var valores = {
                    conta: conta.Nome,
                    inicial: 0,
                    final: valor,
                    valor: valor
                };
                if (i == 0 || i == (contas.length - 1))
                    valores.ehSaldo = true;
                valores = this.ajustarValoresPorSaldo(valores, saldoAtual);
                resultado.push(valores);
                saldoAtual = valores;
            }
            return resultado;
        }
    },
    components: {
        'grafico-fluxo-caixa': {
            props: ['valores', 'height', 'titulo'],
            template: '<div :id="idGrafico" :style="{height: height}"></div>',
            methods: {
                atualizarGrafico: function () {
                    if (_.isUndefined(this.grafico)) {
                        var configuracao = {
                            dados: this.valores,
                            destino: this.idGrafico,
                            titulo: this.titulo
                        };
                        IndicadoresPG.criarGraficoColunasFlutuantes(configuracao, {
                            categoryAxis: {
                                labelRotation: 45
                            }
                        });
                    } else {
                        this.grafico.dataProvider = valores;
                        this.grafico.validateData();
                    }
                }
            },
            mounted: function () { this.atualizarGrafico(); },
            watch: {
                valores: {
                    handler: function () { this.atualizarGrafico(); }, deep: true
                }
            },
            computed: {
                idGrafico: function () { return 'grafico-' + this._uid; }
            }
        }
    }
});

Vue.component('indicador-metas', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.PorFiltros],
    endpoint: 'metas',
    template: '<div v-if="dadosDisponiveis">' +
        '    <div v-for="meta in metas">' +
        '        <div>' +
        '            &nbsp;' +
        '            <span class="pull-left">{{meta.nome}}</span>' +
        '            <span class="pull-right">Meta: {{meta.valor | valor}}</span>' +
        '            <div style="position: relative"> ' +
        '                <div v-html="meta.barraProgresso"></div>' +
        '                <div class="progress-goal-indicator" :style="meta.estiloIndicador" title="Meta esperada até o momento"></div>' +
        '            </div>' +
        '        </div>' +
        '    </div>' +
        '</div>',
    computed: {
        metas: function () {
            var cores = ['#45B6AF', '#8775A7', '#DCA359'];
            var resultado = [];
            for (var i in this.conteudo.dados) {
                var meta = this.conteudo.dados[i];
                var metaCalculada = {
                    nome: meta.ContaNome,
                    cor: cores[i % cores.length],
                    percentualBarra: meta.ValoresAno.ValorMeta > 0 ?
                        Math.round((meta.ValoresPeriodo.ValorRealizado / meta.ValoresAno.ValorMeta) * 100) :
                        null,
                    percentualIndicador: meta.ValoresAno.ValorMeta > 0 ?
                        Math.round((meta.ValoresPeriodo.ValorMeta / meta.ValoresAno.ValorMeta) * 100) :
                        null,
                    valor: meta.ValoresAno.ValorMeta
                };
                metaCalculada.estiloIndicador = {
                    left: (metaCalculada.percentualIndicador >= 100) ? 'calc(100% - 1px)' : metaCalculada.percentualIndicador + '%'
                };
                var textoPercentual = metaCalculada.percentualBarra != null ? metaCalculada.percentualBarra + '%' : 'N/D';
                metaCalculada.barraProgresso = $('<div/>').append(
                    Erp.criarBarraProgresso(metaCalculada.percentualBarra, {
                        conteudo: '<div class="progress-percent">' + textoPercentual + '</div>',
                            listrada: true,
                            cor: metaCalculada.cor
                        })).html();
                resultado.push(metaCalculada);
            }
            return resultado;
        }
    }
});

var mixinIndicadoresSaldos = {
    props: {
        indicador: null, titulo: null,
        competencias: { default: function () { return 5; } }
    },
    methods: {
        valoresOuZero: function (conta, i) {
            return conta.Valores[i] || { ValorMeta: 0, ValorRealizado: 0 };
        },
        contaValores: function (conta, competencias, obterValor) {
            var valor = 0;
            for (var c in competencias) {
                var valorCompetencia = conta.Valores[competencias[c].Indice];
                if (_.isUndefined(valorCompetencia))
                    continue;
                valor += obterValor(valorCompetencia);
            }
            return valor;
        },
        contaValoresOrcado: function (conta, competencias) {
            return this.contaValores(conta, competencias, function (x) {
                return x.ValorOrcado;
            });
        },
        contaValoresRealizado: function (conta, competencias) {
            return this.contaValores(conta, competencias, function (x) {
                return x.ValorRealizado;
            });
        },
        contasSomaOrcado: function (contas, competencias, d) {
            return this.contasSoma(contas, competencias, function (x) {
                return x.ValorOrcado;
            });
        },
        contasSomaRealizado: function (contas, competencias) {
            return this.contasSoma(contas, competencias, function (x) {
                return x.ValorRealizado;
            });
        },
        contasSoma: function (contas, competencias, obterValor) {
            var valor = 0;
            for (c1 in contas) {
                for (var c2 in competencias) {
                    var valores = contas[c1].Valores[competencias[c2].Indice];
                    if (_.isUndefined(valores))
                        continue;
                    valor += obterValor(valores);
                }
            }
            return valor;
        }
    },
    computed: {
        indiceCompetenciaAtual: function () {
            return this.conteudo.dados.Competencias.length - 1;
        },
        competenciasEsquerda: function () {
            // ano == filtro e mes < filtro
            var competencias = this.conteudo.dados.Competencias.filter(function (competencia) {
                return competencia.Data.year() == IndicadoresPG.filtros.ano &&
                    competencia.Data.month() < (IndicadoresPG.filtros.mes - 1);
            });
            var max = this.parametrosAdicionaisXHR.competencias;
            if (competencias.length > max)
                return competencias.slice(competencias.length - max);
            return competencias;
        },
        competenciaAtualAnoAnterior: function () {
            return this.conteudo.dados.Competencias.filter(function (competencia) {
                return competencia.Data.year() == (IndicadoresPG.filtros.ano - 1) &&
                    competencia.Data.month() == (IndicadoresPG.filtros.mes - 1);
            });
        },
        competenciaAtual: function () {
            return this.conteudo.dados.Competencias.filter(function (competencia) {
                return competencia.Data.year() == IndicadoresPG.filtros.ano &&
                    competencia.Data.month() == (IndicadoresPG.filtros.mes - 1);
            });
        },
        competenciasAnoAnterior: function () {
            return this.conteudo.dados.Competencias.filter(function (competencia) {
                return competencia.Data.year() == IndicadoresPG.filtros.ano - 1;
            });
        },
        competenciasAnoAtual: function () {
            return this.conteudo.dados.Competencias.filter(function (competencia) {
                return competencia.Data.year() == IndicadoresPG.filtros.ano;
            });
        }
    }
};

var componenteIndicadorTabelaSaldos1 = Vue.component('indicador-tabelas-saldos-1', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.PorFiltros, mixinIndicadoresSaldos],
    endpoint: 'generico/saldos/tabela1',
    propriedadesParametrosXHR: ['indicador', 'competencias'],
    template: '#template-indicador-tabela-saldos',
    name: 'TabelaSaldos1'
});

Vue.component('indicador-saldos-abreviado-1', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.PorFiltros, IndicadoresPG.mixins.DadosCompartilhados, mixinIndicadoresSaldos],
    template: '#template-indicador-saldos-abreviado-1'
});

Vue.component('indicador-graficos-saldos-conta', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.DadosCompartilhados],
    template: '<div v-if="dadosDisponiveis">' +
        '  <div style="width: 50%; height: 400px" />' +
        '  </div>',
    computed: {
        dataProvider: function () {
            if (!this.conteudo.disponivel)
                return [];

            return [{
                "category": "category 1",
                "column-1": Math.round(this.conteudo.dados.Contas[0].Subitens[0].Valores[20].ValorRealizado),
                "column-2": 5
            }, {
                "category": "category 2",
                "column-1": 6,
                "column-2": 7
            }, {
                "category": "category 3",
                "column-1": 2,
                "column-2": 3
            }];
        }
    },
    methods: {
        criarGrafico: function () {
            this.chart = AmCharts.makeChart(this.$el.firstChild, {
                "type": "serial",
                "categoryField": "category",
                "startDuration": 1,
                "categoryAxis": {
                    "gridPosition": "start"
                },
                "trendLines": [],
                "graphs": [{
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "fillAlphas": 1,
                    "id": "AmGraph-1",
                    "title": "graph 1",
                    "type": "column",
                    "valueField": "column-1"
                }, {
                    "balloonText": "[[title]] of [[category]]:[[value]]",
                    "fillAlphas": 1,
                    "id": "AmGraph-2",
                    "title": "graph 2",
                    "type": "column",
                    "valueField": "column-2"
                }],
                "guides": [],
                "valueAxes": [{
                    "id": "ValueAxis-1",
                    "title": "Axis title"
                }],
                "allLabels": [],
                "balloon": {},
                "legend": {
                    "enabled": true,
                    "useGraphSettings": true
                },
                "titles": [{
                    "id": "Title-1",
                    "size": 15,
                    "text": "Chart Title"
                }]
            });
        },
        atualizarGrafico: function () {
            if (_.isUndefined(this.chart))
                this.criarGrafico();
            this.chart.dataProvider = this.dataProvider;
            this.chart.validateData();
        }
    },
    updated: function () {
        this.atualizarGrafico();
    }
});

Vue.component('indicador-dre-abreviado-1', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.PorFiltros, IndicadoresPG.mixins.DadosCompartilhados],
    props: ['conteudo'],
    template: '#template-indicador-dre-abreviado-1',
    computed: {
        dadosDisponiveis: function () {
            return (!_.isUndefined(this.conteudo.dados));
        },
        registros: function () {
            if (!this.dadosDisponiveis)
                return [];

            return this.conteudo.dados.filter(function (conta) {
                return conta.Destacar == true;
            });
        }
    }
});

Vue.component('seletor-exibicao-indicador', {
    props: ['opcoes'],
    data: function () { return { selecao: this.opcoes[0].id }; },
    template:
        '<div style="width: 100%; position:relative">' +
        '  <div class="opcoes-exibicao-indicador btn-group btn-group-devided" data-toggle="buttons"> ' +
        '    <label v-for="opcao in opcoes" @click="selecao = opcao.id" :class="[\'btn grey btn-outline btn-circle btn-sm\', {active: selecao == opcao.id}]"> ' +
        '      <input type="radio" name="options" class="toggle" id="option1">{{opcao.legenda}}</label> ' +
        '  </div>' +
        // '    <transition-group name="fade" mode="out-in" >' +
        '        <div v-for="opcao in opcoes" v-show="opcao.id==selecao" :key="opcao.id">' +
        '          <slot :name="opcao.id"></slot>' +
        '        <div>' +
        // '    </transition-group>' +
    '</div>'
});

Vue.component('indicador-graficos-saldos-1', {
    mixins: [IndicadoresPG.mixins.Base, IndicadoresPG.mixins.DadosCompartilhados],
    template: '<div v-if="dadosDisponiveis">' +
        '    <div v-for="conta in conteudo.dados.Contas">' +
        //'        <table>' +
        //'            <thead>' +
        //'                <tr><th>Descrição</th><th :colspan="conteudo.dados.Competencias.length">Últimos mêses</th></tr>' +
        //'                <tr><th>{{conta.Nome}}</th><th v-for="competencia in conteudo.dados.Competencias">{{competencia.Descricao}}</th></tr>' +
        //'            </thead>' +
        //'            <tfoot>' +
        //'                <tr><td>{{conta.Nome}}</td><td>0</td></tr>' +
        //'            </tfoot>' +
        //'            <tbody>' +
        //'                <tr v-for="subconta in conta.Subitens"><td>{{subconta.Nome}}</td>' +
        //'                    <td v-for="competencia in conteudo.dados.Competencias">' +
        //'                        {{subconta.Valores[competencia.Data].ValorRealizado | valor}}' +
        //'                    </td>' +
        //'                </tr>' +
        //'            </tbody>' +
        //'        </table>' +
        '    </div>' +
        '</div>'
});

var componenteIndicadorTabelaContas = Vue.component('indicador-tabela-contas', {
    mixins: [IndicadoresPG.mixins.Base],
    props: ['titulo', 'contas'],
    description: 'Indicador padrão de tabela',
    template: '#template-indicador-tabela-contas',
    methods: {
        destacar: function (coluna) {
            return this.$options.colunasDestacar.includes(coluna);
        }
    },
    components: {
        'conta': {
            props: ['conta', 'ehSaldo'],
            template: '<tr :class="{saldo: ehSaldo}"><td>{{conta.Nome}}</td>' +
                '<celulaValor class="destacar" :valor="valores[0]"></celulaValor>' +
                '<celulaValor :valor="valores[1]"></celulaValor>' +
                '<td>{{delta.esquerda.delta | delta}}</td>' +
                '<td v-if="$parent.$options.interpretarDelta" class="interpretacao-delta">' +
                '  <span :class="interp(delta.esquerda.interpretacao)">&nbsp;</span>' +
                '</td>' +
                '<td></td>' +
                '<td>{{conta.Nome}}</td>' +
                '<celulaValor class="destacar" :valor="valores[2]"></celulaValor>' +
                '<celulaValor :valor="valores[3]"></celulaValor>' +
                '<td>{{delta.direita.delta | delta}}</td>' +
                '<td v-if="$parent.$options.interpretarDelta" class="interpretacao-delta">' +
                '  <span :class="interp(delta.direita.interpretacao)">&nbsp;</span>' +
                '</td>' +
                '</tr>',
            computed: {
                valores: function () {
                    return this.$parent.extrairValoresConta(this.conta);
                },
                delta: function () {
                    return {
                        esquerda: IndicadoresPG.calcularDelta(this.conta.ConfiguracaoDelta, this.valores[0], this.valores[1]),
                        direita: IndicadoresPG.calcularDelta(this.conta.ConfiguracaoDelta, this.valores[2], this.valores[3])
                    };
                }
            },
            methods: {
                interp: function (valor) {
                    return IndicadoresPG.obterClasseInterpretacaoDelta(valor);
                }
            }
        },
        coluna: {
            functional: true,
            render: function (create, context) {
                var coluna = context.data.attrs.coluna;
                if (_.isArray(coluna))
                    return create(
                        'td', {
                            class: coluna[1] || '',
                            domProps: {
                                innerHTML: coluna[0]
                            }
                        }, '');

                return create('td', { domProps: { innerHTML: coluna } });
            }
        }
    }
});

Vue.component('indicador-dre-analise-vertical', {
    extends: componenteIndicadorTabelaContas,
    mixins: []
});

Vue.config.errorHandler = function (error, instance) {
    Erp.notificacoes.erroASPNET(error);
};

/* INDICADOR BASE */
IndicadoresPG.IndicadorBase = function (alvo, enderecoWS) {
    this.alvo = alvo;
    this.enderecoWS = enderecoWS;
    this.indicadoresFilhos = [];
};
IndicadoresPG.IndicadorBase.prototype = {
    recarregar: function () {
        var indicador = this;
        this.carregar()
            .done(function () {
                indicador.indicadoresFilhos.forEach(function (i) {
                    i.recarregar();
                });
            }).always($.proxy(this.renderizar, this));
    },
    limpar: function () { },
    carregar: function () {
        // nesse caso, os dados são recebidos por outro indicador, que chama
        // a renderização do filho automaticamente
        if (!_.isUndefined(this.dadosCompartilhados) && !_.isUndefined(this.origemDadosCompartilhados))
            return null;
        var destinoDados = this;
        if (!_.isUndefined(this.dadosCompartilhados))
            destinoDados = this.dadosCompartilhados;
        destinoDados.carregando = true;
        return IndicadoresPG.carregarDadosComFiltros(
            this.enderecoWS,
            function (dados) {
                Vue.set(destinoDados, 'dados', dados);
                Vue.set(destinoDados, 'carregando', false);
            }
        );
    }
};

/* INDICADOR DRE */
IndicadoresPG.IndicadorDRE = function (alvo, enderecoWS, baseDados) {
    IndicadoresPG.IndicadorBase.call(this, alvo, enderecoWS);
    this.dadosCompartilhados = baseDados;
};
IndicadoresPG.IndicadorDRE.prototype = $.extend(Object.create(IndicadoresPG.IndicadorBase.prototype), {
    obterDados: function () {
        if (!_.isUndefined(this.dadosCompartilhados) && !_.isUndefined(this.dadosCompartilhados.dados))
            return this.dadosCompartilhados.dados;
        return this.dados;
    },
    adicionarColunasCabecalho: function (linha) {
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, 'Realizado competência', 'destacar');
        IndicadoresPG.adicionarCelula(linha, 'Orçado competência');
        IndicadoresPG.adicionarCelula(linha, '&Delta; %');
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, 'Realizado ano', 'destacar');
        IndicadoresPG.adicionarCelula(linha, 'Orçado ano');
        IndicadoresPG.adicionarCelula(linha, '&Delta; %');
        IndicadoresPG.adicionarCelula(linha, '');
    },
    adicionarCelulasValores: function (linha, conta, valores) {
        var adicionar = IndicadoresPG.adicionarCelulaValor;
        if (conta.EhPercentual)
            adicionar = IndicadoresPG.adicionarCelulaPercentual;

        adicionar(linha, valores.ValorRealizado, 'destacar');
        adicionar(linha, valores.ValorMeta);

        var delta = 0;
        if (valores.EhPercentual || (valores.ValorMeta == 0 || valores.ValorRealizado == 0))
            IndicadoresPG.adicionarCelula(linha, '');
        else {
            delta = IndicadoresPG.calcularDeltaPadrao(conta.Natureza, valores.ValorRealizado, valores.ValorMeta);
            IndicadoresPG.adicionarCelulaDelta(linha, delta);
        }
        var interpretacao;
        if (conta.ConfiguracaoDelta != null)
            interpretacao = IndicadoresPG.interpretarDeltaConfigurado(conta.ConfiguracaoDelta, delta);
        else
            interpretacao = IndicadoresPG.interpretarDelta(conta.Natureza, delta);
        IndicadoresPG.adicionarCelulaInterpretacao(linha, interpretacao);
    },
    renderizar: function () {
        $(this.alvo).html('');
        var dados = this.obterDados();
        if (IndicadoresPG.lidarComErroCargaDados($(this.alvo), dados))
            return;

        var indicador = document.createElement('div');
        indicador.classList.add('indicador');
        indicador.classList.add('dre');

        var titulo = document.createElement('div');
        // titulo.innerHTML = 'Demonstrativo do resultado';
        titulo.innerHTML = '&nbsp;';
        titulo.classList.add('indicador-cabecalho');

        var quadro = document.createElement('div');
        quadro.classList.add('table-responsive');

        var tabela = document.createElement('table');
        tabela.classList.add('table', 'table', 'table-hover', 'table-condensed');
        var cabecalho = tabela.createTHead();
        var linhaCabecalho = cabecalho.insertRow();
        this.adicionarColunasCabecalho(linhaCabecalho);

        var corpo = tabela.createTBody();
        for (var i in dados) {
            var conta = dados[i];
            var linha = corpo.insertRow();
            if (conta.Destacar)
                linha.className = 'destacar';
            IndicadoresPG.adicionarCelula(linha, conta.NomeConta, "indicador-dre-descricao");
            this.adicionarValores(linha, conta);
        }

        indicador.appendChild(titulo);

        quadro.appendChild(tabela);
        indicador.appendChild(quadro);

        $(this.alvo).html(indicador);
    },
    adicionarValores: function (linha, conta) {
        this.adicionarCelulasValores(linha, conta, conta.ValoresCompetencia);
        this.adicionarCelulasValores(linha, conta, conta.ValoresPeriodo);
    }
});

IndicadoresPG.IndicadorDREAnual = function (alvo, enderecoWS, baseDados, baseIndicador) {
    IndicadoresPG.IndicadorDRE.call(this, alvo, enderecoWS, baseDados);
    baseIndicador.indicadoresFilhos.push(this);
    this.obterDados = $.proxy(IndicadoresPG.obterDadosCompartilhados, this);
};
IndicadoresPG.IndicadorDREAnual.prototype = $.extend(Object.create(IndicadoresPG.IndicadorDRE.prototype), {
    adicionarColunasCabecalho: function (linha) {
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, 'Realizado competência', 'destacar');
        IndicadoresPG.adicionarCelula(linha, 'No ano anterior');
        IndicadoresPG.adicionarCelula(linha, '&Delta; %');
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, 'Acumulado ano atual', 'destacar');
        IndicadoresPG.adicionarCelula(linha, 'Do ano anterior');
        IndicadoresPG.adicionarCelula(linha, '&Delta; %');
        IndicadoresPG.adicionarCelula(linha, '');
    },
    adicionarCelulasValores: function (linha, conta, valor1, valor2) {
        var adicionar = IndicadoresPG.adicionarCelulaValor;
        if (conta.EhPercentual)
            adicionar = IndicadoresPG.adicionarCelulaPercentual;

        adicionar(linha, valor1, 'destacar');
        adicionar(linha, valor2);

        var delta = 0;
        if (conta.EhPercentual || (valor1 == 0 || valor2 == 0))
            IndicadoresPG.adicionarCelula(linha, '');
        else {
            delta = IndicadoresPG.calcularDeltaPadrao(conta.Natureza, valor1, valor2);
            IndicadoresPG.adicionarCelulaDelta(linha, delta);
        }
        var interpretacao = IndicadoresPG.interpretarDelta('C', delta);
        IndicadoresPG.adicionarCelulaInterpretacao(linha, interpretacao);
    },
    adicionarValores: function (linha, conta) {
        this.adicionarCelulasValores(linha, conta, conta.ValoresCompetencia.ValorRealizado, conta.ValoresAnoAnteriorCompetencia.ValorRealizado);
        this.adicionarCelulasValores(linha, conta, conta.ValoresPeriodo.ValorRealizado, conta.ValoresAnoAnteriorPeriodo.ValorRealizado);
    },
});

/* INDICADOR BALANCO RESUMIDO */
IndicadoresPG.IndicadorBalancoResumido = function (alvo, enderecoWS, baseDados) {
    IndicadoresPG.IndicadorBase.call(this, alvo, enderecoWS);
    this.dadosCompartilhados = baseDados;
};
IndicadoresPG.IndicadorBalancoResumido.prototype = $.extend(Object.create(IndicadoresPG.IndicadorBase.prototype), {
    obterDados: function () {
        if (!_.isUndefined(this.dadosCompartilhados) && !_.isUndefined(this.dadosCompartilhados.dados))
            return this.dadosCompartilhados.dados;
        return this.dados;
    },
    adicionarColunasCabecalho: function (linha, colunasVariaveis) {
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, 'Realizado<br/>competência', 'coluna-valor destacar');
        IndicadoresPG.adicionarCelula(linha, 'Orçado<br/>competência', 'coluna-valor');
        IndicadoresPG.adicionarCelula(linha, '&Delta; %');
    },
    renderizar: function () {
        $(this.alvo).html('');
        var dados = this.obterDados();
        if (IndicadoresPG.lidarComErroCargaDados($(this.alvo), dados))
            return;

        var contasAtivo = dados.Contas.filter(function (x) {
            return x.Tipo == 'A';
        });
        var contasPassivo = dados.Contas.filter(function (x) {
            return x.Tipo == 'P';
        });

        var qtdLinhas = Math.max(contasAtivo.length, contasPassivo.length);

        var indicador = document.createElement('div');
        indicador.classList.add('indicador');
        indicador.classList.add('balanco-resumido');

        var titulo = document.createElement('div');
        // titulo.innerHTML = 'Balanço resumido';
        titulo.innerHTML = '&nbsp;';
        titulo.classList.add('indicador-cabecalho');
        indicador.appendChild(titulo);

        var tabela = this.renderizarTabela({
            competencias: dados.DescricaoCompetencias,
            contas: contasAtivo,
            descricao: 'Ativo',
            quantidadeLinhas: qtdLinhas
        });

        indicador.appendChild(tabela);

        tabela = this.renderizarTabela({
            competencias: dados.DescricaoCompetencias,
            contas: contasPassivo,
            descricao: 'Passivo',
            quantidadeLinhas: qtdLinhas
        });
        indicador.appendChild(tabela);

        $(this.alvo).html(indicador);
    },
    renderizarTabela: function (configuracao) {
        var container = document.createElement('div');
        container.classList.add('col-lg-6');

        var quadro = document.createElement('div');
        quadro.classList.add('table-responsive');

        var tabela = document.createElement('table');
        tabela.classList.add('table', 'table', 'table-hover', 'table-condensed');
        var cabecalho = tabela.createTHead();
        var linhaCabecalho = cabecalho.insertRow();

        this.adicionarColunasCabecalho(linhaCabecalho, configuracao.competencias);

        var corpo = tabela.createTBody();
        this.renderizarTabelaConteudo(corpo, configuracao);

        quadro.appendChild(tabela);
        container.appendChild(quadro);
        return container;
    },
    renderizarTabelaConteudo: function (corpo, configuracao) {
        var contas = configuracao.contas;
        for (var i in contas) {
            var conta = contas[i];
            var valores = conta.ValoresCompetencia;
            var linha = corpo.insertRow();
            if (conta.Classes && conta.Classes !== '') {
                linha.className = conta.Classes;
            };
            IndicadoresPG.adicionarCelula(linha, conta.NomeConta);
            IndicadoresPG.adicionarCelulaValor(linha, conta.ValoresCompetencia.ValorRealizado, 'destacar');
            IndicadoresPG.adicionarCelulaValor(linha, conta.ValoresCompetencia.ValorMeta, 'coluna-valor');
            var delta = IndicadoresPG.calcularDeltaPadrao('C', conta.ValoresCompetencia.ValorRealizado, conta.ValoresCompetencia.ValorMeta);
            IndicadoresPG.adicionarCelulaDelta(linha, delta);
        }
        var qtdLinhasBranco = configuracao.quantidadeLinhas - contas.length;
        if (qtdLinhasBranco > 0) {
            for (var i = 0; i < qtdLinhasBranco; i++) {
                var l = corpo.insertRow();
                l.insertCell();
                var c = l.insertCell();
                c.classList.add('destacar');
                c = l.insertCell();
                c.colSpan = 2;
                c.innerHTML = '&nbsp;';
            }
        }

        // totalização
        var valores = contas
            .map(function (v) {
                return {
                    ValorMeta: (v.Classes && v.Classes !== '') ? v.ValoresCompetencia.ValorMeta : 0,
                    ValorRealizado: (v.Classes && v.Classes !== '') ? v.ValoresCompetencia.ValorRealizado : 0
                };
            });
        var total = valores.reduce(function (p, c) {
            return {
                ValorMeta: p.ValorMeta + c.ValorMeta,
                ValorRealizado: p.ValorRealizado + c.ValorRealizado
            };
        }, {
            ValorMeta: 0,
            ValorRealizado: 0
        });

        linha = corpo.insertRow();
        linha.classList.add('total');

        IndicadoresPG.adicionarCelula(linha, configuracao.descricao, 'total');
        IndicadoresPG.adicionarCelulaValor(linha, total.ValorRealizado, 'coluna-valor destacar');
        IndicadoresPG.adicionarCelulaValor(linha, total.ValorMeta, 'coluna-valor');
        IndicadoresPG.adicionarCelula(linha, '');
    }
});
/* INDICADOR BALANCO RESUMIDO ANUAL */
IndicadoresPG.IndicadorBalancoResumidoAnual = function (alvo, enderecoWS, baseDados, baseIndicador) {
    IndicadoresPG.IndicadorBalancoResumido.call(this, alvo, enderecoWS, baseDados);
    baseIndicador.indicadoresFilhos.push(this);
};
IndicadoresPG.IndicadorBalancoResumidoAnual.prototype = $.extend(Object.create(IndicadoresPG.IndicadorBalancoResumido.prototype), {
    adicionarColunasCabecalho: function (linha, colunasVariaveis) {
        IndicadoresPG.adicionarCelula(linha, '');
        IndicadoresPG.adicionarCelula(linha, colunasVariaveis[0], 'destacar');
        IndicadoresPG.adicionarCelula(linha, colunasVariaveis[1]);
        IndicadoresPG.adicionarCelula(linha, colunasVariaveis[2]);
    },
    adicionarCelulasValores: function (linha, conta) {
        IndicadoresPG.adicionarCelula(linha, conta.NomeConta);
        IndicadoresPG.adicionarCelulaValor(linha, conta.ValoresCompetencia.ValorRealizado, 'destacar');
        IndicadoresPG.adicionarCelulaValor(linha, conta.ValoresCompetenciaAnterior.ValorRealizado);
        IndicadoresPG.adicionarCelulaValor(linha, conta.ValoresCompetenciaAnoAnterior.ValorRealizado);
    },
    // anual
    renderizarTabelaConteudo: function (corpo, configuracao) {
        var contas = configuracao.contas;
        for (var i in contas) {
            var conta = contas[i];
            var linha = corpo.insertRow();
            if (conta.Classes && conta.Classes !== '') {
                linha.className = conta.Classes;
            };
            this.adicionarCelulasValores(linha, conta);
        }
        var qtdLinhasBranco = configuracao.quantidadeLinhas - contas.length;
        if (qtdLinhasBranco > 0) {
            for (var i = 0; i < qtdLinhasBranco; i++) {
                var l = corpo.insertRow();
                var c = l.insertCell();
                c.colSpan = 4;
                c.innerHTML = '&nbsp;';
            }
        }

        // totalização
        var valores = contas
            .map(function (v) {
                return {
                    Valor1: v.ValoresCompetencia.ValorRealizado,
                    Valor2: v.ValoresCompetenciaAnterior.ValorRealizado,
                    Valor3: v.ValoresCompetenciaAnoAnterior.ValorRealizado
                };
            });
        var total = valores.reduce(function (p, c) {
            return {
                Valor1: p.Valor1 + c.Valor1,
                Valor2: p.Valor2 + c.Valor2,
                Valor3: p.Valor3 + c.Valor3
            };
        }, {
            Valor1: 0,
            Valor2: 0,
            Valor3: 0
        });

        linha = corpo.insertRow();
        linha.classList.add('total');

        IndicadoresPG.adicionarCelula(linha, configuracao.descricao, 'total');
        IndicadoresPG.adicionarCelulaValor(linha, total.Valor1);
        IndicadoresPG.adicionarCelulaValor(linha, total.Valor2);
        IndicadoresPG.adicionarCelulaValor(linha, total.Valor3);
    }
});

indicadoresPG = new (function () {
    this.dadosCompartilhados = {
        DRE: {},
        BalancoResumido: {}
    };
    this.indicadorDREAtual =
        new IndicadoresPG.IndicadorDRE('#indicador-dre-atual', 'dre', this.dadosCompartilhados.DRE);
    this.indicadorDREAnual =
        new IndicadoresPG.IndicadorDREAnual('#indicador-dre-anual', 'dre', this.dadosCompartilhados.DRE, this.indicadorDREAtual);
    this.indicadorBalancoResumido =
        new IndicadoresPG.IndicadorBalancoResumido('#indicador-balanco-periodo', 'balanco', this.dadosCompartilhados.BalancoResumido);
    this.indicadorBalancoResumidoAnual =
        new IndicadoresPG.IndicadorBalancoResumidoAnual('#indicador-balanco-anual', 'balanco', this.dadosCompartilhados.BalancoResumido, this.indicadorBalancoResumido);

    this.indicadoresACarregar = [this.indicadorDREAtual, this.indicadorBalancoResumido];
    this.recarregarIndicadores = function () {
        this.indicadoresACarregar.forEach(function (i) {
            i.recarregar();
        });
    };

    this.inicializar = function () {
        $('#Filtro').find('input, select').change(function () {
            indicadoresPG.recarregarIndicadores();
        });
    };
})();

new Vue({
    el: '#pg-sidebar',
    name: 'BarraLateral',
    data: { visualizacao: IndicadoresPG.visualizacao },
    methods: {
        selecionar: function (selecao) {
            //this.visualizacao.indicadorAtual = selecao;
            window.location.hash = '#' + selecao;
        }
    },
    components: {
        'seletor-indicadores': {
            template:
                '<li :class="{active: selecionado}">' +
                '  <a @click="$parent.selecionar(selecao)">' +
                '    <i v-if="icone != \'\'" :class="icone"> </i>' +
                '       <span class="title">{{titulo}}</span>' +
                '       <span class="selected" v-if="selecionado"></span>' +
                '  </a>' +
                '</li>',
            props: ['selecao', 'titulo', 'icone'],
            computed: {
                selecionado: function () { return this.$parent.visualizacao.indicadorAtual == this.selecao; }
            }
        }
    }
});

new Vue({
    el: '#container-filtros',
    name: 'Filtros',
    data: {
        filtros: IndicadoresPG.filtros,
        definicaoEmpresas: definicaoEmpresas,
        definicaoGeral: definicaoGeral
    }
});

vueIndicadores = new Vue({
    el: '#container-indicadores',
    name: 'Indicadores',
    data: {
        dados: IndicadoresPG.dados,
        carregando: false,
        dadosLegado: indicadoresPG.dadosCompartilhados,
        filtros: IndicadoresPG.filtros,
        definicaoEmpresas: definicaoEmpresas,
        definicaoGeral: definicaoGeral,
        visualizacao: IndicadoresPG.visualizacao,
        definicao: definicaoIndicadores,
        rota: window.location.hash
    },
    computed: {
        exibir: function () {
            return this.visualizacao.indicadorAtual;
        }
    }
});

$(document).ajaxStart(function () {
    vueIndicadores.$data.carregando = true;
});
$(document).ajaxStop(function () {
    vueIndicadores.$data.carregando = false;
});

$(document).ready(function () {
    indicadoresPG.inicializar();
    indicadoresPG.recarregarIndicadores();

    $(window).on('hashchange', function () {
        IndicadoresPG.visualizacao.indicadorAtual = window.location.hash.substr(1);
    });
});
