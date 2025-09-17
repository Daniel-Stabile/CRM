<%@ Page Title="Conciliação Bancária Manual" Language="C#" Inherits="aga.e.Financeiro.ConciliacaoBancaria.ConciliarManualPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <asp:HiddenField runat="server" ID="Vinculos" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="VinculosSelecionados" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="VinculosARemover" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="TelaFiltro" Value="1" ClientIDMode="Static" />

    <asp:HiddenField runat="server" ID="LCNCSelecionaTodosItens" Value="-1" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="LCNCQtdItens" Value="0" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="LCNCQtdMaxItens" Value="0" ClientIDMode="Static" />

    <asp:HiddenField runat="server" ID="EXNCSelecionaTodosItens" Value="-1" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="EXNCQtdItens" Value="0" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="EXNCQtdMaxItens" Value="0" ClientIDMode="Static" />

    <!--<asp:HiddenField runat="server" ID="NoAutoTopActions" Value="0" ClientIDMode="Static" /> -->

    <!-- <asp:HiddenField runat="server" ID="LCCSelecionaTodosItens" Value="-1" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="LCCQtdItens" Value="0" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="LCCQtdMaxItens" Value="0" ClientIDMode="Static" />

    <asp:HiddenField runat="server" ID="EXCSelecionaTodosItens" Value="-1" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="EXCQtdItens" Value="0" ClientIDMode="Static" />
    <asp:HiddenField runat="server" ID="EXCQtdMaxItens" Value="0" ClientIDMode="Static" /> -->

    <script src="<%= ResolveUrl("~/Content/js/BennerGrid.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/jquery.table2excel.js")%>"></script>
    <script src="<%= ResolveUrl("~/Content/js/RazaoConta.js")%>"></script>
    <script src="<%= ResolveUrl("~/PortalGerais/e/Scripts/erp.js")%>"></script>

    <div class="row" id="divFiltros">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="row">
                <erp:ErpFilterForm runat="server"
                    EntityViewName="WEB_FN_FILTROCONCILIARMANUAL.FORM"
                    ID="Filtro"
                    Title="Conciliar Manual"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="False"
                    UserDefinedCommandsVisible="true"
                    ShowTitle="true"
                    UserDefinedCriteriaWhereClause=""
                    OnCommandExecute="Filtro_CommandExecuted"
                    ChromeState="Fixed"
                    PageWidgetHandle="1" />
            </div>
        </div>
    </div>
    <div class="row" id="divResultados">
        <div class="col-lg-12 col-md-12 col-sm-12" style="margin-top: -1px">
            <div class="portlet light" style="padding-bottom: 5px;">
                <div class="portlet-title">
                    <div class="caption">
                        <span class="caption-subject font-green-sharp bold uppercase">Conciliação manual</span>
                        <span class="caption-helper" id="conciliarDescricao"></span>
                    </div>
                </div>
                <div class="portlet-body form">
                    <div class="row">
                        <div class="form-actions top nobg no-border commands-bar fluid list-commands-bar" style="margin-left: 15px;">
                            <a href="#" onclick="ExibirFiltros(true)" class="btn grey-silver btn-save command-action predef-action editable" title="Voltar para formulário de filtro."><i class="fa fa-arrow-left" style="margin-right: 5px;"></i>Voltar para filtros</a>
                        </div>
                    </div>
                    <div class="tabbable-custom ">
                        <ul class="nav nav-pills" onclick="AtualizarFiltro()">
                            <li class="nav-item active">
                                <a class="nav-link" href="#naoConciliados" data-toggle="tab">Não conciliados</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#conciliados" data-toggle="tab">Conciliados</a>
                            </li>
                        </ul>
                        <div class="tab-content" style="display: table; width: 100%;">
                            <div class="tab-pane active" id="naoConciliados">
                                <wes:CommandsPanel 
                                    runat="server" 
                                    ID="ComandosNaoConciliados" 
                                    Title="Comandos" 
                                    Subtitle="" 
                                    PortletCssClass="" 
                                    PortletLayout="None" 
                                    BootstrapCols="12" 
                                    FontIcon="" 
                                    ShowTitle="false" 
                                    ProviderWidgetUniqueId="" 
                                    ChromeState="Fixed" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="TS_LANCAMENTOS.NAOCONCILIADOS.COMANDOS.GRID" 
                                    VerticalOrientation="False" 
                                    PageId="" 
                                    Level="20" 
                                    Order="10"  />
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="LancamentoSistemaNaoConciliados"
                                    Title="Lançamentos no sistema"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="6"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="TS_LANCAMENTOS.NAOCONCILIADOS.GRID"
                                    Mode="None"
                                    FormUrl="~/aga/e/financeiro/tesouraria/Form.aspx?readOnly=S"
                                    PageId="AGA_E_FINANCEIRO_TESOURARIA_FORM"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22427"
                                    Level="20"
                                    Order="20" />
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="LancamentoExtratoNaoConciliados"
                                    Title="Lançamentos no extrato"
                                    CssClass="no-auto-top-actions"
                                    Subtitle=""
                                    PortletCssClass="no-auto-top-actions"
                                    PortletLayout="Default"
                                    BootstrapCols="6"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="TS_EXTRATOBANCARIO.NAOCONCILIADOS.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22428"
                                    Level="20"
                                    Order="30" />
                            </div>
                            <div class="tab-pane" id="conciliados">
                                <wes:CommandsPanel 
                                    runat="server" 
                                    ID="ComandosConciliados" 
                                    Title="Comandos" 
                                    Subtitle="" 
                                    PortletCssClass="" 
                                    PortletLayout="None" 
                                    BootstrapCols="12" 
                                    FontIcon="" 
                                    ShowTitle="false" 
                                    ProviderWidgetUniqueId="" 
                                    ChromeState="Fixed" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="TS_LANCAMENTOS.CONCILIADOS.COMANDOS.GRID" 
                                    VerticalOrientation="False" 
                                    PageId="" 
                                    Level="20" 
                                    Order="10"  />
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="LancamentoSistemaConciliados"
                                    Title="Lançamentos no sistema"
                                    OnSelectedIndexChanged="LancamentoSistemaConciliados_Load"
                                    OnChecked="LancamentoSistemaConciliados_Load"
                                    OnRefreshWidget="LancamentoSistemaConciliados_Load"
                                    RefreshOnSelectRows="False"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="6"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="TS_LANCAMENTOS.CONCILIADOS.GRID"
                                    Mode="None"
                                    FormUrl="~/aga/e/financeiro/tesouraria/Form.aspx?readOnly=S"
                                    PageId="AGA_E_FINANCEIRO_TESOURARIA_FORM"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22427"
                                    Level="20"
                                    Order="20" />
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="LancamentoExtratoConciliados"
                                    OnSelectedIndexChanged="LancamentoSistemaConciliados_Load"
                                    OnChecked="LancamentoSistemaConciliados_Load"
                                    OnRefreshWidget="LancamentoSistemaConciliados_Load"
                                    RefreshOnSelectRows="False"
                                    Title="Lançamentos no extrato"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="6"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId=""
                                    ChromeState="Fixed"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="TS_EXTRATOBANCARIO.CONCILIADOS.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="True"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22428"
                                    Level="20"
                                    Order="30" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .totalizer-row, .multi-select-message {
            display: none;
        }

        .somatorio-valor, .somatorio-valor:hover {
            cursor: auto;
            height: 30px;
        }

        .diferenca {
            margin-top: -5px;
            margin-left: 5px;
        }
    </style>

    <script type="text/javascript">
        var sistemaNaoConciliados = 'LancamentoSistemaNaoConciliados';
        var extratoNaoConciliados = 'LancamentoExtratoNaoConciliados';
        var sistemaConciliados = 'LancamentoSistemaConciliados';
        var extratoConciliados = 'LancamentoExtratoConciliados';
		
		// 2261326
		 $(document).on('click', 'input', function () {
            setTimeout(() => ChamarAtualizarValores(), 1500)
         });

        function formatarIndice(numero) {
            if (numero <= 9) {
                return '0' + numero;
            } else {
                return numero.toString();
            }
        }

        function ChamarAtualizarValores() {
            __doPostBack('ctl00$Main$ComandosConciliados', 'CMD_ATUALIZARVALORES')
        }

        function AtualizarFiltro() {
            __doPostBack('ctl00$Main$ComandosConciliados', 'CMD_VINCULAR')
        }

        Sys.Application.add_init(appl_init);
        function appl_init() {
            var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
            pgRegMgr.add_initializeRequest(BeginHandler);
            pgRegMgr.add_endRequest(EndHandler);
        }

        function BeginHandler(sender, args) {
            var req = document.getElementById('__EVENTTARGET');
        }

        function EndHandler() {
            ExibirFiltros(false);
            MostrarSomarValores();
        }

        function MostrarGrid() {
            var filtros = $('#portlet_Filtro');
            var resultados = $('#divResultados');
            filtros.hide();
            resultados.show();
            AtribuirMensagem();
        }
        

        //Métodos a serem executados no evento load da página.
        $(function () {
            ExibirFiltros(true);
        });

        //Exibe ou esconde o portlet de filtros a premissa é que escondendo o filtro mostraremos os resultados(grid) e vice-versa
        function ExibirFiltros(exibe) {
            var temErros = ($('#ctl00_Main_Filtro_MsgUser').css('display') == 'block') && ($('#ctl00_Main_Filtro_MsgUser')[0].className.includes('alert-error'));
            var filtros = $('#portlet_Filtro');
            var resultados = $('#divResultados');

            if (exibe || temErros) {
                $('#TelaFiltro').val('1')
                filtros.show();
                resultados.hide();
            }
            else {
                $('#TelaFiltro').val('0')
                toastr.remove();

                var nomeConta = $('[data-fieldname="CONTACORRENTE"]')[0].innerText;

                if (nomeConta != null && nomeConta != "")
                    $('#conciliarDescricao').text('(' + nomeConta + ')');
            }

            LimparClasseTopAction('Lancamento');
        }

        function SetarValor(id, valor) {
            $("#portlet_" + id).find(".actions").html("<label class='btn btn-transparent default btn-outline btn-circle btn-sm active somatorio-valor'>R$ <b>" + parseFloat(valor.replace(',', '.')).toLocaleString('pt-br', {minimumFractionDigits: 2}) + "</b> selecionado</label>");
        }

        function SetarValorDiferenca(id, valor) {
            var cor = 'default';
            if (valor != 0)
                cor = 'red';

            valor = valor.toLocaleString('pt-br', {minimumFractionDigits: 2});

            $("#portlet_" + id).find(".tools").html("<label class='btn btn-transparent " + cor + " btn-outline btn-circle btn-sm active somatorio-valor diferenca'>R$ <b>" + valor + "</b> diferença</label>");
        }

        function MostrarSomarValores() {
            // Explicação da rotina: Para as seleções de itens já conciliados, é buscado todos os vínculos do item e fazendo a seleção do mesmo.
            // Quando o item não se encontra na página atual, a seleção não funciona, por isso os vínculos são armazenados em um hidden field
            // O backend se baseia nos itens selecionados e também nos itens presentes no hidden field, mantendo a integridade dos itens que devem ser selecionados
            // Ao entrar na página em que um dos vínculos está presente, ele é preenchido
            // Os valores e itens do vínculo se mantém preenchidos no backend, mesmo que não selecionados em uma página não visível no front
            $('input[type="checkbox"][id*="SistemaConciliados"], input[type="checkbox"][id*="ExtratoConciliados"], input[type="checkbox"][id*="SistemaNaoConciliados"], input[type="checkbox"][id*="ExtratoNaoConciliados"]')
            .on('change', function (evt) {
                // quando o evento não for gerado pelo usuário, deve ser desconsiderado, pois os checklists selecionados via javascript também geram esse evento, então traria recursividade
                if (!evt
                    || ((!evt.originalEvent || !evt.originalEvent.srcElement)
                        && !evt.currentTarget)
                    || !evt.originalEvent.isTrusted) {
                    return
                }
                if (evt.originalEvent.srcElement.id.includes('LancamentoSistemaNaoConciliados')) {
                    id = 'LCNC'
                }
                else if (evt.originalEvent.srcElement.id.includes('LancamentoSistemaConciliados')) {
                    id = 'LCC'
                }
                else if (evt.originalEvent.srcElement.id.includes('LancamentoExtratoNaoConciliados')) {
                    id = 'EXNC'
                }
                else if (evt.originalEvent.srcElement.id.includes('LancamentoExtratoConciliados')) {
                    id = 'EXC'
                }
                var itemConciliado = ['LCC', 'EXC'].includes(id)
                if (!itemConciliado && evt.originalEvent.srcElement.id.indexOf("CheckBoxSelectedEntity") !== -1) {
                    AtualizarQuantidadeItens(id)
                    document.getElementById(`${id}SelecionaTodosItens`).value = -1;//não exibe nenhuma mensagem
                    $(`#divMensagemParaLimparSelecao${id}`).hide();
                    $(`#divMensagemParaSelecionarTodos${id}`).hide();
                }
                
                if (!itemConciliado && evt.originalEvent.srcElement.id.indexOf("SelectAllCheckBoxHeader") !== -1) {
                    AtualizarQuantidadeItens(id)
                    $(`#divMensagemParaLimparSelecao${id}`).hide();
                    if (evt.originalEvent.srcElement.checked) {
                        document.getElementById(`${id}SelecionaTodosItens`).value = 0;//exibe mensagem para selecionar todos
                        $(`#divMensagemParaSelecionarTodos${id}`).show();
                    } else {
                        document.getElementById(`${id}SelecionaTodosItens`).value = -1;//não exibe nenhuma mensagem
                        $(`#divMensagemParaSelecionarTodos${id}`).hide();
                    }
                }

                var handlesGrid = []
                var checando = evt.currentTarget.checked
                var itemExtrato = evt.currentTarget.id.includes('ExtratoConciliados')
                var selecionaTodos = evt.currentTarget.id.includes('SelectAllCheckBoxHeader')
                if (selecionaTodos) {
                    var body = evt.currentTarget.parentElement.parentElement.parentElement.parentElement.parentElement.querySelector('tbody')
                    var linhas = Array.from(body.querySelectorAll('tr'))
                    var linhasValidas = linhas.filter(where => where.hasAttribute('handle'))
                    handlesGrid = linhasValidas.map(item => item.getAttribute('handle'))
                }
                var handleSelecionado = evt.currentTarget.parentElement.parentElement.parentElement.getAttribute('handle')
                var itensAVincular = []
                var itensARemover = []
                var stringVinculosSelecionados = $('#VinculosSelecionados').val()
                var vinculosSelecionados = stringVinculosSelecionados.split('-').filter(n => n)
                var stringVinculosARemover = $('#VinculosARemover').val()
                var vinculosARemover = stringVinculosARemover.split('-').filter(n => n)

                var stringVinculos = $("#Vinculos").val()
                var vinculos = stringVinculos.split("-").filter(n => n)

                if (checando) {                    
                    for (let i = 0; i < vinculos.length; i++) {
                        vinculo = vinculos[i].split('||')
                        var lancamentos = vinculo[0]
                        var extratos = vinculo[1]
                        if (((selecionaTodos && (itemExtrato && handlesGrid.some(item => extratos.includes(item))) || handlesGrid.some(item => lancamentos.includes(item)))
                            || (itemExtrato && extratos.split(',').includes(handleSelecionado))
                                || lancamentos.split(',').includes(handleSelecionado))) {
                            itensAVincular.push(vinculo)
                            if (!vinculosSelecionados.includes(lancamentos + '||' + extratos))
                                vinculosSelecionados.push(lancamentos + '||' + extratos)
                        }

                        var remocoes = []
                        for (let j = 0; j < vinculosARemover.length; j++) {
                            var vinculoRmv = vinculosARemover[j].split('||')
                            if (selecionaTodos || (itemExtrato && vinculoRmv[1].split(',').includes(handleSelecionado)) || vinculoRmv[0].split(',').includes(handleSelecionado)) {
                                remocoes.push(vinculoRmv)
                            }
                        }

                        if (remocoes.length > 0) {
                            vinculosARemover = vinculosARemover.filter(where => !remocoes.some(arr => where.includes(arr[0] + '||' + arr[1])))
                        }
                    }
                } else {
                    for (let i = 0; i < vinculos.length; i++) {
                        vinculo = vinculos[i].split('||')
                        var lancamentos = vinculo[0]
                        var extratos = vinculo[1]
                        if (((selecionaTodos && (itemExtrato && handlesGrid.some(item => extratos.includes(item))) || handlesGrid.some(item => lancamentos.includes(item)))
                                || (itemExtrato && extratos.split(',').includes(handleSelecionado))
                                    || lancamentos.split(',').includes(handleSelecionado))) {
                                itensARemover.push(vinculo)
                                if (!vinculosARemover.includes(lancamentos + '||' + extratos))
                                    vinculosARemover.push(lancamentos + '||' + extratos)
                        }

                        var remocoes = []
                        for (let j = 0; j < vinculosSelecionados.length; j++) {
                            var vinculoRmv = vinculosSelecionados[j].split('||')
                            if (selecionaTodos || (itemExtrato && vinculoRmv[1].split(',').includes(handleSelecionado)) || vinculoRmv[0].split(',').includes(handleSelecionado)) {
                                remocoes.push(vinculoRmv)
                            }
                        }

                        if (remocoes.length > 0) {
                            vinculosSelecionados = vinculosSelecionados.filter(where => !remocoes.some(arr => where.includes(arr[0] + '||' + arr[1])))
                        }
                    }
                }

                if (itensAVincular.length > 0) {
                    setTimeout(() => ChecarVinculos(itensAVincular, true), 1000)
                }
                if (itensARemover.length > 0) {
                    setTimeout(() => ChecarVinculos(itensARemover, false), 1000)
                }

                $('#VinculosSelecionados').val('')
                for (let i = 0; i < vinculosSelecionados.length; i++) {
                    $('#VinculosSelecionados').val($('#VinculosSelecionados').val() + '-' + vinculosSelecionados[i])
                }

                $('#VinculosARemover').val('')
                for (let i = 0; i < vinculosARemover.length; i++) {
                    $('#VinculosARemover').val($('#VinculosARemover').val() + '-' + vinculosARemover[i])
                }

                setTimeout(() => ChamarAtualizarValores(), 2000)
            })

            // evento dos botões de troca de página
            $('a[id*="btPreviousPage"], a[id*="btNextPage"], i[class*="fa-angle"]')
            .on('click', function (evt) {
                var element = evt.originalEvent.srcElement.tagName.toLowerCase() == 'i' ? evt.originalEvent.srcElement.parentElement : evt.originalEvent.srcElement
                if (!element.id.includes('Nao')
                    && (element.id.includes('btNextPage')
                || element.id.includes('btPreviousPage'))) {
                    RemarcarVinculos()
                } else if (element.id.includes('btNextPage')
                || element.id.includes('btPreviousPage')) {
                    AtribuirMensagem()
                }
            })

            
            $(window).on('resize', function() {
                AjustarTamanho(extratoNaoConciliados);
                AjustarTamanho(extratoConciliados);
            }); 
        }

        function AjustarTamanho(id) {
            var grid = $("#portlet_" + id);

            if (grid.width() <= 650) 
                grid.find('.caption').css('width', '100%');
            else 
                grid.find('.caption').css('width', 'auto');
        }

        function CalcularDiferenca(valorSistema, valorExtrato) {
            valorSistema = parseFloat(DesformatarValor(valorSistema));
            valorExtrato = parseFloat(DesformatarValor(valorExtrato));

            return valorSistema - valorExtrato;
        }

        function recuperarValor(id, campo) {
            var valor = "0,00";
            var grid = $('#portlet_' + id);
            if (grid.find("input[type='checkbox']:checked:not(#ctl00_Main_" + id + "_SimpleGrid_ctl01_SelectAllCheckBoxHeader)").length > 0) {
                var itens = grid.find("input[type='checkbox']:checked:not(#ctl00_Main_" + id + "_SimpleGrid_ctl01_SelectAllCheckBoxHeader)")
                let valores = []
                let soma = 0
                for (let i = 0; i < itens.length; i++) {
                    let valorLinha = itens[i].parentNode.parentNode.parentNode.querySelector(`td[data-field="${campo}"]`).querySelector('a').textContent
                    valores.push(valorLinha)
                }
                if (valores.length > 0) {
                    for (var i = 0; i < valores.length; i++) {
                        var valorNumerico = parseFloat(valores[i].replace("R$", "").replaceAll(".", "").replace(",", "."));
                        soma += valorNumerico;
                    }
                    valor = "R$ " + soma.toLocaleString("pt-BR", { minimumFractionDigits: 2 });
                }
            }
            return valor;
        }

        function DesformatarValor(valor) {
            return valor.replaceAll(".", "").replace(",", ".");
        }

        function ReceberVinculos(vinculos) {
            $("#Vinculos").val(vinculos)
        }

        function ChecarVinculos(itensAVincular, checar) {
            var lancamentos = []
            var extratos = []
            var lancamentosSelecionados = []
            var extratosSelecionados = []

            for (let i =0; i < itensAVincular.length; i++) {
                lancamentos.push(itensAVincular[i][0].split(','))
                extratos.push(itensAVincular[i][1].split(','))
            }

            lancamentos = [].concat(...lancamentos)
            extratos = [].concat(...extratos)

            var tableLancamentos = document.getElementById('ctl00_Main_LancamentoSistemaConciliados_SimpleGrid')
            var tbodyLancamentos = tableLancamentos.querySelector('tbody')
            var linhasLancamentos = tbodyLancamentos.querySelectorAll('tr:not(.totalizer-row)')

            for (let i = 0; i < linhasLancamentos.length; i++) {
                var idCheckbox = `ctl00_Main_LancamentoSistemaConciliados_SimpleGrid_ctl${formatarIndice(i + 2)}_CheckBoxSelectedEntity`
                var handle = linhasLancamentos[i].getAttribute('handle')
                if (handle && lancamentos.includes(handle)) {
                    var element = document.getElementById(idCheckbox)
                    element.checked = checar
                    var evt = document.createEvent("HTMLEvents");
                    evt.initEvent("change", false, true);
                    element.dispatchEvent(evt);
                    lancamentosSelecionados.push(handle)
                    lancamentos = lancamentos.filter(item => item != handle)
                }
            }


            if (lancamentos.length > 0) {
                $('#LancamentosManuais').val(lancamentos.join(","))
            }

            var tableExtratos = document.getElementById('ctl00_Main_LancamentoExtratoConciliados_SimpleGrid')
            var tbodyExtratos = tableExtratos.querySelector('tbody')
            var linhasExtratos = tbodyExtratos.querySelectorAll('tr:not(.totalizer-row)')
             
            for (let i = 0; i < linhasExtratos.length; i++) {
                var idCheckbox = `ctl00_Main_LancamentoExtratoConciliados_SimpleGrid_ctl${formatarIndice(i + 2)}_CheckBoxSelectedEntity`
                var handle = linhasExtratos[i].getAttribute('handle')
                
                if (handle && extratos.includes(handle)) {
                    var element = document.getElementById(idCheckbox)
                    element.checked = checar
                    extratosSelecionados.push(handle)
                    extratos = extratos.filter(item => item != handle)
                }
            }

            if (extratos.length > 0) {
                $('#ExtratosManuais').val(extratos.join(","))
            }
        }

        function AtualizarValores(lancamentosNaoConciliados, extratosNaoConciliados, lancamentosConciliados, extratosConciliados) {
            lancamentosNaoConciliados = lancamentosNaoConciliados.toString().replaceAll('.', ',')
            extratosNaoConciliados = extratosNaoConciliados.toString().replaceAll('.', ',')
            lancamentosConciliados = lancamentosConciliados.toString().replaceAll('.', ',')
            extratosConciliados = extratosConciliados.toString().replaceAll('.', ',')
            var diferencaNaoConciliados = CalcularDiferenca(lancamentosNaoConciliados, extratosNaoConciliados)
            var diferencaConciliados = CalcularDiferenca(lancamentosConciliados, extratosConciliados)

            if (lancamentosNaoConciliados != 'na' && extratoNaoConciliados != 'na') {
                SetarValor(sistemaNaoConciliados, lancamentosNaoConciliados.toString())
                SetarValor(extratoNaoConciliados, extratosNaoConciliados.toString())
                SetarValorDiferenca(extratoNaoConciliados, diferencaNaoConciliados)
            }
            SetarValor(sistemaConciliados, lancamentosConciliados.toString())
            SetarValor(extratoConciliados, extratosConciliados.toString())
            SetarValorDiferenca(extratoConciliados, diferencaConciliados)
        }

        function ReceberTotalizadores(lancamentosConciliados, linhasLcConciliado, extratosConciliados, linhasExConciliado, lancamentosNaoConciliados, linhaLcNConciliado, extratosNaoConciliados, linhasExtratoNConciliado) {
            $('#LCNCQtdMaxItens').val(linhaLcNConciliado)
            $('#LCCQtdMaxItens').val(linhasLcConciliado)
            $('#EXNCQtdMaxItens').val(linhasExtratoNConciliado)
            $('#EXCQtdMaxItens').val(linhasExConciliado)
            
            $('#LCNCQtdItens').val(lancamentosNaoConciliados)
            $('#LCCQtdItens').val(lancamentosConciliados)
            $('#EXNCQtdItens').val(extratosNaoConciliados)
            $('#EXCQtdItens').val(extratosConciliados)
        }

        function AtribuirMensagem() {
            MontarDivMensagemSelecionarTodos("LCNC", 0, "LancamentoSistemaNaoConciliados");
            MontarDivMensagemSelecionarTodos("EXNC", 1, "LancamentoExtratoNaoConciliados");
            // não usando essa funcionalidade para itens conciliados pois gera problemas na seleção dos vínculos
            // MontarDivMensagemSelecionarTodos("LCC", 2, "LancamentoSistemaConciliados");
            // MontarDivMensagemSelecionarTodos("EXC", 3, "LancamentoExtratoConciliados");
        }

        function MontarDivMensagemSelecionarTodos(id, index, fullId) {
            var qtdItens = parseInt(document.getElementById(`${id}QtdItens`).value);
            var qtdMaxItens = parseInt(document.getElementById(`${id}QtdMaxItens`).value);
            
            if (qtdItens > qtdMaxItens) {
                if (document.getElementById(`${id}SelecionaTodosItens`).value === '0' && $(`#divMensagemParaSelecionarTodos${id}`).length > 0 && document.getElementById(`ctl00_Main_${fullId}_SimpleGrid_ctl01_SelectAllCheckBoxHeader`).checked) {
                    $(`#divMensagemParaSelecionarTodos${id}`).show()
                } else if (document.getElementById(`${id}SelecionaTodosItens`).value === '1' && $(`#divMensagemParaLimparSelecao${id}`).length > 0 && document.getElementById(`ctl00_Main_${fullId}_SimpleGrid_ctl01_SelectAllCheckBoxHeader`).checked) {
                    $(`#divMensagemParaLimparSelecao${id}`).show();
                }
                if ($(`#divMensagemParaSelecionarTodos${id}`).length === 0 || !document.getElementById(`ctl00_Main_${fullId}_SimpleGrid_ctl01_SelectAllCheckBoxHeader`).checked) {
                    var displayMensagemParaSelecionar = 'style="display: none;"';
                    var displayMensagemParaLimparSelecao = 'style="display: none;"';

                    if (document.getElementById(`ctl00_Main_${fullId}_SimpleGrid_ctl01_SelectAllCheckBoxHeader`).checked) {
                        if (document.getElementById(`${id}SelecionaTodosItens`).value === '0') {
                            displayMensagemParaSelecionar = '';
                        } else if (document.getElementById(`${id}SelecionaTodosItens`).value === '1') {
                            displayMensagemParaLimparSelecao = '';
                        }
                    }
                    var parent = $(".table-responsive")[index];
                    qtdMaxItens = BuscarItensChecados(id)

                    var child = '<div>                                                                                                                               ' +
                                '   <div id="divMensagemParaSelecionarTodos'+ id + '" ' + displayMensagemParaSelecionar + '>                                                 ' +
                                '      <br><label>Todos os <span style="font-weight: 600;" id="' + id + 'QtdItensLbl">' + qtdMaxItens + '</span> Itens nesta p&aacute;gina est&atilde;o selecionados. </label>' +
                                '      <a id="selecionaTodos" onclick="SelecionarTodosItens(true, \'' + id + '\',' + index + ')" style="font-weight: 600;">                                  ' +
                                '             Selecionar todos os <span style="font-weight: 600;" id="' + id + 'QtdMaxItensLbl2">' + qtdItens + '</span> Itens existentes</a>                             ' +
                                '   </div>                                                                                                                          ' +
                                '   <div id="divMensagemParaLimparSelecao' + id + '" ' + displayMensagemParaLimparSelecao + '>                                                ' +
                                '      <br><label>Todos os <span style="font-weight: 600;" id="' + id + 'QtdMaxItensLbl">' + qtdItens + '</span> documentos est&atilde;o selecionados.</label>                            ' +
                                '      <a id="deselecionaTodos" onclick="SelecionarTodosItens(false, \'' + id + '\',' + index + ')" style="font-weight: 600;">Limpar sele&ccedil;&atilde;o</a>             ';
                    '   </div>                                                                                                                          ' +
                    '</div>                                                                                                                             ';
                    parent.insertAdjacentHTML('beforebegin', child);
                }
            }
        }

        function RemarcarVinculos() {
            var itensAVincular = []
            var itensARemover = []
            
            var vinculos = $('#VinculosSelecionados').val().split("-").filter(n => n)
            var vinculosARemover = $('#VinculosARemover').val().split("-").filter(n => n)

            for (let i = 0; i < vinculos.length; i++) {
                vinculo = vinculos[i].split('||')
                itensAVincular.push(vinculo)
            }
            for (let i = 0; i < vinculosARemover.length; i++) {
                vinculo = vinculosARemover[i].split('||')
                itensARemover.push(vinculo)
            }

            setTimeout(() => {
                ChecarVinculos(itensAVincular, true)
                ChecarVinculos(itensARemover, false)
                ChamarAtualizarValores()
            }, 1000)
        }

        function BuscarItensChecados(id) {
            var idDiv = ''
            if (id == 'LCNC') {
                idDiv = sistemaNaoConciliados
            }
            if (id == 'EXNC') {
                idDiv = extratoNaoConciliados
            }
            if (id == 'LCC') {
                idDiv = sistemaConciliados
            }
            if (id == 'EXC') {
                idDiv = extratoConciliados
            }

            var qtdSelecionados = -1
            var grid = $('#portlet_' + idDiv);
            if (grid.find("input[type='checkbox']:checked:not(#ctl00_Main_" + idDiv + "_SimpleGrid_ctl01_SelectAllCheckBoxHeader)").length > 0) {
                var itens = grid.find("input[type='checkbox']:checked:not(#ctl00_Main_" + idDiv + "_SimpleGrid_ctl01_SelectAllCheckBoxHeader)")
                qtdSelecionados = itens.length
            }

            return qtdSelecionados
        }

        function AtualizarQuantidadeItens(id) {
            var qtdItens = parseInt(document.getElementById(`${id}QtdItens`).value);
            var qtdMaxItens = BuscarItensChecados(id)

            if (document.getElementById(`${id}QtdItensLbl`))
                document.getElementById(`${id}QtdItensLbl`).innerText = qtdMaxItens.toString()
            
            if (document.getElementById(`${id}QtdMaxItensLbl`))
                document.getElementById(`${id}QtdMaxItensLbl`).innerText = qtdItens.toString()

            if (document.getElementById(`${id}QtdMaxItensLbl2`))
                document.getElementById(`${id}QtdMaxItensLbl2`).innerText = qtdItens.toString()
        }

        function SelecionarTodosItens(selecionar, id, index) {
            AtualizarQuantidadeItens(id)
            var qtdItens = parseInt(document.getElementById(`${id}QtdItens`).value);
            var qtdMaxItens = parseInt(document.getElementById(`${id}QtdMaxItens`).value);

            if (selecionar) {
                document.getElementById(`${id}SelecionaTodosItens`).value = 1; // exibe mensagem para limpar seleção
                __doPostBack('ctl00$Main$ComandosConciliados', 'CMD_SELECIONARTODOS')
                setTimeout(() => {
                    $(`#divMensagemParaLimparSelecao${id}`).show();
                    $(`#divMensagemParaSelecionarTodos${id}`).hide();
                }, 100)
            } else {
                $(`#divMensagemParaLimparSelecao${id}`).hide();
                $(`#divMensagemParaSelecionarTodos${id}`).hide();
                document.getElementById(`${id}SelecionaTodosItens`).value = -1; // não exibe nenhuma mensagem
                var chekboxHeader = $("[id$=SelectAllCheckBoxHeader]");
                if (chekboxHeader.length > 0 && chekboxHeader[index].checked) {
                    chekboxHeader[index].click();
                }
            }
            setTimeout(() => ChamarAtualizarValores(), 1000)
        }

        function LimparVinculosSelecionados() {
            $('#VinculosSelecionados').val('')
            $('#VinculosARemover').val('')
            ChamarAtualizarValores()
        }

        function LimparHiddenFields() {
            $('#LCNCSelecionaTodosItens').val('')
            $('#EXNCSelecionaTodosItens').val('')
            // $('#LCCSelecionaTodosItens').val('')
            // $('#EXCSelecionaTodosItens').val('')
        }
    </script>
</asp:Content>
