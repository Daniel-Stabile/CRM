// ---------------------------------------------- //
//                  Estilos (CSS)                 //
// ---------------------------------------------- //
import '../css/Corporativo.css';
import '../assets/plugins/bootstrap-tabdrop/css/tabdrop.css';
import '../css/cloud.css';
import '../css/Tesouraria.css';
import '../assets/plugins/jstree/dist/themes/default/style.css';
import 'bootstrap-switch/dist/css/bootstrap3/bootstrap-switch.css';
import 'nouislider/src/nouislider.css';
import 'nouislider/src/nouislider.pips.css';
import '~/content/aga/css/aga.css';
import '~/content/aga/css/aga.tile.css';
import '~/content/aga/css/aga.grid.css';

// ---------------------------------------------- //
//                    Scripts                     //
// ---------------------------------------------- //
import 'bootstrap-switch';
import 'babel-polyfill';
import 'v-money';
import 'es6-promise/auto';
import 'jstree';
import 'currency.js';
import 'nouislider';
import moment from 'moment';
import 'moment/locale/pt-br';
import DashboardComercialStore from '../apps/Dashboard/store/dashboardComercialStore';
import DashboardFinanceiroStore from '../apps/Dashboard/store/dashboardFinanceiroStore';
import DashboardTributosStore from "../apps/Dashboard/store/dashboardTributosStore";
import OrcamentoRemanejarStore from '../apps/orcamento/remanejar';
import BalanceteStore from "../apps/contabil/balanceteStore";
import VuexPersist from 'vuex-persist';
import Notificacoes from '../js/Notificacoes';
import ComparadorPropostasStore from "../apps/suprimentos/comparadorPropostasStore";
import SaldosStore from '../apps/materiais/saldosStore';
import MovimentacoesStore from '../apps/materiais/movimentacoesStore';
import am4themes_material from '@amcharts/amcharts4/themes/material';

// ---------------------------------------------- //
//                    Globais                     //
// ---------------------------------------------- //
window.currency = require('currency.js');
window.VuexPersist = VuexPersist;
moment.locale('pt-br');
window.moment = moment;
window.noUiSlider = require('nouislider');  
window.Benner.DashboardComercialStore = DashboardComercialStore;
window.Benner.DashboardFinanceiroStore = DashboardFinanceiroStore;
window.Benner.DashboardTributosStore = DashboardTributosStore;
window.Benner.OrcamentoRemanejarStore = OrcamentoRemanejarStore;
window.Benner.BalanceteStore = BalanceteStore;
window.AGA = {};
window.Benner.Corporativo = {};
window.Benner.Corporativo.Notificacoes = Notificacoes;
window.Benner.Corporativo.Suprimentos = {};
window.Benner.Corporativo.Suprimentos.Cotacoes = {};
window.Benner.Corporativo.Suprimentos.Cotacoes.ComparadorPropostasStore = ComparadorPropostasStore;
window.Benner.Corporativo.Materiais = {};
window.Benner.Corporativo.Materiais.SaldosStore = SaldosStore;
window.Benner.Corporativo.Materiais.MovimentacoesStore = MovimentacoesStore;
require('~/content/aga/js/quick-nav.js');
require('~/content/aga/js/components/aga.js');
require('~/content/aga/js/components/aga.revealhandles.js');
require('~/content/aga/js/components/aga.menu.js');
require('~/content/aga/js/components/aga.helper.js');
require('~/content/aga/js/components/aga.loader.js');
require('~/content/aga/js/components/aga.form.js');
require('~/content/aga/js/components/aga.baseinputcontrol.js');
require('~/content/aga/js/components/aga.lookup.js');
require('~/content/aga/js/components/aga.text.js');
require('~/content/aga/js/components/aga.number.js');
require('~/content/aga/js/components/aga.date.js');
require('~/content/aga/js/components/aga.checkbox.js');
require('~/content/aga/js/components/aga.radio.js');
require('~/content/aga/js/components/aga.ajax.js');
require('~/content/aga/js/components/aga.grid.js');
require('~/content/aga/js/components/aga.textdecorator.js');
require('~/content/aga/js/components/aga.init.js');
require('~/content/aga/js/components/aga.tile.js');
require('~/content/aga/js/components/aga.javascriptbutton.js');
require('~/content/aga/js/components/aga.quicknav.js');
require('~/content/aga/js/components/aga.tableCreator.js');
require('~/content/aga/js/components/aga.memo.js');
require('~/content/aga/js/components/aga.toastr.js');
require('~/content/aga/js/components/aga.userconfirmation.js');
require('~/content/aga/js/components/aga.schedule.js');
require('~/content/aga/js/components/aga.searchhider.js');
require('~/content/aga/js/components/aga.jargon.js');

import AmChartsCorpComponent from '../js/amcharts/AmChartsCorpComponent';
var CorpComponents = {};
CorpComponents.AmCharts = AmChartsCorpComponent;
window.CorpComponents = CorpComponents;