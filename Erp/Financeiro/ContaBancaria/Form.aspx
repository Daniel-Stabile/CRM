<%@ Page Title="Contas Bancárias" Language="C#" CodeFile="~/Erp/Financeiro/ContaBancaria/Form.aspx.cs" Inherits="ContaBancariaFormPage" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <script type="text/javascript" src="<%=ResolveUrl("~/Content/js/conciliacao.js") %>"></script>
    <style>
        #portlet_CONTABANCARIA {
            padding-bottom: 0px;
        }
    </style>
    <div class="bg-white">
        <div class="row">            
            <wes:ActionView runat="server" ID="CONTABANCARIA" Title="Conta Bancária" BootstrapCols="12" Action="Form" Controller="ContaBancaria" ChromeState="Normal" EntityViewName="" ShowTitle="True" PageWidgetHandle="317" />            
        </div>

        <asp:UpdatePanel runat="server" ID="Periodo">
            <ContentTemplate>
                <div style="float: right; margin-right: 20px; margin-top: 21px; position: relative; z-index: 10">
                    <div id="reportrange" class="btn blue">
                        <i class="fa fa-calendar"></i>&nbsp;
                    <span></span>
                        <b class="caret"></b>
                    </div>
                </div>
                <asp:HiddenField runat="server" ID="HiddenDataInicio" />
                <asp:HiddenField runat="server" ID="HiddenDataFim" />
            </ContentTemplate>
        </asp:UpdatePanel>

        <div class="portlet light tabbable-line">
            <ul class="nav nav-tabs">
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDMOVIMENTACOES" class="active"><a href="#tabGRIDMOVIMENTACOES" data-toggle="tab">Movimentações</a></li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDCONCILIACOESPENDENTES">
                    <a href="#tabGRIDCONCILIACOESPENDENTES" data-toggle="tab">Conciliações
                        <%
                            if (ConciliacoesPentendes > 0)
                                Response.Write(string.Format("<span class=\"badge badge-danger\">{0}</span>", ConciliacoesPentendes));
                        %>
                    </a>
                </li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDREMESSAS"><a href="#tabGRIDREMESSAS" data-toggle="tab">Remessas</a></li>
                <li onclick="Benner.Page.changeSelectedTab(this)" data-widget-id="GRIDRETORNOSDECOBRANCA">
                    <a href="#tabGRIDRETORNOSDECOBRANCA" data-toggle="tab">Retornos
                        <%
                            if (RetornosPentendes > 0)
                                Response.Write(string.Format("<span class=\"badge badge-danger\">{0}</span>", RetornosPentendes));
                        %>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <div class="tab-pane active" id="tabGRIDMOVIMENTACOES">
                    <div class="row">
                        <wes:ActionView runat="server" ID="GRIDMOVIMENTACOES" Title="Movimentações" BootstrapCols="12" ChromeState="Normal" ShowTitle="False" Action="Extrato" Controller="ContaBancaria" EntityViewName="TS_LANCAMENTOS.GRID" PageWidgetHandle="308" />
                    </div>
                </div>
                <div class="tab-pane" id="tabGRIDCONCILIACOESPENDENTES">
                    <div class="row">
                        <wes:ActionView runat="server" ID="GRIDCONCILIACOESPENDENTES" Title="Conciliações Pendentes" BootstrapCols="12" ChromeState="Minimized" ShowTitle="False" Action="Index" Controller="Conciliacao" EntityViewName="TS_EXTRATOBANCARIO.GRID" PageWidgetHandle="309" />
                    </div>
                </div>
                <div class="tab-pane" id="tabGRIDREMESSAS">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="GRIDREMESSAS" Title="Remessas de Cobrança" BootstrapCols="12" ChromeState="Minimized" ShowTitle="False" UserDefinedDisableRowSelection="False" FormUrl="~/Erp/Financeiro/RemessaBancaria/Form.aspx" UserDefinedCriteriaWhereClause="A.DATA BETWEEN :DATAINICIO AND :DATAFIM AND A.CONTACORRENTE = @CAMPO(HANDLE)" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="True" SystemFilterOnly="False" UserDefinedPageSize="100" UserDefinedSelectColumnVisible="False" Mode="None" DefaultFilterName="" CanInsert="False" CanUpdate="True" CanDelete="True" EntityViewName="CLOUD_GN_HBREMESSAS.GRID" PageWidgetHandle="310" />
                    </div>
                </div>
                <div class="tab-pane" id="tabGRIDRETORNOSDECOBRANCA">
                    <div class="row">
                        <wes:SimpleGrid runat="server" ID="GRIDRETORNOSDECOBRANCA" Title="Retornos de Cobrança" BootstrapCols="12" ChromeState="Minimized" ShowTitle="False" UserDefinedDisableRowSelection="False" FormUrl="~/erp/Financeiro/RetornoBancario/Form.aspx" UserDefinedCriteriaWhereClause="A.DATA BETWEEN :DATAINICIO AND :DATAFIM AND A.CONTA = @CAMPO(HANDLE) AND A.STATUS &gt; 0 AND A.STATUS &lt; 7" UserDefinedDataSourceParameters="" CompanyFilterMode="OnlyCompany" DisplayRowCommand="True" SystemFilterOnly="False" UserDefinedPageSize="100" UserDefinedSelectColumnVisible="False" Mode="None" DefaultFilterName="" CanInsert="False" CanUpdate="True" CanDelete="True" EntityViewName="CLOUD_GN_HBRETORNOS.GRID" PageWidgetHandle="312" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("CONTABANCARIAGRIDMOVIMENTACOES", "CONTABANCARIA", "GRIDMOVIMENTACOES");
            AddWebPartStaticConnection("CONTABANCARIAGRIDCONCILIACOESPENDENTES", "CONTABANCARIA", "GRIDCONCILIACOESPENDENTES");
            AddWebPartStaticConnection("CONTABANCARIAGRIDREMESSAS", "CONTABANCARIA", "GRIDREMESSAS");
            AddWebPartStaticConnection("CONTABANCARIAGRIDRETORNOSDECOBRANCA", "CONTABANCARIA", "GRIDRETORNOSDECOBRANCA");
        }
    </script>

    <script type="text/javascript">
        $(function () {
            function loadDateRange(start, end, first) {
                $('#reportrange span').html(start.lang('br').format('MMMM D, YYYY') + ' - ' + end.lang('br').format('MMMM D, YYYY'));

                $('#<%= HiddenDataInicio.ClientID %>').val(start.format("YYYY/MM/DD"));
                $('#<%= HiddenDataFim.ClientID %>').val(end.format("YYYY/MM/DD"));

                if (first === true)
                    return;

                __doPostBack("<%= Periodo.UniqueID %>");
            }

            var initAjax = function (sender, args) {
                var start = moment($('#<%= HiddenDataInicio.ClientID %>').val());
                var end = moment($('#<%= HiddenDataFim.ClientID %>').val());

                $('#reportrange').daterangepicker({
                    startDate: start,
                    endDate: end,
                    ranges: {
                        'Hoje': [moment(), moment()],
                        'Ontem': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                        'Últimos 7 dias': [moment().subtract(6, 'days'), moment()],
                        'Últimos 30 dias': [moment().subtract(29, 'days'), moment()],
                        'Este mês': [moment().startOf('month'), moment().endOf('month')],
                        'Últimos mês': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                    },
                    locale: {
                        applyLabel: 'Aplicar',
                        cancelLabel: 'Cancelar',
                        customRangeLabel: 'Customizado',
                    }
                }, loadDateRange);

                loadDateRange(start, end, true);
            }

            var prm = Sys.WebForms.PageRequestManager.getInstance();
            if (!prm.get_isInAsyncPostBack()) {
                prm.add_endRequest(initAjax);
            }

            initAjax();
        });
    </script>
</asp:Content>
