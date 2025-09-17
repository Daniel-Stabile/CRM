<%@ Page Language="C#" Title="Saldos banc&aacute;rios" AutoEventWireup="true" Inherits="PortalInterno.Tesouraria.PortalInternoTesourariaConsultarSaldosBancariosPage, Benner.Corporativo.Wes.WebApp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components.UI" TagPrefix="wes" %>

<%@ Register Assembly="Benner.Corporativo.Wes.WebApp" Namespace="PortalInterno.Tesouraria" TagPrefix="gridcontas" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="portlet light">
        <div class="portlet-title">
            <wes:AjaxForm runat="server" ID="FORMVT_FILTROSALDOSBANCARIOS" Title="Saldos banc&Aacuterios" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="FN_VT_FILTROSALDOSBANCARIOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" PageId="" Level="20" Order="20"  />
        </div>
        <div id="resultado" hidden>
            <div>
                <wes:AjaxForm runat="server" ID="PAINEL_TILES" Title="" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="False" CanUpdate="False" CanInsert="True" EntityViewName="FN_VT_FILTROSALDOSBANCARIOS.CUSTOM.FORM" FormMode="None" IncludeRecordInRecentItems="False" UserDefinedCriteriaWhereClause="" UserDefinedCommandsVisible="False" Level="20" Order="900"  />
            </div>
            <div class="portlet-body">            
                <div class="caption">
                    <span runat="server" class="caption-subject font-green-sharp bold uppercase">Contas</span>
                    <span runat="server" class="caption-helper">por <span id="labelTipoConsulta" style="font-weight:600;"></span></span>
                </div>
                <div id="grid">
                    <div class="portlet-body" style="height: auto;">
                        <div id="gridContainer"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" src="../../../Content/js/dx.messages.pt.js"></script>
    <script lang="javascript">	
        $(function () {
            var pagina = Sys.WebForms.PageRequestManager.getInstance();

            if (!pagina.get_isInAsyncPostBack()) {
                pagina.add_endRequest(processarVisibilidadeFiltro);
                pagina.add_endRequest(botoesControle);
            }

            processarVisibilidadeFiltro();
            botoesControle();

            let searchParams = new URLSearchParams(window.location.search);
            if ((searchParams.has('date')) && (searchParams.has('type'))) {
                __doPostBack('ctl00$Main$FORMVT_FILTROSALDOSBANCARIOS','Save');
            }
        });

        const botoesControle = () => {
            $('#ctl00_Main_FORMVT_FILTROSALDOSBANCARIOS_toolbar').append('<a class="btn custom-action command-action blue active" style="display: none" onclick="exibirFiltro();" id="labelExibirFiltro"> Exibir filtro </a><a class="btn custom-action command-action blue" onclick="ocultarFiltro(true);" id="labelOcultarFiltro"> Ocultar filtro </a>');
        };

        var processarVisibilidadeFiltro = () => {
            var estadoFiltro = sessionStorage.getItem('TOGGLE_FILTRO_FORMVT_FILTROSALDOSBANCARIOS');

            if (estadoFiltro === "Oculto" || $("#HasFilterApplied_FORMVT_FILTROSALDOSBANCARIOS").val() == "True")
                ocultarFiltro();
        };

        var ocultarFiltro = (fadeOut) => {
            if (fadeOut)
                $('#ctl00_Main_FORMVT_FILTROSALDOSBANCARIOS_FilterControl_FilterContainer').fadeOut(500);
            else
                $('#ctl00_Main_FORMVT_FILTROSALDOSBANCARIOS_FilterControl_FilterContainer').hide();

            $('#labelOcultarFiltro').addClass('active');
            $('#labelExibirFiltro').removeClass('active');
            $('#labelOcultarFiltro').css('display', 'none');
            $('#labelExibirFiltro').css('display', '');

            sessionStorage.setItem('TOGGLE_FILTRO_FORMVT_FILTROSALDOSBANCARIOS', "Oculto");
        };

        var exibirFiltro = () => {
            $('#ctl00_Main_FORMVT_FILTROSALDOSBANCARIOS_FilterControl_FilterContainer').fadeIn(500);
            $("#HasFilterApplied_FORMVT_FILTROSALDOSBANCARIOS").val("False");

            $('#labelOcultarFiltro').css('display', '');
            $('#labelExibirFiltro').css('display', 'none');

            sessionStorage.setItem('TOGGLE_FILTRO_FORMVT_FILTROSALDOSBANCARIOS', "Visivel");
        };

        function Filtrar(filiais, dataBaseConsulta, tipoData) {
            var filtro = {
                Filiais: filiais,
                DataBaseConsulta: dataBaseConsulta,
                TipoData: tipoData
            };
            $.post(Benner.Page.getApplicationPath() + 'api/SaldosBancarios/MontarGrid', filtro)            
            .done(function(result) {
                let valorResult = result;
                if (valorResult == "")
                    $("#resultado").hide();
                else
                {
                    ocultarFiltro(true);
                    $("#resultado").show();
                }
                $("#gridContainer").dxDataGrid(JSON.parse(result))
                                   .dxDataGrid({
                                        selection: {
                                            mode: "single"
                                        },onRowClick: function (selectedItems) {
                                            window.location.replace(Benner.Page.getApplicationPath() + "aga/e/financeiro/tesouraria/GridCustom.aspx?p=1&hdl=" + selectedItems.data.HANDLE + "&date=" + filtro.DataBaseConsulta.replaceAll('/','') + "&type=" + filtro.TipoData);
                                        }})
            });
        };

        const SetarValoresTiles = () => {
            var jsonValoresTiles = JSON.parse($("#JsonValoresTiles").val());
        
            $("#tileTotalSaldo .details .number").text("R$ " + jsonValoresTiles.TotalSaldo);
            $("#tileTotalFuturo .details .number").text("R$ " + jsonValoresTiles.TotalFuturo);
            $("#tileTotalGeral .details .number").text("R$ " + jsonValoresTiles.TotalGeral);

            $("#tileTotalSaldo .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalSaldo) >= 0 ? "blue" : "red", true);
            $("#tileTotalFuturo .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalFuturo) >= 0 ? "blue" : "red", true);
            $("#tileTotalGeral .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalGeral) >= 0 ? "blue" : "red", true);

            $("#tileTotalSaldo .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalSaldo) >= 0 ? "red" : "blue", false);
            $("#tileTotalFuturo .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalFuturo) >= 0 ? "red" : "blue", false);
            $("#tileTotalGeral .dashboard-stat").toggleClass(parseFloat(jsonValoresTiles.TotalGeral) >= 0 ? "red" : "blue", false);
        };

        const setarTipoConsulta = () => $("#labelTipoConsulta").text($("#tipoConsulta").val());
    </script>
</asp:Content>
