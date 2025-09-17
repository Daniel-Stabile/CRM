<%@ Page Title="Detalhes item" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Pedidos.ItemDetalhesPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<script runat="server">
    protected override void LoadWebPartConnections()
    {
        AddWebPartStaticConnection("Produto->Aplicacoes", "FormItem", "GridAplicacoes");
        AddWebPartStaticConnection("Produto->Substitutos", "FormItem", "GridSubstitutos");
        AddWebPartStaticConnection("Substitutos->GridCompra", "GridSubstitutos", "GridCompraSubstituto");

    }
</script>



<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">

    <style>
        /* Não mostrar "Operação executada" */
        .alert-info {
            display: none;
        }

        th.AlignmentRight {
            text-align: right;
            padding-right: 6px;
        }

        td.AlignmentRight {
            text-align: right;
        }
    </style>



    <erp:ErpTabControl runat="server" ID="tabs">
        <erp:ErpTab runat="server" ID="tab_1_1" Text="Produto">

            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="FormItem"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_REP_DETALHESPRODUTO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ChromeState="Normal"
                    PageWidgetHandle="1"
                    Title="Detalhes"
                    ShowTitle="False" />
            </div>
        </erp:ErpTab>

        <erp:ErpTab runat="server" ID="tab_1_2" Text="Aplicações">

            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="GridAplicacoes"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_REP_DETALHEAPLICACOES.GRID"
                    UserDefinedCriteriaWhereClause="A.HANDLE IN(SELECT PA.APLICACAO FROM PD_PRODUTOAPLICACOES PA WHERE PA.PRODUTO = @CAMPO(HANDLE))"
                    Title="Aplicações"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    FilterVisible="False"
                    DefaultFilterName="Todos"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="15"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="tab_1_3" Text="Substitutos">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="GridSubstitutos"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_REP_DETALHESUBSTITUTOS.GRID"
                    UserDefinedCriteriaWhereClause="A.PRODUTOORIGEM = @CAMPO(HANDLE)"
                    Title="Substitutos"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="True"
                    FilterVisible="False"
                    DefaultFilterName="Todos"
                    SystemFilterOnly="True"
                    UserDefinedPageSize="15"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="1"
                    OnCommandExecuted="GridSubstitutos_CommandExecuted" />
            </div>

            <div style="height: 50px;"></div>

            <div class="row">
                <wes:EditableGrid runat="server"
                    ID="GridCompraSubstituto"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_REP_INCLUSAOPRODUTOS.GRID"
                    Description="Itens encontrados (limite de 100 itens)"
                    UserDefinedCriteriaWhereClause="A.PRODUTO = @CAMPO(PRODUTOSUBSTITUTO)"
                    UserDefinedDisableRowSelection="False"
                    UserDefinedSelectColumnVisible="False"
                    UserDefinedCommandsVisible="True"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="TESTE"
                    DisplayRowCommand="True"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="50"
                    Mode="None"
                    CanInsert="False"
                    CanUpdate="True"
                    CanDelete="False"
                    ShowTitle="False"
                    ChromeState="Normal"
                    PageWidgetHandle="2"
                    OnCommandExecuted="GridCompraSubstituto_CommandExecuted" />

            </div>

        </erp:ErpTab>

    </erp:ErpTabControl>

</asp:Content>


