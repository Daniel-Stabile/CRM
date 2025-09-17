<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalCliente.DefaultPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">

    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Painel Cliente</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">
            <div class="row">
                <erp:ErpDashboardStat ID="tile11" runat="server" source="ClienteValoresEmAtraso" color="red-intense" />               
				<erp:ErpDashboardStat ID="tile12" runat="server" source="ClienteValoresAVencer" color="green-haze" />
                <erp:ErpDashboardStat ID="tile13" runat="server" source="ClientePedidosUltimosNDias-30" color="purple-plum" />
                <erp:ErpDashboardStat ID="tile14" runat="server" source="ClienteDataUltimoPedido" color="blue-madison" />				
            </div>	
			<br/>
			<div class="row">                
				<erp:ErpDashboardStat ID="tile15" runat="server" source="ClienteValoresPreContratos" color="green-turquoise" />               
            </div>
			<br/>
            <div class="row">
                <div class="col-md-12 col-sm-12">
                    <erp:ErpDashboardChart ID="chart1" runat="server" source="cliente-1" color="grey-cararra" />
                </div>
            </div>
        </div>
    </div>

</asp:Content>
