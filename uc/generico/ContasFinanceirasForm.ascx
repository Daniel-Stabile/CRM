<%@ Control Language="C#" Inherits="uc_generico_ContasFinanceirasForm" CodeFile="~/uc/generico/ContasFinanceirasForm.ascx.cs" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<div class="row">
    <div id="divMsgRetorno" runat="server" visible="false" class="alert alert-warning">
        <button class="close" data-dismiss="alert"></button>
        <span id="msgRetorno" runat="server"></span>
    </div>

    <div id="divBotoes" class="col-lg-12 col-md-12 col-sm-12">
        <a id="botacaoConfirmar" runat="server" class="btn blue btn-save command-action predef-action editable" onserverclick="GravarRegistros">
            <i aria-hidden="true" class="fa fa-check"></i>
            Confirmar
        </a>
        <a id="botacaoCancelar" class="btn red btn-save command-action predef-action editable">
            <i aria-hidden="true" class="fa fa-times"></i>
            Cancelar
        </a>
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
        EntityViewName="FN_LANCAMENTOS.TODOSOSCAMPOS.GRID"
        UserDefinedSelectColumnVisible="False"
        UserDefinedPageSize="999"
        SystemFilterOnly="False"
        DisplayRowCommand="True"
        CompanyFilterMode="OnlyCompany"
        ShowExport="True"
        UserDefinedDisableRowSelection="False"
        PageWidgetHandle="22431"
        Level="20"
        Order="10" />

    <%--UserDefinedCriteriaWhereClause="(A.PARCELA IS NULL) AND @CAMPO(ORIGEM) = A.ORIGEM AND @CAMPO(TIPO) = A.TIPO AND @CAMPO(HANDLE) = A.HANDLE"--%>

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
        UserDefinedCommandsVisible="True"
        PageWidgetHandle="22432"
        Level="20"
        Order="20" />

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
        UserDefinedDisableRowSelection="False"
        PageWidgetHandle="22433"
        Level="20"
        Order="30" />

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
        UserDefinedCommandsVisible="True"
        PageWidgetHandle="22434"
        Level="20"
        Order="40" />
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

        $('#gridLancamentos td:not(.column-action):first a').click();
        $('#gridLancamentoCC td:not(.column-action):first a').click();

    });
</script>
