function AplicarRegraMenuLateral()
{
	//Menus modulo gestao de cobranca
	if(sessionStorage.getItem("EXIBIR_AGENDA_GESTAOCOBRANCA") == "true") {
		$("#sidebar_MENUAGENDA").show();
	}
	else {
		$("#sidebar_MENUAGENDA").hide();
	}	
	if(sessionStorage.getItem("EXIBIR_CADASTROS_GESTAOCOBRANCA") == "true") {
		$("#sidebar_MENUCADASTROSGESTAOCOBRANCA").show();
	}
	else {
		$("#sidebar_MENUCADASTROSGESTAOCOBRANCA").hide();
	}
	if (sessionStorage.getItem("EXIBIR_PROCESSOS_SERVIDOR_GESTAOCOBRANCA") == "true") {
		$("#sidebar_MENUPROCESSOSSERVIDORGESTAOCOBRANCA").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSSERVIDORGESTAOCOBRANCA").hide();
	}
	// Menus modulo Comercial
	if(sessionStorage.getItem("EXIBIR_ORDENSVENDA_COMERCIAL") == "true") {
		$("#sidebar_MENUORDENSVENDALATERAL").show();
	}
	else {
		$("#sidebar_MENUORDENSVENDALATERAL").hide();
	}			

	if(sessionStorage.getItem("EXIBIR_FATURAMENTO_COMERCIAL")  == "true") {
		$("#sidebar_MENUFATURAMENTOLATERAL").show();
	}
	else {
		$("#sidebar_MENUFATURAMENTOLATERAL").hide();
	}

	if (sessionStorage.getItem("EXIBIR_PROCESSOS_SERVIDOR_COMERCIAL") == "true") {
		$("#sidebar_MENUPROCESSOSSERVIDORCOMERCIAL").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSSERVIDORCOMERCIAL").hide();
    }

    if (sessionStorage.getItem("EXIBIR_PROPOSTAS_COMERCIAL") == "true") {
        $("#sidebar_MENUPROPOSTASLATERAL").show();
    }
    else {
        $("#sidebar_MENUPROPOSTASLATERAL").hide();
    }		
	
	// Menus modulo Financeiro	
	if(sessionStorage.getItem("EXIBIR_CPA_FINANCEIRO")  == "true") {
		$("#sidebar_MENUCPA").show();
	}
	else {
		$("#sidebar_MENUCPA").hide();
	}				
	
	if(sessionStorage.getItem("EXIBIR_CRE_FINANCEIRO") == "true") {
		$("#sidebar_MENUCRE").show();
	}
	else {
		$("#sidebar_MENUCRE").hide();
	}
	
	if(sessionStorage.getItem("EXIBIR_TESOURARIA_FINANCEIRO") == "true") {
		$("#sidebar_MENUTESOURARIALATERAL").show();
	}
	else {
		$("#sidebar_MENUTESOURARIALATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_NOTASDEBITOCREDITO_FINANCEIRO") == "true") {
		$("#sidebar_MENUNOTASDEBITOCREDITO").show();
	}
	else {
		$("#sidebar_MENUNOTASDEBITOCREDITO").hide();
	}	

	if(sessionStorage.getItem("EXIBIR_CONSULTAS_FINANCEIRO") == "true") {
		$("#sidebar_MENUCONSULTASFINANCEIRO").show();
	}
	else {
		$("#sidebar_MENUCONSULTASFINANCEIRO").hide();
	}

	if (sessionStorage.getItem("EXIBIR_PROCESSOS_FINANCEIRO") == "true") {
		$("#sidebar_MENUPROCESSOSFINANCEIRO").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSFINANCEIRO").hide();
	}

	if(sessionStorage.getItem("EXIBIR_PROCESSOS_SERVIDOR_FINANCEIRO") == "true") {
		$("#sidebar_MENUPROCESSOSNOSERVIDORLATERAL").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSNOSERVIDORLATERAL").hide();
	}

	// Menus modulo Contratos	
	if(sessionStorage.getItem("EXIBIR_PRECONTRATOS_CONTRATOS") == "true") {
		$("#sidebar_MENUPRECONTRATOS").show();
	}
	else {
		$("#sidebar_MENUPRECONTRATOS").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_CONTRATOS_CONTRATOS") == "true") {
		$("#sidebar_MENUCONTRATOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUCONTRATOSLATERAL").hide();
	}
	
	if(sessionStorage.getItem("EXIBIR_FATURAMENTOCONTRATOS_CONTRATOS") == "true") {
		$("#sidebar_MENUFATURAMENTOCONTRATOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUFATURAMENTOCONTRATOSLATERAL").hide();
	}	

	if(sessionStorage.getItem("EXIBIR_REQUISICOES_CONTRATOS") == "true") {
		$("#sidebar_MENUREQUISICOESLATERAL").show();
	}
	else {
		$("#sidebar_MENUREQUISICOESLATERAL").hide();
	}
	
	if(sessionStorage.getItem("EXIBIR_CONSULTAS_CONTRATOS") == "true") {
		$("#sidebar_MENUCONSULTACONTRATOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUCONSULTACONTRATOSLATERAL").hide();
	}

    // Menus modulo ESG
	if (sessionStorage.getItem("EXIBIR_REQUISITOSGRI_ESG") == "true") {
	    $("#sidebar_MENUREQUISITOSGRI").show();
	} else {
	    $("#sidebar_MENUREQUISITOSGRI").hide();
    }

    // Menus modulo Gestão de projetos
    if (sessionStorage.getItem("EXIBIR_GESTAO_PROJETOS") == "true") {
        $("#sidebar_MENU_GESTAOPROJETOS").show();
    } else {
        $("#sidebar_MENU_GESTAOPROJETOS").hide();
    }
	
	if (sessionStorage.getItem("EXIBIR_GESTAO_KANBAN") == "true") {
        $("#sidebar_MENU_GESTAOKABAN").show();
    } else {
        $("#sidebar_MENU_GESTAOKABAN").hide();
    }

    // Menus modulo Aquisicoes
    if (sessionStorage.getItem("EXIBIR_AQUISICOES_AQUISICOES") == "true") {
        $("#sidebar_MENU_AQUISICOESLATERAL").show();
    } else {
        $("#sidebar_MENU_AQUISICOESLATERAL").hide();
    }

    if (sessionStorage.getItem("EXIBIR_REQUISICOES_AQUISICOES") == "true") {
        $("#sidebar_MENU_REQUISICOESAQUISICOESLATERAL").show();
    } else {
        $("#sidebar_MENU_REQUISICOESAQUISICOESLATERAL").hide();
    }

	// Menus modulo Materiais	
	if(sessionStorage.getItem("EXIBIR_ITENS_MATERIAIS") == "true") {
		$("#sidebar_MENUITENSMATERIAISLATERAL").show();
	}
	else {
		$("#sidebar_MENUITENSMATERIAISLATERAL").hide();
	}		
	
	if(sessionStorage.getItem("EXIBIR_ATENDIMENTO_MATERIAIS") == "true") {
		$("#sidebar_MENUATENDIMENTOMATERIAISLATERAL").show();
	}
	else {
		$("#sidebar_MENUATENDIMENTOMATERIAISLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_RECEBIMENTOS_MATERIAIS") == "true") {
		$("#sidebar_MENUMATERIAISRECEBIMENTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUMATERIAISRECEBIMENTOSLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_ALMOXARIFADO_MATERIAIS") == "true") {
		$("#sidebar_MENUALMOXARIFADOMATERIAISLATERAL").show();
	}
	else {
		$("#sidebar_MENUALMOXARIFADOMATERIAISLATERAL").hide();
	}		
	
	if(sessionStorage.getItem("EXIBIR_RECALCULOS_MATERIAIS") == "true") {
		$("#sidebar_MENURECALCULOSMATERIAISLATERAL").show();
	}
	else {
		$("#sidebar_MENURECALCULOSMATERIAISLATERAL").hide();
	}	
	
	$("#sidebar_MENUENTRADADENOTAFISCALLATERAL").toggle(sessionStorage.getItem("EXIBIR_ENTRADA_NOTA_FISCAL_MATERIAIS") == "true");
	
	// Menus modulo Suprimentos		
	if(sessionStorage.getItem("EXIBIR_SOLICITACOES_SUPRIMENTOS") == "true") {
		$("#sidebar_MENUSOLICITACOESSUPRIMENTOS").show();
	}
	else {
		$("#sidebar_MENUSOLICITACOESSUPRIMENTOS").hide();
	}
	
	if(sessionStorage.getItem("EXIBIR_REQUISICOES_SUPRIMENTOS") == "true") {
		$("#sidebar_MENUREQUISICOESSUPRIMENTOS").show();
	}
	else {
		$("#sidebar_MENUREQUISICOESSUPRIMENTOS").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_COTACOES_SUPRIMENTOS") == "true") {
		$("#sidebar_MENUCOTACOESSUPRIMENTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUCOTACOESSUPRIMENTOSLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_ORDENSDECOMPRA_SUPRIMENTOS") == "true") {
		$("#sidebar_MENUORDENSDECOMPRASUPRIMENTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUORDENSDECOMPRASUPRIMENTOSLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_ORDENSDECOMPRA_SUPRIMENTOS") == "true") {
		$("#sidebar_MENUORDENSDECOMPRASUPRIMENTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUORDENSDECOMPRASUPRIMENTOSLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_RESSUPRIMENTOS_SUPRIMENTOS") == "true") {
		$("#sidebar_MENURESSUPRIMENTOSSUPRIMENTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENURESSUPRIMENTOSSUPRIMENTOSLATERAL").hide();
	}	
	
	// Menus modulo contabil
	if(sessionStorage.getItem("EXIBIR_MOVIMENTACOES_CONTABIL") == "true") {
		$("#sidebar_MENUMOVIMENTACOESCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUMOVIMENTACOESCONTABILLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_CONSULTAS_CONTABIL") == "true") {
		$("#sidebar_MENUCONSULTASCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUCONSULTASCONTABILLATERAL").hide();
	}		
	
	if(sessionStorage.getItem("EXIBIR_PROCESSOS_CONTABIL") == "true") {
		$("#sidebar_MENUPROCESSOSCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSCONTABILLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_VALIDACOES_CONTABIL") == "true") {
		$("#sidebar_MENUVALIDACAOCONTABILATERAL").show();
	}
	else {
		$("#sidebar_MENUVALIDACAOCONTABILATERAL").hide();
	}	

	if(sessionStorage.getItem("EXIBIR_DEMONSTRACOES_CONTABIL") == "true") {
		$("#sidebar_MENUDEMONSTRACOESCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUDEMONSTRACOESCONTABILLATERAL").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_PLANOS_CONTABIL") == "true") {
		$("#sidebar_MENUPLANOSCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUPLANOSCONTABILLATERAL").hide();
	}		
	
	if(sessionStorage.getItem("EXIBIR_CONFIGURACOES_CONTABIL") == "true") {
		$("#sidebar_MENUCONFIGURACOESCONTABILLATERAL").show();
	}
	else {
		$("#sidebar_MENUCONFIGURACOESCONTABILLATERAL").hide();
    }	
	
    //Validar a tela de parâmetros do contábil
    $("a[href*='/aga/a/Contabil/Parametros/Menu.aspx']").toggle(sessionStorage.getItem("EXIBIR_SUBITEM_CADASTROS_CONTABIL") == "true");

    // Menus modulo tributos
	if(sessionStorage.getItem("EXIBIR_MOVIMENTACOES_TRIBUTOS") == "true") {
		$("#sidebar_MENUMOVIMENTACOESTRIBUTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUMOVIMENTACOESTRIBUTOSLATERAL").hide();
	}

	if(sessionStorage.getItem("EXIBIR_SUBSTITUICAOTRIBUTARIAAPURACOES_TRIBUTOS") == "true") {
		$("#sidebar_MENUSUBSTITUICAOTRIBUTARIAAPURACOES").show();
	}
	else {
		$("#sidebar_MENUSUBSTITUICAOTRIBUTARIAAPURACOES").hide();
	}	
	
	if(sessionStorage.getItem("EXIBIR_CONSULTAS_TRIBUTOS") == "true") {
		$("#sidebar_MENUCONSULTASTRIBUTOSLATERAL").show();
	}
	else {
		$("#sidebar_MENUCONSULTASTRIBUTOSLATERAL").hide();
    }
	
	if (sessionStorage.getItem("EXIBIR_DECLARACOES_TRIBUTOS") == "true") {
        $("#sidebar_MENUDECLARACOESLATERAL").show();
    }
    else {
        $("#sidebar_MENUDECLARACOESLATERAL").hide();
    }	

    if (sessionStorage.getItem("EXIBIR_APURACOES_TRIBUTOS") == "true") {
        $("#sidebar_MENUAPURACOESTRIBUTOSLATERAL").show();
    }
    else {
        $("#sidebar_MENUAPURACOESTRIBUTOSLATERAL").hide();
    }

    if (sessionStorage.getItem("EXIBIR_PISCONFINS_TRIBUTOS") == "true") {
        $("#sidebar_MENUPISCONFINSTRIBUTOSLATERAL").show();
    }
    else {
        $("#sidebar_MENUPISCONFINSTRIBUTOSLATERAL").hide();
    }

    if (sessionStorage.getItem("EXIBIR_PROCESSOS_TRIBUTOS") == "true") {
        $("#sidebar_MENUPROCESSOSTRIBUTOSLATERAL").show();
    }
    else {
        $("#sidebar_MENUPROCESSOSTRIBUTOSLATERAL").hide();
    }
    // Menus modulo Produção
    if (sessionStorage.getItem("EXIBIR_ORDENS_PRODUCAO") == "true") {
        $("#sidebar_MENULATERALPRORDENSPRODUCAO").show();
    }
    else {
        $("#sidebar_MENULATERALPRORDENSPRODUCAO").hide();
    }
    if (sessionStorage.getItem("EXIBIR_ORDENS_RETRABALHO") == "true") {
        $("#sidebar_MENULATERALORDENSRETRABALHO").show();
    }
    else {
        $("#sidebar_MENULATERALORDENSRETRABALHO").hide();
    }
    if (sessionStorage.getItem("EXIBIR_ORDENS_DESMONTAGEM") == "true") {
        $("#sidebar_MENUORDEMDESMONTAGEMLATERAL").show();
    }
    else {
        $("#sidebar_MENUORDEMDESMONTAGEMLATERAL").hide();
    }

    //Menus modulo Ativo
    if (sessionStorage.getItem("EXIBIR_ITENS_ATIVO") == "true") {
        $("#sidebar_MENUITENSLATERAL").show();
    }
    else {
        $("#sidebar_MENUITENSLATERAL").hide();
    }
    if (sessionStorage.getItem("EXIBIR_CALCULOS_ATIVO") == "true") {
        $("#sidebar_MENUATIVOCALCULOSLATERAL").show();
    }
    else {
        $("#sidebar_MENUATIVOCALCULOSLATERAL").hide();
    }
    if (sessionStorage.getItem("EXIBIR_INVENTARIOS_ATIVO") == "true") {
        $("#sidebar_MENUATIVOINVENTARIOSLATERAL").show();
    }
    else {
        $("#sidebar_MENUATIVOINVENTARIOSLATERAL").hide();
    }
    //Menus modulo Orçamento
    if (sessionStorage.getItem("EXIBIR_EMPENHOS") == "true") {
        $("#sidebar_EMPENHOSLATERAL").show();
    }
    else {
        $("#sidebar_EMPENHOSLATERAL").hide();
	}
	if (sessionStorage.getItem("EXIBIR_PROCESSOS_ORCAMENTO") == "true") {
		$("#sidebar_MENUPROCESSOSORCAMENTO").show();
	}
	else {
		$("#sidebar_MENUPROCESSOSORCAMENTO").hide();
	}
    //Validar a tela de cadastros Produção
    $("a[href*='/aga/a/producao/parametros/Menu.aspx']").toggle(sessionStorage.getItem("EXIBIR_CADASTRO_PRODUCAO") == "true");

    //Validação do menu de aprovações (genérico)    
    $("#sidebar_APROVACOESLATERAL").toggle(sessionStorage.getItem("EXIBIR_APROVACOES") == "true");
	
    //Validar a tela de cadastros Ativo
    $("a[href*='/aga/a/ativo/parametros/Menu.aspx']").toggle(sessionStorage.getItem("EXIBIR_CADASTRO_ATIVO") == "true");

	// setTimeout(() => {
	// 	if(!$("#ctl00_SidebarMenu > li:nth-child(3)").hasClass("active") && !$("#ctl00_SidebarMenu > li:nth-child(3)").hasClass("open")){
	// 		$("#ctl00_SidebarMenu > li:nth-child(3)>a").click()
	// 	}
	//   }, "200");
	  
}

function ExibirMenusModuloGestaoCobranca()
{
	var array = [
		"EXIBIR_AGENDA_GESTAOCOBRANCA",
		"EXIBIR_CADASTROS_GESTAOCOBRANCA",
		"EXIBIR_PROCESSOS_SERVIDOR_GESTAOCOBRANCA"
	];
	ExibirMenus(array);		
}

function ExibirMenusModuloComercial()
{
	var array = [
		"EXIBIR_ORDENSVENDA_COMERCIAL",
		"EXIBIR_FATURAMENTO_COMERCIAL",
        "EXIBIR_PROCESSOS_SERVIDOR_COMERCIAL",
        "EXIBIR_PROPOSTAS_COMERCIAL"
	];
	ExibirMenus(array);		
}

function ExibirMenusModuloFinanceiro()
{	
	var array = [
		"EXIBIR_CPA_FINANCEIRO",
		"EXIBIR_CRE_FINANCEIRO",
		"EXIBIR_TESOURARIA_FINANCEIRO",
		"EXIBIR_NOTASDEBITOCREDITO_FINANCEIRO",
		"EXIBIR_CONSULTAS_FINANCEIRO",
		"EXIBIR_PROCESSOS_FINANCEIRO",
		"EXIBIR_PROCESSOS_SERVIDOR_FINANCEIRO"
	];
	ExibirMenus(array);		
}

function ExibirMenusModuloContratos()
{
	var array = [
		"EXIBIR_PRECONTRATOS_CONTRATOS",
		"EXIBIR_CONTRATOS_CONTRATOS",
		"EXIBIR_FATURAMENTOCONTRATOS_CONTRATOS",
		"EXIBIR_REQUISICOES_CONTRATOS",
        "EXIBIR_CONSULTAS_CONTRATOS",
        "EXIBIR_APROVACOES"
	];
	ExibirMenus(array);			
}

function ExibirMenusModuloMateriais()
{	
	var array = [
		"EXIBIR_ITENS_MATERIAIS",
		"EXIBIR_ATENDIMENTO_MATERIAIS",
		"EXIBIR_RECEBIMENTOS_MATERIAIS",
		"EXIBIR_ALMOXARIFADO_MATERIAIS",
		"EXIBIR_RECALCULOS_MATERIAIS",
		"EXIBIR_ENTRADA_NOTA_FISCAL_MATERIAIS"
	];
	ExibirMenus(array);		
}

function ExibirMenusModuloEsg() {
    var array = ["EXIBIR_REQUISITOSGRI_ESG"];
    ExibirMenus(array);
}

function ExibirMenusModuloProjetos() {
    var array = [
		"EXIBIR_GESTAO_PROJETOS",
		"EXIBIR_GESTAO_KANBAN"
		];
    ExibirMenus(array);
}

function ExibirMenusModuloAquisicoes() {
    var array = [
        "EXIBIR_AQUISICOES_AQUISICOES",
        "EXIBIR_REQUISICOES_AQUISICOES",
    ];
    ExibirMenus(array);
}

function ExibirMenusModuloSuprimentos()
{
	var array = [
		"EXIBIR_SOLICITACOES_SUPRIMENTOS",
		"EXIBIR_REQUISICOES_SUPRIMENTOS",
		"EXIBIR_COTACOES_SUPRIMENTOS",
		"EXIBIR_ORDENSDECOMPRA_SUPRIMENTOS",
        "EXIBIR_RESSUPRIMENTOS_SUPRIMENTOS",
        "EXIBIR_APROVACOES"
	];
	ExibirMenus(array);	
}

function ExibirMenusModuloContabil()
{
	var array = [
		"EXIBIR_MOVIMENTACOES_CONTABIL",
		"EXIBIR_CONSULTAS_CONTABIL",
		"EXIBIR_VALIDACOES_CONTABIL",
		"EXIBIR_DEMONSTRACOES_CONTABIL",
		"EXIBIR_PLANOS_CONTABIL",
		"EXIBIR_CONFIGURACOES_CONTABIL",
        "EXIBIR_PROCESSOS_CONTABIL",
        "EXIBIR_SUBITEM_CADASTROS_CONTABIL"
	];
	ExibirMenus(array);	
}

function ExibirMenusModuloTributos()
{
	var array = [
		"EXIBIR_MOVIMENTACOES_TRIBUTOS",
		"EXIBIR_SUBSTITUICAOTRIBUTARIAAPURACOES_TRIBUTOS",
        "EXIBIR_CONSULTAS_TRIBUTOS",
		"EXIBIR_DECLARACOES_TRIBUTOS",
        "EXIBIR_APURACOES_TRIBUTOS",
        "EXIBIR_SUBITEM_CADASTROS_TRIBUTOS",
        "EXIBIR_PISCONFINS_TRIBUTOS",
        "EXIBIR_PROCESSOS_TRIBUTOS"

	];
	ExibirMenus(array);
}

function ExibirMenusModuloAtivo()
{
    var array = [
        "EXIBIR_ITENS_ATIVO",
        "EXIBIR_CALCULOS_ATIVO",
        "EXIBIR_CADASTRO_ATIVO",
		"EXIBIR_INVENTARIOS_ATIVO"
	];
	ExibirMenus(array);
}

function ExibirMenusModuloOrcamentos()
{
    var array = [
        "EXIBIR_APROVACOES",
		"EXIBIR_EMPENHOS",
		"EXIBIR_PROCESSOS_ORCAMENTO"
	];
	ExibirMenus(array);
}

function ExibirMenusPortalInterno() {
    var array = [
        "EXIBIR_APROVACOES"
    ];
    ExibirMenus(array);
}

function ExibirMenusModuloProducao() {
    var array = [
        "EXIBIR_ORDENS_PRODUCAO",
        "EXIBIR_ORDENS_RETRABALHO",
        "EXIBIR_ORDENS_DESMONTAGEM",
        "EXIBIR_CADASTRO_PRODUCAO"
    ];
    ExibirMenus(array);
}


//Para alguns papéis que possuem a página default.aspx do wes como home do módulo
function ExibirMenusPaginaDefault() {
    var array = [
        "EXIBIR_APROVACOES"
    ];
    ExibirMenus(array);
}

function ExibirMenusGestorCompras() {
    var array = [
        "EXIBIR_APROVACOES"
    ];
    ExibirMenus(array);
}

function ExibirMenus(arrayVariaveis)
{
	sessionStorage.setItem("EXIBIR_AGENDA_GESTAOCOBRANCA","false");
	sessionStorage.setItem("EXIBIR_CADASTROS_GESTAOCOBRANCA", "false");
	sessionStorage.setItem("EXIBIR_PROCESSOS_SERVIDOR_GESTAOCOBRANCA", "false");
    sessionStorage.setItem("EXIBIR_ORDENSVENDA_COMERCIAL", "false");
    sessionStorage.setItem("EXIBIR_FATURAMENTO_COMERCIAL", "false");
    sessionStorage.setItem("EXIBIR_PROCESSOS_SERVIDOR_COMERCIAL", "false");
    sessionStorage.setItem("EXIBIR_PROPOSTAS_COMERCIAL", "false");
	sessionStorage.setItem("EXIBIR_CPA_FINANCEIRO","false");
	sessionStorage.setItem("EXIBIR_CRE_FINANCEIRO","false");
	sessionStorage.setItem("EXIBIR_TESOURARIA_FINANCEIRO","false");	
	sessionStorage.setItem("EXIBIR_NOTASDEBITOCREDITO_FINANCEIRO", "false");
	sessionStorage.setItem("EXIBIR_PROCESSOS_FINANCEIRO", "false");
	sessionStorage.setItem("EXIBIR_CONSULTAS_FINANCEIRO","false");
	sessionStorage.setItem("EXIBIR_PRECONTRATOS_CONTRATOS","false");
	sessionStorage.setItem("EXIBIR_CONTRATOS_CONTRATOS","false");
	sessionStorage.setItem("EXIBIR_FATURAMENTOCONTRATOS_CONTRATOS","false");
	sessionStorage.setItem("EXIBIR_REQUISICOES_CONTRATOS","false");
	sessionStorage.setItem("EXIBIR_CONSULTAS_CONTRATOS","false");
	sessionStorage.setItem("EXIBIR_ITENS_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_ATENDIMENTO_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_RECEBIMENTOS_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_ALMOXARIFADO_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_RECALCULOS_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_ENTRADA_NOTA_FISCAL_MATERIAIS","false");
	sessionStorage.setItem("EXIBIR_SOLICITACOES_SUPRIMENTOS","false");
	sessionStorage.setItem("EXIBIR_REQUISICOES_SUPRIMENTOS","false");
	sessionStorage.setItem("EXIBIR_COTACOES_SUPRIMENTOS","false");
	sessionStorage.setItem("EXIBIR_ORDENSDECOMPRA_SUPRIMENTOS","false");
	sessionStorage.setItem("EXIBIR_RESSUPRIMENTOS_SUPRIMENTOS","false");
	sessionStorage.setItem("EXIBIR_MOVIMENTACOES_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_CONSULTAS_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_PROCESSOS_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_VALIDACOES_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_DEMONSTRACOES_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_PLANOS_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_CONFIGURACOES_CONTABIL","false");
	sessionStorage.setItem("EXIBIR_MOVIMENTACOES_TRIBUTOS","false");
	sessionStorage.setItem("EXIBIR_SUBSTITUICAOTRIBUTARIAAPURACOES_TRIBUTOS","false");
    sessionStorage.setItem("EXIBIR_CONSULTAS_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_DECLARACOES_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_APURACOES_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_PROCESSOS_SERVIDOR_FINANCEIRO", "false");
    sessionStorage.setItem("EXIBIR_SUBITEM_CADASTROS_CONTABIL", "false");
    sessionStorage.setItem("EXIBIR_SUBITEM_CADASTROS_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_APROVACOES", "false");
    sessionStorage.setItem("EXIBIR_ORDENS_PRODUCAO", "false");
    sessionStorage.setItem("EXIBIR_ORDENS_RETRABALHO", "false");
    sessionStorage.setItem("EXIBIR_ORDENS_DESMONTAGEM", "false");
    sessionStorage.setItem("EXIBIR_CADASTRO_PRODUCAO", "false");
    sessionStorage.setItem("EXIBIR_PISCONFINS_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_PROCESSOS_TRIBUTOS", "false");
    sessionStorage.setItem("EXIBIR_ITENS_ATIVO", "false");
    sessionStorage.setItem("EXIBIR_CALCULOS_ATIVO", "false");
    sessionStorage.setItem("EXIBIR_CADASTRO_ATIVO", "false");
    sessionStorage.setItem("EXIBIR_INVENTARIOS_ATIVO", "false");
    sessionStorage.setItem("EXIBIR_REQUISITOSGRI_ESG", "false");
    sessionStorage.setItem("EXIBIR_GESTAO_PROJETOS", "false");
	sessionStorage.setItem("EXIBIR_GESTAO_KANBAN", "false");
    sessionStorage.setItem("EXIBIR_AQUISICOES_AQUISICOES", "false");
    sessionStorage.setItem("EXIBIR_REQUISICOES_AQUISICOES", "false");
	sessionStorage.setItem("EXIBIR_EMPENHOS", "false");
	sessionStorage.setItem("EXIBIR_PROCESSOS_ORCAMENTO", "false");

	arrayVariaveis.forEach(element => sessionStorage.setItem(element,"true"));
}
