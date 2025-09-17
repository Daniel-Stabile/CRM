<%@ Page Title="Devoluções cliente/fornecedor" AutoEventWireup="true" Language="C#" CodeFile="dev_fornecedor_cliente.aspx.cs" Inherits="DevolucoesClienteFornecedorPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Dev_Forn_Cliente" ContentPlaceHolderID="Main" runat="Server">
    <div class="row" style="padding-left: 10px;">
        <div class="col-xs-12 col-sm-12 col-md-3 col-lg-3">
            <div class="row">
                <div class="row">
                    <div>
                        <wes:AjaxForm runat="server"
                            ID="PESSOA"
                            FormMode="View"
                            Title="Informações Pessoa"
                            BootstrapCols="12"
                            ShowTitle="True"
                            EntityViewName="GN_PESSOAS.DEVCLIENTEFORN.FORM"
                            CanDelete="False"
                            CanUpdate="False"
                            CanInsert="False"
                            ChromeState="Normal"
                            IncludeRecordInRecentItems="True"
                            UserDefinedCommandsVisible="True"
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
                                            <span class="widget-thumb-subtitle">Devoluções pagas</span>
                                            <span class="widget-thumb-body-stat" data-field="CUSTOM_QTD_DEV"></span>
                                        </div>
                                    </div>
                                    <h4 class="widget-thumb-heading widget-thumb-subtitle">Total</h4>
                                    <b data-field="CUSTOM_VALOR_DEV"></b>
                                    <h4 class="widget-thumb-heading">Média</h4>
                                    <b data-field="CUSTOM_MEDIA_DEV"></b>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="widget-thumb widget-bg-color-white text-uppercase">
                                    <div class="widget-thumb-wrap">
                                        <i class="widget-thumb-icon bg-red icon-arrow-down"></i>
                                        <div class="widget-thumb-body">
                                            <span class="widget-thumb-subtitle">Devoluções compensadas</span>
                                            <span class="widget-thumb-body-stat" data-field="CUSTOM_QTD_COMPENSADOS"></span>
                                        </div>
                                    </div>
                                    <h4 class="widget-thumb-heading widget-thumb-subtitle">Total</h4>
                                    <b data-field="CUSTOM_VALOR_COMPENSADOS"></b>
                                    <h4 class="widget-thumb-heading">Média</h4>
                                    <b data-field="CUSTOM_MEDIA_COMPENSADOS"></b>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="DevolucoesPagas"
                                        ProviderWidgetUniqueId="PESSOA"
                                        UserDefinedPageSize="6"
                                        UserDefinedSelectColumnVisible="true"
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Devoluções"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="true"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="Q_PARCELASDEVPAGOS.DATASOURCE.GRID" />
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
                                        EntityViewName="Q_DOCUMENTOSPAGODEV.DATASOURCE.GRID"
                                        OnFilterExecute="DocumentosPagos_FilterExecute" />
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane" id="tab_Compensados">
                        <div class="row">
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="Compensados"
                                        ProviderWidgetUniqueId="PESSOA"
                                        UserDefinedPageSize="6"
                                        UserDefinedSelectColumnVisible="true"
                                        UserDefinedCriteriaWhereClause=""
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Compensados"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="false"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="Q_PARCELASDEVCOMPENSADOS.DATASOURCE.GRID" />
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div>
                                    <wes:SimpleGrid runat="server"
                                        ID="Movimentacoes"
                                        ProviderWidgetUniqueId="Compensados"
                                        UserDefinedPageSize="6"
                                        UserDefinedCriteriaWhereClause=" A.EHPREVISAO <> 'S' AND A.AUTORIZACAOPAGAMENTO = @CAMPO(HANDLE) AND A.TIPOMOVIMENTO IN (2,18) "
                                        UserDefinedSelectColumnVisible="false"
                                        Visible="true"
                                        ChromeState="Normal"
                                        Mode="None"
                                        ShowTitle="true"
                                        Title="Movimentações"
                                        CompanyFilterMode="CompanyAndBranch"
                                        DisplayRowCommand="false"
                                        UserDefinedDisableRowSelection="true"
                                        CanInsert="false"
                                        CanUpdate="false"
                                        CanDelete="false"
                                        EntityViewName="QMOVIMENTACOESDEV.DATASOURCE.GRID" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>

        $(document).ready(function () {
            LoadInfoTiles();
        });

        function GetHandlePessoa() {
            return $('#ctl00_Main_PESSOA_HANDLE_HiddenField').val();
        }

        function GetTipo() {
            const urlParams = new URLSearchParams(window.location.search);
            const myParam = urlParams.get('tp');
        
            if (myParam != null) {
                if (myParam.toString() == "5") {
                    return "S";
                }
                else if (myParam.toString() == "6") {
                    return "E";
                }
            }
        
            return "";
        }


        function LoadInfoTiles() {
            spars = JSON.stringify({ 'handlePessoa': GetHandlePessoa(), 'tipo': GetTipo() });
            $.ajax({
                type: "POST",
                url: "dev_fornecedor_cliente.aspx/BuscarValoresTiles",
                data: spars,
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    bindTiles(response.d);
                }
            });
        }

        function bindTiles(prDados) {
            setNoteValue("CUSTOM_QTD_DEV", prDados.QuantidadePagos);
            setNoteValue("CUSTOM_QTD_COMPENSADOS", prDados.QuantidadeCompensados);
            setNoteValue("CUSTOM_VALOR_DEV", prDados.ValorPagos);
            setNoteValue("CUSTOM_VALOR_COMPENSADOS", prDados.ValorCompensados);
            setNoteValue("CUSTOM_MEDIA_DEV", prDados.MediaPagos);
            setNoteValue("CUSTOM_MEDIA_COMPENSADOS", prDados.MediaCompensados);
        }

        function setNoteValue(field, value) {
            $('.somatorio').find('[data-field="' + field + '"]').text(" " + value);
        }

    </script>

    <style>
        .pricing-content-1 .price-table-pricing > h3 {
            font-size: 60px;
            position: relative;
        }

        .widget-thumb .widget-thumb-heading {
            margin: 10px 0 0px;
        }
    </style>
</asp:Content>
