<%@ Page Title="Caixa de entrada" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>



<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">

        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("CAPA->RATEIO", "CAPA", "RATEIO");         
            AddWebPartStaticConnection("CAPA->INFOSADD", "CAPA", "INFOSADD");
        }

        protected override void OnPreRenderComplete(EventArgs e)
        {
            base.OnPreRenderComplete(e);

            CAPA.Title = CAPA.GetEntity()["PRODUTO"].GetString()+" >> "+(CAPA.GetEntity()["QUANTIDADE"].GetDecimal() * CAPA.GetEntity()["VALORESTIMADO"].GetDecimal()).ToString("0.00");
        }
    </script>

    <div class="row">
        <wes:AjaxForm
            ID="CAPA"
            runat="server"
            EntityViewName="PORTAL_INT_VISUALIZAR_DETALHES_ITEM_SOLICITACAO.FORM"
            FormMode="View"
            ShowTitle="true"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            HideDeveloperCommands="false"
            EditButtonClass="green" />
    </div>

	<div class="row">
        <wes:AjaxForm
            ID="INFOSADD"
            runat="server"
            EntityViewName="PORTAL_INT_VISUALIZAR_INFOS_ADICIONAIS_ITEM_SOLICITACOES.FORM"
            FormMode="ReadOnly"
            ShowTitle="False"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            HideDeveloperCommands="false"
            EditButtonClass="green" />
    </div>

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="RATEIO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_RATEIO_SOLICITACAO.GRID"
            UserDefinedCriteriaWhereClause="A.SOLICITACAOITEM = @CAMPO(HANDLE)"
            Title="Rateio"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="false"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            FilterVisible="False"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            ChromeState="Normal"
                />
    </div>
</asp:Content>
