<%@ Page Title="Novo lançamento" Language="C#" Inherits="aga.a.contabil.lancamentos.lancamentosNewLancamentosPage,Benner.Corporativo.Wes.WebApp" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <div class="row">
        <wes:Tile runat="server" ID="TILEVALORDEBITO" Title="TILEVALORDEBITO" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.CONTABEIS.CUSTOM.GRID" CompanyFilterMode="None" CriteriaWhereClause="(A.DOCUMENTO = 0 AND A.ORIGEM = 1 AND A.EMPRESA = @EMPRESA AND A.LOTE = 0 AND A.NATUREZA = 'D')" Value="VALOR" Description="Valor Débito" Icon="fa fa-minus" Color="blue" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="2"  />
        <wes:Tile runat="server" ID="TILEVALORCREDITO" Title="TILEVALORCREDITO" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.CONTABEIS.CUSTOM.GRID" CompanyFilterMode="None" CriteriaWhereClause="(A.DOCUMENTO = 0 AND A.ORIGEM = 1 AND A.EMPRESA = @EMPRESA AND A.LOTE = 0 AND A.NATUREZA = 'C')" Value="VALOR" Description="Valor Crédito" Icon="fa fa-plus" Color="red" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="5"  />
        <wes:Tile runat="server" ID="TILEDIFERENCA" Title="TILEDIFERENCA" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOSTILE.DATASOURCE.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.DOCUMENTO= 0" Value="DIFERENCA" Description="Diferença" Color="yellow-crusta" ValueAggregation="Sum" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="8"  />
        <wes:Tile runat="server" ID="TILEDOCUMENTO" Title="TILEDOCUMENTO" Subtitle="" PortletCssClass="" PortletLayout="None" BootstrapCols="3" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_DOCUMENTOS.CUSTOM.GRID" CompanyFilterMode="None" CriteriaWhereClause="A.HANDLE = 0" Value="DOCUMENTOCONTABIL" Description="Documento" Icon="fa fa-file" Color="grey-cascade" ValueAggregation="None" TileType="Default" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="9"  />
        <wes:AjaxForm runat="server" ID="NOVOLANAMENTO" Title="Inf. Lançamento" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="7" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="LANAMENTOS" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.NEW.CUSTOM.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="10"  />
        <wes:SimpleGrid runat="server" ID="LANAMENTOS" Title="Lançamentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="5" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOS.NEW.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="15"  />
        <wes:SimpleGrid runat="server" ID="CENTRODECUSTOS" Title="Centro de custos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="NOVOLANAMENTO" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CT_LANCAMENTOCC.NEW.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="(A.LANCAMENTO = @CAMPO(HANDLE) AND A.DOCUMENTO = @CAMPO(DOCUMENTO) AND A.NATUREZA = @CAMPO(NATUREZA))" FormUrl="~/aga/a/Contabil/lancamentos/NovolancamentoCC.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" CssClass="hide" PageId="AGA_A_CONTABIL_LANCAMENTOS_NEWLANCAMENTOS" Level="20" Order="20"  />
        </div>
    
        <script type="text/javascript">
                      var steps;
        $(function () {
            steps = [
                {
                element: '#NOVOLANAMENTO',
        	    title: 'Dados do lançamento.',
    			content: "Aqui estão disponíveis os campos necessários para inclusão de um novo lançamento, os de preenchimento obrigatório são marcados com '*'.",
    			placement: 'right',
                backdrop: true
            },
    		{
                element: '#portlet_LANAMENTOS',
        	    title: 'Lancamentos efetuados.',
    			content: 'Aqui estão listados os lançamentos efetuados para o documento atual.',
    			placement: 'left',
                backdrop: true
            },
    		{
                element: '#CENTRODECUSTOS',
        	    title: 'Lancamentos efetuados.',
    			content: 'Aqui ficam listados os centros de custo vinculados ao lançamento.',
    			placement: 'top',
                backdrop: true
            },
    		{
                element: '#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_DOCUMENTO_ctl01_text',
        	    title: 'Documento vinculado.',
    			content: 'Campo preenchido automaticamente, após inclusão do lançamento o sistema gera um novo documento, com base nos dados do lançamento informado.',
    			placement: 'bottom',
    			backdrop: true
            },
    		{
    			element: '#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_CONTADEBITO_ctl01_select',
        	    title: 'Conta de debito e crédito.',
    			content: 'Caso uma das contas informadas exiga um centro de custo, após inclusão do lançamento, uma nova janela será aberta, para que o usuário possa informa-lo.',
    			placement: 'top',
    			backdrop: true
    		}];


            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {

                Benner.Page.addWebTourSteps(steps);
                Benner.Page.initWebTour(false);
                prm.add_endRequest(function (sender, args) {
                    $('.btn-save').click(function () {
                        ValidarCentroCustos();

                    });
                });

            }

            $.ajax({
                type: "GET",
                dataType: "json",
                url: Benner.Page.getApplicationPath() + 'lancamentos/VerificaParametrosParaDocAutomatico',  
                success: function (data) {
                    if (!data){
                        $('#ctl00_Main_NOVOLANAMENTO_toolbar').append('<div class="alert alert-warning"><strong>Atenção!</strong><p>Para utilização do formulário é necessario configurar os parâmetros contábeis de lançamento!</p><ol><li>Documento Contabil como \'Automático\'</li><li>Lote como \'Não Utiliza\'</li></ol></div>')
                        $('#ctl00_Main_NOVOLANAMENTO_toolbar > a').hide();
                    }                       
                    
                },
                error: function (xhr, textStatus, error) {
                    console.log(error);
                }               
            });



})
        var contaDebito, contaCredito;

        function ValidarCentroCustos() {

            var contaDebito = $('#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_CONTADEBITO_ctl01_select').val();
            var contaCredito = $('#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_CONTACREDITO_ctl01_select').val();
            
            var contaDebitoTexto = $('#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_CONTADEBITO_ctl01_select').text();
            
            var contaCreditoTexto = $('#ctl00_Main_NOVOLANAMENTO_formView_PageControl_GERAL_GERAL_CONTACREDITO_ctl01_select').text();

            if (contaDebito !== null || contaCredito !== null) {
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    url: Benner.Page.getApplicationPath() + 'lancamentos/VerificaExigeCC',
                    data: { conta: [contaCredito, contaDebito] },

                    beforeSend: function () {
                        App.blockUI({ target: '#ContentPanel', animate: true });
                    },
                    success: function (data) {
                        if ($('#ctl00_Main_LANAMENTOS_SimpleGrid').find('thead').length > 0) {
                            $('#ctl00_Main_TILEVALORDEBITO').removeClass('hide').show();
                            $('#ctl00_Main_TILEDIFERENCA').removeClass('hide').show();
                            $('#ctl00_Main_TILEVALORCREDITO').removeClass('hide').show();
                            $('#ctl00_Main_TILEDOCUMENTO').removeClass('hide').show();    
                            if (data.exige)
                            {
                                $('#ctl00_Main_CENTRODECUSTOS').removeClass('hide').show();
                                if(data.conta == contaDebito){
                                    CallModalCC(contaDebitoTexto.substring(0,contaDebitoTexto.indexOf('-')));    
                                }
                                else
                                    CallModalCC(contaCreditoTexto.substring(0,contaCreditoTexto.indexOf('-')));    
                                
                            }
                        }
                    },
                    error: function (xhr, textStatus, error) {
                        console.log(error);
                    },
                    complete: function () {
                        App.unblockUI('#ContentPanel');
                    }
                });
            }

        }

        function CallModalCC(conta) {
            var seletor = "#ctl00_Main_LANAMENTOS_SimpleGrid td:contains('{0}')".replace('{0}', conta)
            $(seletor).trigger('click');
            setTimeout(function() { __doPostBack('ctl00$Main$CENTRODECUSTOS', 'New'); }, 1500);

        }

              </script>
        <style>
              .wes-tile .wes-default-tile, .wes-tile .wes-progress-tile, .wes-tile .wes-flat-tile {
    height: 80px !important;
    margin-bottom: 12px;
}

.dashboard-stat.dashboard-stat-v2 .visual{
    padding-top: 0px;
}

.dashboard-stat .details .number {
    padding-top: 15px;
    line-height: 0px;
}

.dashboard-stat .details .desc {
    line-height: 60px;
}

.ShowCC {
    display: block!important;
}

.tour-step-background {
    z-index: 3;
}


              </style>
      </asp:Content>
    