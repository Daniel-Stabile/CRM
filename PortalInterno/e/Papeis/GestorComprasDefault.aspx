<%@ Page Language="C#" Title="Início" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="Benner" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <style>
		.dashboard-stat{
			margin-bottom: 25px !important;
		}
	</style>
    <script runat="server">
        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            
            var def = Benner.Tecnologia.Common.EntityDefinition.FromQuery(" SELECT ESTOQUEMINIMO FROM PD_PARAMETROSESTOQUEEMPRESA WHERE EMPRESA = @EMPRESA");
            var param = Benner.Tecnologia.Common.Entity.GetFirstOrDefault(def, new Benner.Tecnologia.Common.Criteria());
            if (param != null)
                if (param["ESTOQUEMINIMO"].GetDecimal() == 0)
                {
                    tile14.Visible = false;   
                }
        }
    </script>

    <div class="portlet light ">
        <div class="portlet-title">
            <div class="caption">
                <span runat="server" id="NomeTitulo" class="caption-subject font-green-sharp bold uppercase">Gestor de compras</span>
                <span runat="server" id="HelperTitulo" class="caption-helper">indicadores</span>
            </div>
        </div>
        <div class="portlet-body">

    <div class="row">
        <erp:ErpDashboardStat ID="tile15" runat="server" source="InternoSolicitacoesAguardandoAprovacao" color="blue-madison" />
        <erp:ErpDashboardStat ID="tile11" runat="server" source="InternoRequisicoesAguardandoConfirmacao" color="blue-madison" />
        <erp:ErpDashboardStat ID="tile13" runat="server" source="InternoRequisicoesAguardandoCotacao" color="purple-plum" />
        <erp:ErpDashboardStat ID="tile12" runat="server" source="InternoOrdensCompraConfirmar" color="green-haze" />
        <erp:ErpDashboardStat ID="tile14" runat="server" source="InternoProdutosEstoqueMinimo" color="red-intense" />
        <erp:ErpDashboardStat ID="tile16" runat="server" source="InternoCatalogosAguardandoAprovacao" color="blue-madison" />
    </div>
  </div>
</div>

<script>
	$(document).ready(function() {
		ExibirMenusGestorCompras();		
	});		
</script>

</asp:Content>
