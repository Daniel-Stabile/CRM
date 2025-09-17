<%@ Page Title="Consulta comissões" Language="C#" AutoEventWireup="true"
    Inherits="PortalRepresentante.Financeiro.ComissoesPage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content" ContentPlaceHolderID="Main">

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FILTRO->TITULOS_GRID", "FILTRO", "TITULOS_GRID");
            AddWebPartStaticConnection("TITULOS_GRID->COMISSOES_GRID", "TITULOS_GRID", "COMISSOES_GRID");
            AddWebPartStaticConnection("TITULOS_GRID->PARCELAS_GRID", "TITULOS_GRID", "PARCELAS_GRID");
        }
    </script>
    <div class="row">
        <erp:ErpFilterForm runat="server"
            ID="FILTRO"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_W_FILTROCOMISSOES.FORM"
            Title="Pesquisa de notas fiscais >>"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            CanInsert="True"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="true"
            UserDefinedCriteriaWhereClause=""
            ChromeState="Normal"
            PageWidgetHandle="1"
            OnCommandExecuted="FILTRO_CommandExecuted" />
    </div>

    <div class="row">
        <erp:ErpSimpleGrid runat="server"
            ID="TITULOS_GRID"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_REP_COMISSOESDOCUMENTO.GRID"
            UserDefinedCriteriaWhereClause="@WHERECLAUSE"
            UserDefinedDisableRowSelection="False"
            UserDefinedCommandsVisible="True"
            UserDefinedSelectColumnVisible="False"
            HideDeveloperCommands="False"
            CompanyFilterMode="None"
            DisplayRowCommand="False"
            FilterVisible="False"
            SystemFilterOnly="True"
            UserDefinedPageSize="10"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="True"
            Title="Notas fiscais >>"
            ChromeState="Normal"
            PageWidgetHandle="2"
            OnCommandExecute="TITULOS_GRID_CommandExecute" />
    </div>

    <div class="erp-unbox">
        <div class="portlet light">
            <div class="portlet-body">
                <erp:ErpTabControl runat="server" ID="ErpTabControl1" ShowBorder="true" RenderAsPortlet="false">
                    <erp:ErpTab runat="server" ID="tab_1_1" Text="Minhas comissões">
                        <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="COMISSOES_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_COMISSOES.GRID"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                Title=""
                                ChromeState="Normal"
                                PageWidgetHandle="3" />
                        </div>
                    </erp:ErpTab>

                    <erp:ErpTab runat="server" ID="tab_1_2" Text="Vencimentos da NF">
                       <div class="row">
                            <wes:SimpleGrid runat="server"
                                ID="PARCELAS_GRID"
                                SystemInstanceName="CORPORATIVO"
                                EntityViewName="PORTAL_REP_COMISSOESPARCELAS.GRID"
                                UserDefinedCriteriaWhereClause="A.DOCUMENTO = @CAMPO(HANDLE)"
                                UserDefinedDisableRowSelection="False"
                                UserDefinedCommandsVisible="True"
                                UserDefinedSelectColumnVisible="False"
                                HideDeveloperCommands="False"
                                CompanyFilterMode="None"
                                DisplayRowCommand="False"
                                FilterVisible="False"
                                SystemFilterOnly="True"
                                UserDefinedPageSize="10"
                                Mode="None"
                                CanInsert="False"
                                CanUpdate="False"
                                CanDelete="False"
                                ShowTitle="False"
                                Title="Parcelas"
                                ChromeState="Normal"
                                PageWidgetHandle="4" />
                        </div>
                    </erp:ErpTab>
                </erp:ErpTabControl>
            </div>
        </div>
    </div>

    <br />

    <blockquote class="blue" style="border-left-color: #4b8df8">
        <small>
            <strong>Creditado:</strong>
            Valor da comissão calculada na nota fiscal.</small>
        <small>
            <strong>Liberado:</strong>
            Valor da comissão disponível para apuração.</small>
        <small>
            <strong>Apurado:</strong>
            Valor da comissão disponível para efetuar o pagamento.</small>
        <small>
            <strong>Recebido:</strong>
            Valor da comissão onde o pagamento já foi efetuado.</small>
        <small>
            <strong>A receber:</strong>
            Diferença entre creditado e recebido.</small>
    </blockquote>

</asp:Content>
