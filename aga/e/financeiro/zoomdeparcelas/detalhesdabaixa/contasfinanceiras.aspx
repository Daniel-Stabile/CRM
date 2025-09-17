<%@ Page Title="Contas Financeiras" Language="C#" Inherits="Benner.Tecnologia.Wes.Components.WebApp.WesPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
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
            CanDelete="False"
            CanUpdate="False"
            CanInsert="False"
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
            ProviderWidgetUniqueId="gridLancamentos"
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
            CanDelete="False"
            CanUpdate="False"
            CanInsert="False"
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

                    var formLancamentoCCHeight = $('#formLancamentoCC').height() - $('#gridLancamentoCC').height();
                    var newHeightCC = $('#gridLancamentoCC .table-responsive').height() + formLancamentoCCHeight;
                    $('#gridLancamentoCC .table-responsive').height(newHeightCC);
                    $('#gridLancamentoCC .table-responsive').css("overflow-y", "auto");
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
