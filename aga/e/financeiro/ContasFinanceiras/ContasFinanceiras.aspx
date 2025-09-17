<%@ Page Title="Contas Financeiras" Language="C#" CodeFile="~/aga/e/financeiro/ContasFinanceiras/ContasFinanceiras.aspx.cs" Inherits="ContasFinanceirasContasFinanceirasPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div id="divBotoes" class="col-lg-12 col-md-12 col-sm-12">
            <a id="botaoConfirmar" runat="server" class="btn blue btn-save command-action predef-action editable" onserverclick="BotaoConfirmar_OnClick">
                <i aria-hidden="true" class="fa fa-check"></i>
                Confirmar
            </a>
            <a id="botaoCancelar" runat="server" class="btn red btn-save command-action predef-action editable" onserverclick="BotaoCancelar_OnClick">
                <i aria-hidden="true" class="fa fa-times"></i>
                Cancelar
            </a>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div id="divMsgRetorno" runat="server" visible="false" class="alert alert-warning">
                <button class="close" data-dismiss="alert"></button>
                <span id="msgRetorno" runat="server"></span>
            </div>
        </div>
    </div>
    <br />
    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="gridLancamentos"
            Title="Lançamentos financeiros"
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="7"
            FontIcon=""
            ShowTitle="true"
            ChromeState="Fixed"
            CanDelete="False"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="FN_LANCAMENTOS.ZOOMDOC.GRID"
            UserDefinedSelectColumnVisible="False"
            UserDefinedPageSize="999"
            SystemFilterOnly="False"
            DisplayRowCommand="True"
            CompanyFilterMode="OnlyCompany"
            ShowExport="True"
            UserDefinedDisableRowSelection="False" />

        <wes:AjaxForm runat="server"
            ID="formLancamentos"
            Title=""
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="5"
            FontIcon=""
            ShowTitle="False"
            ProviderWidgetUniqueId="gridLancamentos"
            ChromeState="Fixed"
            CanDelete="True"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="FN_LANCAMENTOS.ZOOMDOC.FORM"
            FormMode="None"
            IncludeRecordInRecentItems="True"
            UserDefinedCommandsVisible="True" />
    </div>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="gridLancamentoCC"
            Title="Centros de custos"
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="7"
            FontIcon=""
            ShowTitle="true"
            ProviderWidgetUniqueId="formLancamentos"
            ChromeState="Fixed"
            CanDelete="False"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="FN_LANCAMENTOCC.TODOSOSCAMPOS.GRID"
            UserDefinedSelectColumnVisible="False"
            UserDefinedPageSize="999"
            SystemFilterOnly="False"
            DisplayRowCommand="True"
            CompanyFilterMode="OnlyCompany"
            ShowExport="True"
            UserDefinedDisableRowSelection="False" />

        <wes:AjaxForm runat="server"
            ID="formLancamentoCC"
            Title=" "
            Subtitle=""
            PortletCssClass=""
            PortletLayout="Default"
            BootstrapCols="5"
            FontIcon=""
            ShowTitle="False"
            ProviderWidgetUniqueId="gridLancamentoCC"
            ChromeState="Fixed"
            CanDelete="True"
            CanUpdate="True"
            CanInsert="True"
            EntityViewName="FN_LANCAMENTOCC.ZOOMDOC.FORM"
            FormMode="None"
            IncludeRecordInRecentItems="True"
            UserDefinedCommandsVisible="True" />
    </div>

    <script>
        $(function () {
            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    if ($('#gridLancamentoCC tr.active').length == 0)
                        $('#gridLancamentoCC td:not(.column-action):first a').click();
                    var formLancamentosHeight = $('#formLancamentos').height() - $('#gridLancamentos').height();
                    var newHeight = $('#gridLancamentos .table-responsive').height() + formLancamentosHeight;
                    $('#gridLancamentos .table-responsive').height(newHeight);
                    $('#gridLancamentos .table-responsive').css("overflow-y", "auto");
                    $('#gridLancamentos .table-responsive').css("min-height", "290px");

                    var formLancamentoCCHeight = $('#formLancamentoCC').height() - $('#gridLancamentoCC').height();
                    var newHeightCC = $('#gridLancamentoCC .table-responsive').height() + formLancamentoCCHeight;
                    $('#gridLancamentoCC .table-responsive').height(newHeightCC);
                    $('#gridLancamentoCC .table-responsive').css("overflow-y", "auto");
                    $('#gridLancamentoCC .table-responsive').css("min-height", "210px");
                });
            }
            SelecionaItemGrid();
        });

        function SelecionaItemGrid() {
            $('#gridLancamentos td:not(.column-action):first a').click();
            $('#gridLancamentoCC td:not(.column-action):first a').click();
        };
    </script>

</asp:Content>