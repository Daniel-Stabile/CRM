<%@ Page Title="Meus dados" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMHANDLE->RESUMO_COMANDOS", "FORMHANDLE", "RESUMO_COMANDOS");
            AddWebPartStaticConnection("FORMHANDLE->RESUMO_VIEW", "FORMHANDLE", "RESUMO_VIEW");
            AddWebPartStaticConnection("FORMHANDLE->ENDERECO_VIEW", "FORMHANDLE", "ENDERECO_VIEW");

            AddWebPartStaticConnection("CADASTROFORNECEDOR_FRM->TELEFONES_GRID", "FORMHANDLE", "TELEFONES_GRID");
            AddWebPartStaticConnection("CADASTROFORNECEDOR_FRM->CONTATOS_GRID", "FORMHANDLE", "CONTATOS_GRID");
        }
                                     
    </script>

    <style>
        #CadastroZone {
            display: none;
        }
    </style>

    <div class="row">
        <wes:AjaxForm runat="server"
            ID="FORMHANDLE"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_INT_FORNECEDOR_GERAL.FORM"
            Title="Dados do fornecedor "
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            SystemFilterOnly="False"
            Mode="None"
            CanInsert="False"
            CanUpdate="False"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause="A.HANDLE = @CAMPO(HANDLE)"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>


    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <erp:ErpDefaultPortlet ID="ErpDefaultPortlet1" runat="server" Title="Dados do fornecedor" TitleDescription="dados gerais">
                <div class="row">
                    <div class="row">
                        <wes:CommandsPanel
                            ID="RESUMO_COMANDOS"
                            runat="server"
                            EntityViewName="PORTAL_INT_FORNECEDOR_GERAL.FORM"
                            UserDefinedCommandsVisible="true"
                            SystemInstanceName="CORPORATIVO" />
                    </div>
                </div>
                <div class="row">
                    <div class="row">
                        <erp:SimpleCardView
                            ID="RESUMO_VIEW"
                            runat="server"
                            EntityViewName="PORTAL_INT_FORNECEDOR_GERAL.FORM"
                            DisplayLabels="True"
                            ColumnCount="1" />
                    </div>
                </div>
            </erp:ErpDefaultPortlet>
        </div>

        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">

            <erp:ErpDefaultPortlet ID="ErpDefaultPortlet2" runat="server" Title="Endereço" TitleDescription="endereço principal">
                <div class="row">
                    <erp:SimpleCardView
                        ID="ENDERECO_VIEW"
                        runat="server"
                        EntityViewName="PORTAL_INT_FORNECEDOR_ENDERECO.FORM"
                        DisplayLabels="True"
                        ColumnCount="1" />
                </div>
            </erp:ErpDefaultPortlet>
        </div>
    </div>


    <div class="row">
        <div class="col-md-12 col-lg-12 col-sm-12 erp-unbox">
            <erp:ErpTabControl runat="server" ID="ErpTabControl" ShowBorder="true" RenderAsPortlet="false">
                <erp:ErpTab runat="server" ID="ErpTabTelefones" Text="Telefones">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="TELEFONES_GRID"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_INT_FORNECEDOR_TELEFONES.GRID"
                            Description="Contatos do fornecedor."
                            UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="true"
                            CompanyFilterMode="None"
                            FormUrl="~/PortalInterno/e/Financeiro/Fornecedores/Telefone.aspx"
                            DisplayRowCommand="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="5"
                            Mode="None"
                            CanInsert="True"
                            CanUpdate="True"
                            CanDelete="True"
                            ShowTitle="false"
                            Title="Telefones >>"
                            ChromeState="Normal"
                            PageWidgetHandle="2" />
                    </div>
                </erp:ErpTab>

                <erp:ErpTab runat="server" ID="ErpTabContatos" Text="Contato">
                    <div class="row">
                        <wes:SimpleGrid runat="server"
                            ID="CONTATOS_GRID"
                            SystemInstanceName="CORPORATIVO"
                            EntityViewName="PORTAL_INT_FORNECEDOR_CONTATOS.GRID"
                            Description="Contatos do fornecedor."
                            UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                            UserDefinedCommandsVisible="True"
                            UserDefinedSelectColumnVisible="False"
                            HideDeveloperCommands="true"
                            CompanyFilterMode="None"
                            DisplayRowCommand="False"
                            FilterVisible="False"
                            SystemFilterOnly="False"
                            UserDefinedPageSize="5"
                            Mode="None"
                            CanInsert="True"
                            CanUpdate="True"
                            CanDelete="True"
                            ShowTitle="false"
                            Title="Contatos >>"
                            ChromeState="Normal"
                            PageWidgetHandle="4"
                            FormUrl="~/PortalInterno/e/Financeiro/Fornecedores/Contato.aspx" />
                    </div>
                </erp:ErpTab>

            </erp:ErpTabControl>
        </div>
    </div>

</asp:Content>
