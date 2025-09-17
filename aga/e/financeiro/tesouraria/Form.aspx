<%@ Page Title="Tesouraria" Language="C#"  Inherits="aga.e.Financeiro.Tesouraria.LancamentosTesourariaForm" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <div class="col-md-12">
            <div class="bg-white col-md-12" style="padding-top: 10px;">
                <h4 class="caption-subject font-green-sharp bold uppercase" style="padding-left: 10px;"></h4>
                <wes:AjaxForm runat="server" 
                    ID="AjaxForm1"
                    Title="" 
                    Subtitle=""
                    ShowTitle="False"
                    PortletCssClass="bg-white"
                    PortletLayout="None"
                    BootstrapCols="12"
                    FontIcon=""
                    ProviderWidgetUniqueId=""
                    UserDefinedPageSize="0" 
                    ChromeState="Normal"
                    CanDelete="False"
                    CanUpdate="False"
                    CanInsert="False"
                    EntityViewName="TS_LANCAMENTOS.DOCUMENTOS.FORM"
                    FormMode="View"
                    IncludeRecordInRecentItems="False"
                    UserDefinedCommandsVisible="True" Order="110" />
                <h4 class="caption-subject font-green-sharp bold uppercase" style="padding-left: 10px;">Documento</h4>
                <wes:AjaxForm runat="server" 
                    ID="FORMTS_LANCAMENTOS"
                    Title="Documento" 
                    Subtitle=""
                    ShowTitle="true"
                    PortletCssClass="bg-white"
                    PortletLayout="None"
                    BootstrapCols="12"
                    FontIcon=""
                    ProviderWidgetUniqueId=""
                    ChromeState="Normal"
                    CanDelete="True"
                    CanUpdate="True"
                    CanInsert="True"
                    EntityViewName="TS_LANCAMENTOS.TESOURARIA.FORM"
                    FormMode="View"
                    IncludeRecordInRecentItems="True"
                    UserDefinedCommandsVisible="True" Order="100" />
            </div>
        </div>

        <div class="col-md-12 widget">
            <div class="portlet light">
                <div class="tabbable-line">
                    <ul class="nav nav-tabs">
                        <li class="active" id="movimentacoesTab" runat="server">
                            <a href="#ctl00_Main_tab_movimentacoes" data-toggle="tab" runat="server">Movimentações</a>
                        </li>
                        <li id="tab_contabilizacao_header" runat="server">
                            <a href="#ctl00_Main_tab_contabilizacao" data-toggle="tab" runat="server">Contabilização</a>
                        </li>
                        <li id="transferenciaOrigemTab" runat="server">
                            <a href="#ctl00_Main_tab_transferenciaOrigem" data-toggle="tab" runat="server">Transferência origem</a>
                        </li>
                        <li id="transferenciaDestinoTab" runat="server">
                            <a href="#ctl00_Main_tab_transferenciaDestino" data-toggle="tab" runat="server">Transferência destino</a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_movimentacoes" runat="server">
                            <div class="row form">
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="MOVIMENTACOES"
                                    Title="Movimentações"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId="FORMTS_LANCAMENTOS"
                                    ChromeState="Normal"
                                    CanDelete="True"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="FN_MOVIMENTACOES.TESOURARIA.GRID"
                                    DefaultFilterName="Por data"
                                    Mode="Selectable"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="20"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="None"
                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOTESOURARIA = @CAMPO(HANDLE)"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="True"
                                    Order="105" />
                                <div class="col-md-7"></div>
                                <wes:SimpleGrid 
                                    runat="server" 
                                    ID="TOTAIS" 
                                    Title="Totais" 
                                    Subtitle="" 
                                    PortletCssClass="" 
                                    PortletLayout="None" 
                                    BootstrapCols="5" 
                                    FontIcon="" 
                                    ShowTitle="true" 
                                    ProviderWidgetUniqueId="FORMTS_LANCAMENTOS" 
                                    ChromeState="Normal" 
                                    CanDelete="False" 
                                    CanUpdate="False" 
                                    CanInsert="False" 
                                    EntityViewName="FN_MOVIMENTACOESTOTAISOPERACAO.DATASOURCE.GRID" 
                                    Mode="None" 
                                    UserDefinedSelectColumnVisible="False" 
                                    UserDefinedPageSize="100" 
                                    SystemFilterOnly="False" 
                                    DisplayRowCommand="False" 
                                    CompanyFilterMode="OnlyCompany" 
                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOTESOURARIA = @CAMPO(HANDLE)" 
                                    ShowExport="False" 
                                    UserDefinedDisableRowSelection="False" 
                                    Order="107" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_contabilizacao" runat="server">
                            <div class="row">
                                <wes:SimpleGrid
                                    runat="server"
                                    ID="CONTABILIZACAO"
                                    Title="Contabilização"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="None"
                                    BootstrapCols="9"
                                    FontIcon=""
                                    ShowTitle="true"
                                    ProviderWidgetUniqueId="FORMTS_LANCAMENTOS"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="CT_LANCAMENTOS.TESOURARIA.GRID"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="5"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="True"
                                    CompanyFilterMode="OnlyCompany"
                                    UserDefinedCriteriaWhereClause="A.LANCAMENTOTESOURARIA = @CAMPO(HANDLE)"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    Order="110" />
                                <wes:SimpleGrid runat="server"
                                    ID="GRIDCENTRODECUSTO"
                                    ProviderWidgetUniqueId="CONTABILIZACAO"
                                    BootstrapCols="3"
                                    ShowTitle="False"
                                    Title="Centro de custo"
                                    EntityViewName="CT_LANCAMENTOCC.TESOURARIA.GRID"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="False"
                                    CompanyFilterMode="OnlyCompany"
                                    UserDefinedDisableRowSelection="False"
                                    UserDefinedCriteriaWhereClause="A.LANCAMENTO = @CAMPO(HANDLE)"
                                    PageWidgetHandle="57449" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_transferenciaOrigem" runat="server">
                            <div class="row form">
                                <wes:AjaxForm runat="server"
                                    ID="TRANSFERNCIAORIGEM"
                                    Title="Transferência Origem"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="FORMTS_LANCAMENTOS"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="False"
                                    CanInsert="False"
                                    EntityViewName="TS_LANCAMENTOS.TRANSFERENCIAORIGEM.FORM"
                                    UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(ORIGEM)"
                                    FormMode="View"
                                    IncludeRecordInRecentItems="True"
                                    UserDefinedCommandsVisible="False"
                                    PageWidgetHandle="22639"
                                    Level="20"
                                    Order="120" />
                            </div>
                        </div>
                        <div class="tab-pane" id="tab_transferenciaDestino" runat="server">
                            <div class="row form">
                                <wes:SimpleGrid runat="server"
                                    ID="TRANSFERNCIASDESTINO"
                                    Title="Transferências destino"
                                    Subtitle=""
                                    PortletCssClass=""
                                    PortletLayout="Default"
                                    BootstrapCols="12"
                                    FontIcon=""
                                    ShowTitle="false"
                                    ProviderWidgetUniqueId="FORMTS_LANCAMENTOS"
                                    ChromeState="Normal"
                                    CanDelete="False"
                                    CanUpdate="True"
                                    CanInsert="False"
                                    EntityViewName="TS_LANCAMENTOS.TRANSFERENCIASDESTINO.GRID"
                                    UserDefinedCriteriaWhereClause="A.ORIGEM = @CAMPO(HANDLE)"
                                    Mode="None"
                                    UserDefinedSelectColumnVisible="False"
                                    UserDefinedPageSize="10"
                                    SystemFilterOnly="False"
                                    DisplayRowCommand="False"
                                    CompanyFilterMode="OnlyCompany"
                                    ShowExport="True"
                                    UserDefinedDisableRowSelection="False"
                                    PageWidgetHandle="22640"
                                    Level="20"
                                    Order="130"
                                    FormUrl="~/aga/e/financeiro/tesouraria/LancamentoDestino.aspx"
                                    />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .form-section {
            padding-bottom: 5px;
            border-bottom: 1px solid #e7ecf1;
        }

        .form-section a {
            font-size: 16px;
            text-decoration: none;
            color: inherit;
        }

        #FORMTS_LANCAMENTOS {
            padding: 10px;
        }
        #AjaxForm1{padding: 10px;}

        .list-commands-bar {
            margin-bottom: 10px;
        }
    </style>
</asp:Content>
