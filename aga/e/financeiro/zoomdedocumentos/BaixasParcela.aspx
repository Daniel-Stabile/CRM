<%@ Page Title="Baixas" Language="C#" CodeFile="~/aga/e/financeiro/zoomdedocumentos/BaixasParcela.aspx.cs" Inherits="zoomdedocumentosBaixasParcelaPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:SimpleGrid runat="server" ID="BAIXAS" Title="Baixas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_MOVIMENTACOES.BAIXAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.TIPOMOVIMENTO IN (1,2,3,5,6,8,9,14,16,17,18,19,20,15,4,22,23)" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="5" />
    </div>
    <div class="row">
        <div class="col-md-12">
            <div class="portlet light">
                <div class="portlet-body">
                    <div class="row">
                        <div class="col-md-12">
                            <ul runat="server" ID="TABS" class="nav nav-tabs">
                                <li runat="server" ID="TAB_BAIXAS" class="active">
                                    <a href="#tabBAIXAS" data-toggle="tab" aria-expanded="true">Baixa</a>
                                </li>
                                <li runat="server" ID="TAB_CONTASFINANCEIRAS" class="">
                                    <a href="#tabCONTASFINANCEIRAS" data-toggle="tab" aria-expanded="false">Contas financeira</a>
                                </li>
                                <li runat="server" ID="TAB_LANCAMENTOS" class="">
                                    <a href="#tabLANCAMENTOS" data-toggle="tab" aria-expanded="false">Lançamentos</a>
                                </li>
                                <li runat="server" ID="TAB_COMPENSACOES" class="">
                                    <a href="#tabCOMPENSACOES" data-toggle="tab" aria-expanded="false">Compensações</a>
                                </li>
                                <li runat="server" ID="TAB_IMPOSTOSRETIDOS" class="">
                                    <a href="#tabIMPOSTOSRETIDOS" data-toggle="tab" aria-expanded="false">Impostos retidos</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane fade active in" id="tabBAIXAS">
                                    <div class="row">
                                        <wes:AjaxForm
                                            runat="server"
                                            ID="BAIXA"
                                            ShowTitle="False"
                                            PortletCssClass=""
                                            PortletLayout="Default"
                                            BootstrapCols="12"
                                            FontIcon=""
                                            ProviderWidgetUniqueId="BAIXAS"
                                            ChromeState="Normal"
                                            CanDelete="True"
                                            CanUpdate="True"
                                            CanInsert="True"
                                            EntityViewName="FN_MOVIMENTACOES_BAIXASPARCELAS.FORM"
                                            FormMode="View"
                                            IncludeRecordInRecentItems="True"
                                            UserDefinedCommandsVisible="True"
                                            PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM"
                                            Level="20"
                                            Order="10"  />
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
                                            ProviderWidgetUniqueId="BAIXAS"
                                            Mode="None"
                                            UserDefinedSelectColumnVisible="False"
                                            UserDefinedPageSize="10"
                                            SystemFilterOnly="False"
                                            DisplayRowCommand="True"
                                            CompanyFilterMode="OnlyCompany"
                                            UserDefinedDisableRowSelection="False"
                                            UserDefinedCriteriaWhereClause="A.MOVIMENTACAO IS NOT NULL AND A.MOVIMENTACAO = @CAMPO(HANDLE)"
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
                                            ProviderWidgetUniqueId="GRIDCONTASFINANCEIRAS"
                                            UserDefinedPageSize="10"
                                            SystemFilterOnly="False"
                                            DisplayRowCommand="False"
                                            CompanyFilterMode="OnlyCompany"
                                            UserDefinedDisableRowSelection="False"
                                            UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE) AND A.CENTROCUSTO IN (SELECT HANDLE FROM CT_CC)"
                                            PageWidgetHandle="57449" />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tabLANCAMENTOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server"
                                            ID="GRIDCONTABILIZACAO"
                                            FormMode="View"
                                            Title="Contabilização"
                                            ProviderWidgetUniqueId="BAIXAS"
                                            BootstrapCols="12"
                                            ShowTitle="False"
                                            EntityViewName="CT_LANCAMENTOS.ZOOMDEPARCELAS.CONTABILIZACAO.GRID"
                                            ChromeState="Fixed"
                                            CanDelete="False"
                                            CanUpdate="False"
                                            CanInsert="False"
                                            IncludeRecordInRecentItems="True"
                                            UserDefinedCommandsVisible="True"
                                            UserDefinedCriteriaWhereClause="A.LANCAMENTOMOVIMENTACAO = @CAMPO(HANDLE) AND A.LANCAMENTOORIGINAL IS NULL"
                                            PageWidgetHandle="57510" />
                                    </div>
                                    <div class="row">
                                        <wes:AjaxForm runat="server"
                                            ID="FORMCT_LANCAMENTOS"
                                            BootstrapCols="6"
                                            ShowTitle="False"
                                            Title="Lançamentos da contabilização"
                                            ProviderWidgetUniqueId="GRIDCONTABILIZACAO"
                                            EntityViewName="CT_LANCAMENTOS.ZOOMDEDOCUMENTOS.LANCAMENTOS.FORM"
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
                                            ProviderWidgetUniqueId="GRIDCONTABILIZACAO"
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
                                </div>
                                <div class="tab-pane fade" id="tabCOMPENSACOES">
                                    <div class="row">
                                        <wes:AjaxForm runat="server"
                                            ID="DOCUMENTOCOMPENSADO"
                                            BootstrapCols="6"
                                            ShowTitle="False"
                                            ProviderWidgetUniqueId="BAIXAS"
                                            EntityViewName="FN_DOCUMENTOS.COMPENSACOES.FORM"
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
                                            UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT DOCUMENTO FROM FN_PARCELAS WHERE HANDLE = @CAMPO(PARCELABAIXA))"
                                            PageWidgetHandle="58469" />

                                        <wes:SimpleGrid runat="server"
                                            ID="PARCELASCOMPENSADA"
                                            BootstrapCols="6"
                                            ShowTitle="False"
                                            ProviderWidgetUniqueId="BAIXAS"
                                            EntityViewName="FN_PARCELAS.COMPENSACOES.GRID"
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
                                            UserDefinedCriteriaWhereClause="A.DOCUMENTO IN (SELECT DOCUMENTO FROM FN_PARCELAS WHERE HANDLE = @CAMPO(PARCELABAIXA))"
                                            PageWidgetHandle="59449" />
                                    </div>
                                </div>
                                <div class="tab-pane fade" id="tabIMPOSTOSRETIDOS">
                                    <div class="row">
                                        <wes:SimpleGrid runat="server"
                                            ID="SimpleGrid1"
                                            FormMode="View"
                                            Title="Impostos retidos"
                                            ProviderWidgetUniqueId="BAIXAS"
                                            BootstrapCols="12"
                                            ShowTitle="False"
                                            EntityViewName="FN_DOCUMENTOIMPOSTOSPARCELAS.CUSTOM.GRID"
                                            ChromeState="Fixed"
                                            CanDelete="False"
                                            CanUpdate="False"
                                            CanInsert="False"
                                            IncludeRecordInRecentItems="True"
                                            UserDefinedCommandsVisible="True"
                                            UserDefinedCriteriaWhereClause="MOVIMENTACAO = @CAMPO(HANDLE) AND TIPO IN(4,3)"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <wes:AjaxForm runat="server" ID="DADOSDATESOURARIA" Title="Dados da tesouraria" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="BAIXA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="LANCAMENTO_TEROUSARIA_BAIXADIRETA.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(LANCAMENTOTESOURARIA)" UserDefinedCommandsVisible="True" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="20" />
        <wes:AjaxForm runat="server" ID="DOCUMENTOGERADO" Title="Documento gerado" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="BAIXA" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.RETENCAO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(DOCUMENTOGERADO)" UserDefinedCommandsVisible="True" PageId="WEB_E_FINANCEIRO_BAIXASPARCELA_FORM" Level="20" Order="30" />
    </div>
    <script type="text/javascript">
        function EsconderTabCompensacoes() {
            $('#ctl00_Main_TAB_COMPENSACOES').hide()
        }

        function MostrarTabCompensacoes() {
            $('#ctl00_Main_TAB_COMPENSACOES').show()
        }
    </script>
    
</asp:Content>
