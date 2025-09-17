<%@ Page Title="Zoom de parcelas" Language="C#" Inherits="aga.e.Financeiro.ZoomDeParcelas,Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <asp:updatepanel id="UPStep" runat="server" updatemode="Always" xmlns:asp="http://www.asp.net">
        <ContentTemplate>
            <asp:HiddenField runat="server" ID="EmRemessa" Value="N" ClientIDMode="Static" /> 
            <asp:HiddenField runat="server" ID="EhCRE" Value="N" ClientIDMode="Static" />
        </ContentTemplate>
    </asp:updatepanel>

    <div class="row">

        <div class="col-md-5">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="FORMPARCELA"
                    OnCommandExecute="FORMPARCELA_CommandExecute"
                    PortletLayout="Default"
                    FormMode="None"
                    Title="Parcela"
                    BootstrapCols="12"
                    ShowTitle="True"
                    EntityViewName="FN_PARCELAS.ZOOMDEPARCELAS.FORM"
                    ChromeState="Normal"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    IncludeRecordInRecentItems="True"
                    UserDefinedCommandsVisible="True"
                    PageWidgetHandle="57522" />
            </div>
        </div>

        <div class="col-md-7">
            <div class="row">
                <wes:Tile runat="server"
                    ID="TILESALDOPARCELA"
                    Title="Saldo da parcela"
                    Subtitle=""
                    PortletCssClass=""
                    PortletLayout="None"
                    BootstrapCols="6"
                    FontIcon=""
                    ShowTitle="true"
                    ProviderWidgetUniqueId="FORMPARCELA"
                    ChromeState="Normal"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    EntityViewName="WEB_E_FINANCEIRO_ZOOMDEPARCELAS_SALDOPARCELA.DATASOURCE.GRID"
                    CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    Value="SALDO"
                    TotalValue="SALDO"
                    Description="Saldo"
                    Color="green"
                    Icon="fa fa-money"
                    ValueAggregation="None"
                    Status="Valor total"
                    Prefix="R$"
                    ValueFormat="0.00"
                    TileType="Flat"
                    PageWidgetHandle="57534"
                    Level="20"
                    Order="30" />

                <wes:Tile runat="server"
                    ID="TILESTATUSPARCELA"
                    Title=""
                    Subtitle=""
                    PortletCssClass=""
                    PortletLayout="None"
                    BootstrapCols="6"
                    FontIcon=""
                    ShowTitle="true"
                    ProviderWidgetUniqueId="FORMPARCELA"
                    ChromeState="Normal"
                    CanDelete="false"
                    CanUpdate="false"
                    CanInsert="false"
                    EntityViewName="WEB_E_FINANCEIRO_ZOOMDEPARCELAS_STATUSPARCELA.DATASOURCE.GRID"
                    CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    Value="STATUS"
                    Description="Status"
                    Color="COLOR"
                    Icon="FONTICON"
                    ValueAggregation="None"
                    TileType="Default"
                    PageWidgetHandle="57521"
                    Level="20"
                    Order="30" />
            </div>
            <div class="row">
                <!-- InicioTabs -->
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-body">
                            <div class="row">
                                <div class="col-md-12">
                                    <ul class="nav nav-tabs">
                                        <li class="active">
                                            <a href="#tabANEXOS" data-toggle="tab" aria-expanded="true">Anexos</a>
                                        </li>
                                        <li class="">
                                            <a href="#tabCONTASFINANCEIRAS" data-toggle="tab" aria-expanded="false">Contas financeiras</a>
                                        </li>
                                        <li id="liREMESSA" class="">
                                            <a href="#tabREMESSA" data-toggle="tab" aria-expanded="false">Remessa eletrônica</a>
                                        </li>
                                        <li class="">
                                            <a href="#tabCONTABILIZACAO" data-toggle="tab" aria-expanded="false">Contabilização </a>
                                        </li>
                                        <li class="">
                                            <a href="#tabRETENCOES" data-toggle="tab" aria-expanded="false">Impostos retidos</a>
                                        </li>
                                        <li class="">
                                            <a href="#tabOCORRENCIAS" data-toggle="tab" aria-expanded="false">Ocorrências</a>
                                        </li>
                                        <li class="" >
                                            <a href="#tabBAIXAS" data-toggle="tab" aria-expanded="true">Baixas</a>
                                        </li>
                                        <li class="">
                                            <a href="#tabASSINATURAS" data-toggle="tab" aria-expanded="false">Assinaturas</a>
                                        </li>
                                        <li class="" >
                                            <a href="#tabINFBANCARIAS" data-toggle="tab" aria-expanded="false">Informações bancárias</a>
                                        </li>
                                        <li class="" id="liINFBANCARIASPIX">
                                            <a href="#tabINFBANCARIASPIX" data-toggle="tab" aria-expanded="false">Informações bancárias PIX</a>
                                        </li>
                                        <li class="" id="liORCAMENTOS" >
                                            <a href="#tabORCAMENTOS" data-toggle="tab" aria-expanded="false">Orçamentos</a>
                                        </li>
                                        
                                        <li class="" id="liCONTRATOS">
                                            <a href="#tabCONTRATOS" data-toggle="tab" aria-expanded="false">Contratos</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade  active in" id="tabANEXOS">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDANEXOS"
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    Title="Anexos"
                                                    EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_ANEXOS.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="True"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.DOCUMENTOFINANCEIRO = @CAMPO(DOCUMENTO)"
                                                    PageWidgetHandle="57449"
                                                    FormUrl="" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabASSINATURAS">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GridAssinaturas"
                                                    Title="Assinaturas"
                                                    UserDefinedDisableRowSelection="True"
                                                    FormUrl=""
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.PARCELALIBERACAO = @CAMPO(HANDLE)"
                                                    UserDefinedDataSourceParameters=""
                                                    CompanyFilterMode="OnlyCompany"
                                                    DisplayRowCommand="False"
                                                    SystemFilterOnly="False"
                                                    UserDefinedPageSize="10"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    DefaultFilterName=""
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"
                                                    ShowTitle="False"
                                                    ChromeState="Normal"
                                                    EntityViewName="PORTAL_INT_FIN_APROVACAOCPA_ASSINATURAS.GRID"
                                                    PageWidgetHandle="14" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabCONTABILIZACAO">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDCONTABILIZACAO"
                                                    FormMode="View"
                                                    Title="Contabilização"
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    EntityViewName="CT_LANCAMENTOS.ZOOMDEPARCELAS.CONTABILIZACAO.GRID"
                                                    ChromeState="Fixed"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    IncludeRecordInRecentItems="True"
                                                    UserDefinedCommandsVisible="True"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(DOCUMENTO)"
                                                    PageWidgetHandle="57510" />
                                            </div>
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDCT_LANCAMENTOS"
                                                    BootstrapCols="6"
                                                    ShowTitle="False"
                                                    Title="Lançamentos da contabilização"
                                                    EntityViewName="CT_LANCAMENTOS.ZOOMDEDOCUMENTOS.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="False"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(DOCUMENTO)"
                                                    PageWidgetHandle="57469" />

                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDCT_LANCAMENTOCC"
                                                    BootstrapCols="6"
                                                    ShowTitle="False"
                                                    Title="Lançamentos de centro de custo da contabilização"
                                                    EntityViewName="CT_LANCAMENTOCC.ZOOMDEDOCUMENTOS.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="False"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    ProviderWidgetUniqueId="GRIDCONTABILIZACAO"
                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                                                    PageWidgetHandle="57449" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabRETENCOES">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="RETENES"
                                                    Title="Retenções"
                                                    Subtitle=""
                                                    PortletCssClass=""
                                                    PortletLayout="Default"
                                                    BootstrapCols="12"
                                                    FontIcon=""
                                                    ShowTitle="false"
                                                    ChromeState="Fixed"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    EntityViewName="FN_DOCUMENTOIMPOSTOS.ZOOMDEDOCUMENTOS.GRID"
                                                    Mode="None"
                                                    FormUrl="~/aga/e/financeiro/zoomdedocumentos/Retencao.aspx"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="True"
                                                    CompanyFilterMode="OnlyCompany"
                                                    ShowExport="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedDisableRowSelection="False"
                                                    UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(DOCUMENTO)"
                                                    PageWidgetHandle="22513"
                                                    Level="20"
                                                    Order="20" />

                                            </div>
                                            <!-- <div class="row"> tabPARCELAS -->
                                        </div>
                                        <div class="tab-pane fade" id="tabBAIXAS">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDBAIXAS"
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    Title="Baixas"
                                                    EntityViewName="FN_MOVIMENTACOES.ZOOMDEPARCELAS.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="True"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND TIPOMOVIMENTO IN (1,2,3,4,5,6,8,9,14,15,17,18,19,20,22,23)"
                                                    PageWidgetHandle="57449"
                                                    FormUrl="~/aga/a/financeiro/zoomdedocumentos/BaixasParcela.aspx" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabINFBANCARIAS">
                                            <div class="row">
                                                <wes:AjaxForm runat="server"
                                                    ID="FORMINFOBANCARIAS"
                                                    FormMode="View"
                                                    Title=""
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    EntityViewName="FN_PARCELAS.ZOOMDEPARCELAS.INFORMACOESBANCARIAS.FORM"
                                                    ChromeState="Fixed"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    IncludeRecordInRecentItems="True"
                                                    UserDefinedCommandsVisible="True"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.AP = @CAMPO(AP)"
                                                    PageWidgetHandle="57511" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabINFBANCARIASPIX">
                                            <div class="row">
                                                <wes:AjaxForm runat="server"
                                                    ID="FORMINFOBANCARIASPIX"
                                                    FormMode="View"
                                                    Title=""
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    EntityViewName="FN_PARCELAS.ZOOMDEPARCELAS.INFORMACOESBANCARIASPIX.FORM"
                                                    ChromeState="Fixed"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    IncludeRecordInRecentItems="True"
                                                    UserDefinedCommandsVisible="True"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.AP = @CAMPO(AP)"
                                                    PageWidgetHandle="57511" />
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabORCAMENTOS">
                                            <div class="row">
                                                <wes:SimpleGrid
                                                    runat="server"
                                                    ID="OrcamentoContas"
                                                    ProviderWidgetUniqueId="Parcela"
                                                    Title="Contas"
                                                    BootstrapCols="12" 
                                                    ChromeState="Fixed"  
                                                    UserDefinedDisableRowSelection="true" 
                                                    UserDefinedPageSize="10000" 
                                                    CanView="false"  />                        
                                            </div>
                                             <div class="row">
                                                <wes:SimpleGrid
                                                    runat="server"
                                                    ID="OrcamentoCCs"
                                                    ProviderWidgetUniqueId="Parcela"
                                                    Title="Centros de resultados"
                                                    BootstrapCols="12" 
                                                    ChromeState="Fixed"  
                                                    UserDefinedDisableRowSelection="true" 
                                                    UserDefinedPageSize="10000" 
                                                    CanView="false"  />                        
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabCONTRATOS">
                                            <div class="row">
                                                <wes:SimpleGrid
                                                    runat="server"
                                                    ID="Contratos"
                                                    Title="OrcamentoCC"
                                                    BootstrapCols="12"
                                                    UserDefinedDisableRowSelection="True"
                                                    FormUrl=""
                                                    UserDefinedCriteriaWhereClause=""
                                                    UserDefinedDataSourceParameters=""
                                                    DisplayRowCommand="False"
                                                    SystemFilterOnly="False"
                                                    UserDefinedPageSize="10"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    HideDeveloperCommands="True"
                                                    DefaultFilterName=""
                                                    CanInsert="False"
                                                    CanUpdate="False"
                                                    CanDelete="False"
                                                    ShowTitle="False"
                                                    ChromeState="Normal"
                                                    EntityViewName="APROVACAO_AP_CONTRATOS.DATASOURCE.CUSTOM.GRID"
                                                    PageWidgetHandle="112" />  
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabOCORRENCIAS">
                                            <div class="tabbable-line">
                                                <ul class="nav nav-tabs">
                                                    <li data-widget-id="GRIDOCORRENCIAS" class="active">
                                                        <a href="#tabGRIOCORRENCIAS" data-toggle="tab" aria-expanded="true">
                                                            <i class="fa fa-edit"></i>Ocorrências
                                                        </a>
                                                    </li>
                                                    <li data-widget-id="GRIDSUSPENSOES">
                                                        <a href="#tabGRIDSUSPENSOES" data-toggle="tab" aria-expanded="true">
                                                            <i class="fa fa-unlock-alt"></i>Suspensão/Liberação
                                                        </a>
                                                    </li>
                                                </ul>
                                                <div class="tab-content">
                                                    <div class="tab-pane active" id="tabGRIOCORRENCIAS">
                                                        <wes:SimpleGrid runat="server"
                                                            ID="GRIDOCORRENCIAS"
                                                            BootstrapCols="12"
                                                            ShowTitle="False"
                                                            Title="Baixas"
                                                            EntityViewName="FN_MOVIMENTACOES.OCORRENCIAPARCELAS.GRID"
                                                            ChromeState="Normal"
                                                            CanDelete="true"
                                                            CanUpdate="true"
                                                            CanInsert="true"
                                                            Mode="None"
                                                            UserDefinedSelectColumnVisible="False"
                                                            UserDefinedPageSize="10"
                                                            SystemFilterOnly="False"
                                                            DisplayRowCommand="False"
                                                            CompanyFilterMode="OnlyCompany"
                                                            ProviderWidgetUniqueId="FORMPARCELA"
                                                            UserDefinedDisableRowSelection="False"
                                                            UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND TIPOMOVIMENTO IN (7)"
                                                            FormUrl="~/ERP/Financeiro/OcorrenciaParcelas/Form.aspx"
                                                            PageWidgetHandle="57450"
                                                            OnCommandExecute="GRIDOCORRENCIAS_CommandExecute" />
                                                    </div>
                                                    <div class="tab-pane" id="tabGRIDSUSPENSOES">
                                                        <wes:SimpleGrid runat="server"
                                                            ID="GRIDSUSPENSOES"
                                                            BootstrapCols="12"
                                                            ShowTitle="False"
                                                            Title="Baixas"
                                                            EntityViewName="FN_MOVIMENTACOES.ZOOMDEPARCELAS.OCORRENCIAS.GRID"
                                                            ChromeState="Normal"
                                                            CanDelete="false"
                                                            CanUpdate="false"
                                                            CanInsert="false"
                                                            Mode="None"
                                                            UserDefinedSelectColumnVisible="False"
                                                            UserDefinedPageSize="10"
                                                            SystemFilterOnly="False"
                                                            DisplayRowCommand="False"
                                                            CompanyFilterMode="OnlyCompany"
                                                            UserDefinedDisableRowSelection="False"
                                                            UserDefinedCriteriaWhereClause="A.PARCELA = @CAMPO(HANDLE) AND TIPOMOVIMENTO IN (12,13)"
                                                            PageWidgetHandle="57450"
                                                            ProviderWidgetUniqueId="FORMPARCELA"/>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="tab-pane fade" id="tabCONTASFINANCEIRAS">
                                            <div class="row">
                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDCONTASFINANCEIRAS"
                                                    BootstrapCols="7"
                                                    ShowTitle="False"
                                                    Title="Contas Financeiras"
                                                    EntityViewName="FN_LANCAMENTOS.CUSTOM.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="True"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    UserDefinedCriteriaWhereClause="A.PARCELA IS NOT NULL AND A.PARCELA = @CAMPO(HANDLE) AND A.TIPO IN (3,11)"
                                                    FormUrl="~/aga/a/financeiro/documentos/lancamentos.aspx?ignoreValidation=S"
                                                    PageWidgetHandle="57449" />

                                                <wes:SimpleGrid runat="server"
                                                    ID="GRIDCENTRODECUSTO"
                                                    BootstrapCols="5"
                                                    ShowTitle="False"
                                                    Title="Centro de custo"
                                                    EntityViewName="FN_LANCAMENTOCC.ZOOMDEDOCUMENTOS.GRID"
                                                    ChromeState="Normal"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    Mode="None"
                                                    UserDefinedSelectColumnVisible="False"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedPageSize="10"
                                                    SystemFilterOnly="False"
                                                    DisplayRowCommand="False"
                                                    CompanyFilterMode="OnlyCompany"
                                                    UserDefinedDisableRowSelection="False"
                                                    UserDefinedCriteriaWhereClause="A.LANCAMENTO IN (SELECT HANDLE FROM FN_LANCAMENTOS WHERE PARCELA IS NOT NULL AND PARCELA = @CAMPO(HANDLE) AND TIPO IN (3,11))"
                                                    PageWidgetHandle="57449" />
                                            </div>
                                            <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                                        </div>
                                        <div class="tab-pane fade" id="tabREMESSA">
                                            <div class="row">
                                                <wes:AjaxForm runat="server"
                                                    ID="FORMREMESSAELETRONICA"
                                                    FormMode="View"
                                                    Title="Remessa eletrônica"
                                                    BootstrapCols="12"
                                                    ShowTitle="False"
                                                    EntityViewName="GN_HBREMESSAS_ELETRONICA.CUSTOM.FORM"
                                                    ChromeState="Fixed"
                                                    CanDelete="False"
                                                    CanUpdate="False"
                                                    CanInsert="False"
                                                    IncludeRecordInRecentItems="True"
                                                    UserDefinedCommandsVisible="True"
                                                    ProviderWidgetUniqueId="FORMPARCELA"
                                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(REMESSA)"
                                                    PageWidgetHandle="57511" />
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- FimTabs -->
        </div>
    </div>
    
    <script type="text/javascript">
        $(function () {

            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    ocultarRemessaEletronica();
                    ocultarOrcamentosEContratos();
                });
            } 
            ocultarRemessaEletronica();
            ocultarOrcamentosEContratos();
        });

        function ocultarRemessaEletronica() {
            var emRemessa = $('#EmRemessa').val();
            
            console.log(emRemessa);

            if (emRemessa != "S") {
                $('#tabREMESSA').hide();
                $('#liREMESSA').hide();
            }
        }
        
        function ocultarOrcamentosEContratos() {
            var ehCRE = $('#EhCRE').val();
            
            if (ehCRE == "S") {
                $('#liORCAMENTOS').hide();
                $('#liCONTRATOS').hide();
            }
        }
    </script>

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMPARCELAGRIDBAIXAS", "FORMPARCELA", "GRIDBAIXAS");
            AddWebPartStaticConnection("FORMPARCELAGRIDOCORRENCIAS", "FORMPARCELA", "GRIDOCORRENCIAS");
            AddWebPartStaticConnection("FORMPARCELAFORMINFOBANCARIAS", "FORMPARCELA", "FORMINFOBANCARIAS");
        }
</script>
</asp:Content>
