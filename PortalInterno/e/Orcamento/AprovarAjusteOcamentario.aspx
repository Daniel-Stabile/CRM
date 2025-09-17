<%@ Page Title="Aprovar ajuste or&ccedil;ament&aacute;rio" Language="C#" Inherits="aga.e.orcamento.AprovarAjusteOrcamentario" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>
<asp:content id="Content1" contentplaceholderid="Main" runat="Server" xmlns:asp="urn:asp.net">

	<style>
		.page-content {
			background: #F1F3FA;
		}

		.page-bar {
			background: #fff;
		}
	</style>


	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12">
			<div style="display: flex;width: 100%;gap: 20px;">

				<div style="flex: 1; background: #fff;margin-bottom: 12px">
					<div class="row">
						<wes:AjaxForm runat="server" ID="ORCAMENTO" Title="" FormMode="View" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="" IncludeRecordInRecentItems="False" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="True" ChromeState="Normal" HideDeveloperCommands="False" EntityViewName="PORTAL_INT_APROVAR_VERBA_ORCAMENTARIA.FORM" PageWidgetHandle="110" />
					</div>
				</div>

				<div style="flex: 1;display: flex;flex-direction: column; overflow: auto;">
					<div class="row">
						<wes:AjaxForm runat="server" ID="HISTORICO" Title="Hist&oacute;rico" FormMode="View" BootstrapCols="12" UserDefinedCommandsVisible="True" UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)" IncludeRecordInRecentItems="False" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="True" ChromeState="Normal" HideDeveloperCommands="False" EntityViewName="PORTAL_INT_APROVAR_VERBA_ORCAMENTARIA_HISTORICO.FORM" PageWidgetHandle="110" />
					</div>
					<div class="row">
						<wes:SimpleGrid runat="server" ID="ANEXOS" Title="Anexos" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="ORCAMENTO" CanDelete="True" CanUpdate="False" CanInsert="True" EntityViewName="OP_ANEXOS_EM_CT_ORCAMENTOAPROVACOES.GRID" Mode="None" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" DisplayRowCommand="True" FilterVisible="False" FormUrl="~/aga/a/OrcamentoPublico/Anexos/Form.aspx" UserDefinedDisableRowSelection="False" Level="20" Order="50" />
					</div>
				</div>
			</div>
			<div class="row">
				<wes:SimpleGrid runat="server" ID="LANCAMENTOS" SystemInstanceName="CORPORATIVO" EntityViewName="PORTAL_INT_VERBA_ORCAMENTARIA_LANCAMENTOS.GRID" UserDefinedCriteriaWhereClause="A.ORCAMENTOAPROVACAO = @CAMPO(HANDLE) AND (A.ORIGEM = 'B' OR A.ORIGEM = 'C' OR A.ORIGEM = 'D' OR A.ORIGEM = 'E' OR A.ORIGEM = 'Q' OR A.ORIGEM = '1')" UserDefinedDisableRowSelection="False" UserDefinedCommandsVisible="True" UserDefinedSelectColumnVisible="False" HideDeveloperCommands="True" CompanyFilterMode="None" DisplayRowCommand="False" FilterVisible="False" SystemFilterOnly="True" UserDefinedPageSize="10" Mode="None" CanInsert="False" CanUpdate="False" CanDelete="False" ShowTitle="True" Title="Movimenta&ccedil;&otilde;es" ChromeState="Normal" PageWidgetHandle="3" />
			</div>

		</div>
	</div>


</asp:content>