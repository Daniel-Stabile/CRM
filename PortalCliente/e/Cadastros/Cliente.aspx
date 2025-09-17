<%@ Page Title="Meus dados" Language="C#" AutoEventWireup="true"
    Inherits="PortalBase.CorpBasePage, Benner.Corporativo.Wes.WebApp" %>

<%@ Register Assembly="Benner.Tecnologia.Wes.Components.WebApp" Namespace="Benner.Tecnologia.Wes.Components.WebApp" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Tecnologia.Wes.Components" Namespace="Benner.Tecnologia.Wes.Components" TagPrefix="wes" %>
<%@ Register Assembly="Benner.Erp.Wes.Components" Namespace="Benner.Erp.Wes.Components" TagPrefix="erp" %>

<asp:Content runat="server" ID="Content1" ContentPlaceHolderID="Main">
    <script runat="server">
        protected override void LoadWebPartConnections()
        {
            AddWebPartStaticConnection("FORMHANDLE->RESUMO_VIEW", "FORMHANDLE", "RESUMO_VIEW");
            AddWebPartStaticConnection("FORMHANDLE->ENDERECO_VIEW", "FORMHANDLE", "ENDERECO_VIEW");


            AddWebPartStaticConnection("CADASTROCLIENTE_FRM->TELEFONES_GRID", "FORMHANDLE", "TELEFONES_GRID");
            AddWebPartStaticConnection("CADASTROCLIENTE_FRM->LOCAISENTREGA_GRID", "FORMHANDLE", "LOCAISENTREGA_GRID");
            AddWebPartStaticConnection("CADASTROCLIENTE_FRM->CONTATOS_GRID", "FORMHANDLE", "CONTATOS_GRID");
            AddWebPartStaticConnection("CADASTROCLIENTE_FRM->TRANSPORTADORAS_GRID", "FORMHANDLE", "TRANSPORTADORAS_GRID");

        }

    </script>



    <style>
        #CadastroClienteZone {
            display: none;
        }
    </style>

    <div class="row">       
        <wes:AjaxForm runat="server"
            ID="FORMHANDLE"
            SystemInstanceName="CORPORATIVO"
            EntityViewName="PORTAL_CLI_MEUSDADOS_GERAL.FORM"
            Title="Meus dados"
            IncludeRecordInRecentItems="False"
            HideDeveloperCommands="False"
            SystemFilterOnly="False"
            Mode="None"
            CanInsert="False"
            CanUpdate="True"
            CanDelete="False"
            ShowTitle="False"
            UserDefinedCriteriaWhereClause="A.HANDLE = (SELECT B.PESSOA FROM Z_GRUPOUSUARIOS B WHERE B.HANDLE = @USUARIO)"
            ChromeState="Normal"
            PageWidgetHandle="1" />
    </div>


    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <erp:ErpAjaxForm
                    ID="RESUMO_VIEW"
                    Title="Meus dados"
                    Subtitle="dados gerais"
                    runat="server"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_GERAL.FORM"
                    DisplayLabels="True"
                    ColumnCount="1" />                        
            </div>
        </div>

        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <erp:ErpAjaxForm
                    ID="ENDERECO_VIEW"
                    Title="Endereço"
                    Subtitle="endereço principal"
                    runat="server"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_ENDERECO.FORM"
                    DisplayLabels="True"
                    ColumnCount="1" />                    
            </div>
        </div>
    </div>


    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="TELEFONES_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_TELEFONES.GRID"
                    Description="Contatos do cliente."
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="~/PortalCliente/e/Cadastros/Telefone.aspx"
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="5"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    Title="Telefones >>"
                    ChromeState="Normal"
                    PageWidgetHandle="2" />
            </div>
        </div>

        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="LOCAISENTREGA_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_LOCAISENTREGA.GRID"
                    Description="Locais de entrega do cliente."
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="~/PortalCliente/e/Cadastros/LocalEntrega.aspx"
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="5"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    ChromeState="Normal"
                    Title="Locais de entrega >> "
                    PageWidgetHandle="3" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="CONTATOS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_CONTATOS.GRID"
                    Description="Contatos do cliente."
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedCommandsVisible="True"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    DisplayRowCommand="False"
                    FilterVisible="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="5"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    Title="Contatos >>"
                    ChromeState="Normal"
                    PageWidgetHandle="4"
                    FormUrl="~/PortalCliente/e/Cadastros/Contato.aspx" />
            </div>
        </div>
        <div class="col-md-6 col-lg-6 col-sm-12 erp-unbox">
            <div class="row">
                <wes:SimpleGrid runat="server"
                    ID="TRANSPORTADORAS_GRID"
                    SystemInstanceName="CORPORATIVO"
                    EntityViewName="PORTAL_CLI_MEUSDADOS_TRANSPORTADORAS.GRID"
                    Description="Transportadoras do cliente."
                    UserDefinedCriteriaWhereClause="A.PESSOA = @CAMPO(HANDLE)"
                    UserDefinedSelectColumnVisible="False"
                    HideDeveloperCommands="False"
                    CompanyFilterMode="None"
                    FormUrl="~/PortalCliente/e/Cadastros/Transportadora.aspx"
                    DisplayRowCommand="False"
                    SystemFilterOnly="False"
                    UserDefinedPageSize="5"
                    Mode="None"
                    CanInsert="True"
                    CanUpdate="True"
                    CanDelete="True"
                    ShowTitle="True"
                    Title="Transportadoras >>"
                    ChromeState="Normal"
                    PageWidgetHandle="6" />
            </div>
        </div>
    </div>
</asp:Content>
