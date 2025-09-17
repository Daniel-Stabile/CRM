<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalInterno.Dashboards.Financeiro.PortalInternoDocumentosEmitidosPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <h3 class="page-title">
        Contas a receber emitidos
    </h3>

    <div class="row">
        <erp:ErpDashboardStat ID="tile1" runat="server" source="PortalInternoContasReceberPMFTile" color="blue-madison" />
        <erp:ErpDashboardStat ID="tile2" runat="server" source="PortalInternoContasReceberPMRTile" color="green-haze" />
    </div>

    <div class="row">
        <div class="col-md-12 col-sm-12">
            <erp:ErpDashboardChart ID="ErpDashboardChart1" runat="server" source="PortalInternoContasReceberFaturamentoChart-2142342df,23232,23423,42,234,234,23,423,4" color="grey-cararra" />
        </div>
    </div>
    

</asp:Content>
