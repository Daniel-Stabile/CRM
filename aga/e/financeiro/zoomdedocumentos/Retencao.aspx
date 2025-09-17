<%@ Page Title="Retenção" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Financeiro.ZoomDeDocumentos.Retencao" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-4 ">
            <div class="row">
                <wes:AjaxForm
                    runat="server"
                    ID="IMPOSTOS"
                    Title="Retenção"
                    PortletCssClass=""
                    PortletLayout="Default"
                    BootstrapCols="12"
                    FontIcon=""
                    ShowTitle="true"
                    ProviderWidgetUniqueId=""
                    ChromeState="Fixed"
                    CanDelete="False"
                    CanUpdate="True"
                    CanInsert="False"
                    EntityViewName="FN_DOCUMENTOIMPOSTOS.CUSTOM.FORM"
                    FormMode="View"
                    IncludeRecordInRecentItems="False"
                    UserDefinedCommandsVisible="True"
                    PageWidgetHandle="22514"
                    Level="20" Order="10" />
            </div>
        </div>
        <div class="col-md-8">

            <wes:SimpleGrid
                runat="server"
                ID="RETENOTERCEIROS"
                Title="Retenção terceiros"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="Default"
                BootstrapCols="12"
                FontIcon=""
                ShowTitle="true"
                ProviderWidgetUniqueId="IMPOSTOS"
                ChromeState="Normal"
                CanDelete="True"
                CanUpdate="True"
                CanInsert="True"
                EntityViewName="FN_DOCUMENTOIMPOSTOSTERCEIROS.RETENCAO.GRID"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="True"
                CompanyFilterMode="OnlyCompany"
                ShowExport="False"
                FormUrl="~/aga/e/financeiro/zoomdedocumentos/RetencaoTerceiros.aspx"
                UserDefinedCriteriaWhereClause="A.RETENCAO = @CAMPO(HANDLE)"
                UserDefinedDisableRowSelection="False"
                PageWidgetHandle="22517"
                Level="20"
                Order="40"
                Visible="false" />

            <wes:AjaxForm
                runat="server"
                ID="DOCUMENTOGERADO"
                Title="Documento Gerado"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="Default"
                BootstrapCols="5"
                FontIcon=""
                ShowTitle="true"
                ChromeState="Fixed"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                EntityViewName="FN_DOCUMENTOS.RETENCAO.FORM"
                FormMode="View"
                IncludeRecordInRecentItems="False"
                UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(DOCUMENTOGERADO) OR
A.HANDLE IN (SELECT DOCUMENTOGERADO FROM FN_DOCUMENTOIMPOSTOSPARCELAS
              WHERE DOCUMENTO = @CAMPO(HANDLE)
                AND IMPOSTO = @CAMPO(IMPOSTO)
                AND NOT(DOCUMENTOGERADO IS NULL)) OR
A.HANDLE IN (SELECT RETIDOPORTERCEIRO.DOCUMENTOGERADO
               FROM FN_DOCUMENTOIMPOSTOSPARCELAS RETIDONABAIXA
               JOIN FN_RETENCAOTERCEIROPARCELA RETIDOPORTERCEIRO
                 ON RETIDOPORTERCEIRO.RETIDONABAIXA = RETIDONABAIXA.HANDLE
              WHERE RETIDONABAIXA.DOCUMENTO = @CAMPO(HANDLE)
                AND RETIDONABAIXA.IMPOSTO = @CAMPO(IMPOSTO)
                AND NOT(RETIDOPORTERCEIRO.DOCUMENTOGERADO IS NULL))
                "
                UserDefinedCommandsVisible="False"
                PageWidgetHandle="22515"
                Level="20"
                Order="20" />

            <wes:SimpleGrid
                runat="server"
                ID="VENCIMENTOS"
                Title="Vencimentos"
                Subtitle=""
                PortletCssClass=""
                PortletLayout="Default"
                BootstrapCols="7"
                FontIcon=""
                ShowTitle="true"
                ProviderWidgetUniqueId="DOCUMENTOGERADO"
                ChromeState="Fixed"
                CanDelete="False"
                CanUpdate="False"
                CanInsert="False"
                EntityViewName="FN_PARCELAS.RETENCAO.GRID"
                Mode="None"
                UserDefinedSelectColumnVisible="False"
                UserDefinedPageSize="10"
                SystemFilterOnly="False"
                DisplayRowCommand="False"
                CompanyFilterMode="OnlyCompany"
                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                ShowExport="False"
                UserDefinedDisableRowSelection="False"
                PageWidgetHandle="22516"
                Level="20"
                Order="30" />
        </div>
    </div>
    <script>
        $(function () {
            // Application event handlers for component developers.
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(function (sender, args) {
                    if ($('#RETENOTERCEIROS tr.active').length == 0)
                        $('#RETENOTERCEIROS td:not(.column-action):first').click();
                });
            }

            $('#RETENOTERCEIROS td:not(.column-action):first').click();

        });
    </script>
</asp:Content>
