<%@ Page Title="Itens da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <div class="row">
		<wes:AjaxForm runat="server"
			ID="REQUISICAO"
			SystemInstanceName="CORPORATIVO"
			EntityViewName="PORTAL_INT_ATIVO_REQUISICAOTRANSFERENCIA.FORM"
			IncludeRecordInRecentItems="False"
			HideDeveloperCommands="False"
			UserDefinedCommandsVisible="true"
			CanInsert="true"
			CanUpdate="True"
			CanDelete="true"
			ShowTitle="True"
			UserDefinedCriteriaWhereClause="A.ITEM = @CAMPO(HANDLE)"
			Title="Requisição de movimentação"
			ChromeState="Normal"
			PageWidgetHandle="1" />
        </div>
</asp:Content>
