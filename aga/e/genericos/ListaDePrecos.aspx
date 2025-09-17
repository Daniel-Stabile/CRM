<%@ Page Title="Lista de preços" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Generico.ListaDePrecos" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LISTADEPREOS" Title="Lista de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_LISTASPRECOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="10" />
        <div class="col-md-6">
            <div class="portlet light">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs">
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="TABELASDEPREOS" class="active">
                            <a data-toggle="tab" href="#tabTABELASDEPREOS" aria-expanded="true"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Tabelas de preços")%></a>
                        </li>
                        <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="ESTADOS">
                            <a data-toggle="tab" href="#tabESTADOS"><%= Benner.Tecnologia.Wes.Components.LanguageTranslator.Translate(@"Estados")%></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabTABELASDEPREOS" aria-expanded="true">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="TABELASDEPREOS" Title="Tabelas de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LISTADEPREOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_LISTAPRECOTABELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LISTA = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2027_at2331_hsec58a284.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="20" /> 
                            </div>
                        </div>
                        <div class="tab-pane" id="tabESTADOS">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="ESTADOS" Title="Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LISTADEPREOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_LISTAPRECOESTADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LISTAPRECO = @CAMPO(HANDLE)" FormUrl="~/aga/a/f/aga_t2030_at2335_hs998d310.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="30" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <wes:CommandsPanel runat="server" ID="COMANDOINCLUIRPRECOPRODUTO" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="True" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_VTINCLUIRPRECOPRODUTOS.COMANDO.FORM" VerticalOrientation="False" Level="20" Order="40" />
        <wes:AjaxForm runat="server" ID="PREOPRODUTO" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="True" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="AGA_CM_LISTAPRECOPRODUTOS.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="50" />
        <wes:AjaxForm runat="server" ID="INCLUIRPREOPRODUTO" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="True" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_VTINCLUIRPRECOPRODUTOS.PRECO_VENDA.FORM" FormMode="View" IncludeRecordInRecentItems="False" UserDefinedCommandsVisible="True" Level="20" Order="60" />
        <wes:SimpleGrid runat="server" ID="PREOSPRODUTOS" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="False" ProviderWidgetUniqueId="TABELASDEPREOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CM_LISTAPRECOPRODUTOS.CADASTROPRECOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TABELA = @CAMPO(HANDLE) AND A.LISTA = @CAMPO(LISTA)" ShowExport="True" UserDefinedDisableRowSelection="True" Level="20" Order="50" />
    </div>
    <style>
        #ESTADOS th, td, #TABELASDEPREOS th, td, #PREOSPRODUTOS th, td {
            white-space: nowrap !important;
        }
    </style>
    <script>
        $(() => {
            var gerenciadorRequests = Sys.WebForms.PageRequestManager.getInstance();

            if (!gerenciadorRequests.get_isInAsyncPostBack())
                gerenciadorRequests.add_endRequest(VisibilidadeFormularioPreco);

            VisibilidadeFormularioPreco();
        });

        const VisibilidadeFormularioPreco = () => {
            var estadoFormularioPreco = $("#EstadoFormularioPreco").val();

            $("#COMANDOINCLUIRPRECOPRODUTO").toggle(estadoFormularioPreco == "Read");
            $("#INCLUIRPREOPRODUTO").toggle(estadoFormularioPreco == "New");
            $("#PREOPRODUTO").toggle(estadoFormularioPreco == "Editing");
        };
    </script>
</asp:Content>