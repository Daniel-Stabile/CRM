import Page from './Page';
import ModalPage from './ModalPage';

var Notificacoes = function () {
	//Variáveis de controle para impedir que os processos assincronos sejam empilhados ou que possam ser feitas chamadas repetidas.
	var estaLendoNotificacoes = false;
	var estaLimpandoNotificacoes = false;
	
	var obterTextoContagemNotificacoesCabecalho = function (quantidade) {
        switch (quantidade) {
            case 0:
                return "Nenhuma notificação.";
            case 1:
                return "1 notificação.";
            default:
                return String.format("{0} notificações.", quantidade);
        }
    };
	
	return {
		inicializarNotificacoes: function () {
			$('#header_notification_bar .dropdown-toggle').on('click', function () {
				var handlesNaoLidas = $("li[data-notificacao-lida='false']")
					.map(function () { return $(this).attr("handle"); })
					.toArray();
				
				if (handlesNaoLidas.length)
					Benner.Corporativo.Notificacoes.lerNotificacoes(handlesNaoLidas);
				
				$('#header_notification_bar .dropdown-menu-list').removeAttr("data-initialized");
                App.initSlimScroll('#header_notification_bar .scroller');
            });
			
			$("li.dropdown-user-wes").hover(function () { 
				$('#header_notification_bar .dropdown-menu-list').removeAttr("data-initialized");
				App.initSlimScroll('#header_notification_bar .scroller'); 
			});
			
			if ($("#header_notification_bar span.active").length)
                this.obterNotificacoes();
		},
		
		obterNotificacoes: function () {
            $.get(Page.getApplicationPath() + "api/ObterNotificacoes")
				.done(function (data) {
					Benner.Corporativo.Notificacoes.carregarNotificacoes(data);
				});
        },
		
		carregarNotificacoes: function (notificacoes) {
			var headerNotificacoes = $("#header_notification_bar");
            var dropDownMenuList = headerNotificacoes.find(".dropdown-menu-list");
			var contagemNotificacoesCabecalho = headerNotificacoes.find(".dropdown-menu li.external h3 span");
			
			contagemNotificacoesCabecalho.text(obterTextoContagemNotificacoesCabecalho(notificacoes.length));
			dropDownMenuList.removeAttr("data-initialized");
			dropDownMenuList.empty();
			
			$.each(notificacoes, function (index) {
				var textoData = moment(this.DataHora, 'DD/MM/YYYY hh:mm:ss').fromNow();
				
				$('#header_notification_bar .dropdown-menu-list').append("<li handle='HANDLE_NOTIFICACAO' data-notificacao-lida='NOTIFICACAO_LIDA'> <a href='URL_NOTIFICACAO'> <span class='time' style='text-align: center;' title='DATAHORA_LABEL'>DATAHORA_NOTIFICACAO</span> <span class='details' title='DESCRICAO_LABEL'> <span class='label label-sm label-icon' style='background-color: CORICONE_NOTIFICACAO; font-size: 10px;'> <i class='fa fa-ICONE_NOTIFICACAO'></i> </span> DESCRICAO_NOTIFICACAO </span> </a> </li>"
					.replace("HANDLE_NOTIFICACAO", this.Handle)
					.replace("NOTIFICACAO_LIDA", this.Lida)
					.replace("URL_NOTIFICACAO", Page.getApplicationPath() + this.Url)
					.replace("DATAHORA_NOTIFICACAO", textoData.length > 10 ? String.format("{0}...", textoData.substring(0,8)) : textoData)
					.replace("DATAHORA_LABEL", textoData)
					.replace("CORICONE_NOTIFICACAO", this.CorIcone)
					.replace("ICONE_NOTIFICACAO", this.Icone)
					.replace("DESCRICAO_NOTIFICACAO", this.Descricao.length > 20 ? String.format("{0}...", this.Descricao.substring(0,20)) : this.Descricao)
					.replace("DESCRICAO_LABEL", this.Descricao));
			});
            
            App.initSlimScroll('#header_notification_bar .scroller');
        },
		
		limparNotificacoes: function () {
			if (!estaLimpandoNotificacoes)
			{
				var handlesNotificacoes = $('#header_notification_bar .dropdown-menu-list li')
					.map(function () { return $(this).attr("handle"); })
					.toArray();
				
				if (handlesNotificacoes.length)
				{
					estaLimpandoNotificacoes = true;
					$.post(Page.getApplicationPath() + "api/LimparNotificacoes", { HandlesNotificacoes: handlesNotificacoes })
						.done(function (data) {
							Benner.Corporativo.Notificacoes.obterNotificacoes();
						})
						.always(function() {
							estaLimpandoNotificacoes = false;
						});
				}
			};
		},
		
		abrirConfiguracoes: function () {
			Benner.ModalPage.show({ url: Page.getApplicationPath() + "aga/a/genericos/notificacoes/GerenciarNotificacoes.aspx?imp=1", size: 'large', displayTitle: false });
		},
		
		lerNotificacoes: function (notificacoesNaoLidas) {
			if (!estaLendoNotificacoes)
			{
				estaLendoNotificacoes = true;
				
				$.post(Page.getApplicationPath() + "api/LerNotificacoes", { HandlesNotificacoes: notificacoesNaoLidas })
					.done(function (data) {
						$("#header_notification_bar .badge.badge-default").text("");
						$("li[data-notificacao-lida='false']").attr("data-notificacao-lida", "true");
					})
					.always(function() {
						estaLendoNotificacoes = false;
					});
			};
		},
		
		associarEventosToggleNotificacoes: function() {
			$(".toggleNotificacao input").on('switchChange.bootstrapSwitch', function (event, state) 
			{ 
				var handle = $(this).attr("handle");
				$(this).bootstrapSwitch('readonly', true); 
				
				$.post(Page.getApplicationPath() + "api/AtualizarConfiguracaoNotificacao", { HandleTipoNotificacao: handle, Ativada: state })
					.done(function (data) {
						$("#header_notification_bar .badge.badge-default").text("");
						$("li[data-notificacao-lida='false']").attr("data-notificacao-lida", "true");
					})
					.always(function() {
						$(".toggleNotificacao input[handle='"+ handle +"']").bootstrapSwitch('readonly', false);
					});
			});
		}
	}
}();

export default Notificacoes;