<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Corporativo.Wes.WebApp.Components.ConsultaDeDocumentos" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<div class="row">
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.CONSULTADOCUMENTOS.CUSTOM.GRID" DefaultFilterName="Pré-definido padrão" Mode="SelectableRequired" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/e/financeiro/zoomdedocumentos/Form.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="WEB_A_FINANCEIRO_CONSULTADOCUMENTOS_CPA" Level="20" Order="20" />
</div>

<script type="text/javascript">
    $(function () {
        var pagina = Sys.WebForms.PageRequestManager.getInstance();
        if (!pagina.get_isInAsyncPostBack()) {
            pagina.add_endRequest(ControlElements);
        }

        ControlElements();
    });


    function ControlElements() {
        $('#ColunaValorDocumento').parent().parent().css("text-align", "left");
    }

    window.onload = function () {
        var buscaAvancada = $('#ctl00_Main_FILTRARDOCUMENTOS_PageControl_GERAL_GERAL_GRUPOBUSCAAVANCADA');
        if (buscaAvancada != null && !buscaAvancada.hasClass("minimized")) {
            buscaAvancada.children()[0].click();
        }
    };

</script>
<style>
    .rigth {
        text-align: right;
        display: block;
    }
</style>
