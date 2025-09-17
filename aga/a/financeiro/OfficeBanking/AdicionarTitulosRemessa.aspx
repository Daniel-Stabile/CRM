<%@ Page Title="Títulos da remessa" Language="C#" Inherits="aga.a.Financeiro.OfficeBanking.AdicionarTitulosRemessa,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="TTULOS" Title="Títulos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="FN_PARCELAS.SELECIONARTITULOS.GRID" DefaultFilterName="Padrão" Mode="Fixed" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.HANDLE IN (SELECT P.HANDLE
		FROM FN_PARCELAS P JOIN FN_DOCUMENTOS DOC ON P.DOCUMENTO = DOC.HANDLE
		WHERE (DOC.OPERACAOCANCELAMENTO IS NULL) AND
		(P.DOCUMENTOSUSPENSO = 'N') AND
		(P.PERMUTA = 'N') AND
		(DOC.EHPREVISAO = 'N') AND
		(P.PERMITIRBAIXARPELATESOURARIA = 'S')  AND
		((DOC.ENTRADASAIDA = 'E' AND DOC.TIPODEMOVIMENTO IN (1, 2)) OR (DOC.ENTRADASAIDA = 'E' AND DOC.TIPODEMOVIMENTO = 3)) AND
		(P.EMABERTO = 'S') AND
		(P.PREVISAO &lt;&gt; 'S') AND
		(P.REMESSA IS NULL) AND
                (P.PREREMESSA IS NULL))" FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_FINANCEIRO_OFFICEBANKING_ADICIONARTITULOSREMESSA" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
              $(function(){
    var pagina = Sys.WebForms.PageRequestManager.getInstance();
	if (!pagina.get_isInAsyncPostBack()) {
		pagina.add_endRequest(AjustarCamposFiltro);
	}
    __doPostBack('ctl00$Main$TTULOS$ClearButton','');
    Sys.Application.add_init(appl_init);
	AjustarCamposFiltro();
});

function AjustarCamposFiltro() {
    var buscaAvancada = $('#ctl00_Main_TTULOS_GERAL_BUSCAAVANCADA');
    buscaAvancada.css('border-bottom', '2px solid #a0c2ec');
    buscaAvancada.css('font-weight', '500');
    
    var tituloDocumentos = $('#ctl00_Main_TTULOS_GERAL_TIPOSDOCUMENTO');
    var camposDocumentos = tituloDocumentos.parent().children('.row');
    tituloDocumentos.css('font-size', '16px');
    tituloDocumentos.css('border-bottom', 'none');
    tituloDocumentos.css('margin-bottom', '10px');
    camposDocumentos.css('margin-bottom', '-30px');
    camposDocumentos.css('margin-top', '-30px');
    
    $('th[data-field="VALORLIQUIDOCALCULADO"]').removeClass('text-left').addClass('text-right');
}

function beforeAsyncPostBack() {
    // nada aqui
}

function inicializaCMD_ADICIONAR() {
    comando = '<i class="fa fa-plus btn-action"></i>';
    comando += ' Adicionar selecionados';
    $('#top-CMD_ADICIONAR').html(comando);
    $("#ctl00_Main_TTULOS_footerCommands").children().html(comando)
}

function afterAsyncPostBack() {
    // no clique de um input checkbox
    $('input[type="checkbox"]').on('click', function () {
        
        // seta o padrão do comando adicionar
        inicializaCMD_ADICIONAR();
        
        // zera a variável que controla o valor
        var valorTotal = 0;
        
        // para cada checkbox, que esteja checado, que não seja o checkbox que marca todos
        $('input[type="checkbox"]:checked:not(#ctl00_Main_TTULOS_SimpleGrid_ctl01_SelectAllCheckBoxHeader)').each(function(){
            // busca o TR do checkbox
        	parentTR = $(this).parents('tr:eq(0)');
        	if(parentTR.children('.campoValorLiquidoCalculado').text() !== '' ){
        	   
        	
            	// busca o primeiro TD do tipo currency (campo Valor)
            	TDValor = $(parentTR).children('.campoValorLiquidoCalculado:first').text();
            	
            	
            	
                // busca o texto do filho do TD e remove o cifrão
                strValor = TDValor.replace(/[R$\s]+/, '');
                // remove o ponto
                strValor = strValor.replaceAll('.', '');
                strValor = strValor.replace(',', '.');
    
                // converte
                var valorSelecionado = parseFloat(strValor);
                valorTotal +=!isNaN(valorSelecionado) ? valorSelecionado : 0;
               
                // se possui valor, monta um novo html pro CMD_ADICIONAR
                if (valorTotal > 0)
                {   
                    valorFormatado = 'R$ ' + mascaraValor(valorTotal.toFixed(2));
                    comando = '<i class="fa fa-plus btn-action"></i>';
                    comando += ' Adicionar selecionados';
                    comando += ' (' + valorFormatado + ')';
    
                	$('#top-CMD_ADICIONAR').html(comando);
                	$("#ctl00_Main_TTULOS_footerCommands").children().html(comando)
                }
        	    
            }
        });
    });
    
}

function mascaraValor(valor) {
    valor = valor.toString().replace(/\D/g,"");
    valor = valor.toString().replace(/(\d)(\d{8})$/,"$1.$2");
    valor = valor.toString().replace(/(\d)(\d{5})$/,"$1.$2");
    valor = valor.toString().replace(/(\d)(\d{2})$/,"$1,$2");
    return valor;
}

function appl_init() {
    var pgRegMgr = Sys.WebForms.PageRequestManager.getInstance();
    pgRegMgr.add_beginRequest(BeginHandler);
    pgRegMgr.add_endRequest(EndHandler);
}

function BeginHandler() {
    beforeAsyncPostBack();
}

function EndHandler() {           
    afterAsyncPostBack();
}

              </script>
      </asp:Content>
    