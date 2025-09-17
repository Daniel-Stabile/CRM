<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalFornecedores.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">


    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Painel Fornecedor</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">

            <div class="row">
                <erp:ErpDashboardStat ID="tile1" runat="server" source="FornecedorCotacoesPendentes" color="blue-madison" />
                <erp:ErpDashboardStat ID="tile3" runat="server" source="FornecedorUltimoPedido" color="purple-plum" />
                <erp:ErpDashboardStat ID="tile4" runat="server" source="FornecedorNumeroPedidos-30" color="red-intense" />
                <erp:ErpDashboardStat ID="tile2" runat="server" source="FornecedorPedidosPendentesTile" color="green-haze" hideZeroValue="true" />
            </div>
            <br />
            <div class="row">
                <erp:ErpDashboardStat ID="tile5" runat="server" source="FornecedorDocumentosPendentes" color="red-intense" />
                <erp:ErpDashboardStat ID="tile6" runat="server" source="FornecedorAcidentesTrabalhoPendentes" color="red-intense" />
            </div>
            <br />

            <div class="row" style="margin-top:20px;">
                <div class="col-md-6 col-sm-6">
                    <erp:ErpDashboardChart ID="chart1" runat="server" source="fornecedores-0" color="white" />
                </div>
                <div class="col-md-6 col-sm-6">
                    <erp:ErpDashboardChart ID="chart2" runat="server" source="fornecedores-9" color="white" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
