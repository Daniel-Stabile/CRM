<%@ Page Title="Apuração" Language="C#" Inherits="ERP_Financeiro_Comissao_Apuracao" CodeFile="~/Erp/Financeiro/Comissao/Apuracao.aspx.cs" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <style>
        table.tableColumnValue {
            width: 100%;
        }

        td.valueSaldo {
            padding-right: 24px;
            width: 50%;
        }

        .note {
            font-family: "Open Sans", sans-serif;
        }

        .block.caption {
            font-size: 20px;
        }

        .note td {
            padding-right: 10px;
            font-size: 15px;
        }

        .note.note-success {
            color: #27a4b0;
        }

        .note.note-info {
            color: #327ad5;
        }

        .note.note-warning {
            color: #c29d0b;
        }

        .note.note-danger {
            color: #e73d4a;
        }

        .currencyvalue {
            display: inline-table;
        }

        .portlet.light {
            padding: 10px 15px;
        }
    </style>
    <div class="row portlet light" style="margin-left: 0px; margin-right: 0px;">
        <div class="col-xs-12 col-sm-5 col-md-5 col-lg-5">
            <div class="row" style="margin-left: -30px;">
                <wes:AjaxForm runat="server" ID="APURACAO" Title="Apuração" Subtitle="" PortletCssClass=""
                    PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId=""
                    ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True"
                    EntityViewName="FN_DOCUMENTOCOMISSOESAPURACOES.COMISSAO.APURACAO.FORM" FormMode="View"
                    IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageWidgetHandle="22378"
                    Level="20" Order="10" />
            </div>
        </div>
        <div class="col-xs-12 col-sm-7 col-md-7 col-lg-7 portlet light">
            <div class="row">
                <div class="portlet light" id="portlet_APURADO">
                    <div class="portlet-body form">
                        <div class="row">
                            <div class="mt-element-step">
                                <span class="mt-step-title uppercase font-grey-cascade" style="font-size: 20px;">Valores Apurados</span>
                                <div class="row step-thin" data-typename="apurados">
                                    <div class="col-lg-4 bg-grey mt-step-col done">
                                        <div class="mt-step-number first bg-white font-grey">+</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Receber</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="receber">0</div>
                                    </div>
                                    <div class="col-lg-4 bg-grey mt-step-col error">
                                        <div class="mt-step-number bg-white font-grey">–</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Descontar</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="descontar">0</div>
                                    </div>
                                    <div class="col-lg-4 bg-grey mt-step-col active">
                                        <div class="mt-step-number bg-white font-grey">=</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Valor</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="valor">0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="portlet light" id="portlet_DISPONIVEL">
                    <div class="portlet-body form">
                        <div class="row">
                            <div class="mt-element-step">
                                <span class="mt-step-title uppercase font-grey-cascade" style="font-size: 20px;">Valores Disponíveis</span>
                                <div class="row step-no-background-thin" data-typename="disponiveis">
                                    <div class="col-lg-4 mt-step-col done">
                                        <div class="mt-step-number first bg-white font-grey">+</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Receber</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="receber">0</div>
                                    </div>
                                    <div class="col-lg-4 mt-step-col error">
                                        <div class="mt-step-number bg-white font-grey">–</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Descontar</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="descontar">0</div>
                                    </div>
                                    <div class="col-lg-4 mt-step-col active">
                                        <div class="mt-step-number bg-white font-grey">=</div>
                                        <div class="mt-step-title uppercase font-grey-cascade">Valor</div>
                                        <div class="mt-step-content font-grey-cascade" data-name="valor">0</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="portlet light">
        <div class="row">
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="row">
                    <erp:ErpBasicSimpleGrid runat="server" ID="DISPONIVEIS" Title="Disponíveis" Subtitle=""
                        PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"
                        ProviderWidgetUniqueId="APURACAO" ChromeState="Fixed" CanDelete="True" CanUpdate="True"
                        CanInsert="True" EntityViewName="FN_DOCUMENTOCOMISSOES.COMISSAO.APURACAO.GRID"
                        UserDefinedCriteriaWhereClause="" Mode="Search" UserDefinedSelectColumnVisible="true"
                        UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True"
                        CompanyFilterMode="OnlyCompany" ShowExport="True" UserDefinedDisableRowSelection="False"
                        PageWidgetHandle="22326" Level="20" Order="10"
                        FormUrl="~/Erp/Financeiro/Comissao/Documento.aspx"
                        OnCommandExecute="DISPONIVEIS_CommandExecute" />
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                <div class="row">
                    <erp:ErpBasicSimpleGrid runat="server" ID="APURADOS" Title="Apurados" Subtitle="" PortletCssClass=""
                        PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true"
                        ProviderWidgetUniqueId="APURACAO" ChromeState="Fixed" CanDelete="false" CanUpdate="false"
                        CanInsert="false" EntityViewName="FN_DOCUMENTOCOMISSOES.COMISSAO.APURACAO.GRID"
                        UserDefinedCriteriaWhereClause="A.APURACAO = @CAMPO(HANDLE)" Mode="Search"
                        UserDefinedSelectColumnVisible="true" UserDefinedPageSize="10" SystemFilterOnly="False"
                        DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" ShowExport="True"
                        UserDefinedDisableRowSelection="False" PageWidgetHandle="22326" Level="20" Order="10"
                        FormUrl="~/Erp/Financeiro/Comissao/Documento.aspx" OnCommandExecute="APURADOS_CommandExecute" />                 
                </div>
            </div>
        </div>
    </div>
    <script>
        self.HandleApuracao = -1;
        function GetHandleApuracao() {
            if (self.HandleApuracao < 0) {
                var el = $('#ctl00_Main_APURACAO_HANDLE_HiddenField').val();
                if ((el.length > 0) && (el != undefined))
                    self.HandleApuracao = el;
            }
            return self.HandleApuracao;
        }
        function getInfoApurados() {
            elHandle = GetHandleApuracao();
            if (elHandle > 0) {
                spars = JSON.stringify({ 'prHandleApuracao': elHandle });
                $.ajax({
                    type: "POST",
                    url: "Apuracao.aspx/GetInfoApuracaoComissao",
                    async: false,
                    data: spars,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d)
                            setValores("apurados", response.d);
                    }
                });
            }
        }
        function getInfoDisponiveis() {
            elHandle = GetHandleApuracao();
            if (elHandle > 0) {
                spars = JSON.stringify({ 'prHandleApuracao': elHandle });
                $.ajax({
                    type: "POST",
                    url: "Apuracao.aspx/GetInfoDisponiveisComissao",
                    async: false,
                    data: spars,
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        if (response.d)
                            setValores("disponiveis", response.d);
                    }
                });
            }
        }

        function setValores(typeName, objValues) {
            $('div[data-typename="' + typeName + '"]').find('div[data-name="receber"]').text(objValues.Receber.FormattedValue);
            $('div[data-typename="' + typeName + '"]').find('div[data-name="descontar"]').text(objValues.Descontar.FormattedValue);
            $('div[data-typename="' + typeName + '"]').find('div[data-name="valor"]').text(objValues.Valor.FormattedValue);
        }
        $(document).ready(function () {
            loadPage();
        });
        $(function () {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(loadPage);
            }
        });
        function loadPage() {
            getInfoApurados();
            getInfoDisponiveis();
        }
    </script>
</asp:Content>
