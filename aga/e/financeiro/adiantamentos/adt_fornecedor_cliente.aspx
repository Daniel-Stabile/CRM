<%@ Page Title="Adiantamentos cliente/fornecedor" Language="C#" AutoEventWireup="true" CodeFile="adt_fornecedor_cliente.aspx.cs" Inherits="AdiantamentoClienteFornecedorPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Adt_Forn_Cliente" ContentPlaceHolderID="Main" runat="Server">
    <div class="row" style="padding-left: 10px;">
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
            <div class="row">
                <div class="row">
                    <div>
                        <wes:AjaxForm runat="server" ID="PESSOA" FormMode="View" Title="Informações Pessoa" BootstrapCols="12" ShowTitle="True"
                            EntityViewName="GN_PESSOAS.ADTCCLIENTEFORN.FORM" CanDelete="False" CanUpdate="False" CanInsert="False"
                            ChromeState="Normal" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True"
                            HideDeveloperCommands="false" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-12 col-md-9 col-lg-9">
            <div class="tabbable-line portlet light">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#tab_overview" data-toggle="tab" aria-expanded="true">Compensação</a></li>
                    <li class=""><a href="#tab_Compensados" data-toggle="tab" aria-expanded="true">Compensados&nbsp;<i class="fa fa-arrow-down font-red"></i></a></li>
                </ul>
                <div class="tab-content">
                    <div class="tab-pane active" id="tab_overview">
                        <div class="somatorio row">
                            <div class="col-md-6">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <i class="widget-thumb-icon bg-blue fa fa-dollar"></i>
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Adiantamentos pagos</span>
                                            <span class="widget-thumb-body-stat" data-field="CUSTOM_QTD_ADTOS"></span>
                                        </div>
                                    </div>
                                    <h4 class="widget-thumb-heading widget-thumb-subtitle">Total</h4>
                                    <b data-field="CUSTOM_VALOR_ADTO"></b>
                                    <h4 class="widget-thumb-heading">Média</h4>
                                    <b data-field="CUSTOM_MEDIO_ADTO"></b>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <i class="widget-thumb-icon bg-red icon-arrow-down"></i>
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Adiantamentos compensados</span>
                                            <span class="widget-thumb-body-stat" data-field="CUSTOM_QTD_COMPENSADOS"></span>
                                        </div>
                                    </div>
                                    <h4 class="widget-thumb-heading widget-thumb-subtitle">Total</h4>
                                    <b data-field="CUSTOM_VALOR_COMPENSADOS"></b>
                                    <h4 class="widget-thumb-heading">Média</h4>
                                    <b data-field="CUSTOM_MEDIO_COMPENSADOS"></b>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="AdtPagos"
                                        ProviderWidgetUniqueId="PESSOA"
                                        UserDefinedPageSize="6"
                                        UserDefinedSelectColumnVisible="true"
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Adiantamentos"
                                        DisplayRowCommand="True"
                                        UserDefinedDisableRowSelection="true"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="Q_PARCELASADTOPAGOS.DATASOURCE.GRID" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="DocumentosPagos"
                                        ProviderWidgetUniqueId="PESSOA"
                                        UserDefinedPageSize="6"
                                        UserDefinedCriteriaWhereClause=""
                                        UserDefinedSelectColumnVisible="true"
                                        DefaultFilterName="Pessoa"
                                        Mode="Fixed"
                                        ShowTitle="true"
                                        Title="Documentos"
                                        CompanyFilterMode="CompanyAndBranch"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="true"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="Q_DOCUMENTOSPAGO.DATASOURCE.GRID" />
                                </div>
                            </div>
                        </div>
                         <div class="somatorio Selecionario row">
                            <div class="col-md-4">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Total adiantamentos: <b data-field="CUSTOM_VALOR_ADTO_SELECIONADO"></b></span>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Total de Títulos: <b data-field="CUSTOM_VALOR_COMPENSADOS_SELECIONADO"></b></span>
                                               
                                         </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Saldo títulos: <b data-field="CUSTOM_VALOR_Resto"></b></span>
                                            
                                         </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab_Compensados">
                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <a><strong>Para consultar as movimentações do adiantamento clique sobre o registro de adiantamento.</strong></a>
                                    <wes:SimpleGrid runat="server"
                                        ID="gridCompensados"
                                        ProviderWidgetUniqueId="PESSOA"
                                        UserDefinedPageSize="6"
                                        UserDefinedSelectColumnVisible="true"
                                        UserDefinedCriteriaWhereClause=""
                                        ChromeState="Normal"
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Compensados"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="false"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="QPARCELASADTOCOMPENSADOS.DATASOURCE.GRID" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="gridMovimentacoes"
                                        ProviderWidgetUniqueId="gridCompensados"
                                        UserDefinedPageSize="6"
                                        UserDefinedCriteriaWhereClause=" A.EHPREVISAO <> 'S' AND A.AUTORIZACAOPAGAMENTO = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN (3,17,19) "
                                        UserDefinedSelectColumnVisible="false"
                                        Visible="true" ChromeState="Normal"
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Movimentações"
                                        CompanyFilterMode="CompanyAndBranch"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="true"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="QMOVIMENTACOES.DATASOURCE.GRID" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<script src="../../../../content/js/adiantamentos/AdiantamentosClienteFornecedor.js"></script>
    <style>
        .pricing-content-1 .price-table-pricing > h3 {
            font-size: 60px;
            position: relative;
        }

        .widget-thumb .widget-thumb-heading {
            margin: 10px 0 0px;
        }
    </style>
<script>
    $(document).on('click', 'input', function () {
    debugger
    var handle = $(this).closest("tr")[0].getAttribute('handle');
    var selecionado = $(this).closest("tr")[0].getAttribute('class');
    var titulo = $(this).closest("table")[0].getAttribute('id');


    spars = JSON.stringify({ 'handle': handle, 'selecionar': selecionado,'titulo' : titulo });
    $.ajax({
        type: "POST",
        url: "adt_fornecedor_cliente.aspx/SomarValoresTiles",
        data: spars,
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            bindRodape(response.d);
        }
        });
    });

    function bindRodape(prDados) {
    setNoteValue("CUSTOM_VALOR_ADTO_SELECIONADO", prDados.ValorPagosSelecionado);
    setNoteValue("CUSTOM_VALOR_COMPENSADOS_SELECIONADO", prDados.ValorCompensadosSelecionado);
    setNoteValue("CUSTOM_VALOR_Resto", prDados.RestoSelecionado);
}
</script>
</asp:Content>

