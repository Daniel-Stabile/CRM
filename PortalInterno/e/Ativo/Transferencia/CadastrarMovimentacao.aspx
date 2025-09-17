<%@ Page Title="Itens da requisição" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">
    <style>
        div[data-field=MOVIMENTACAO] .radio-inline:nth-of-type(1n+4) {
            display: none !important;
        }

    </style>

    <script runat="server">

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            REQUISICAO.Title = "Movimentação - " + REQUISICAO.GetEntity()["MOVIMENTACAO"].GetString();
        }
    
    </script>        

    <div class="row">
		<wes:AjaxForm runat="server"
			ID="REQUISICAO"
			SystemInstanceName="CORPORATIVO"
			EntityViewName="AT_ITEMMOVIMENTACAOAPROVACOES.CUSTOM.FORM"
			IncludeRecordInRecentItems="False"
			HideDeveloperCommands="False"
			UserDefinedCommandsVisible="true"
			CanInsert="true"
			CanUpdate="True"
			CanDelete="true"
			ShowTitle="True"
			Title="Cadastro de itens"
			ChromeState="Normal"
			PageWidgetHandle="1" />
    </div>

</asp:Content>