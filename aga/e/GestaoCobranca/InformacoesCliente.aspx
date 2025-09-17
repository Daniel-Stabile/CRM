<%@ Page Title="Informações" Language="C#" CodeFile="~/aga/e/GestaoCobranca/InformacoesCliente.aspx.cs" Inherits="cobrancaInformacoesClientePage" %>
      
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
     
      <asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <style>
        .portlet, .light {
            border-radius:20px!important;
        }

        .portlet-none {
            padding-bottom:10px!important;
        }

        .note {
            padding: 0 30px 0 15px
        }

        #ctl00_Main_TTULOS_FilterControl_FilterContainer, #ctl00_Main_TTULOS_MsgUser, .alert-warning, .alert-danger {
            margin: 0 -20px 5px !important;
        }

        #ctl00_Main_TTULOS_FilterControl .input-group > input, select {
            border-top-left-radius: 10px !important;
            border-bottom-left-radius: 10px !important;
        }

        #ctl00_Main_TTULOS_FilterControl_FilterFormContainer  select {
            border-radius: 10px !important;
        }

        #ctl00_Main_TTULOS_FilterControl_FilterFormContainer > .btn, .btn-default:not(#ctl00_Main_TTULOS_FilterControl_FilterControlEditButton) {
            border-top-right-radius: 10px !important;
            border-bottom-right-radius: 10px !important;
        }

        .select2-selection, .select2-selection--single {
            border-top-left-radius: 10px !important;
            border-bottom-left-radius: 10px !important;
        }

        #ctl00_Main_TTULOS_FilterControl_FilterControlNewButton {
            border-top-right-radius: 10px !important;
            border-bottom-right-radius: 10px !important;
        } 

        #ctl00_Main_TTULOS_FilterControl_FilterActionsCol > a {
            display: none
        }

        #ctl00_Main_ATIVIDADES_SimpleGrid > thead {
            display: none;
        }

        #ctl00_Main_ATIVIDADES_footerCommands {
            display: none;
        }

        .command-action{
            border-radius: 10px!important;
        }

        #ctl00_Main_INFORMAES_toolbar, #ctl00_Main_ATIVIDADES_toolbar {
            text-align: center;
        }

        #ctl00_Main_INFORMAES_toolbar > a {
            width: 10rem;
            margin-bottom: 20px;
            text-align: center;
        }
        
        #ctl00_Main_TTULOS_FilterControl_FilterContainer {
            background-color: #fff!important; 
            border-color: #fff!important; 
            border-left: 5px !important;
        }
        
        .tilevalue {
            font-size: 55%;
            font-weight: bolder
        }

        .wes-default-tile, .wes-tile, .details {
            max-height: 100px!important;
            margin-top: 0px!important;
        }

        #ctl00_Main_TTULOS_FilterControl_FilterContainer label {
            font-weight: 700;
        }
        .nav-tabs {
            border-bottom: 0;
        }
        .nav-tabs>li.active>a, .nav-tabs>li.active>a:focus, .nav-tabs>li.active>a:hover {
            color: #3598dc;
            background-color: #fff;
            border: 0; 
            border-color: 0; 
            cursor: default;
            border-bottom: 1px solid #3598dc!important;
        }

        .nav-tabs>li:not(.active) > a {
            color: #555;
        }

        .tabGridTitulosRenegociacao {
            font-size: 20px!important;
        }

        #titulosContainer {
            padding-right: 0!important;
        }

        .containerPrincipal {
            background-color: white!important;
            border-radius: 20px!important;
            border: 5px solid #eef1f5;
        }

        .mt-radio.mt-radio-outline>input:checked~span,.mt-radio.mt-radio-outline>span {
            border: 1px solid rgba(0,0,0,0.5);
            background: none;
        }

        .mt-radio.mt-radio-outline:hover>span{
            border: 1px solid rgb(0, 0, 0)!important;
            background: none!important;
        }

        .mt-radio-inline {
            letter-spacing: -1.5px;
        }

        .mt-radio {
            padding-left: 25px
        }

        .control-label.name.empty {
            max-height: 4px
        }

        .boolean-control.mt-checkbox.mt-checkbox-outline {            
            letter-spacing: -1.5px;
        }

        .text-left, .static-info, .label-form, .value {
            font-size: small!important;
        }

        .col-md-12 {
            padding-left: 10px;
            padding-right: 10px
        }

        .col-md-3 {
            padding: 0 5px 0 5px
        }

        .widget .portlet.light {
            padding: 5px 10px 5px!important;
            margin-bottom: 0
        }

        .dashboard-stat .details .number {
            padding-top: 20px;
            letter-spacing: -2px
        }

        .legendaGrid {
            width: 20px;
            height: 20px;
            padding-left: 20px;
            margin-bottom: 0px;
            margin-left: 10px;
        }

        .legendaTextoGrid {
            padding-left: 5px;
        }

    </style>
    <section style="
        display: grid;
        grid-template-columns: 25% 58% auto">

        <div class="containerPrincipal" id="divCliente" style="background-color:white;border-radius:20px!important"">

            <wes:AjaxForm runat="server" ID="INFORMAES" Title="Cliente" Subtitle="" PortletCssClass="" PortletLayout="Default" FontIcon="fa fa-user-o" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.INFORMACOES_CLIENTE.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE" Level="20" Order="100"  />
            <wes:AjaxForm runat="server" ID="ENDEREO" Title="Endereço" Subtitle="" PortletCssClass="" PortletLayout="Default" FontIcon="fa fa-map-marker" ShowTitle="true" ProviderWidgetUniqueId="INFORMAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.INFORMACOES_ENDERECO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE" Level="20" Order="110"  />
            <wes:AjaxForm runat="server" ID="CONTATO" Title="Contato" Subtitle="" PortletCssClass="" PortletLayout="Default" FontIcon="fa fa-phone" ShowTitle="true" ProviderWidgetUniqueId="INFORMAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOAS.INFORMACOES_CONTATO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="False" PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE" Level="20" Order="118"  />
            <wes:SimpleGrid runat="server" ID="CONTATOS" Title="Contatos" Subtitle="" PortletCssClass="" PortletLayout="Default" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="INFORMAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GN_PESSOATELEFONES.INFORMACOES_CONTATO.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="5" SystemFilterOnly="False" DisplayRowCommand="False" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)" ShowExport="False" UserDefinedDisableRowSelection="False" PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE" Level="20" Order="130"  />
        </div>

        <div class="col-md-12 containerPrincipal" id="titulosContainer" >
            <div class="portlet light">
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <ul class="nav nav-tabs">
                                <li class="active">
                                    <a class="tabGridTitulosRenegociacao" href="#tabTITULOS" data-toggle="tab" aria-expanded="true"><i class="fa fa-folder-o"></i> Títulos</a>
                                </li>
                                <li class="">
                                    <a class="tabGridTitulosRenegociacao" href="#tabRENEGOCIACOES" data-toggle="tab" aria-expanded="false">
                                        <i class="fa fa-usd"></i>
                                        Renegociações
                                    </a>
                                </li>
                            </ul>

                            <div id="tentativaMenu"></div>

                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="tabTITULOS">
                                    <div class="row">
                                        <wes:Tile runat="server"
                                            ID="VENCIDO"
                                            Title=""
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="None"
                                            BootstrapCols="3"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="TTULOS"
                                            ChromeState="Normal"
                                            CanDelete="True"
                                            CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="FN_PARCELAS.TITULOS_COBRANCA.GRID"
                                            Description="Vencido"
                                            Color="blue"
                                            Icon="fa fa-dollar"
                                            TileType="Default"
                                            PageWidgetHandle="57579"
                                            Level="20"
                                            Order="30" />

                                        <wes:Tile runat="server"
                                            ID="MULTA"
                                            Title=""
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="None"
                                            BootstrapCols="3"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="TTULOS"
                                            ChromeState="Normal"
                                            CanDelete="True"
                                            CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="FN_PARCELAS.TITULOS_COBRANCA.GRID"
                                            ValueFormat="0.00"
                                            Description="Multa"
                                            Color="blue"
                                            Icon="fa fa-dollar"
                                            TileType="Default"
                                            PageWidgetHandle="57579"
                                            Level="20"
                                            Order="30" />

                                        <wes:Tile runat="server"
                                            ID="JUROS"
                                            Title=""
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="None"
                                            BootstrapCols="3"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="TTULOS"
                                            ChromeState="Normal"
                                            CanDelete="True"
                                            CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="FN_PARCELAS.TITULOS_COBRANCA.GRID"
                                            ValueFormat="0.00"
                                            Description="Juros"
                                            Color="blue"
                                            Icon="fa fa-dollar"
                                            TileType="Default"
                                            PageWidgetHandle="57579"
                                            Level="20"
                                            Order="30" />

                                        <wes:Tile runat="server"
                                            ID="TOTAL"
                                            Title=""
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="None"
                                            BootstrapCols="3"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="TTULOS"
                                            ChromeState="Normal"
                                            CanDelete="True"
                                            CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="FN_PARCELAS.TITULOS_COBRANCA.GRID"
                                            ValueFormat="0.00"
                                            Description="Total geral"
                                            Color="blue"
                                            Icon="fa fa-dollar"
                                            TileType="Default"
                                            PageWidgetHandle="57579"
                                            Level="20"
                                            Order="30" />

                                        <wes:SimpleGrid
                                            runat="server"
                                            ID="TTULOS"
                                            Title="Títulos"
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="Default"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="INFORMAES"
                                            ChromeState="Normal"
                                            CanDelete="False"
                                            CanUpdate="False"
                                            CanInsert="False"
                                            EntityViewName="FN_PARCELAS.TITULOS_COBRANCA.GRID"
                                            UserDefinedSelectColumnVisible="true"
                                            UserDefinedPageSize="10"
                                            SystemFilterOnly="False"
                                            DefaultFilterName="Padrão"
                                            Mode="Fixed"
                                            DisplayRowCommand="True"
                                            CompanyFilterMode="OnlyCompany"
                                            ShowExport="True"
                                            UserDefinedDisableRowSelection="False"
                                            PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE"
                                            Level="20"
                                            Order="127"
                                            UserDefinedCriteriaWhereClause="A.DOCUMENTOSUSPENSO = 'N' AND A.VALOR - A.VALORESBAIXADOS > 0 AND A.DOCUMENTO IN (SELECT HANDLE FROM FN_DOCUMENTOS WHERE PESSOA = @CAMPO(HANDLE) AND OPERACAOCANCELAMENTO IS NULL AND (((ENTRADASAIDA = 'S') AND TIPODEMOVIMENTO IN (1, 2)) OR ((ENTRADASAIDA = 'E') AND TIPODEMOVIMENTO = 3)) AND (ABRANGENCIA NOT IN ('R','F','A','B','D','G','H') AND (EFETUANDOINTEGRACAO <> 'S' OR EFETUANDOINTEGRACAO IS NULL)))" />
                                    </div>
                                    <div class="portlet legendaGrid" style="background-color:gray"><span class="legendaTextoGrid">Renegociados</span></div>
                                </div>

                                <div class="tab-pane fade" id="tabRENEGOCIACOES">
                                    <div class="row">
                                        <wes:SimpleGrid
                                            runat="server"
                                            ID="RENEGOCIAES"
                                            Title="Renegociações"
                                            Subtitle=""
                                            PortletCssClass=""
                                            PortletLayout="Default"
                                            FontIcon=""
                                            ShowTitle="false"
                                            ProviderWidgetUniqueId="INFORMAES"
                                            ChromeState="Normal"
                                            CanDelete="False"
                                            CanUpdate="True"
                                            CanInsert="False"
                                            EntityViewName="GC_SIMULACOES.GESTAO_COBRANCA.GRID"
                                            UserDefinedSelectColumnVisible="true"
                                            UserDefinedPageSize="10"
                                            SystemFilterOnly="False"
                                            DisplayRowCommand="True"
                                            FormUrl="~/aga/e/GestaoCobranca/Renegociacao.aspx"
                                            CompanyFilterMode="OnlyCompany"
                                            ShowExport="True"
                                            UserDefinedDisableRowSelection="False"
                                            PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE"
                                            Level="20"
                                            Order="127"
                                            UserDefinedCriteriaWhereClause="A.CLIENTE = @CAMPO(HANDLE)" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="divAtividades" class="containerPrincipal">
            <wes:SimpleGrid runat="server" ID="ATIVIDADES" Title="Atividades" Subtitle="" PortletCssClass="" PortletLayout="Default" FontIcon="fa fa-bars" ShowTitle="true" ProviderWidgetUniqueId="INFORMAES" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="GC_CLIENTEHISTORICOS.INFORMACOES_CLIENTE.GRID" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.CLIENTE = @CAMPO(HANDLE)" UserDefinedCommandsVisible="True" DisplayRowCommand="false" UserDefinedDisableRowSelection="true" PageId="AGA_A_COBRANCA_INFORMACOESCLIENTE" Level="20" Order="118"  />
        </div>

    </section>

    <script>
       $(function(){
            ajustaPosicaoBotaoEditarCliente();
            ajustaPosicaoBotaoRegistrarAtividade();
            ajustaFiltroAutomagico();

            var prm = Sys.WebForms.PageRequestManager.getInstance();

            prm.add_endRequest(function (s, e) {
                ajustaPosicaoBotaoEditarCliente();
                ajustaPosicaoBotaoRegistrarAtividade();
                ajustaFiltroAutomagico();
            });
        });

        function ajustaPosicaoBotaoEditarCliente(){
            var divButton = $("#ctl00_Main_INFORMAES_toolbar");
            $("#ctl00_Main_INFORMAES_toolbar").remove();
            if($("#ctl00_Main_INFORMAES_toolbar").length == 0)
                $("#divCliente").append(divButton);
        }

        function ajustaPosicaoBotaoRegistrarAtividade(){
            var divButton = $("#ctl00_Main_ATIVIDADES_toolbar");
            $("#ctl00_Main_ATIVIDADES_toolbar").remove();
            if($("#ctl00_Main_ATIVIDADES_toolbar").length == 0)
                $("#divAtividades").append(divButton);
        }

        function ajustaFiltroAutomagico(){
            $('input:radio').change(function() {
                javascript:__doPostBack('ctl00$Main$TTULOS$FilterControl$FilterButton','')
            });
        }
    </script>

      </asp:Content>
    
    