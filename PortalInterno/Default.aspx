<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Painel colaborador</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">

    <div class="row">
        <erp:ErpDashboardStat ID="tile11" runat="server" source="InternoNecessidades" color="blue-madison" />
        <erp:ErpDashboardStat ID="tile12" runat="server" source="InternoRequisicoesAtendimento" color="green-haze" />
        <erp:ErpDashboardStat ID="tile13" runat="server" source="InternoRequisicoesAguardandoAprovacao" color="purple-plum" />
    </div>

    <script>
		$(document).ready(function() {
		    ExibirMenusPortalInterno();		
		});		
    </script>
</asp:Content>
