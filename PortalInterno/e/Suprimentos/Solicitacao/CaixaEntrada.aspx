<%@ Page Title="Aprovação de solicitações" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.Suprimentos.Solicitacoes.CaixaEntrada,Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>



<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <div class="row">
        <wes:SimpleGrid runat="server"
            ID="CAIXA"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_CAIXAENTRADA_SOLICITACOES.GRID"
            UserDefinedCriteriaWhereClause=""
            Title="Aprovação >> Solicitações"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="True"
            HideDeveloperCommands="False"
            CompanyFilterMode="CompanyAndBranch"
            DisplayRowCommand="False"
            DefaultFilterName="Pesquisar por"
            SystemFilterOnly="False"
            UserDefinedPageSize="10"
            Mode="Selectable"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            FormUrl="~/PortalInterno/e/Suprimentos/Solicitacao/VisualizarCapaSolicitacao.aspx"
            ChromeState="Normal"
                />
    </div>
</asp:Content>
