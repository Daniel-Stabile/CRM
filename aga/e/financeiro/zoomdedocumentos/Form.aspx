<%@ Page Title="Zoom de documentos" Language="C#" Inherits="aga.e.Financeiro.ZoomDeDocumentos,Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-4 ">
            <div class="row">
                <wes:CommandsPanel
                    runat="server"
                    ID="COMANDOS"
                    Title="Comandos"
                    Subtitle=""
                    PortletCssClass=""
                    PortletLayout="Default"
                    BootstrapCols="12"
                    FontIcon=""
                    ShowTitle="false"
                    ProviderWidgetUniqueId=""
                    ChromeState="Normal"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    EntityViewName="FN_DOCUMENTOS.CONSULTADOCUMENTOS.COMANDOS.GRID"
                    VerticalOrientation="False"
                    Level="20" Order="1"  />
            </div>
            <div class="row">
                <wes:AjaxForm
                    runat="server"
                    ID="FORMDOCUMENTO"
                    FormMode="View"
                    Title="Documento"
                    BootstrapCols="12"
                    ShowTitle="True"
                    EntityViewName="FN_DOCUMENTOS.ZOOMDEDOCUMENTOS.FORM"
                    ChromeState="Fixed"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    IncludeRecordInRecentItems="True"
                    UserDefinedCommandsVisible="True"
                    PageWidgetHandle="57522" />
            </div>
        </div>
        <!-- <div class="col-md-4"> -->
        <div class="col-md-8">
            <div class="row">
                <wes:Tile
                    runat="server"
                    ID="TILESALDODOCUMENTO"
                    PortletCssClass=""
                    PortletLayout="none"
                    BootstrapCols="6"
                    ShowTitle="true"
                    ProviderWidgetUniqueId="FORMDOCUMENTO"
                    ChromeState="Normal"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_SALDODOCUMENTO.DATASOURCE.GRID"
                    CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    CriteriaWhereClauseTotalValue="A.HANDLE = @CAMPO(HANDLE)"
                    Prefix="R$"
                    Description=""
                    TotalValue="VALORNOMINAL"
                    ValueFormat="N2"
                    Value="SALDO"
                    Status="VALORLABEL"
                    Color="blue"
                    Icon="fa fa-money"
                    ValueAggregation="None"
                    TileType="Progress"
                    PageWidgetHandle="57533"
                    Level="20"
                    Order="30" />


                <wes:Tile runat="server"
                    ID="TILESTATUSDOCUMENTO"
                    Title="Status Documento"
                    Subtitle=""
                    PortletCssClass=""
                    PortletLayout="None"
                    BootstrapCols="6"
                    FontIcon=""
                    ShowTitle="true"
                    ProviderWidgetUniqueId="FORMDOCUMENTO"
                    ChromeState="Normal"
                    CanDelete="True"
                    CanUpdate="True"
                    CanInsert="True"
                    EntityViewName="WEB_E_FINANCEIRO_ZOOMDEDOCUMENTOS_STATUSDOCUMENTO.DATASOURCE.GRID"
                    CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
                    Value="STATUS"
                    Description="Situação"
                    Color="CLASSE"
                    Icon="ICONE"
                    ValueAggregation="None"
                    TileType="Default"
                    PageWidgetHandle="57579"
                    Level="20"
                    Order="30" />
            </div>
            <!-- InicioTabs -->
            <div class="tabbable tabbable-custom erp-border">
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tabPARCELAS" data-toggle="tab" aria-expanded="true">Parcelas</a>
                    </li>
                    <li class="">
                        <a href="#tabCONTASFINANCEIRAS" data-toggle="tab" aria-expanded="false">Contas financeiras </a>
                    </li>
                    <li class="">
                        <a href="#tabRETENCOES" data-toggle="tab" aria-expanded="false">Retenções</a>
                    </li>
                    <li class="">
                        <a href="#tabCONTABILIZACAO" data-toggle="tab" aria-expanded="false">Contabilização</a>
                    </li>
                    <li class="">
                        <a href="#tabAGLUTINADOS" data-toggle="tab" aria-expanded="false">Documentos Aglutinados</a>
                    </li>
                    <li runat="server" id="TABEMPENHOS" class="">
                        <a href="#tabEMPENHOS" data-toggle="tab" aria-expanded="false">Empenhos</a>
                    </li>    
                    <li runat="server" id="TABDOCBAIXAS" class="">
                        <a href="#tabBAIXAS" data-toggle="tab" aria-expanded="false">Documentos baixados</a>
                    </li>
                    <li class="">
                        <a href="#tabASSINATURAS" data-toggle="tab" aria-expanded="false">Assinaturas</a>
                    </li>
                    <li class="">
                        <a href="#tabAUDITORIA" data-toggle="tab" aria-expanded="false">Usuários</a>
                    </li>
                    <li class="">
                        <a href="#tabHISTORICO" data-toggle="tab" aria-expanded="false">Histórico</a>
                    </li>
                    <li class="">
                        <a href="#tabOUTRASINFOS" data-toggle="tab" aria-expanded="false">Outras informações</a>
                    </li>
					<li class="">
                        <a href="#tabREINF" data-toggle="tab" aria-expanded="false">REINF</a>
                    </li>
                </ul>
                <!-- <ul class="nav nav-tabs"> -->
                <div class="tab-content">
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
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="True"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE) AND A.PARCELA IS NULL"
                                FormUrl="~/aga/a/financeiro/documentos/lancamentos.aspx"
                                PageWidgetHandle="57447" />

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
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="False"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="True"
                                UserDefinedCriteriaWhereClause="A.LANCAMENTO = 0"
                                PageWidgetHandle="57448" />

                            <wes:SimpleGrid runat="server"
                                ID="GRIDDIMENSOES"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Dimensões"
                                EntityViewName="FN_LANCAMENTODIMENSOES.CONTAFINANCEIRA.GRID"
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
                                UserDefinedDisableRowSelection="True"
                                UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = 0"
                                PageWidgetHandle="57449" />
                        </div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>
                    <!-- <div class="tab-pane fade active in" id="tabCONTASFINANCEIRAS"> -->

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
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="True"
                                CompanyFilterMode="OnlyCompany"
                                ShowExport="False"
                                UserDefinedDisableRowSelection="False"
                                PageWidgetHandle="22513"
                                Level="20"
                                Order="20" />

                        </div>
                        <!-- <div class="row"> tabPARCELAS -->
                    </div>
                    <!-- <div class="tab-pane fade" id="tabPARCELAS"> -->
                    <div class="tab-pane fade active in" id="tabPARCELAS">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRIDPARCELAS"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Parcelas"
                                EntityViewName="FN_PARCELAS.ZOOMDEDOCUMENTOS.GRID"
                                ChromeState="Normal"
                                CanDelete="False"
                                CanUpdate="False"
                                CanInsert="False"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="true"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                PageWidgetHandle="57449"
                                FormUrl="~/aga/e/financeiro/zoomdeparcelas/Form.aspx?hdl=@CAMPO(HANDLE)" />
                        </div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>

                    <!-- <div class="tab-pane fade" id="tabAGLUTINADOS"> -->
                    <div class="tab-pane fade" id="tabAGLUTINADOS">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRIDAGLUTINADOS"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Documentos Aglutinados"
                                EntityViewName="FN_DOCUMENTOS.CONTASPAGAR.GRID"
                                ChromeState="Normal"
                                CanDelete="False"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                CanUpdate="False"
                                CanInsert="False"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="False"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCTOAGLUTINADOR = @CAMPO(HANDLE)"
                                PageWidgetHandle="57450"
                                FormUrl="~/aga/e/financeiro/zoomdedocumentos/Aglutinado.aspx" />
                        </div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>

                    <div class="tab-pane fade" id="tabEMPENHOS">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRIDEMPENHOS"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Empenhos"
                                EntityViewName="FN_DOCUMENTOPEDIDOSEMPENHOS.CPACRE.GRID"
                                ChromeState="Normal"
                                CanDelete="True"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                CanUpdate="True"
                                CanInsert="True"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="False"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                PageWidgetHandle="57450"
                                FormUrl="~/aga/a/financeiro/documentos/Empenho.aspx"/>
                        </div>
                    </div>
                    
                    <div class="tab-pane fade" id="tabASSINATURAS">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRIDASSINATURAS"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Assinaturas"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                EntityViewName="PD_ASSINATURAS.CPACRE.GRID"
                                ChromeState="Normal"
                                CanDelete="False"
                                CanUpdate="False"
                                CanInsert="False"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="true"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                PageWidgetHandle="57449" />
                        </div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>
                    
                    <div class="tab-pane fade" id="tabHISTORICO">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="GRIDHISTORICO"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Histórico"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                EntityViewName="PD_STATUS.CPACRE.GRID"
                                ChromeState="Normal"
                                CanDelete="False"
                                CanUpdate="False"
                                CanInsert="False"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="true"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.HANDLEREGISTROORIGEM = @CAMPO(HANDLE)"
                                PageWidgetHandle="57449" />
                        </div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>

                     <div class="tab-pane fade" id="tabAUDITORIA">
                        <div class="row">
                            <wes:AjaxForm runat="server"
								ID="AjaxForm1"
								FormMode="View"
                                ShowTitle="False"
								Title="Usuários"
								BootstrapCols="12"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
								EntityViewName="FN_DOCUMENTOS.AUDITORIA.FORM"
								ChromeState="Fixed"
								CanDelete="False"
								CanUpdate="False"
								CanInsert="False"
								IncludeRecordInRecentItems="True"
								UserDefinedCommandsVisible="True"
                                CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
								PageWidgetHandle="57666" />
							</div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>

                    <div class="tab-pane fade" id="tabOUTRASINFOS">
                        <div class="row">
                            <wes:AjaxForm runat="server"
								ID="FORMOUTRASINFOS"
								FormMode="View"
								Title="Outras informações"
								BootstrapCols="12"
								ShowTitle="True"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
								EntityViewName="FN_DOCUMENTOS.OUTRASINFORMACOES.FORM"
								ChromeState="Fixed"
								CanDelete="False"
								CanUpdate="False"
								CanInsert="False"
								IncludeRecordInRecentItems="True"
								UserDefinedCommandsVisible="True"
                                CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
								PageWidgetHandle="57666" />
							</div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>
					
					<div class="tab-pane fade" id="tabREINF">
                        <div class="row">
                            <wes:AjaxForm runat="server"
								ID="FORMREINF"
								FormMode="View"
								Title="REINF"
								BootstrapCols="12"
								ShowTitle="True"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
								EntityViewName="FN_DOCUMENTOS.REINF.FORM"
								ChromeState="Fixed"
								CanDelete="False"
								CanUpdate="False"
								CanInsert="False"
								IncludeRecordInRecentItems="True"
								UserDefinedCommandsVisible="True"
                                CriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
								PageWidgetHandle="57666" />
							</div>
                        <!-- <div class="row"> tabCONTASFINANCEIRAS -->
                    </div>

                    <div class="tab-pane fade" id="tabBAIXAS">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="SimpleGrid12"
                                BootstrapCols="12"
                                ShowTitle="False"
                                Title="Documentos baixados"
                                EntityViewName="FN_MOVIMENTACOES.DOCUMENTOSBAIXADOS.GRID"
                                ChromeState="Normal"
                                CanDelete="False"
                                ProviderWidgetUniqueId="FORMDOCUMENTO"
                                CanUpdate="False"
                                CanInsert="False"
                                Mode="None"
                                UserDefinedSelectColumnVisible="False"
                                UserDefinedPageSize="10"
                                SystemFilterOnly="False"
                                DisplayRowCommand="False"
                                CompanyFilterMode="OnlyCompany"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTOGERADO = @CAMPO(HANDLE)"/>
                        </div>
                    </div>

                    <!-- <div class="tab-pane fade" id="tabCONTASFINANCEIRAS"> -->
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
                                UserDefinedCriteriaWhereClause="A.LANCAMENTOFINANCEIRO = @CAMPO(HANDLE) or A.LANCAMENTOMOVIMENTACAO = (SELECT MAX(HANDLE) HANDLE FROM FN_MOVIMENTACOES WHERE DOCUMENTO = @CAMPO(HANDLE) AND TIPOMOVIMENTO = 15)"
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
                                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
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
                                UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                                PageWidgetHandle="57449" />
                        </div>
                        <!-- <div class="row"> tabCONTABILIZACAO -->
                    </div>
                    <!--<div class="tab-pane fade" id="tabCONTABILIZACAO"> -->
                </div>
                <!-- <div class="tab-content"> -->
            </div>
            <!-- <div class="portlet-body"> -->
        </div>
        <!-- <div class="col-md-8"> -->
    </div>
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDCONTASFINANCEIRAS", "FORMDOCUMENTO", "GRIDCONTASFINANCEIRAS");
            AddWebPartStaticConnection("GRIDCONTASFINANCEIRASGRIDCENTRODECUSTO", "FORMDOCUMENTO", "GRIDCENTRODECUSTO");
            AddWebPartStaticConnection("FORMDOCUMENTOGRIDPARCELAS", "FORMDOCUMENTO", "GRIDPARCELAS");
            AddWebPartStaticConnection("GRIDPARCELASFORMPARCELA", "GRIDPARCELAS", "FORMPARCELA");
            AddWebPartStaticConnection("FORMDOCUMENTOFORMCONTABILIZACAO", "FORMDOCUMENTO", "GRIDCONTABILIZACAO");
            AddWebPartStaticConnection("GRIDCONTABILIZACAOGRIDCT_LANCAMENTOS", "GRIDCONTABILIZACAO", "GRIDCT_LANCAMENTOS");
            AddWebPartStaticConnection("GRIDCT_LANCAMENTOSGRIDCT_LANCAMENTOCC", "GRIDCT_LANCAMENTOS", "GRIDCT_LANCAMENTOCC");
        }

    </script>
</asp:Content>
