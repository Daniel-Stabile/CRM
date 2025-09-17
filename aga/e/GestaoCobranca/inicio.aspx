<%@ Page Title="Gestão de cobrança" Language="C#" CodeFile="~/aga/e/GestaoCobranca/inicio.aspx.cs" Inherits="GestaoCobrancainicioPage" %>
   
<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
	<div class="row">
		<wes:CommandsPanel runat="server" ID="GC" Title="GC" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="" ChromeState="Normal" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="WEB_GC_MODULO.GRID" VerticalOrientation="False" PageId="GESTAOCOBRANCA" Level="20" Order="10"  />
	</div>
	<script>
	    ExibirMenusModuloGestaoCobranca();
	</script>
</asp:Content>