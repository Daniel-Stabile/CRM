<%@ Control Language="C#" AutoEventWireup="true" Inherits="Benner.Corporativo.Wes.WebApp.Components.ConsultaDeDocumentos" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<div class="row">
    <wes:AjaxForm runat="server" ID="FORMFILTRO" Title="TESTE Visão form" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_VT_FILTROFISCALENTRADASAIDA.AVANCADO.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="TRIBUTOS_DOCUMENTOSFISCAIS_SAIDA" Level="20" Order="10" />
    <wes:SimpleGrid runat="server" ID="DOCUMENTOS" Title="Documentos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_DOCUMENTOS.CONSULTAFISCAL.CUSTOM.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/e/Tributos/Documentos/FiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DOCUMENTOSFISCAIS_SAIDA" Level="20" Order="20" />
    <wes:SimpleGrid runat="server" ID="PARCELAS" Title="Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.FISCALENTRADASAIDA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/e/Tributos/Documentos/FiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" PageId="TRIBUTOS_DOCUMENTOSFISCAIS_SAIDA" Level="20" Order="30" />
    <wes:SimpleGrid runat="server" ID="PARCELASDOCUMENTOS" Title="Documentos/Parcelas" Subtitle="" PortletCssClass="" PortletLayout="Default" ProviderWidgetUniqueId="DOCUMENTO" BootstrapCols="12" FontIcon="" ShowTitle="false" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="False" EntityViewName="FN_PARCELAS.DOCSFISCALENTRADASAIDA.GRID" Mode="None" UserDefinedSelectColumnVisible="True" UserDefinedPageSize="30" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" FormUrl="~/aga/e/Tributos/Documentos/FiscalForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)" PageId="TRIBUTOS_DOCUMENTOSFISCAIS_SAIDA" Level="20" Order="40" />
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
