<%@ Page Title="Especificações" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>


<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">


    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("ESPECIFICACOES_FORM->CONTAFINANCEIRA_GRID", "ESPECIFICACOES_FORM", "CONTAFINANCEIRA_GRID");
            AddWebPartStaticConnection("CONTAFINANCEIRA_GRID->CENTROCUSTO_GRID", "CONTAFINANCEIRA_GRID", "CENTROCUSTO_GRID");
        }
               
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);

            CONTAFINANCEIRA_GRID.EnsureDataLoad();
            var ds = CONTAFINANCEIRA_GRID.DataSource as IList;
            if (ds != null)
                TAB_LANCAMENTOS.TabVisible = ds.Count > 0;
        }        
    </script>

    <erp:ErpTabControl runat="server" ID="TABS" ShowBorder="true">
        <erp:ErpTab runat="server" ID="TAB_ESPECIFICACOES" Text="Especificações">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="ESPECIFICACOES_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_REQUISICAO_ESPECIFICACAO.FORM"
                    IncludeRecordInRecentItems="False"
                    HideDeveloperCommands="False"
                    CanInsert="False"
                    CanUpdate="False"
                    CanDelete="False"
                    ShowTitle="False"
                    Title="Especificações"
                    ChromeState="Normal"
                    PageWidgetHandle="1" />
            </div>
        </erp:ErpTab>
        <erp:ErpTab runat="server" ID="TAB_DADOSFINANCEIROS" Text="Dados Financeiros">
            <div class="row">
                <wes:AjaxForm runat="server"
                    ID="DADOSFINANCEIROS_FORM"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTALINTERNO_REQUISICAO_DADOSFINANCEIROS.FORM"
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
        <erp:ErpTab runat="server" ID="TAB_LANCAMENTOS" Text="Rateios">
            <span class="erp-unbox">
                <div class="row">
                    <wes:SimpleGrid runat="server"
                        ID="CONTAFINANCEIRA_GRID"
                        SystemInstanceName="CORPORATIVO"
                        EntityViewName="PORTALINTERNO_REQUISICAO_LANCAMENTOS.GRID"
                        Title="Contas financeira"
                        UserDefinedDisableRowSelection="False"
                        UserDefinedCommandsVisible="True"
                        UserDefinedSelectColumnVisible="False"
                        UserDefinedCriteriaWhereClause="A.LANCAMENTOREQSUPRIMENTO = @CAMPO(HANDLE)"
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
                        EntityViewName="PORTALINTERNO_REQUISICAO_LANCAMENTOCC.GRID"
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
