<%@ Page Title="Lista de preços" Language="C#" Inherits="Benner.Corporativo.Wes.WebApp.aga.e.Generico.Fornecedores.ListaDePrecos" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" runat="Server">
    <div class="row">
        <wes:AjaxForm runat="server" ID="LISTADEPREOS" Title="Lista de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="6" FontIcon="" ShowTitle="true" ProviderWidgetUniqueId="" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_LISTASPRECOS.LISTADEPRECOS.FORM" FormMode="None" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="10" />
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
                                <wes:SimpleGrid runat="server" ID="TABELASDEPREOS" Title="Tabelas de preços" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LISTADEPREOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_LISTAPRECOTABELAS.TABELAS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LISTA = @CAMPO(HANDLE)" FormUrl="~/aga/a/genericos/fornecedores/TabelaDePrecos.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="24" /> 
                            </div>
                        </div>
                        <div class="tab-pane" id="tabESTADOS">
                            <div class="row">
                                <wes:SimpleGrid runat="server" ID="ESTADOS" Title="Estados" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="false" ProviderWidgetUniqueId="LISTADEPREOS" ChromeState="Minimized" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_LISTAPRECOESTADOS.ESTADOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="OnlyCompany" UserDefinedCriteriaWhereClause="A.LISTAPRECO = @CAMPO(HANDLE) AND A.FORNECEDOR = @CAMPO(PESSOA)" FormUrl="~/aga/a/genericos/fornecedores/EstadosForm.aspx" ShowExport="True" UserDefinedDisableRowSelection="False" Level="20" Order="30" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <wes:AjaxForm runat="server" ID="PREOPRODUTO" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="True" ProviderWidgetUniqueId="TABELASDEPREOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="True" EntityViewName="CM_LISTAPRECOPRODUTOS.PRODUTO.FORM" FormMode="View" IncludeRecordInRecentItems="True" UserDefinedCommandsVisible="True" Level="20" Order="10" UserDefinedCriteriaWhereClause="A.TABELA = @CAMPO(HANDLE) AND A.LISTA = @CAMPO(LISTA) AND 1=2" />
        <wes:SimpleGrid runat="server" ID="PREOSPRODUTOS" Title="Preços produtos" Subtitle="" PortletCssClass="" PortletLayout="Default" BootstrapCols="12" FontIcon="" ShowTitle="False" ProviderWidgetUniqueId="TABELASDEPREOS" ChromeState="Fixed" CanDelete="True" CanUpdate="True" CanInsert="False" EntityViewName="CM_LISTAPRECOPRODUTOS.PRODUTOS.GRID" Mode="Selectable" UserDefinedSelectColumnVisible="False" UserDefinedPageSize="10" SystemFilterOnly="False" DisplayRowCommand="True" CompanyFilterMode="CompanyAndBranch" UserDefinedCriteriaWhereClause="A.TABELA = @CAMPO(HANDLE) AND A.LISTA = @CAMPO(LISTA)" ShowExport="True" UserDefinedDisableRowSelection="True" Level="20" Order="17" />
    </div>
    <style>
        #ESTADOS th, td, #TABELASDEPREOS th, td, #PREOSPRODUTOS th, td {
            white-space: nowrap !important;
        }
    </style>
</asp:Content>