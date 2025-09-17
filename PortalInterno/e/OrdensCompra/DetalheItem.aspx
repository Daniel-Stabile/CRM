<%@ Page Title="Item" Language="C#" AutoEventWireup="true"
    Inherits="PortalInterno.OrdensCompra.DetalheItemPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ITEM_FORM->CONTAFINANCEIRA_GRID", "ITEM_FORM", "CONTAFINANCEIRA_GRID");
            AddWebPartStaticConnection("CONTAFINANCEIRA_GRID->CENTROCUSTO_GRID", "CONTAFINANCEIRA_GRID", "CENTROCUSTO_GRID");
        }
    </script>

    <erp:ErpTabControl runat="server" ID="TABS" ShowBorder="true">
        <erp:ErpTab runat="server" ID="TAB_ITEM" Text="Item">
            <div class="row">                
                <wes:AjaxForm runat="server"
                    ID="ITEM_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Item"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_DADOSFINANCEIROS" Text="Dados Financeiros">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="DADOSFINANCEIROS_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA_DADOSFINANCEIROS.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Dados Financeiros"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_RATEIO" Text="Rateio">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="RATEIO_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA_RATEIO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Dados Financeiros"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_IMPOSTOS" Text="Impostos">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="IMPOSTOS_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA_IMPOSTOS.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Impostos"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_LANCAMENTOS" Text="Rateios">
            <span class="erp-unbox">
                <div class="row">
                    <erp:ErpSimpleGrid runat="server"
                        ID="CONTAFINANCEIRA_GRID"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA_LANCAMENTOS.GRID"
                        Title="Contas financeiras"
                        UserDefinedDisableRowSelection="False"
                        UserDefinedCommandsVisible="True"
                        UserDefinedSelectColumnVisible="False"
                        UserDefinedCriteriaWhereClause="A.LANCAMENTOORDEMCOMPRA = @CAMPO(HANDLE)"
                        HideDeveloperCommands="False"
                        UserDefinedPageSize="10"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="True"
                        ChromeState="Normal"
                        PageWidgetHandle="1" />
                </div>
            </span>
            <span class="erp-unbox">
                <div class="row">
                    <wes:SimpleGrid runat="server"
                        ID="CENTROCUSTO_GRID"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTALINTERNO_ITEMORDEMCOMPRA_LANCAMENTOCC.GRID"
                        Title="Centros de custo"
                        UserDefinedDisableRowSelection="False"
                        UserDefinedCommandsVisible="True"
                        UserDefinedSelectColumnVisible="False"
                        UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                        HideDeveloperCommands="False"
                        UserDefinedPageSize="10"
                        CanInsert="False"
                        CanUpdate="False"
                        CanDelete="False"
                        ShowTitle="True"
                        ChromeState="Normal"
                        PageWidgetHandle="1" />
                </div>
            </span>
        </erp:ErpTab>
    </erp:ErpTabControl>
</asp:Content>
